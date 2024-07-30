#include <flutter/runtime_effect.glsl>
#include <fns/cellular3D.glsl>

const float octaves = 4.0;

uniform vec2 size;
uniform float time;
uniform vec3 xyz;
uniform float scale;
uniform float dilation;


out vec4 fragColor;

void main() {
    vec2 fragCoord = FlutterFragCoord();
    vec2 n = vec2(0.0);
    for(float i = 0.0; i < octaves; i += 1.0) {
        n += cellular(vec3((xyz.xy + fragCoord) / size.y, xyz.z) * scale * pow(2.0, i));
    }
    n /= dilation / octaves;
    fragColor = vec4(n.y, n.y, n.y, 1.0);
}
