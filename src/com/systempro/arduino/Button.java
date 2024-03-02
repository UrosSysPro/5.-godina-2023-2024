package com.systempro.arduino;

import org.firmata4j.Pin;

import java.awt.*;
import java.awt.event.KeyEvent;

public class Button {
    public Pin pin;
    public boolean down;
    public int key;
    public String name;
    public Button(Pin pin,int key,String name){
        this.name=name;
        this.key=key;
        this.pin=pin;
        down=false;
        try{
            pin.setMode(Pin.Mode.INPUT);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    public void change(long value){
        down= value == 1;
    }
    public void update(){
        try{
            Robot robot=new Robot();
            if (down){
                robot.keyPress(key);
            }else{
                robot.keyRelease(key);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
