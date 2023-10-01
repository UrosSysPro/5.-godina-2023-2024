package com.systempro.lavirint;

import java.io.File;
import java.util.Scanner;

public class BFS {
    private int[][] mat;
    private int width,height;

    public BFS(String fileName){
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

    }
}
