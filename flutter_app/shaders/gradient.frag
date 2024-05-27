#include <flutter/runtime_effect.glsl>

//uniform vec2 size;
uniform vec4 color;
uniform vec2 size;
uniform vec2 mouse;

out vec4 fragColor;

float circle(vec2 p,float r){
    return length(p)-r;
}
vec2 translate(vec2 p,vec2 t){
    return p-t;
}
vec3 translate(vec3 p,vec3 t){
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
float box(vec2 p,vec2 b ){
    vec2 d = abs(p)-b;
    return length(max(d,0.0)) + min(max(d.x,d.y),0.0);
}

float sdSphere( vec3 p, float s )
{
    return length(p)-s;
}

#define PI 3.1415926535
float shape(vec2 p){
    return unionSdf(
        box(translate(p,vec2(300,500)),vec2(50,200)),
        box(translate(p,vec2(500,500)),vec2(200,50))
    );
}
//float shape(vec2 p){
//    float d=10000;
//    vec2 center=size/2;
//    float a=100;
//    for(int i=0;i<6;i++){
//        float angle=PI*2/6*float(i);
//        vec2 t=center+vec2(cos(angle),sin(angle))*a;
//        float d1=outline(
//        circle(translate(p,t),a)
//        ,3);
//        d=min(d1,d);
//    }
//    return d;
//}

float rayMarch(vec2 start,vec2 target){
    vec2 ro=start;
    vec2 rd=normalize(target-start);
    float initial=distance(start,target);
    float d=0;
    for(int i=0;i<750;i++){
        vec2 p=ro+rd*d;
        float min=shape(p);
        float sdf=min;
        d+=sdf;
        if(d>initial||min<0.001)break;
    }
    return d;
}

void main() {
    //    fragColor=color;
    vec2 uv = FlutterFragCoord().xy;
    float r=rayMarch(uv,mouse);
    float d=shape(uv);
    vec4 innerColor=vec4(uv/size,0.5,1.0);
    vec4 outerColor=vec4(0,0,0,1);
    float smoothness=2;
    fragColor=mix(innerColor,outerColor,float(r>distance(uv,mouse)));
    //    fragColor=mix(innerColor,outerColor,smoothstep(0,smoothness,d));
}