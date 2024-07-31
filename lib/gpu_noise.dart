library gpu_noise;

import 'dart:typed_data' as td;
import 'dart:ui' as ui;

import 'package:flutter/widgets.dart' as w;

import 'package:vector_math/vector_math.dart' as vm;

Future<ui.FragmentShader> load(String path) async =>
    (await ui.FragmentProgram.fromAsset(path)).fragmentShader();

abstract class NoisePainter extends w.CustomPainter {
  int get uniformsOffset => 4;

  final ui.FragmentShader shader;
  final ui.Size size;
  final double elapsed;
  final shaderPaint = ui.Paint();
  final double scale;
  final double brightness;

  void setFloats(ui.Size size) {
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);
    shader.setFloat(2, elapsed);
    shader.setFloat(3, scale);
    shader.setFloat(4, brightness);
  }

  NoisePainter({
    super.repaint,
    required this.shader,
    required this.size,
    required this.elapsed,
    required this.scale,
    required this.brightness,
  });

  @override
  bool shouldRepaint(covariant NoisePainter oldDelegate) =>
      oldDelegate.shader != shader ||
      oldDelegate.size != size ||
      oldDelegate.elapsed != elapsed ||
      oldDelegate.scale != scale ||
      oldDelegate.brightness != brightness;
}

mixin _Noise2Painter on NoisePainter {
  @override
  int get uniformsOffset => 6;

  vm.Vector2 get xy;

  @override
  void setFloats(ui.Size size) {
    super.setFloats(size);
    final offset = super.uniformsOffset;
    shader.setFloat(offset + 1, xy.x);
    shader.setFloat(offset + 2, xy.y);
  }

  @override
  void paint(ui.Canvas canvas, ui.Size size) {
    setFloats(size);
    canvas.drawRect(ui.Offset.zero & size, shaderPaint..shader = shader);
  }

  @override
  bool shouldRepaint(covariant _Noise2Painter oldDelegate) =>
      super.shouldRepaint(oldDelegate) || oldDelegate.xy != xy;
}

class Noise2Painter extends NoisePainter with _Noise2Painter {
  @override
  final vm.Vector2 xy;

  Noise2Painter({
    super.repaint,
    required super.shader,
    required super.size,
    required super.elapsed,
    required super.scale,
    required super.brightness,
    required this.xy,
  });
}

class VoronoiTime2Painter extends NoisePainter with _Noise2Painter {
  @override
  final int uniformsOffset = 7;

  @override
  final vm.Vector2 xy;
  final double time;

  VoronoiTime2Painter({
    super.repaint,
    required super.shader,
    required super.size,
    required super.elapsed,
    required super.scale,
    required super.brightness,
    required this.xy,
    required this.time,
  });

  @override
  void setFloats(ui.Size size) {
    super.setFloats(size);
    shader.setFloat(super.uniformsOffset + 1, time);
  }

  @override
  void paint(ui.Canvas canvas, ui.Size size) {
    setFloats(size);
    canvas.drawRect(ui.Offset.zero & size, shaderPaint..shader = shader);
  }

  @override
  bool shouldRepaint(covariant VoronoiTime2Painter oldDelegate) =>
      super.shouldRepaint(oldDelegate) || oldDelegate.time != time;
}

mixin _Noise3Painter on NoisePainter {
  @override
  int get uniformsOffset => 7;

  vm.Vector3 get xyz;

  @override
  void setFloats(ui.Size size) {
    super.setFloats(size);
    final offset = super.uniformsOffset;
    shader.setFloat(offset + 1, xyz.x);
    shader.setFloat(offset + 2, xyz.y);
    shader.setFloat(offset + 3, xyz.z);
  }

  @override
  void paint(ui.Canvas canvas, ui.Size size) {
    setFloats(size);
    canvas.drawRect(ui.Offset.zero & size, shaderPaint..shader = shader);
  }

  @override
  bool shouldRepaint(covariant _Noise3Painter oldDelegate) =>
      super.shouldRepaint(oldDelegate) || oldDelegate.xyz != xyz;
}

class Noise3Painter extends NoisePainter with _Noise3Painter {
  @override
  final vm.Vector3 xyz;

  Noise3Painter({
    super.repaint,
    required super.shader,
    required super.size,
    required super.elapsed,
    required super.scale,
    required super.brightness,
    required this.xyz,
  });
}

