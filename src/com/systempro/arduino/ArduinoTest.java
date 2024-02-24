package com.systempro.arduino;

import org.firmata4j.IODevice;
import org.firmata4j.IODeviceEventListener;
import org.firmata4j.IOEvent;
import org.firmata4j.Pin;
import org.firmata4j.firmata.FirmataDevice;

import java.util.Scanner;

public class ArduinoTest {
    public void run(){
        try {
            IODevice device = new FirmataDevice("/dev/ttyUSB0");

            device.addEventListener(new IODeviceEventListener() {
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
                }
                @Override
                public void onMessageReceive(IOEvent event, String message) {
                    System.out.println(message);
                }
            });
            device.ensureInitializationIsDone();

            Pin pin=device.getPin(8);
            pin.setMode(Pin.Mode.OUTPUT);
            pin.setValue(1);

            Scanner scanner=new Scanner(System.in);
            while (true){
                char c=scanner.next().charAt(0);
                if(c=='q')break;
                if(c=='w'){
                    pin.setValue(pin.getValue()==1?0:1);
                }
                System.out.println(c);
            }
            device.stop();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
