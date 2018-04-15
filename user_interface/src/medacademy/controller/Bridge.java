package medacademy.controller;

import medacademy.model.ExcelBuilder;
import netscape.javascript.JSObject;

import java.util.ArrayList;

public class Bridge {

    ExcelBuilder builder = new ExcelBuilder();

    String[] internal = {"general", "celevoi", "general+", "ank_priem", "ank_bvi", "ank_kvota", "ank_celevoi", "ank_ball"};
    String[] gzgu = {"1.1", "1.2", "1.3", "1.4"};

    public void startStatGenerator(JSObject input) {
        String tab = (String) input.getMember("tabName");
        System.out.println(tab);
        ArrayList<String> sheets = new ArrayList<String>();
        switch(tab) {
            case "internal":
                for (String sheet : internal)
                    if (((Boolean) input.getMember(sheet)) == true)
                        sheets.add(sheet);

                try {
                    builder.startBuildExcel(tab, sheets);
                } catch (Exception e) {
                    e.printStackTrace();
                }

                break;
            case "gzgu":
                for (String sheet : gzgu)
                    if (((Boolean) input.getMember(sheet)) == true)
                        sheets.add(sheet);

                try {
                    builder.startBuildExcel(tab, sheets);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                break;
            case "list":
                System.out.println("list");
                System.out.println("nobvi" + " " + input.getMember("nobvi"));
                System.out.println("kvota" + " " + input.getMember("kvota"));
                System.out.println("celevoi" + " " + input.getMember("celevoi"));
                System.out.println("budget1" + " " + input.getMember("budget1"));
                System.out.println("budget2" + " " + input.getMember("budget2"));
                System.out.println("dogovor" + " " + input.getMember("dogovor"));
                System.out.println("vse" + " " + input.getMember("vse"));
                break;
            case "set":
                System.out.println("set");
                System.out.println("list");
                System.out.println("nobvi" + " " + input.getMember("bvi"));
                System.out.println("kvota" + " " + input.getMember("kvota"));
                System.out.println("celevoi" + " " + input.getMember("celevoi"));
                System.out.println("budget1" + " " + input.getMember("budget1"));
                System.out.println("budget2" + " " + input.getMember("budget2"));
                System.out.println("dogovor" + " " + input.getMember("dogovor"));
                System.out.println("vse1" + " " + input.getMember("vse1"));
                System.out.println("compet_ball" + " " + input.getMember("compet_ball"));
                System.out.println("general_ege" + " " + input.getMember("general_ege"));
                System.out.println("parts_ege" + " " + input.getMember("parts_ege"));
                System.out.println("general_id" + " " + input.getMember("general_id"));
                System.out.println("parts_id" + " " + input.getMember("parts_id"));
                System.out.println("vse2" + " " + input.getMember("vse2"));
                System.out.println("otdel_id" + " " + input.getMember("otdel_id"));
                System.out.println("inbetween" + " " + input.getMember("inbetween"));
                System.out.println("colored" + " " + input.getMember("colored"));
                break;
        }
    }
}