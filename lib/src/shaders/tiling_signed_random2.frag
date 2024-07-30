#include <flutter/runtime_effect.glsl>
#include "config.glsl"
#include "fns/srandom.glsl"


uniform vec2 size;
uniform float time;
uniform vec2 xy;
uniform float period;
uniform float scale;
uniform float brightness;

out vec4 fragColor;

void main() {
    vec2 fragCoord = FlutterFragCoord();
    vec2 n = vec2(0.0);
    for(float i = 0.0; i < OCTAVES; i += 1.0) {
        n += srandom2((xy + fragCoord) / size.y * scale * pow(2.0, i), period);
    }
    n *= brightness / OCTAVES;
    fragColor = vec4(n.x, n.x, n.x, 1.0);
}
