package com.systempro.arduino;

import com.googlecode.lanterna.TerminalSize;
import com.googlecode.lanterna.graphics.TextGraphics;
import com.googlecode.lanterna.input.KeyStroke;
import com.googlecode.lanterna.input.KeyType;
import com.googlecode.lanterna.screen.Screen;
import com.googlecode.lanterna.screen.TerminalScreen;
import com.googlecode.lanterna.terminal.DefaultTerminalFactory;
import org.firmata4j.IODevice;
import org.firmata4j.IODeviceEventListener;
import org.firmata4j.IOEvent;
import org.firmata4j.Pin;
import org.firmata4j.firmata.FirmataDevice;

import java.awt.event.KeyEvent;
import java.io.IOException;

public class ArduinoTest implements IODeviceEventListener{
    public Screen screen;
    public TextGraphics graphics;
    public IODevice device;
//    public Button button1,button2;
    public Button[] buttons;
    public boolean exit;
    public void run(){
        try{
            screen=new DefaultTerminalFactory().createScreen();
            graphics=screen.newTextGraphics();
            screen.startScreen();
            device = new FirmataDevice("/dev/ttyUSB0");
            device.addEventListener(this);
            device.ensureInitializationIsDone();


            buttons=new Button[]{
                new Button(device.getPin(2), KeyEvent.VK_D,"key D"),
                new Button(device.getPin(4), KeyEvent.VK_W,"key W"),
                new Button(device.getPin(6), KeyEvent.VK_A,"key A"),
            };

            exit=false;
            while (!exit){
                input();
                update();
                draw();
                Thread.sleep(16);
            }

            screen.stopScreen();
            device.stop();
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public void input(){
        try {
            KeyStroke keyStroke;
            while((keyStroke=screen.pollInput())!=null){
                if(keyStroke.getKeyType()== KeyType.Character){
                    char c=keyStroke.getCharacter();
                    if(c=='q'){
                        exit=true;
                    }
                }
            }
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    public void update(){
        for(Button button:buttons)button.update();
    }
    public void draw(){
        try {
            for(int i=0;i<buttons.length;i++){
                graphics.putString(0,i,buttons[i].name+": "+buttons[i].down);
            }
            screen.refresh();
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
        if(buttons==null)return;

        Pin pin = event.getPin();
        long value= pin.getValue();
        int index=pin.getIndex();

        for(Button button:buttons) if(index==button.pin.getIndex())button.change(value);
    }
    @Override
    public void onMessageReceive(IOEvent event, String message) {
        System.out.println(message);
    }
}
