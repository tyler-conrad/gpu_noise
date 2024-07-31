#include <flutter/runtime_effect.glsl>
#include "config.glsl"
#include "fns/gerstnerWave.glsl"


uniform vec2 size;
uniform float elapsed;
uniform vec2 xy;
uniform vec2 dir;
uniform float steepness;
uniform float wavelength;
uniform float time;
uniform float scale;
uniform float brightness;

out vec4 fragColor;

void main() {
    vec2 fragCoord = FlutterFragCoord();
    vec3 n = vec3(0.0);
    for(float i = 0.0; i < OCTAVES; i += 1.0) {
        n += gerstnerWave((xy + fragCoord) / size.y * scale * pow(2.0, i), dir, steepness, wavelength, time);
    }
    n *= brightness / OCTAVES;
    fragColor = vec4(n.x, n.x, n.x, 1.0);
}