mixin _Noise4Painter on NoisePainter {
  @override
  int get uniformsOffset => 8;

  vm.Vector4 get xyzw;

  @override
  void setFloats(ui.Size size) {
    super.setFloats(size);
    final offset = super.uniformsOffset;
    shader.setFloat(offset + 1, xyzw.x);
    shader.setFloat(offset + 2, xyzw.y);
    shader.setFloat(offset + 3, xyzw.z);
    shader.setFloat(offset + 4, xyzw.w);
  }

  @override
  void paint(ui.Canvas canvas, ui.Size size) {
    setFloats(size);
    canvas.drawRect(ui.Offset.zero & size, shaderPaint..shader = shader);
  }

  @override
  bool shouldRepaint(covariant _Noise4Painter oldDelegate) =>
      super.shouldRepaint(oldDelegate) || oldDelegate.xyzw != xyzw;
}

class Noise4Painter extends NoisePainter with _Noise4Painter {
  @override
  final vm.Vector4 xyzw;

  Noise4Painter({
    super.repaint,
    required super.shader,
    required super.size,
    required super.elapsed,
    required super.scale,
    required super.brightness,
    required this.xyzw,
  });
}

class GerstnerWave2Painter extends NoisePainter with _Noise2Painter {
  @override
  final uniformsOffset = 11;

  @override
  final vm.Vector2 xy;
  final vm.Vector2 dir;
  final double steepness;
  final double wavelength;
  final double time;

  GerstnerWave2Painter({
    super.repaint,
    required super.shader,
    required super.size,
    required super.elapsed,
    required this.xy,
    required this.dir,
    required this.steepness,
    required this.wavelength,
    required this.time,
    required super.scale,
    required super.brightness,
  });

  @override
  void setFloats(ui.Size size) {
    super.setFloats(size);
    final offset = super.uniformsOffset;
    shader.setFloat(offset + 1, dir.x);
    shader.setFloat(offset + 2, dir.y);
    shader.setFloat(offset + 3, steepness);
    shader.setFloat(offset + 4, wavelength);
    shader.setFloat(offset + 5, time);
  }

  @override
  void paint(ui.Canvas canvas, ui.Size size) {
    setFloats(size);
    canvas.drawRect(ui.Offset.zero & size, shaderPaint..shader = shader);
  }

  @override
  bool shouldRepaint(covariant GerstnerWave2Painter oldDelegate) =>
      super.shouldRepaint(oldDelegate) ||
      oldDelegate.dir != dir ||
      oldDelegate.steepness != steepness ||
      oldDelegate.wavelength != wavelength ||
      oldDelegate.time != time;
}

class PrimitivePeriodTiling2Painter extends NoisePainter with _Noise2Painter {
  @override
  final int uniformsOffset = 7;

  @override
  final vm.Vector2 xy;
  final double period;

  PrimitivePeriodTiling2Painter({
    super.repaint,
    required super.shader,
    required super.size,
    required super.elapsed,
    required super.scale,
    required super.brightness,
    required this.xy,
    required this.period,
  });

  @override
  void setFloats(ui.Size size) {
    super.setFloats(size);
    shader.setFloat(super.uniformsOffset + 1, period);
  }

  @override
  void paint(ui.Canvas canvas, ui.Size size) {
    setFloats(size);
    canvas.drawRect(ui.Offset.zero & size, shaderPaint..shader = shader);
  }

  @override
  bool shouldRepaint(covariant PrimitivePeriodTiling2Painter oldDelegate) =>
      super.shouldRepaint(oldDelegate) || oldDelegate.period != period;
}

class PrimitivePeriodTiling3Painter extends NoisePainter with _Noise3Painter {
  @override
  final uniformsOffset = 8;

  @override
  final vm.Vector3 xyz;
  final double period;

  PrimitivePeriodTiling3Painter({
    super.repaint,
    required super.shader,
    required super.size,
    required super.elapsed,
    required super.scale,
    required super.brightness,
    required this.xyz,
    required this.period,
  });

  @override
  void setFloats(ui.Size size) {
    super.setFloats(size);
    shader.setFloat(super.uniformsOffset + 1, period);
  }

  @override
  void paint(ui.Canvas canvas, ui.Size size) {
    setFloats(size);
    canvas.drawRect(ui.Offset.zero & size, shaderPaint..shader = shader);
  }

  @override
  bool shouldRepaint(covariant PrimitivePeriodTiling3Painter oldDelegate) =>
      super.shouldRepaint(oldDelegate) || oldDelegate.period != period;
}

mixin _Tiling2Painter on NoisePainter {
  @override
  int get uniformsOffset => 8;

  vm.Vector2 get xy;
  vm.Vector2 get period;

  @override
  void setFloats(ui.Size size) {
    super.setFloats(size);
    final offset = super.uniformsOffset;
    shader.setFloat(offset + 1, xy.x);
    shader.setFloat(offset + 2, xy.y);
    shader.setFloat(offset + 3, period.x);
    shader.setFloat(offset + 4, period.y);
  }

  @override
  void paint(ui.Canvas canvas, ui.Size size) {
    setFloats(size);
    canvas.drawRect(ui.Offset.zero & size, shaderPaint..shader = shader);
  }

  @override
  bool shouldRepaint(covariant _Tiling2Painter oldDelegate) =>
      super.shouldRepaint(oldDelegate) ||
      oldDelegate.xy != xy ||
      oldDelegate.period != period;
}

