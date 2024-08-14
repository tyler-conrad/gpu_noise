#include "config.glsl"
#include "fns/random.glsl"
#include <flutter/runtime_effect.glsl>

uniform vec2 size;
uniform float elapsed;
uniform float scale;
uniform float brightness;
uniform vec4 xyzw;

out vec4 fragColor;

void main() {
  vec2 fragCoord = FlutterFragCoord();
  float n = 0.0;
  for (float i = 0.0; i < OCTAVES; i += 1.0) {
    n += random(vec4((xyzw.xy + fragCoord) / size.y * scale * pow(2.0, i),
                     xyzw.z, xyzw.w));
  }
  n *= brightness / OCTAVES;
  fragColor = vec4(n, n, n, 1.0);
}