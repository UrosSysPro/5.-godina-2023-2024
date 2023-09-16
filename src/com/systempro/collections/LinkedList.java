package com.systempro.collections;

public class LinkedList {
    private class Node{
        public int value;
        public Node next;
        public Node(int value,Node next){
            this.value=value;
            this.next=next;
        }
        public Node(int value){
            this(value,null);
        }
    }

    private Node root;
    public LinkedList(){
        root=null;
    }
    public void addStart(int value){

    }
    public void addEnd(int value){

    }
    public void removeStart(){

    }
    public void removeEnd(){

    }
    public int get(int i){
        return 0;
    }
    public void insert(int value,int i){

    }
}