class Tiling2Painter extends NoisePainter with _Tiling2Painter {
  @override
  final int uniformsOffset = 8;

  @override
  final vm.Vector2 xy;
  @override
  final vm.Vector2 period;

  Tiling2Painter({
    super.repaint,
    required super.shader,
    required super.size,
    required super.elapsed,
    required super.scale,
    required super.brightness,
    required this.xy,
    required this.period,
  });
}

mixin _Tiling3Painter on NoisePainter {
  @override
  int get uniformsOffset => 10;

  vm.Vector3 get xyz;
  vm.Vector3 get period;

  @override
  void setFloats(ui.Size size) {
    super.setFloats(size);
    final offset = super.uniformsOffset;
    shader.setFloat(offset + 1, xyz.x);
    shader.setFloat(offset + 2, xyz.y);
    shader.setFloat(offset + 3, xyz.z);
    shader.setFloat(offset + 4, period.x);
    shader.setFloat(offset + 5, period.y);
    shader.setFloat(offset + 6, period.z);
  }

  @override
  void paint(ui.Canvas canvas, ui.Size size) {
    setFloats(size);
    canvas.drawRect(ui.Offset.zero & size, shaderPaint..shader = shader);
  }

  @override
  bool shouldRepaint(covariant _Tiling3Painter oldDelegate) =>
      super.shouldRepaint(oldDelegate) ||
      oldDelegate.xyz != xyz ||
      oldDelegate.period != period;
}

class Tiling3Painter extends NoisePainter with _Tiling3Painter {
  @override
  final vm.Vector3 xyz;
  @override
  final vm.Vector3 period;

  Tiling3Painter({
    super.repaint,
    required super.shader,
    required super.size,
    required super.elapsed,
    required this.xyz,
    required this.period,
    required super.scale,
    required super.brightness,
  });
}

mixin _Tiling4Painter on NoisePainter {
  @override
  int get uniformsOffset => 12;

  vm.Vector4 get xyzw;
  vm.Vector4 get period;

  @override
  void setFloats(ui.Size size) {
    super.setFloats(size);
    final offset = super.uniformsOffset;
    shader.setFloat(offset + 1, xyzw.x);
    shader.setFloat(offset + 2, xyzw.y);
    shader.setFloat(offset + 3, xyzw.z);
    shader.setFloat(offset + 4, xyzw.w);
    shader.setFloat(offset + 5, period.x);
    shader.setFloat(offset + 6, period.y);
    shader.setFloat(offset + 7, period.z);
    shader.setFloat(offset + 8, period.w);
  }

  @override
  void paint(ui.Canvas canvas, ui.Size size) {
    setFloats(size);
    canvas.drawRect(ui.Offset.zero & size, shaderPaint..shader = shader);
  }

  @override
  bool shouldRepaint(_Tiling4Painter oldDelegate) =>
      super.shouldRepaint(oldDelegate) ||
      oldDelegate.xyzw != xyzw ||
      oldDelegate.period != period;
}

class Tiling4Painter extends NoisePainter with _Tiling4Painter {
  @override
  final vm.Vector4 xyzw;
  @override
  final vm.Vector4 period;

  Tiling4Painter({
    super.repaint,
    required super.shader,
    required super.size,
    required super.elapsed,
    required this.xyzw,
    required this.period,
    required super.scale,
    required super.brightness,
  });
}

class TilingSimplexFlow2Painter extends NoisePainter with _Tiling2Painter {
  @override
  final int uniformsOffset = 9;

  @override
  final vm.Vector2 xy;
  @override
  final vm.Vector2 period;
  final double alpha;

  TilingSimplexFlow2Painter({
    super.repaint,
    required super.shader,
    required super.size,
    required super.elapsed,
    required super.scale,
    required super.brightness,
    required this.xy,
    required this.period,
    required this.alpha,
  });

  @override
  void setFloats(ui.Size size) {
    super.setFloats(size);
    shader.setFloat(super.uniformsOffset + 1, alpha);
  }

  @override
  void paint(ui.Canvas canvas, ui.Size size) {
    setFloats(size);
    canvas.drawRect(ui.Offset.zero & size, shaderPaint..shader = shader);
  }

  @override
  bool shouldRepaint(covariant TilingSimplexFlow2Painter oldDelegate) =>
      super.shouldRepaint(oldDelegate) ||
      oldDelegate.alpha != alpha;
}

