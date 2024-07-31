#include <flutter/runtime_effect.glsl>
#include "config.glsl"
#include "fns/psrdnoise.glsl"


uniform vec2 size;
uniform float time;
uniform vec3 xyz;
uniform float scale;
uniform float brightness;

out vec4 fragColor;

void main() {
    vec2 fragCoord = FlutterFragCoord();
    float n = 0.0;
    for(float i = 0.0; i < OCTAVES; i += 1.0) {
        n += psrdnoise(vec3((xyz.xy + fragCoord) / size.y * scale * pow(2.0, i), xyz.z));
    }
    n *= brightness / OCTAVES;
    fragColor = vec4(n, n, n, 1.0);
}
