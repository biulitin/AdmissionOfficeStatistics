package medacademy;

import medacademy.controller.Bridge;
import javafx.application.Application;
import javafx.beans.value.ChangeListener;
import javafx.beans.value.ObservableValue;
import javafx.concurrent.Worker;
import javafx.concurrent.Worker.State;
import javafx.scene.Scene;
import javafx.scene.layout.StackPane;
import javafx.scene.web.WebView;
import javafx.stage.Stage;
import netscape.javascript.JSObject;

public class MedAcademy extends Application {

    //First execute method
    @Override
    public void start(Stage stage) throws Exception{
        stage.setTitle("Формирование статистики");
        StackPane pane = new StackPane();
        WebView browser = new WebView();

        //loads html
        browser.getEngine().load(getClass().getResource("view//main.html").toExternalForm());
        pane.getChildren().add(browser);

        registerBridge(browser);

        Scene scene = new Scene(pane, 800,500);
        stage.setScene(scene);
        stage.show();
    }

    public void registerBridge(WebView browser){
        browser.getEngine().setJavaScriptEnabled(true);
        Worker<Void> worker = browser.getEngine().getLoadWorker();
        // Listening to the status of worker
        worker.stateProperty().addListener(new ChangeListener<Worker.State>() {
            @Override
            public void changed(ObservableValue<? extends State> observable,
                                State oldValue, State newValue) {
                // When load successed.
                if (newValue == Worker.State.SUCCEEDED) {
                    // Get window object of page.
                    JSObject jsobj = (JSObject)  browser.getEngine().executeScript("window");
                    // Set member for 'window' object.
                    jsobj.setMember("javaBridge", new Bridge());
                }
            }
        });
    }

    public static void main(String[] args) {
        launch(args);
    }
}
