#include <flutter/runtime_effect.glsl>
#include "config.glsl"
#include "fns/psrddnoise3.glsl"


uniform vec2 size;
uniform float time;
uniform vec3 xyz;
uniform vec3 period;
uniform float alpha;
uniform float scale;
uniform float dilation;

out vec4 fragColor;

void main() {
    vec2 fragCoord = FlutterFragCoord();
    vec3 gradient;
    vec3 dg;
    vec3 dg2;
    float n = 0.0;
    for(float i = 0.0; i < OCTAVES; i += 1.0) {
        n += psrddnoise(vec3((xyz.xy + fragCoord) / size.y, xyz.z) * scale / pow(2.0, i), period, alpha, gradient, dg, dg2);
    }
    n *= dilation / OCTAVES;
    fragColor = vec4(n, n, n, 1.0);
}