class TilingSimplexFlow3Painter extends NoisePainter with _Tiling3Painter {
  @override
  final int uniformsOffset = 11;

  @override
  final vm.Vector3 xyz;
  @override
  final vm.Vector3 period;
  final double alpha;

  TilingSimplexFlow3Painter({
    super.repaint,
    required super.shader,
    required super.size,
    required super.elapsed,
    required super.scale,
    required super.brightness,
    required this.xyz,
    required this.period,
    required this.alpha,
  });

  @override
  void setFloats(ui.Size size) {
    super.setFloats(size);
    shader.setFloat(super.uniformsOffset + 1, alpha);
  }

  @override
  void paint(ui.Canvas canvas, ui.Size size) {
    setFloats(size);
    canvas.drawRect(ui.Offset.zero & size, shaderPaint..shader = shader);
  }

  @override
  bool shouldRepaint(covariant TilingSimplexFlow3Painter oldDelegate) =>
      super.shouldRepaint(oldDelegate) ||
      oldDelegate.alpha != alpha;
}

class Voronoise2Painter extends NoisePainter with _Noise2Painter {
  @override
  final int uniformsOffset = 8;

  @override
  final vm.Vector2 xy;
  final vm.Vector2 uv;

  Voronoise2Painter({
    super.repaint,
    required super.shader,
    required super.size,
    required super.elapsed,
    required super.scale,
    required super.brightness,
    required this.xy,
    required this.uv,
  });

  @override
  void setFloats(ui.Size size) {
    super.setFloats(size);
    final offset = super.uniformsOffset;
    shader.setFloat(offset + 1, uv.x);
    shader.setFloat(offset + 2, uv.y);
  }

  @override
  void paint(ui.Canvas canvas, ui.Size size) {
    setFloats(size);
    canvas.drawRect(ui.Offset.zero & size, shaderPaint..shader = shader);
  }

  @override
  bool shouldRepaint(covariant Voronoise2Painter oldDelegate) =>
      super.shouldRepaint(oldDelegate) ||
      oldDelegate.uv != uv;
}

class Voronoise3Painter extends NoisePainter with _Noise3Painter {
  @override
  final int uniformsOffset = 9;

  @override
  final vm.Vector3 xyz;
  final vm.Vector2 uv;

  Voronoise3Painter({
    super.repaint,
    required super.shader,
    required super.size,
    required super.elapsed,
    required super.scale,
    required super.brightness,
    required this.xyz,
    required this.uv,
  });

  @override
  void setFloats(ui.Size size) {
    super.setFloats(size);
    final offset = super.uniformsOffset;
    shader.setFloat(offset + 1, uv.x);
    shader.setFloat(offset + 2, uv.y);
  }

  @override
  void paint(ui.Canvas canvas, ui.Size size) {
    setFloats(size);
    canvas.drawRect(ui.Offset.zero & size, shaderPaint..shader = shader);
  }

  @override
  bool shouldRepaint(covariant Voronoise3Painter oldDelegate) =>
      super.shouldRepaint(oldDelegate) ||
      oldDelegate.uv != uv;
}

class Wavelet2Painter extends NoisePainter with _Noise2Painter {
  @override
  final int uniformsOffset = 8;

  @override
  final vm.Vector2 xy;
  final double phase;
  final double k;

  Wavelet2Painter({
    super.repaint,
    required super.shader,
    required super.size,
    required super.elapsed,
    required super.scale,
    required super.brightness,
    required this.xy,
    required this.phase,
    required this.k,
  });

  @override
  void setFloats(ui.Size size) {
    super.setFloats(size);
    final offset = super.uniformsOffset;
    shader.setFloat(offset + 1, phase);
    shader.setFloat(offset + 2, k);
  }

  @override
  void paint(ui.Canvas canvas, ui.Size size) {
    setFloats(size);
    canvas.drawRect(ui.Offset.zero & size, shaderPaint..shader = shader);
  }

  @override
  bool shouldRepaint(covariant Wavelet2Painter oldDelegate) =>
      super.shouldRepaint(oldDelegate) ||
      oldDelegate.phase != phase ||
      oldDelegate.k != k;
}

Future<ui.Image> toImage(NoisePainter painter) {
  final recorder = ui.PictureRecorder();
  final canvas = ui.Canvas(recorder, ui.Offset.zero & painter.size);
  painter.paint(canvas, painter.size);
  return recorder
      .endRecording()
      .toImage(painter.size.width.toInt(), painter.size.height.toInt());
}

Future<ui.Image> cellular2Image({
  required ui.Size size,
  required vm.Vector2 xy,
  required double scale,
  required double brightness,
  double elapsed = 0.0,
}) =>
    load('lib/src/shaders/cellular2.frag').then(
      (shader) => toImage(
        Noise2Painter(
          shader: shader,
          size: size,
          elapsed: elapsed,
          xy: xy,
          scale: scale,
          brightness: brightness,
        ),
      ),
    );

