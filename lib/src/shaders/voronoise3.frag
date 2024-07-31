#include <flutter/runtime_effect.glsl>
#include "config.glsl"
#include "fns/voronoise.glsl"

uniform vec2 size;
uniform float elapsed;
uniform float scale;
uniform float brightness;
uniform vec3 xyz;
uniform vec2 uv;

out vec4 fragColor;

void main() {
    vec2 fragCoord = FlutterFragCoord();
    float n = 0.0;
    for(float i = 0.0; i < OCTAVES; i += 1.0) {
        n += voronoise(vec3((xyz.xy + fragCoord) / size.y * scale * pow(2.0, i), xyz.z), uv.x, uv.y);
    }
    n *= brightness / OCTAVES;
    fragColor = vec4(n, n, n, 1.0);
}
