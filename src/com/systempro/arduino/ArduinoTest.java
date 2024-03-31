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
public class ArduinoTest implements IODeviceEventListener{
    public Screen screen;
    public TextGraphics graphics;
    public IODevice device;
    public Pin analogIn;
    public boolean exit;
    public void run(){
        try{
            screen=new DefaultTerminalFactory().createScreen();
            graphics=screen.newTextGraphics();
            screen.startScreen();
            device = new FirmataDevice("/dev/ttyUSB0");
            device.addEventListener(this);
            device.ensureInitializationIsDone();

            analogIn=device.getPin(14);
            analogIn.setMode(Pin.Mode.ANALOG);


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

    }
    public void draw(){
        try {
            screen.clear();
            graphics.putString(0,0,String.format("pin 14: %4d",analogIn.getValue()));
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

        Pin pin = event.getPin();
        long value= pin.getValue();
        int index=pin.getIndex();
    }
    @Override
    public void onMessageReceive(IOEvent event, String message) {
        System.out.println(message);
    }
}
