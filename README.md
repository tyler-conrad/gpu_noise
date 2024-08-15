# gpu_noise

This package provides GPU-based noise generation functions for Flutter
applications. The noise shaders utilized in this library are sourced from the
[lygia](https://github.com/patriciogonzalezvivo/lygia) project.

![](example.gif)

## Features
The primary components of this library include:

1. **GPU Noise Generation Functions**:
   - These functions utilize GPU shaders to generate noise patterns.
     - Multiple noise types (e.g., Perlin, Simplex)
     - Customizable noise parameters

2. **CustomPainters**:
   - The library includes CustomPainters that can be used to render the
     generated noise directly onto the screen.

3. **NoiseBytes**:
   - This component allows for accessing the generated noise values on the
     CPU. While the primary noise generation happens on the GPU, there are
     scenarios where you might need to access these values on the CPU for
     further processing or analysis. NoiseBytes provides a convenient
     interface for this purpose.

## Usage

The `example/gallery` Flutter example provides a viewer for each noise type with
customizable parameters. Different sliders will be available depending on the 
type and dimension of the noise being generated. Additionally the functions
are modified by mouse interactions:
 - **Change the xy position**: Left click and drag.
 - **Adjust period, direction, uv, phase, and k parameters**: Right click 
   and drag.
 - **Scale adjustment**: Use the scroll wheel.

The [lib/src/shaders/config.glsl](lib/src/shaders/config.glsl) file contains the
default parameters for every noise shader. You can adjust the `OCTAVES` value to
have all noise functions generated with a series of noise mappings with different
scales.

## Example

To use a `ui.CustomPainter` to view noise generated from a shader use the
`NoisePainter` subclasses:

```dart
import 'package:flutter/material.dart' as m;

import 'package:vector_math/vector_math.dart' as vm;

import 'package:gpu_noise/gpu_noise.dart' as gn;

void main() async {
  m.runApp(
    m.MaterialApp(
      home: m.Scaffold(
        body: m.LayoutBuilder(
          builder: (context, constraints) {
            final size = m.Size(
              constraints.maxWidth,
              constraints.maxHeight,
            );
            return m.CustomPaint(
              size: size,
              painter: gn.Noise2Painter(
                  shader: await gn.load('lib/src/shaders/perlin2.frag'),
              size: size,
              scale: 64.0,
              brightness: 1.0,
              xy: vm.Vector2.zero(),
            ),
            child: m.SizedBox.expand(),
            );
          },
        ),
      ),
    ),
  );
}
```

To generate noise that can be read from RAM use the `NoiseBytes` class:

```dart
import 'dart:ui' as ui;

import 'package:vector_math/vector_math.dart' as vm;

import 'package:gpu_noise/gpu_noise.dart' as gn;

int intAtXY(int x, int y) async {
  final nb = await gn.NoiseBytes(
    image: await gn.perlin2Image(
      size: ui.Size(512.0, 512.0),
      scale: 64.0,
      brightness: 1.0,
      xy: vm.Vector2.zero(),
    ),
  ).loaded;
  return nb.byte(0, 0);
}

}
```
