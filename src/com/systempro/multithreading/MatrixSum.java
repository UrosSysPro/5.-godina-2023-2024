package com.systempro.multithreading;

import java.util.Random;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;

public class MatrixSum {
    int[][] mat;
    ExecutorService service;
    Adder[] adders;
    Future[] futures;
    long[] zbirovi;
    public MatrixSum(int n,int m){
        service= Executors.newFixedThreadPool(16);
        Random random=new Random();
        mat=new int[n][m];
        for(int i=0;i<n;i++){
            for(int j=0;j<m;j++){
                mat[i][j]=random.nextInt(10000);
            }
        }
        adders=new Adder[n];
        zbirovi=new long[n];
        futures=new Future[n];
        for(int i=0;i<adders.length;i++)adders[i]=new Adder(mat,i,zbirovi);
    }
    public long sum(){
        long s=0;
        for(int i=0;i<mat.length;i++){
            for(int j=0;j<mat[i].length;j++){
                Math.sin(mat[i][j]);
                s+=mat[i][j];
            }
        }
        return s;
    }
    public long sumParallel(){
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
                try{
                    threads[i].join();
                }catch (Exception e){
                    e.printStackTrace();
                }
                s+=zbirovi[i];
            }
            return s;
    }
    public long sumConcurent(){
        for(int i=0;i<mat.length;i++){
            futures[i]=service.submit(adders[i]);
        }
        long s=0;
        for(int i=0;i<futures.length;i++){
            try{
                futures[i].get();
            }catch (Exception e){
                e.printStackTrace();
            }
            s+=zbirovi[i];
        }
        return s;
    }
    public void shutDown(){
        service.shutdown();
    }
}
