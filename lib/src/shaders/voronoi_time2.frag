#include "config.glsl"
#include "fns/voronoi.glsl"
#include <flutter/runtime_effect.glsl>

uniform vec2 size;
uniform float elapsed;
uniform float scale;
uniform float brightness;
uniform vec2 xy;
uniform float time;

out vec4 fragColor;

void main() {
  vec2 fragCoord = FlutterFragCoord();
  vec3 n = vec3(0.0);
  for (float i = 0.0; i < OCTAVES; i += 1.0) {
    n += voronoi((xy + fragCoord) / size.y * scale * pow(2.0, i), time);
  }
  n *= brightness / OCTAVES;
  fragColor = vec4(n.x, n.x, n.x, 1.0);
}
