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
        root=new Node(value,root);
    }
    public void addEnd(int value){
        if(root==null){
            root=new Node(value);
            return;
        }
        Node node=root;
        while (node.next!=null)node=node.next;
        node.next=new Node(value);
    }
    public void removeStart(){
        root=root.next;
    }
    public void removeEnd(){
        if(root==null||root.next==null){
            root=null;
            return;
        }
        Node node=root;
        while(node.next.next!=null)node=node.next;
        node.next=null;
    }
    public int get(int i){
        Node node=root;
        for(int j=0;j<i;j++){
            node=node.next;
        }
        return node.value;
    }
    public void insert(int value,int i){

    }
}
