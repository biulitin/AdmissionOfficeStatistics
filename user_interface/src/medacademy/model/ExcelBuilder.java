package medacademy.model;

import org.apache.poi.ss.usermodel.*;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.*;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.util.ArrayList;
import java.util.Iterator;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class ExcelBuilder {

    XSSFWorkbook book = null;

    //represents the needs of generation
    //finds by IDs name of sheets, excel template and sql query
    public class WhereIsIt{
        public String excelName;//excel template name
        public ArrayList<String> sheetName = new ArrayList<String>();//sheets to generate names
        public ArrayList<String> sql = new ArrayList<String>();      //sql query for sheets

        public WhereIsIt(String excelId, ArrayList<String> sheetId){
            JSONParser parser = new JSONParser();
            try{
                JSONArray arr = (JSONArray) parser.parse(new FileReader(this.getClass().getClassLoader().getResource("").getPath()+"medacademy\\model\\jsons\\sql.json"));
                Iterator<JSONObject> iter = arr.iterator();
                while(iter.hasNext()){
                    JSONObject obj = iter.next();
                    String objExcelId = (String) obj.get("excel_id");
                    String objSheetId = (String) obj.get("sheet_id");
                    if(objExcelId.equals(excelId)){
                        excelName = (String) obj.get("excel_name");
                        for(String sheet: sheetId){
                            if(sheet.equals(objSheetId)){
                                sheetName.add((String) obj.get("sheet_name"));
                                sql.add((String) obj.get("sql"));
                            }
                        }
                    }
                }
            }catch(Exception e){
                e.printStackTrace();
            }
        }
    }

    //represent cell
    public class MyCell{
        public int x1,x2,y1,y2;
        public Pattern p = Pattern.compile("\\d+");

        //start is for the point of entry
        public MyCell(String str, int start){
            Matcher m = p.matcher(str);
            m.find();
            x1 = (Integer.parseInt(m.group())-1);
            m.find();
            x2 = (Integer.parseInt(m.group())-1);
            m.find();
            y1 = (Integer.parseInt(m.group())-1)+start;
            m.find();
            y2 = (Integer.parseInt(m.group())-1)+start;
        }

        //default style of a cell
        public CellStyle defStyle(Row row){
            CellStyle style = row.getSheet().getWorkbook().createCellStyle();
            style.setVerticalAlignment(VerticalAlignment.CENTER);
            style.setAlignment(HorizontalAlignment.CENTER);
            return style;
        }

        public MyCell insert(XSSFSheet sheet, String text){
            //if merge cells needs
            if((y1!=y2)||(x1!=x2))
                sheet.addMergedRegion(new CellRangeAddress(y1,y2,x1,x2));

            Row row = sheet.getRow(y1);
            if(row == null)
                row = sheet.createRow(y1);

            Cell cell = row.createCell(x1);
            cell.setCellStyle(defStyle(row));
            cell.setCellValue(text);
            return this;
        }
    }

    //fulfill sheet with the sql query result
    //it knows where to paste cell by the names of columns in result set
    public void fulfillSheet(XSSFSheet sheet, ResultSet set) throws Exception{
        ResultSetMetaData meta = set.getMetaData();
        int start = 0;
        MyCell lastCell = null;
        while(set.next()){
            for(int i = 0; i<meta.getColumnCount(); i++){
                String colName = meta.getColumnName(1+i);
                if(!colName.matches("^c.*"))
                    continue;
                String cellText = set.getString(i+1);
                lastCell = new MyCell(colName, start).insert(sheet, cellText);
            }
            start = lastCell.y2;
        }
    }

    //the entry point of generation
    //it takes the id of document and ids of required sheets
    public void startBuildExcel(String name, ArrayList<String> sheets) throws Exception{
        WhereIsIt whereisit = new WhereIsIt(name, sheets);
        File file = new File(this.getClass().getClassLoader().getResource("").getPath()+"medacademy\\model\\excels\\"+whereisit.excelName);
        XSSFWorkbook book = new XSSFWorkbook(file);
        for(int i = 0; i<whereisit.sheetName.size(); i++){
            XSSFSheet sheet = book.getSheet(whereisit.sheetName.get(i));
            ResultSet set = DBSingleton.executeStatement(whereisit.sql.get(i));
            fulfillSheet(sheet, set);
        }
        book.write(new FileOutputStream(file+"1.xlsx"));
    }
}
