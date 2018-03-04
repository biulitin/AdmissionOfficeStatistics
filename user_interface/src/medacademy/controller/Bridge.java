package medacademy.controller;

import netscape.javascript.JSObject;

public class Bridge {
    public void startStatGenerator(JSObject input) {
        String tab = (String) input.getMember("tabName");

        switch(tab){
            case "internal":
                System.out.println("internal");
                System.out.println("general"  + " " +input.getMember("general"));
                System.out.println("celevoi"  + " " +input.getMember("celevoi"));
                System.out.println("general+"  + " " +input.getMember("general+"));
                System.out.println("ank_priem"  + " " +input.getMember("ank_priem"));
                System.out.println("ank_bvi"  + " " +input.getMember("ank_bvi"));
                System.out.println("ank_kvota"  + " " +input.getMember("ank_kvota"));
                System.out.println("ank_celecoi"  + " " +input.getMember("ank_celevoi"));
                System.out.println("ank_ball"  + " " +input.getMember("ank_ball"));
                break;
            case "gzgu":
                System.out.println("gzgu");
                System.out.println("1.1" + " " + input.getMember("1.1"));
                System.out.println("1.2" + " " + input.getMember("1.2"));
                System.out.println("1.3" + " " + input.getMember("1.3"));
                System.out.println("1.4" + " " + input.getMember("1.4"));
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