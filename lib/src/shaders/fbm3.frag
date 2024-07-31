#include <flutter/runtime_effect.glsl>
#include "config.glsl"
#include "fns/fbm.glsl"


uniform vec2 size;
uniform float elapsed;
uniform vec3 xyz;
uniform float scale;
uniform float brightness;

out vec4 fragColor;

void main() {
    vec2 fragCoord = FlutterFragCoord();
    float n = fbm(vec3((xyz.xy + fragCoord) / size.y * scale, xyz.z)) * brightness / FBM_OCTAVES;
    fragColor = vec4(n, n, n, 1.0);
}
