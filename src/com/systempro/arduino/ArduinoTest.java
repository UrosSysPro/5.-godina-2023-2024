package com.systempro.arduino;

import com.googlecode.lanterna.input.KeyStroke;
import com.googlecode.lanterna.input.KeyType;
import com.googlecode.lanterna.screen.Screen;
import com.googlecode.lanterna.terminal.DefaultTerminalFactory;
import org.firmata4j.IODevice;
import org.firmata4j.IODeviceEventListener;
import org.firmata4j.IOEvent;
import org.firmata4j.Pin;
import org.firmata4j.firmata.FirmataDevice;

import java.awt.*;
import java.awt.event.KeyEvent;

public class ArduinoTest implements IODeviceEventListener{
    public Screen screen;
    public int button1=2,button2=3;

    public void run(){
        try {
            screen=new DefaultTerminalFactory().createScreen();
            System.out.println();
            screen.startScreen();
            IODevice device = new FirmataDevice("/dev/ttyUSB0");
            device.addEventListener(this);
            device.ensureInitializationIsDone();

//            Pin pin1=device.getPin(button1);
//            Pin pin2=device.getPin(button2);
//            pin1.setMode(Pin.Mode.INPUT);
//            pin2.setMode(Pin.Mode.INPUT);

            boolean exit=false;
            while (!exit){
                KeyStroke keyStroke;
                while((keyStroke=screen.pollInput())!=null){
                    if(keyStroke.getKeyType()== KeyType.Character){
                        char c=keyStroke.getCharacter();
                        if(c=='q'){
                            exit=true;
                        }
                    }
                }
                Thread.sleep(16);
            }

            screen.stopScreen();
            device.stop();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    @Override
    public void onStart(IOEvent event) {
        System.out.println("Device is ready");
    }
    @Override
    public void onStop(IOEvent event) {
        System.out.println("Device has been stopped");
    }
    @Override
    public void onPinChange(IOEvent event) {
        Pin pin = event.getPin();
        long value= pin.getValue();
        int index=pin.getIndex();
        if(index==8){
            System.out.println(
                String.format(
                    "Pin %d got a value of %d",
                    pin.getIndex(),
                    pin.getValue())
            );
        }
        if(index==button1&&value==1){
            try{
                Robot robot=new Robot();
                robot.keyPress(KeyEvent.VK_I);
                robot.keyRelease(KeyEvent.VK_I);
            }catch (Exception e){
                System.out.println("robot error");
                e.printStackTrace();
            }
            System.out.println("pin 0 value:"+value);
        }
        if(index==button2&&value==1){
            try{
                Robot robot=new Robot();
                robot.keyPress(KeyEvent.VK_K);
                robot.keyRelease(KeyEvent.VK_K);
            }catch (Exception e){
                System.out.println("robot error");
                e.printStackTrace();
            }
            System.out.println("pin 0 value:"+value);
        }
    }
    @Override
    public void onMessageReceive(IOEvent event, String message) {
        System.out.println(message);
    }
}
