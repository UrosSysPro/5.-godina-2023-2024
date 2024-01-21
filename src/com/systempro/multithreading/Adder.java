package com.systempro.multithreading;

public class Adder implements Runnable {
    int[][] mat;
    int column;
    long[] zbirovi;
    public Adder(int[][] mat,int column,long[] zbirovi){
        this.mat=mat;
        this.column=column;
        this.zbirovi=zbirovi;
    }
    @Override
    public void run() {
        zbirovi[column]=0;
        for(int j=0;j<mat[column].length;j++){
            Math.sin(mat[column][j]);
            zbirovi[column]+=mat[column][j];
        }
    }
}
