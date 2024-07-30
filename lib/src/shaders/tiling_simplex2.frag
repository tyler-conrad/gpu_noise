#include <flutter/runtime_effect.glsl>
#include "config.glsl"
#include "fns/psrddnoise2.glsl"


uniform vec2 size;
uniform float time;
uniform vec2 xy;
uniform vec2 period;
uniform float alpha;
uniform float scale;
uniform float brightness;

out vec4 fragColor;

void main() {
    vec2 fragCoord = FlutterFragCoord();
    vec2 gradient;
    vec3 dg;
    float n = 0.0;
    for(float i = 0.0; i < OCTAVES; i += 1.0) {
        n += psrddnoise((xy + fragCoord) / size.y * scale / pow(2.0, i), period, alpha, gradient, dg);
    }
    n *= brightness / OCTAVES;
    fragColor = vec4(n, n, n, 1.0);
}
