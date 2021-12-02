package com.rundeck.plugins.oro;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Properties;

public class DBResourceModelSourceTest {

    public static void main(String[] args) {
        try {
            InputStream input = new FileInputStream(args[0]);
            Properties prop = new Properties();
            prop.load(input);
            DBResourceModelSource o = new DBResourceModelSource(prop);


        } catch (Exception ex) {
            ex.printStackTrace();
        }


    }
}
