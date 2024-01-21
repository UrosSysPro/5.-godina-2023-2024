package com.systempro;
import com.systempro.multithreading.MatrixSum;

class Main{
    public static void main(String[] args) {
        MatrixSum p=new MatrixSum(16,10000000);

        long average=0;
        for(int i=0;i<10;i++){
            long start=System.nanoTime();
            long sum=p.sumConcurent();
            long end=System.nanoTime();
            System.out.println("zbir: "+sum+"\nvreme: "+(end-start)/1000_000);
            average+=(end-start);
        }

        average/=10;
        System.out.println("Average: "+average+"in miliseconds: "+average/1000_000);

        p.shutDown();
    }
}