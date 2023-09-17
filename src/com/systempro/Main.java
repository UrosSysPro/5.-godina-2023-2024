package com.systempro;

import com.systempro.collections.ArrayList;
import com.systempro.collections.LinkedList;

class Main{
    public static void main(String[] args) {
        LinkedList list=new LinkedList();
        for(int i=0;i<10;i++){
            list.addStart(i);
        }
        for(int i=0;i<10;i++){
            System.out.println(list.get(i));
        }
    }
}