Future<ui.Image> cellular2x2Image({
  required ui.Size size,
  required vm.Vector2 xy,
  required double scale,
  required double brightness,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/cellular2x2.frag');
  return toImage(
    Noise2Painter(
      shader: shader,
      size: size,
      elapsed: elapsed,
      xy: xy,
      scale: scale,
      brightness: brightness,
    ),
  );
}

Future<ui.Image> cellular2x2x2Image({
  required ui.Size size,
  required vm.Vector3 xyz,
  required double scale,
  required double brightness,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/cellular2x2x2.frag');
  return toImage(
    Noise3Painter(
      shader: shader,
      size: size,
      elapsed: elapsed,
      xyz: xyz,
      scale: scale,
      brightness: brightness,
    ),
  );
}

Future<ui.Image> cellular3Image({
  required ui.Size size,
  required vm.Vector3 xyz,
  required double scale,
  required double brightness,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/cellular3.frag');
  return toImage(
    Noise3Painter(
      shader: shader,
      size: size,
      elapsed: elapsed,
      xyz: xyz,
      scale: scale,
      brightness: brightness,
    ),
  );
}

Future<ui.Image> curl2Image({
  required ui.Size size,
  required vm.Vector2 xy,
  required double scale,
  required double brightness,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/curl2.frag');
  return toImage(
    Noise2Painter(
      shader: shader,
      size: size,
      elapsed: elapsed,
      xy: xy,
      scale: scale,
      brightness: brightness,
    ),
  );
}

Future<ui.Image> curl3Image({
  required ui.Size size,
  required vm.Vector3 xyz,
  required double scale,
  required double brightness,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/curl3.frag');
  return toImage(
    Noise3Painter(
      shader: shader,
      size: size,
      elapsed: elapsed,
      xyz: xyz,
      scale: scale,
      brightness: brightness,
    ),
  );
}

Future<ui.Image> curl4Image({
  required ui.Size size,
  required vm.Vector4 xyzw,
  required double scale,
  required double brightness,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/curl4.frag');
  return toImage(
    Noise4Painter(
      shader: shader,
      size: size,
      elapsed: elapsed,
      xyzw: xyzw,
      scale: scale,
      brightness: brightness,
    ),
  );
}

Future<ui.Image> fbm2Image({
  required ui.Size size,
  required vm.Vector2 xy,
  required double scale,
  required double brightness,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/fbm2.frag');
  return toImage(
    Noise2Painter(
      shader: shader,
      size: size,
      elapsed: elapsed,
      xy: xy,
      scale: scale,
      brightness: brightness,
    ),
  );
}

Future<ui.Image> fbm3Image({
  required ui.Size size,
  required vm.Vector3 xyz,
  required double scale,
  required double brightness,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/fbm3.frag');
  return toImage(
    Noise3Painter(
      shader: shader,
      size: size,
      elapsed: elapsed,
      xyz: xyz,
      scale: scale,
      brightness: brightness,
    ),
  );
}

Future<ui.Image> gerstnerWaveImage({
  required ui.Size size,
  required vm.Vector2 xy,
  required vm.Vector2 dir,
  required double steepness,
  required double wavelength,
  required double time,
  required double scale,
  required double brightness,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/gerstner_wave.frag');
  return toImage(
    GerstnerWave2Painter(
      shader: shader,
      size: size,
      elapsed: elapsed,
      xy: xy,
      dir: dir,
      steepness: steepness,
      wavelength: wavelength,
      time: time,
      scale: scale,
      brightness: brightness,
    ),
  );
}

Future<ui.Image> gradient2Image({
  required ui.Size size,
  required vm.Vector2 xy,
  required double scale,
  required double brightness,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/gradient2.frag');
  return toImage(
    Noise2Painter(
      shader: shader,
      size: size,
      elapsed: elapsed,
      xy: xy,
      scale: scale,
      brightness: brightness,
    ),
  );
}

Future<ui.Image> gradient3Image({
  required ui.Size size,
  required vm.Vector3 xyz,
  required double scale,
  required double brightness,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/gradient3.frag');
  return toImage(
    Noise3Painter(
      shader: shader,
      size: size,
      elapsed: elapsed,
      xyz: xyz,
      scale: scale,
      brightness: brightness,
    ),
  );
}

Future<ui.Image> perlin2Image({
  required ui.Size size,
  required vm.Vector2 xy,
  required double scale,
  required double brightness,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/perlin2.frag');
  return toImage(
    Noise2Painter(
      shader: shader,
      size: size,
      elapsed: elapsed,
      xy: xy,
      scale: scale,
      brightness: brightness,
    ),
  );
}

Future<ui.Image> perlin3Image({
  required ui.Size size,
  required vm.Vector3 xyz,
  required double scale,
  required double brightness,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/perlin3.frag');
  return toImage(
    Noise3Painter(
      shader: shader,
      size: size,
      elapsed: elapsed,
      xyz: xyz,
      scale: scale,
      brightness: brightness,
    ),
  );
}

Future<ui.Image> perlin4Image({
  required ui.Size size,
  required vm.Vector4 xyzw,
  required double scale,
  required double brightness,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/perlin4.frag');
  return toImage(
    Noise4Painter(
      shader: shader,
      size: size,
      elapsed: elapsed,
      xyzw: xyzw,
      scale: scale,
      brightness: brightness,
    ),
  );
}

Future<ui.Image> psrd2Image({
  required ui.Size size,
  required vm.Vector2 xy,
  required double scale,
  required double brightness,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/psrd2.frag');
  return toImage(
    Noise2Painter(
      shader: shader,
      size: size,
      elapsed: elapsed,
      xy: xy,
      scale: scale,
      brightness: brightness,
    ),
  );
}

Future<ui.Image> psrd3Image({
  required ui.Size size,
  required vm.Vector3 xyz,
  required double scale,
  required double brightness,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/psrd3.frag');
  return toImage(
    Noise3Painter(
      shader: shader,
      size: size,
      elapsed: elapsed,
      xyz: xyz,
      scale: scale,
      brightness: brightness,
    ),
  );
}

Future<ui.Image> random2Image({
  required ui.Size size,
  required vm.Vector2 xy,
  required double scale,
  required double brightness,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/random2.frag');
  return toImage(
    Noise2Painter(
      shader: shader,
      size: size,
      elapsed: elapsed,
      xy: xy,
      scale: scale,
      brightness: brightness,
    ),
  );
}

Future<ui.Image> random3Image({
  required ui.Size size,
  required vm.Vector3 xyz,
  required double scale,
  required double brightness,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/random3.frag');
  return toImage(
    Noise3Painter(
      shader: shader,
      size: size,
      elapsed: elapsed,
      xyz: xyz,
      scale: scale,
      brightness: brightness,
    ),
  );
}

Future<ui.Image> random4Image({
  required ui.Size size,
  required vm.Vector4 xyzw,
  required double scale,
  required double brightness,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/random4.frag');
  return toImage(
    Noise4Painter(
      shader: shader,
      size: size,
      elapsed: elapsed,
      xyzw: xyzw,
      scale: scale,
      brightness: brightness,
    ),
  );
}

Future<ui.Image> signedRandom2Image({
  required ui.Size size,
  required vm.Vector2 xy,
  required double scale,
  required double brightness,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/signed_random2.frag');
  return toImage(
    Noise2Painter(
      shader: shader,
      size: size,
      elapsed: elapsed,
      xy: xy,
      scale: scale,
      brightness: brightness,
    ),
  );
}

Future<ui.Image> signedRandom3Image({
  required ui.Size size,
  required vm.Vector3 xyz,
  required double scale,
  required double brightness,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/signed_random3.frag');
  return toImage(
    Noise3Painter(
      shader: shader,
      size: size,
      elapsed: elapsed,
      xyz: xyz,
      scale: scale,
      brightness: brightness,
    ),
  );
}

Future<ui.Image> signedRandom4Image({
  required ui.Size size,
  required vm.Vector4 xyzw,
  required double scale,
  required double brightness,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/signed_random4.frag');
  return toImage(
    Noise4Painter(
      shader: shader,
      size: size,
      elapsed: elapsed,
      xyzw: xyzw,
      scale: scale,
      brightness: brightness,
    ),
  );
}

Future<ui.Image> simplex2Image({
  required ui.Size size,
  required vm.Vector2 xy,
  required double scale,
  required double brightness,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/simplex2.frag');
  return toImage(
    Noise2Painter(
      shader: shader,
      size: size,
      elapsed: elapsed,
      xy: xy,
      scale: scale,
      brightness: brightness,
    ),
  );
}

Future<ui.Image> simplex3Image({
  required ui.Size size,
  required vm.Vector3 xyz,
  required double scale,
  required double brightness,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/simplex3.frag');
  return toImage(
    Noise3Painter(
      shader: shader,
      size: size,
      elapsed: elapsed,
      xyz: xyz,
      scale: scale,
      brightness: brightness,
    ),
  );
}

Future<ui.Image> simplex4Image({
  required ui.Size size,
  required vm.Vector4 xyzw,
  required double scale,
  required double brightness,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/simplex4.frag');
  return toImage(
    Noise4Painter(
      shader: shader,
      size: size,
      elapsed: elapsed,
      xyzw: xyzw,
      scale: scale,
      brightness: brightness,
    ),
  );
}

Future<ui.Image> tilingFbm3Image({
  required ui.Size size,
  required vm.Vector3 xyz,
  required double period,
  required double scale,
  required double brightness,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/tiling_fbm3.frag');
  return toImage(
    PrimitivePeriodTiling3Painter(
      shader: shader,
      size: size,
      elapsed: elapsed,
      xyz: xyz,
      period: period,
      scale: scale,
      brightness: brightness,
    ),
  );
}

Future<ui.Image> tilingGradient3Image({
  required ui.Size size,
  required vm.Vector3 xyz,
  required double period,
  required double scale,
  required double brightness,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/tiling_gradient3.frag');
  return toImage(
    PrimitivePeriodTiling3Painter(
      shader: shader,
      size: size,
      elapsed: elapsed,
      xyz: xyz,
      period: period,
      scale: scale,
      brightness: brightness,
    ),
  );
}

Future<ui.Image> tilingPerlin2Image({
  required ui.Size size,
  required vm.Vector2 xy,
  required vm.Vector2 period,
  required double scale,
  required double brightness,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/tiling_perlin2.frag');
  return toImage(
    Tiling2Painter(
      shader: shader,
      size: size,
      elapsed: elapsed,
      xy: xy,
      period: period,
      scale: scale,
      brightness: brightness,
    ),
  );
}

Future<ui.Image> tilingPerlin3Image({
  required ui.Size size,
  required vm.Vector3 xyz,
  required vm.Vector3 period,
  required double scale,
  required double brightness,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/tiling_perlin3.frag');
  return toImage(
    Tiling3Painter(
      shader: shader,
      size: size,
      elapsed: elapsed,
      xyz: xyz,
      period: period,
      scale: scale,
      brightness: brightness,
    ),
  );
}

Future<ui.Image> tilingPerlin4Image({
  required ui.Size size,
  required vm.Vector4 xyzw,
  required vm.Vector4 period,
  required double scale,
  required double brightness,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/tiling_perlin4.frag');
  return toImage(
    Tiling4Painter(
      shader: shader,
      size: size,
      elapsed: elapsed,
      xyzw: xyzw,
      period: period,
      scale: scale,
      brightness: brightness,
    ),
  );
}

Future<ui.Image> tilingSignedRandom2Image({
  required ui.Size size,
  required vm.Vector2 xy,
  required double period,
  required double scale,
  required double brightness,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/tiling_signed_random2.frag');
  return toImage(
    PrimitivePeriodTiling2Painter(
      shader: shader,
      size: size,
      elapsed: elapsed,
      xy: xy,
      period: period,
      scale: scale,
      brightness: brightness,
    ),
  );
}

Future<ui.Image> tilingSignedRandom3Image({
  required ui.Size size,
  required vm.Vector3 xyz,
  required double period,
  required double scale,
  required double brightness,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/tiling_signed_random3.frag');
  return toImage(
    PrimitivePeriodTiling3Painter(
      shader: shader,
      size: size,
      elapsed: elapsed,
      xyz: xyz,
      period: period,
      scale: scale,
      brightness: brightness,
    ),
  );
}

Future<ui.Image> tilingSimplex2Image({
  required ui.Size size,
  required vm.Vector2 xy,
  required vm.Vector2 period,
  required double scale,
  required double brightness,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/tiling_simplex2.frag');
  return toImage(
    Tiling2Painter(
      shader: shader,
      size: size,
      elapsed: elapsed,
      xy: xy,
      period: period,
      scale: scale,
      brightness: brightness,
    ),
  );
}

Future<ui.Image> tilingSimplex3Image({
  required ui.Size size,
  required vm.Vector3 xyz,
  required vm.Vector3 period,
  required double scale,
  required double brightness,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/tiling_simplex3.frag');
  return toImage(
    Tiling3Painter(
      shader: shader,
      size: size,
      elapsed: elapsed,
      xyz: xyz,
      period: period,
      scale: scale,
      brightness: brightness,
    ),
  );
}

Future<ui.Image> tilingSimplexFlow2Image({
  required ui.Size size,
  required vm.Vector2 xy,
  required vm.Vector2 period,
  required double alpha,
  required double scale,
  required double brightness,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/tiling_simplex_flow2.frag');
  return toImage(
    TilingSimplexFlow2Painter(
      shader: shader,
      size: size,
      elapsed: elapsed,
      xy: xy,
      period: period,
      alpha: alpha,
      scale: scale,
      brightness: brightness,
    ),
  );
}

Future<ui.Image> tilingSimplexFlow3Image({
  required ui.Size size,
  required vm.Vector3 xyz,
  required vm.Vector3 period,
  required double alpha,
  required double scale,
  required double brightness,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/tiling_simplex_flow3.frag');
  return toImage(
    TilingSimplexFlow3Painter(
      shader: shader,
      size: size,
      elapsed: elapsed,
      xyz: xyz,
      period: period,
      alpha: alpha,
      scale: scale,
      brightness: brightness,
    ),
  );
}

Future<ui.Image> voronoi2Image({
  required ui.Size size,
  required vm.Vector2 xy,
  required double scale,
  required double brightness,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/voronoi2.frag');
  return toImage(
    Noise2Painter(
      shader: shader,
      size: size,
      elapsed: elapsed,
      xy: xy,
      scale: scale,
      brightness: brightness,
    ),
  );
}

Future<ui.Image> voronoi3Image({
  required ui.Size size,
  required vm.Vector3 xyz,
  required double scale,
  required double brightness,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/voronoi3.frag');
  return toImage(
    Noise3Painter(
      shader: shader,
      size: size,
      elapsed: elapsed,
      xyz: xyz,
      scale: scale,
      brightness: brightness,
    ),
  );
}

Future<ui.Image> voronoiTime2Image({
  required ui.Size size,
  required vm.Vector2 xy,
  required double time,
  required double scale,
  required double brightness,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/voronoi_time2.frag');
  return toImage(
    VoronoiTime2Painter(
      shader: shader,
      size: size,
      elapsed: elapsed,
      xy: xy,
      time: time,
      scale: scale,
      brightness: brightness,
    ),
  );
}

Future<ui.Image> voronoise2Image({
  required ui.Size size,
  required vm.Vector2 xy,
  required vm.Vector2 uv,
  required double scale,
  required double brightness,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/voronoise2.frag');
  return toImage(
    Voronoise2Painter(
      shader: shader,
      size: size,
      elapsed: elapsed,
      xy: xy,
      uv: uv,
      scale: scale,
      brightness: brightness,
    ),
  );
}

Future<ui.Image> voronoise3Image({
  required ui.Size size,
  required vm.Vector3 xyz,
  required vm.Vector2 uv,
  required double scale,
  required double brightness,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/voronoise3.frag');
  return toImage(
    Voronoise3Painter(
      shader: shader,
      size: size,
      elapsed: elapsed,
      xyz: xyz,
      uv: uv,
      scale: scale,
      brightness: brightness,
    ),
  );
}

Future<ui.Image> wavelet2Image({
  required ui.Size size,
  required vm.Vector2 xy,
  required double phase,
  required double k,
  required double scale,
  required double brightness,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/wavelet2.frag');
  return toImage(
    Wavelet2Painter(
      shader: shader,
      size: size,
      elapsed: elapsed,
      xy: xy,
      phase: phase,
      k: k,
      scale: scale,
      brightness: brightness,
    ),
  );
}

Future<ui.Image> worley2Image({
  required ui.Size size,
  required vm.Vector2 xy,
  required double scale,
  required double brightness,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/worley2.frag');
  return toImage(
    Noise2Painter(
      shader: shader,
      size: size,
      elapsed: elapsed,
      xy: xy,
      scale: scale,
      brightness: brightness,
    ),
  );
}

Future<ui.Image> worley3Image({
  required ui.Size size,
  required vm.Vector3 xyz,
  required double scale,
  required double brightness,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/worley3.frag');
  return toImage(
    Noise3Painter(
      shader: shader,
      size: size,
      elapsed: elapsed,
      xyz: xyz,
      scale: scale,
      brightness: brightness,
    ),
  );
}

class ImageDecodeException implements Exception {
  final String message;

  ImageDecodeException(this.message);

  @override
  String toString() => 'ImageDecodeException: $message';
}

class NoiseBytes {
  static const int channels = 4;

  final ui.Image _image;
  late final Future<void> loaded;
  late final td.ByteData? _bytes;

  NoiseBytes({required ui.Image image}) : _image = image {
    loaded = load();
  }

  Future<void> load() async {
    _bytes = await _image.toByteData();
    if (_bytes == null) {
      throw ImageDecodeException('Image().toByteData() returned null.');
    }
  }

  int byte(int x, int y) {
    if (x < 0) {
      throw StateError('x must be greater than or equal to 0.');
    }
    if (x >= _image.width) {
      throw StateError('x must be less than ${_image.width}.');
    }
    if (y < 0) {
      throw StateError('y must be greater than or equal to 0.');
    }
    if (y >= _image.height) {
      throw StateError('y must be less than ${_image.height}.');
    }
    return _bytes!.getUint8((x + y * _image.width) * channels);
  }
}
