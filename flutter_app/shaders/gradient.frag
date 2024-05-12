#include <flutter/runtime_effect.glsl>

uniform vec2 size;

out vec4 fragColor;

void main() {
//    int float vec2 vec3 vec4
    vec2 uv = FlutterFragCoord().xy / vec2(1000);
    fragColor = vec4(uv,0.5,1.0);
}