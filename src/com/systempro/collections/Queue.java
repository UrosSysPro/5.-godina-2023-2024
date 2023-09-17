package com.systempro.collections;

public class Queue<T> {
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

    private Node start,end;
    public Queue(){
        start=null;
        end=null;
    }
    public void add(T value){
        if(start==null)
            end=start=new Node(value);
        else{
            end.next=new Node(value);
            end=end.next;
        }
    }
    public T remove(){
        T value=start.value;
        start=start.next;
        if(start==null)end=null;
        return value;
    }
    public boolean isEmpty(){
        return start==null;
    }
}
