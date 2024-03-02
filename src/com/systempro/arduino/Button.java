package com.systempro.arduino;

import org.firmata4j.Pin;

import java.awt.*;
import java.awt.event.KeyEvent;

public class Button {
    public Pin pin;
    public boolean down;
    public int key;
    public Button(Pin pin,int key){
        this.key=key;
        this.pin=pin;
        down=false;
    }
    public void change(long value){
        down= value != 0;
    }
    public void update(){
        Robot robot;
        try{
            robot=new Robot();
        }catch (Exception e){
            e.printStackTrace();
            return;
        }
        if (down){
            robot.keyPress(key);
        }else{
            robot.keyRelease(key);
        }
    }
}
