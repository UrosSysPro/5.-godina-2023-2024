package com.systempro.lavirint;

import javax.swing.*;
import java.awt.*;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;

public class App extends JFrame{
    DFS dfs;
    int cellSize=2;
    public App(){
        super();
//        dfs=new DFS("resources/bfs/lavirint.txt");
//        dfs.resi(14,0);
//        dfs.print();
        dfs=new DFS(800,500);
        dfs.regenerate();
        dfs.resi(40,30);
    }

    @Override
    public void paint(Graphics graphics) {
        super.paint(graphics);
        dfs.draw(graphics,cellSize);
    }

    public void click(int x,int y,int button){
        if(button==MouseEvent.BUTTON3)dfs.regenerate();
        x/=cellSize;
        y/=cellSize;
        dfs.resi(x,y);
        repaint();
    }

    public static void run(){
        App frame=new App();
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setPreferredSize(new Dimension(800,600));
        frame.pack();
        frame.setVisible(true);
        frame.addMouseListener(new MouseListener() {
            @Override
            public void mouseClicked(MouseEvent mouseEvent) {
                frame.click(mouseEvent.getX(), mouseEvent.getY(),mouseEvent.getButton());
            }

            @Override
            public void mousePressed(MouseEvent mouseEvent) {

            }

            @Override
            public void mouseReleased(MouseEvent mouseEvent) {

            }

            @Override
            public void mouseEntered(MouseEvent mouseEvent) {

            }

            @Override
            public void mouseExited(MouseEvent mouseEvent) {

            }
        });
    }
}
