package com.systempro.lavirint;

import com.systempro.collections.Queue;

import java.awt.*;
import java.io.File;
import java.util.Scanner;

public class DFS {
    private int[][] mat;
    private int width,height;

    public DFS(String fileName){
        try{
            File file=new File(fileName);
            Scanner scanner=new Scanner(file);

            String[] row=scanner.nextLine().split(" ");
            width=Integer.parseInt(row[0]);
            height=Integer.parseInt(row[1]);

            mat=new int[width][height];

            for(int j=0;j<height;j++){
                row=scanner.nextLine().split(" ");
                for(int i=0;i<width;i++){
                    mat[i][j]=Integer.parseInt(row[i]);
                }
            }
        }catch (Exception e){
            e.printStackTrace();
        }
    }
    public void print(){
        for(int j=0;j<height;j++){
            for(int i=0;i<width;i++){
                if(mat[i][j]==-1)System.out.print("   ");
                else if(mat[i][j]==-2)System.out.print("###");
                else ispisiBroj(mat[i][j]);
            }
            System.out.println();
        }
    }
    private void ispisiBroj(int broj){
        if(broj<10)         System.out.print("  "+broj);
        else if(broj<100)   System.out.print(" "+broj);
        else if(broj<1000)  System.out.print(broj);
    }
    public void resi(int x,int y){
        mat[x][y]=0;
        Queue<Point> stack=new Queue<>();
        stack.add(new Point(x,y));
        while (!stack.isEmpty()){
            Point p=stack.remove();
            if(p.x-1>=0&&p.x-1<width&&mat[p.x-1][p.y]==-1){
                stack.add(new Point(p.x-1,p.y));
                mat[p.x-1][p.y]=mat[p.x][p.y]+1;
            }
            if(p.x+1>=0&&p.x+1<width&&mat[p.x+1][p.y]==-1) {
                stack.add(new Point(p.x+1,p.y));
                mat[p.x+1][p.y]=mat[p.x][p.y]+1;
            }
            if(p.y-1>=0&&p.y-1<height&&mat[p.x][p.y-1]==-1){
                stack.add(new Point(p.x,p.y-1));
                mat[p.x][p.y-1]=mat[p.x][p.y]+1;
            }
            if(p.y+1>=0&&p.y+1<height&&mat[p.x][p.y+1]==-1) {
                stack.add(new Point(p.x,p.y+1));
                mat[p.x][p.y+1]=mat[p.x][p.y]+1;
            }
        }
    }

    public void draw(Graphics graphics){
        Color start=Color.BLUE;
        Color end=Color.ORANGE;
        int cellSize=50;
        int max=-2;
        for(int i=0;i<width;i++){
            for(int j=0;j<height;j++) {
                if(mat[i][j]>max)max=mat[i][j];
            }
        }
        for(int i=0;i<width;i++){
            for(int j=0;j<height;j++){
                if(mat[i][j]==-2){
                    graphics.setColor(Color.BLACK);
                    graphics.fillRect(i*cellSize,j*cellSize+50,cellSize,cellSize);
                }
                if(mat[i][j]==-1){
                    graphics.setColor(Color.WHITE);
                    graphics.fillRect(i*cellSize,j*cellSize+50,cellSize,cellSize);
                }
                if(mat[i][j]!=-2 && mat[i][j]!=-1){
                    float alfa=(float)mat[i][j]/(float)max;

                    Color color=new Color(
                        (int)(start.getRed()*alfa+end.getRed()*(1-alfa)),
                        (int)(start.getGreen()*alfa+end.getGreen()*(1-alfa)),
                        (int)(start.getBlue()*alfa+end.getBlue()*(1-alfa))
                    );
                    graphics.setColor(color);
                    graphics.fillRect(i*cellSize,j*cellSize+50,cellSize,cellSize);
                }
            }
        }
    }
}
