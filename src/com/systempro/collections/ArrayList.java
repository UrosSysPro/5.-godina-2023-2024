package com.systempro.collections;

public class ArrayList {
    private int n;
    private int[] niz;

    public ArrayList(){
        n=0;
        niz=new int[1];
    }
    public int getSize(){
        return n;
    }
    public int get(int i){
        return niz[i];
    }
    public void set(int i,int value){
        niz[i]=value;
    }
    public void add(int value){
        if(n>=niz.length){
            int[] novi=new int[n+1];
            for(int i=0;i<n;i++){
                novi[i]=niz[i];
            }
            niz=novi;
        }
        niz[n]=value;
        n++;
    }
}
