#include <flutter/runtime_effect.glsl>

//uniform vec2 size;
uniform vec4 color;
uniform vec2 size;

out vec4 fragColor;

float circle(vec2 p,float r){
    return length(p)-r;
}
vec2 translate(vec2 p,vec2 t){
    return p-t;
}
float unionSdf(float d1,float d2){
    return min(d1,d2);
}
float outline(float d,float w){
    return abs(d)-w;
}
float subtract(float d1,float d2){
    return max(d1,-d2);
}
#define PI 3.1415926535
float shape(vec2 p){
    float d=10000;
    vec2 center=size/2;
    float a=100;
    for(int i=0;i<6;i++){
        float angle=PI*2/6*float(i);
        vec2 t=center+vec2(cos(angle),sin(angle))*a;
        float d1=outline(
            circle(translate(p,t),a)
        ,3);
        d=min(d1,d);
    }
    return d;
//    return subtract(
//        outline(
//            circle(translate(p,vec2(300,300)),100),
//            3
//        ),
//        circle(translate(p,vec2(300,400)),100)
//    );
}
void main() {
    //    fragColor=color;
    vec2 uv = FlutterFragCoord().xy;
    float d=shape(uv);
    vec4 innerColor=vec4(uv/size,0.5,1.0);
    vec4 outerColor=vec4(0,0,0,1);
    float smoothness=2;
    fragColor=mix(innerColor,outerColor,smoothstep(0,smoothness,d));
}