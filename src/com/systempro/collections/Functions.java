package com.systempro.collections;

public class Functions {
    public static long fibonaci(int n){
        if(n==0||n==1)return n;
        return fibonaci(n-1)+fibonaci(n-2);
    }
    public static long stepen(int x,int n){
        if(n==0)return 1;
        return x*stepen(x,n-1);
    }
    public static long stepen2(int x,int n){
        if(n==0)return 1;
        int k=n/2;
        if(n%2==0)return stepen2(x,k)*stepen2(x,k);
        return x*stepen2(x,k)*stepen2(x,k);
    }

}
