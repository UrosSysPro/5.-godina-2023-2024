package com.systempro.lavirint;

import javax.swing.*;
import java.awt.*;

public class App extends JFrame{
    DFS dfs;
    public App(){
        super();
        dfs=new DFS("resources/bfs/lavirint.txt");
        dfs.resi(14,0);
        dfs.print();
    }

    @Override
    public void paint(Graphics graphics) {
        super.paint(graphics);
        dfs.draw(graphics);
    }

    public static void run(){
        App frame=new App();
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setPreferredSize(new Dimension(800,600));
        frame.pack();
        frame.setVisible(true);
    }
}
