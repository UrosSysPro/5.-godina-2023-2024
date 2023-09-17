package com.systempro;


import com.systempro.collections.Queue;
import com.systempro.collections.Stack;

class Main{
    public static void main(String[] args) {
        Queue<Short> queue=new Queue<>();
        for(short i=0;i<10;i++)queue.add(i);
        for(short i=0;i<10;i++) System.out.println(queue.remove());
    }
}