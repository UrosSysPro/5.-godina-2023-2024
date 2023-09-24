package com.systempro.collections;

public class Tree {
    private class Node{
        public int value;
        public Node left,right;
        public Node(int value){
            this(value,null,null);
        }
        public Node(int value,Node left,Node right){
            this.value=value;
            this.left=left;
            this.right=right;
        }
    }
    private Node root;
    public Tree(){
        root=null;
    }
    public void add(int value){
        root=addR(root,value);
    }
    private Node addR(Node root,int value){
        if(root==null)return new Node(value);
        if(value>root.value){
            root.right=addR(root.right,value);
        }else{
            root.left=addR(root.left,value);
        }
        return root;
    }
}
