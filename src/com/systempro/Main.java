package com.systempro;


import com.systempro.lavirint.DFS;

class Main{
    public static void main(String[] args) {
        DFS dfs=new DFS("resources/bfs/lavirint.txt");
        dfs.resi(13,0);
        dfs.print();
    }
}