package com.systempro.geometrija;

public class Cetvorougao extends Mnogougao{
    public Cetvorougao(float a) {
        super(a);
    }

    @Override
    public float izracunajObim() {
        return 4*a;
    }

    @Override
    public float izracunajPovrsinu() {
        return a*a;
    }

    @Override
    public String toString() {
        return "Cetvorougao"+super.toString();
    }

    @Override
    public void draw() {
        for(int i=0;i<a;i++){
            for(int j=0;j<a;j++){
                System.out.print(" *");
            }
            System.out.println();
        }
    }

    @Override
    public int compareTo(Object o) {
        if(o instanceof Trougao)return -1;
        if(o instanceof Cetvorougao){
            Cetvorougao t=(Cetvorougao) o;
            if(a>t.a)return 1;
            if(a<t.a)return -1;
        }
        return 0;
    }
}
