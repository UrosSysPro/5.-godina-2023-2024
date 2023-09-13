package com.systempro.geometrija;

public class Trougao extends Mnogougao{

    public Trougao(float a) {
        super(a);
    }

    @Override
    public float izracunajObim() {
        return 3*a;
    }

    @Override
    public float izracunajPovrsinu() {
        return a*a*(float)Math.sqrt(3)/4;
    }

    @Override
    public String toString() {
        return "Trougao"+super.toString();
    }

    @Override
    public void draw() {
        for(int j=0;j<a;j++){
            for(int i=0;i<a-j;i++){
                System.out.print(" ");
            }
            for(int i=0;i<j+1;i++){
                System.out.print(" *");
            }
            System.out.println();
        }
    }

    @Override
    public int compareTo(Object o) {
        if(o instanceof Cetvorougao)return 1;
        if(o instanceof Trougao){
            Trougao t=(Trougao) o;
            if(a>t.a)return 1;
            if(a<t.a)return -1;
        }
        return 0;
    }
}


/*
     *
    * *
   * * *
  * * * *
 * * * * *
* */