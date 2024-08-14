#include "config.glsl"
#include "fns/fbm.glsl"
#include <flutter/runtime_effect.glsl>

uniform vec2 size;
uniform float elapsed;
uniform float scale;
uniform float brightness;
uniform vec3 xyz;
uniform float period;

out vec4 fragColor;

void main() {
  vec2 fragCoord = FlutterFragCoord();
  float n = fbm(vec3((xyz.xy + fragCoord) / size.y * scale, xyz.z), period) *
            brightness / FBM_OCTAVES;
  fragColor = vec4(n, n, n, 1.0);
}
