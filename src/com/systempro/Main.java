package com.systempro;


import com.systempro.collections.Queue;
import com.systempro.collections.Stack;
import com.systempro.lavirint.BFS;

class Main{
    public static void main(String[] args) {
        BFS bfs=new BFS("resources/bfs/lavirint.txt");
        bfs.print();
    }
}