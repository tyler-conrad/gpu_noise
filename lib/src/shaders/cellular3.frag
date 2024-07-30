#include <flutter/runtime_effect.glsl>
#include "config.glsl"
#include "fns/cellular3D.glsl"


uniform vec2 size;
uniform float time;
uniform vec3 xyz;
uniform float scale;
uniform float brightness;

out vec4 fragColor;

void main() {
    vec2 fragCoord = FlutterFragCoord();
    vec2 n = vec2(0.0);
    for(float i = 0.0; i < OCTAVES; i += 1.0) {
        n += cellular(vec3((xyz.xy + fragCoord) / size.y, xyz.z) * scale * pow(2.0, i));
    }
    n *= brightness / OCTAVES;
    fragColor = vec4(n.x, n.x, n.x, 1.0);
}
