package com.systempro;


import com.systempro.breakout.BreakOut;
import com.systempro.lavirint.App;
import com.systempro.multithreading.MatrixSum;

class Main{
    public static void main(String[] args) {
        MatrixSum p=new MatrixSum(8,10000000);
        long sum2=p.sum();
        long start=System.nanoTime();
        long sum=p.sumParallel();
        long end=System.nanoTime();
        System.out.println("zbir: "+sum+"\nvreme: "+(end-start));
        if(sum==sum2){
            System.out.println("tacno\n");
        }else{
            System.out.println("netacno\n");
        }
    }
}