package com.systempro.multithreading;

import java.util.Random;

public class MatrixSum {
    int[][] mat;
    public MatrixSum(int n,int m){
        Random random=new Random();
        mat=new int[n][m];
        for(int i=0;i<n;i++){
            for(int j=0;j<m;j++){
                mat[i][j]=random.nextInt(10000);
            }
        }
    }
    public long sum(){
        long s=0;
        for(int i=0;i<mat.length;i++){
            for(int j=0;j<mat[i].length;j++){
                s+=mat[i][j];
            }
        }
        return s;
    }
    public long sumParallel(){
        try{
            long[] zbirovi=new long[mat.length];
            Thread[] threads=new Thread[mat.length];
            for(int i=0;i<threads.length;i++){
                int column = i;
                threads[i]=new Thread(()->{
                    zbirovi[column]=0;
                    for(int j=0;j<mat[column].length;j++){
                        zbirovi[column]+=mat[column][j];
                    }
                });
                threads[i].start();
            }
            long s=0;
            for(int i=0;i<threads.length;i++){
                threads[i].join();
                s+=zbirovi[i];
            }
            return s;
        }catch (Exception e){
            e.printStackTrace();
        }
        return 0;
    }
}
