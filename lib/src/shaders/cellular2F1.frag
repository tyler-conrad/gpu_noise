#include <flutter/runtime_effect.glsl>
#include <fns/cellular2D.glsl>

const float octaves = 4.0;

uniform vec2 size;
uniform float time;
uniform vec2 xy;
uniform float scale;
uniform float dilation;

out vec4 fragColor;

void main() {
    vec2 fragCoord = FlutterFragCoord();
    vec2 f = vec2(0.0);
    for(float i = 0.0; i < octaves; i += 1.0) {
        f += cellular((xy + fragCoord) / size.y * scale * pow(2.0, i));
    }
    f /= dilation / octaves;
    fragColor = vec4(f.x, f.x, f.x, 1.0);
}
