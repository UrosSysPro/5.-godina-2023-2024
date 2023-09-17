package com.systempro.collections;

public class Stack<T> {
    private class Node{
        public T value;
        public Node next;
        public Node(T value, Node next){
            this.value=value;
            this.next=next;
        }
        public Node(T value){
            this(value,null);
        }
    }

    private Node root;

    public Stack(){
        root=null;
    }
    public void push(T value){
        root=new Node(value,root);
    }
    public T pop(){
        Node node=root;
        root=node.next;
        return node.value;
    }
    public T peek(){
        return root.value;
    }
    public boolean isEmpty(){
        return root==null;
    }
}
