package com.systempro.collections;

public class Stack {
    private static class Node{
        public int value;
        public Node next;
        public Node(int value, Node next){
            this.value=value;
            this.next=next;
        }
        public Node(int value){
            this(value,null);
        }
    }

    private Node root;

    public Stack(){
        root=null;
    }
    public void push(int i){

    }
    public int pop(){

    }
    public int peek(){

    }
    public boolean isEmpty(){

    }
}
