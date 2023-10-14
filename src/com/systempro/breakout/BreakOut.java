package com.systempro.breakout;

import javax.swing.*;
import java.awt.*;

public class BreakOut {
    JFrame frame;
    Graphics graphics;
    int x=0,y=0;
    public BreakOut(){

        frame=new JFrame();
        SwingUtilities.invokeLater(new Runnable() {
            @Override
            public void run() {
                frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
                frame.setTitle("Break Out");
                frame.setPreferredSize(new Dimension(800,600));
                frame.pack();
                graphics=frame.getGraphics();
                frame.setVisible(true);
            }
        });
        try{
            Thread.sleep(1000);
        }catch (Exception e){
        }
    }

    public void run(){
        while(true){
            graphics.setColor(Color.CYAN);
            graphics.fillRect(x,y,100,100);
            System.out.println("hello");
            x++;
            y++;
            sleep();
        }
    }
    public void sleep(){
        try{
            Thread.sleep(16);
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
