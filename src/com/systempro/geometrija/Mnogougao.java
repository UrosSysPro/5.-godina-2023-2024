package com.systempro.geometrija;

public abstract class Mnogougao implements Drawable,Comparable{
    public Mnogougao(float a){
        this.a=a;
    }
    public float a;
    public abstract float izracunajObim();
    public abstract float izracunajPovrsinu();

    @Override
    public String toString() {
        return "{ povrsina: "+
            izracunajPovrsinu()+
            ", obim: "+
            izracunajObim()+
            ", a: "+a+" }";
    }
}
