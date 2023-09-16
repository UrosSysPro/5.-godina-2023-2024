package com.systempro;

import com.systempro.collections.ArrayList;

class Main{
    public static void main(String[] args) {
        ArrayList list=new ArrayList();
        for(int i=0;i<10;i++){
            list.add(i);
        }
        for(int i=0;i<10;i++){
            System.out.println(list.get(i));
        }
    }
}