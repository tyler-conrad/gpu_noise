library gpu_noise;

import 'dart:ui' as ui;

import 'package:flutter/widgets.dart' as w;

import 'package:vector_math/vector_math.dart' as vm;

Future<ui.FragmentShader> load(String path) async =>
    (await ui.FragmentProgram.fromAsset(path)).fragmentShader();

abstract class NoisePainter extends w.CustomPainter {
  final ui.FragmentShader shader;
  final ui.Size size;
  final double elapsed;
  final shaderPaint = ui.Paint();
  final double scale;
  final double brightness;

  NoisePainter({
    super.repaint,
    required this.shader,
    required this.size,
    required this.elapsed,
    required this.scale,
    required this.brightness,
  });
}

mixin _Noise2Painter on NoisePainter {
  vm.Vector2 get xy;

  @override
  void paint(ui.Canvas canvas, ui.Size size) {
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);
    shader.setFloat(2, elapsed);
    shader.setFloat(3, xy.x);
    shader.setFloat(4, xy.y);
    shader.setFloat(5, scale);
    shader.setFloat(6, brightness);

    canvas.drawRect(ui.Offset.zero & size, shaderPaint..shader = shader);
  }

  @override
  bool shouldRepaint(_Noise2Painter oldDelegate) =>
      oldDelegate.shader != shader ||
      oldDelegate.size != size ||
      oldDelegate.xy != xy ||
      oldDelegate.scale != scale ||
      oldDelegate.brightness != brightness;
}

class Noise2Painter extends NoisePainter with _Noise2Painter {
  @override
  final vm.Vector2 xy;

  Noise2Painter({
    super.repaint,
    required super.shader,
    required super.size,
    required super.elapsed,
    required this.xy,
    required super.scale,
    required super.brightness,
  });
}

class VoronoiTime2Painter extends NoisePainter with _Noise2Painter {
  @override
  final vm.Vector2 xy;
  final double time;

  VoronoiTime2Painter({
    super.repaint,
    required super.shader,
    required super.size,
    required super.elapsed,
    required this.xy,
    required this.time,
    required super.scale,
    required super.brightness,
  });

  @override
  void paint(ui.Canvas canvas, ui.Size size) {
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);
    shader.setFloat(2, elapsed);
    shader.setFloat(3, xy.x);
    shader.setFloat(4, xy.y);
    shader.setFloat(5, time);
    shader.setFloat(6, scale);
    shader.setFloat(7, brightness);

    canvas.drawRect(ui.Offset.zero & size, shaderPaint..shader = shader);
  }

  @override
  bool shouldRepaint(VoronoiTime2Painter oldDelegate) =>
      oldDelegate.shader != shader ||
      oldDelegate.size != size ||
      oldDelegate.xy != xy ||
      oldDelegate.time != time ||
      oldDelegate.scale != scale ||
      oldDelegate.brightness != brightness;
}

mixin _Noise3Painter on NoisePainter {
  vm.Vector3 get xyz;

  @override
  void paint(ui.Canvas canvas, ui.Size size) {
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);
    shader.setFloat(2, elapsed);
    shader.setFloat(3, xyz.x);
    shader.setFloat(4, xyz.y);
    shader.setFloat(5, xyz.z);
    shader.setFloat(6, scale);
    shader.setFloat(7, brightness);

    canvas.drawRect(ui.Offset.zero & size, shaderPaint..shader = shader);
  }

  @override
  bool shouldRepaint(_Noise3Painter oldDelegate) =>
      oldDelegate.shader != shader ||
      oldDelegate.size != size ||
      oldDelegate.xyz != xyz ||
      oldDelegate.scale != scale ||
      oldDelegate.brightness != brightness;
}

class Noise3Painter extends NoisePainter with _Noise3Painter {
  @override
  final vm.Vector3 xyz;

  Noise3Painter({
    super.repaint,
    required super.shader,
    required super.size,
    required super.elapsed,
    required this.xyz,
    required super.scale,
    required super.brightness,
  });
}

mixin _Noise4Painter on NoisePainter {
  vm.Vector4 get xyzw;

  @override
  void paint(ui.Canvas canvas, ui.Size size) {
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);
    shader.setFloat(2, elapsed);
    shader.setFloat(3, xyzw.x);
    shader.setFloat(4, xyzw.y);
    shader.setFloat(5, xyzw.z);
    shader.setFloat(6, xyzw.w);
    shader.setFloat(7, scale);
    shader.setFloat(8, brightness);

    canvas.drawRect(ui.Offset.zero & size, shaderPaint..shader = shader);
  }

  @override
  bool shouldRepaint(_Noise4Painter oldDelegate) =>
      oldDelegate.shader != shader ||
      oldDelegate.size != size ||
      oldDelegate.xyzw != xyzw ||
      oldDelegate.scale != scale ||
      oldDelegate.brightness != brightness;
}

class Noise4Painter extends NoisePainter with _Noise4Painter {
  @override
  final vm.Vector4 xyzw;

  Noise4Painter({
    super.repaint,
    required super.shader,
    required super.size,
    required super.elapsed,
    required this.xyzw,
    required super.scale,
    required super.brightness,
  });
}

class GerstnerWave2Painter extends NoisePainter with _Noise2Painter {
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
  void paint(ui.Canvas canvas, ui.Size size) {
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);
    shader.setFloat(2, elapsed);
    shader.setFloat(3, xy.x);
    shader.setFloat(4, xy.y);
    shader.setFloat(5, dir.x);
    shader.setFloat(6, dir.y);
    shader.setFloat(7, steepness);
    shader.setFloat(8, wavelength);
    shader.setFloat(9, time);
    shader.setFloat(10, scale);
    shader.setFloat(11, brightness);

    canvas.drawRect(ui.Offset.zero & size, shaderPaint..shader = shader);
  }

  @override
  bool shouldRepaint(GerstnerWave2Painter oldDelegate) =>
      oldDelegate.shader != shader ||
      oldDelegate.size != size ||
      oldDelegate.xy != xy ||
      oldDelegate.dir != dir ||
      oldDelegate.steepness != steepness ||
      oldDelegate.wavelength != wavelength ||
      oldDelegate.time != time ||
      oldDelegate.scale != scale ||
      oldDelegate.brightness != brightness;
}

class PrimitivePeriodTiling2Painter extends NoisePainter with _Noise2Painter {
  @override
  final vm.Vector2 xy;
  final double period;

  PrimitivePeriodTiling2Painter({
    super.repaint,
    required super.shader,
    required super.size,
    required super.elapsed,
    required this.xy,
    required this.period,
    required super.scale,
    required super.brightness,
  });

  @override
  void paint(ui.Canvas canvas, ui.Size size) {
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);
    shader.setFloat(2, elapsed);
    shader.setFloat(3, xy.x);
    shader.setFloat(4, xy.y);
    shader.setFloat(5, period);
    shader.setFloat(6, scale);
    shader.setFloat(7, brightness);

    canvas.drawRect(ui.Offset.zero & size, shaderPaint..shader = shader);
  }

  @override
  bool shouldRepaint(PrimitivePeriodTiling2Painter oldDelegate) =>
      oldDelegate.shader != shader ||
      oldDelegate.size != size ||
      oldDelegate.xy != xy ||
      oldDelegate.period != period ||
      oldDelegate.scale != scale ||
      oldDelegate.brightness != brightness;
}

class PrimitivePeriodTiling3Painter extends NoisePainter with _Noise3Painter {
  @override
  final vm.Vector3 xyz;
  final double period;

  PrimitivePeriodTiling3Painter({
    super.repaint,
    required super.shader,
    required super.size,
    required super.elapsed,
    required this.xyz,
    required this.period,
    required super.scale,
    required super.brightness,
  });

  @override
  void paint(ui.Canvas canvas, ui.Size size) {
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);
    shader.setFloat(2, elapsed);
    shader.setFloat(3, xyz.x);
    shader.setFloat(4, xyz.y);
    shader.setFloat(5, xyz.z);
    shader.setFloat(6, period);
    shader.setFloat(7, scale);
    shader.setFloat(8, brightness);

    canvas.drawRect(ui.Offset.zero & size, shaderPaint..shader = shader);
  }

  @override
  bool shouldRepaint(PrimitivePeriodTiling3Painter oldDelegate) =>
      oldDelegate.shader != shader ||
      oldDelegate.size != size ||
      oldDelegate.xyz != xyz ||
      oldDelegate.period != period ||
      oldDelegate.scale != scale ||
      oldDelegate.brightness != brightness;
}

mixin _Tiling2Painter on NoisePainter {
  vm.Vector2 get xy;
  vm.Vector2 get period;

  @override
  void paint(ui.Canvas canvas, ui.Size size) {
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);
    shader.setFloat(2, elapsed);
    shader.setFloat(3, xy.x);
    shader.setFloat(4, xy.y);
    shader.setFloat(5, period.x);
    shader.setFloat(6, period.y);
    shader.setFloat(7, scale);
    shader.setFloat(8, brightness);

    canvas.drawRect(ui.Offset.zero & size, shaderPaint..shader = shader);
  }

  @override
  bool shouldRepaint(_Tiling2Painter oldDelegate) =>
      oldDelegate.shader != shader ||
      oldDelegate.size != size ||
      oldDelegate.xy != xy ||
      oldDelegate.scale != scale ||
      oldDelegate.brightness != brightness;
}

class Tiling2Painter extends NoisePainter with _Tiling2Painter {
  @override
  final vm.Vector2 xy;
  @override
  final vm.Vector2 period;

  Tiling2Painter({
    super.repaint,
    required super.shader,
    required super.size,
    required super.elapsed,
    required this.xy,
    required this.period,
    required super.scale,
    required super.brightness,
  });
}

mixin _Tiling3Painter on NoisePainter {
  vm.Vector3 get xyz;
  vm.Vector3 get period;

  @override
  void paint(ui.Canvas canvas, ui.Size size) {
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);
    shader.setFloat(2, elapsed);
    shader.setFloat(3, xyz.x);
    shader.setFloat(4, xyz.y);
    shader.setFloat(5, xyz.z);
    shader.setFloat(6, period.x);
    shader.setFloat(7, period.y);
    shader.setFloat(8, period.z);
    shader.setFloat(9, scale);
    shader.setFloat(10, brightness);

    canvas.drawRect(ui.Offset.zero & size, shaderPaint..shader = shader);
  }

  @override
  bool shouldRepaint(_Tiling3Painter oldDelegate) =>
      oldDelegate.shader != shader ||
      oldDelegate.size != size ||
      oldDelegate.xyz != xyz ||
      oldDelegate.period != period ||
      oldDelegate.scale != scale ||
      oldDelegate.brightness != brightness;
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
  vm.Vector4 get xyzw;
  vm.Vector4 get period;

  @override
  void paint(ui.Canvas canvas, ui.Size size) {
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);
    shader.setFloat(2, elapsed);
    shader.setFloat(3, xyzw.x);
    shader.setFloat(4, xyzw.y);
    shader.setFloat(5, xyzw.z);
    shader.setFloat(6, xyzw.w);
    shader.setFloat(7, period.x);
    shader.setFloat(8, period.y);
    shader.setFloat(9, period.z);
    shader.setFloat(10, period.w);
    shader.setFloat(11, scale);
    shader.setFloat(12, brightness);

    canvas.drawRect(ui.Offset.zero & size, shaderPaint..shader = shader);
  }

  @override
  bool shouldRepaint(_Tiling4Painter oldDelegate) =>
      oldDelegate.shader != shader ||
      oldDelegate.size != size ||
      oldDelegate.xyzw != xyzw ||
      oldDelegate.period != period ||
      oldDelegate.scale != scale ||
      oldDelegate.brightness != brightness;
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
  final vm.Vector2 xy;
  @override
  final vm.Vector2 period;
  final double alpha;

  TilingSimplexFlow2Painter({
    super.repaint,
    required super.shader,
    required super.size,
    required super.elapsed,
    required this.xy,
    required this.period,
    required this.alpha,
    required super.scale,
    required super.brightness,
  });

  @override
  void paint(ui.Canvas canvas, ui.Size size) {
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);
    shader.setFloat(2, elapsed);
    shader.setFloat(3, xy.x);
    shader.setFloat(4, xy.y);
    shader.setFloat(5, period.x);
    shader.setFloat(6, period.y);
    shader.setFloat(7, alpha);
    shader.setFloat(8, scale);
    shader.setFloat(9, brightness);

    canvas.drawRect(ui.Offset.zero & size, shaderPaint..shader = shader);
  }

  @override
  bool shouldRepaint(TilingSimplexFlow2Painter oldDelegate) =>
      oldDelegate.shader != shader ||
      oldDelegate.size != size ||
      oldDelegate.xy != xy ||
      oldDelegate.period != period ||
      oldDelegate.alpha != alpha ||
      oldDelegate.scale != scale ||
      oldDelegate.brightness != brightness;
}

class TilingSimplexFlow3Painter extends NoisePainter with _Tiling3Painter {
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
    required this.xyz,
    required this.period,
    required this.alpha,
    required super.scale,
    required super.brightness,
  });

  @override
  void paint(ui.Canvas canvas, ui.Size size) {
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);
    shader.setFloat(2, elapsed);
    shader.setFloat(3, xyz.x);
    shader.setFloat(4, xyz.y);
    shader.setFloat(5, xyz.z);
    shader.setFloat(6, period.x);
    shader.setFloat(7, period.y);
    shader.setFloat(8, period.z);
    shader.setFloat(9, alpha);
    shader.setFloat(10, scale);
    shader.setFloat(11, brightness);

    canvas.drawRect(ui.Offset.zero & size, shaderPaint..shader = shader);
  }

  @override
  bool shouldRepaint(TilingSimplexFlow3Painter oldDelegate) =>
      oldDelegate.shader != shader ||
      oldDelegate.size != size ||
      oldDelegate.xyz != xyz ||
      oldDelegate.period != period ||
      oldDelegate.alpha != alpha ||
      oldDelegate.scale != scale ||
      oldDelegate.brightness != brightness;
}

class Voronoise2Painter extends NoisePainter with _Noise2Painter {
  @override
  final vm.Vector2 xy;
  final vm.Vector2 uv;

  Voronoise2Painter({
    super.repaint,
    required super.shader,
    required super.size,
    required super.elapsed,
    required this.xy,
    required this.uv,
    required super.scale,
    required super.brightness,
  });

  @override
  void paint(ui.Canvas canvas, ui.Size size) {
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);
    shader.setFloat(2, elapsed);
    shader.setFloat(3, xy.x);
    shader.setFloat(4, xy.y);
    shader.setFloat(5, uv.x);
    shader.setFloat(6, uv.y);
    shader.setFloat(7, scale);
    shader.setFloat(8, brightness);

    canvas.drawRect(ui.Offset.zero & size, shaderPaint..shader = shader);
  }

  @override
  bool shouldRepaint(Voronoise2Painter oldDelegate) =>
      oldDelegate.shader != shader ||
      oldDelegate.size != size ||
      oldDelegate.xy != xy ||
      oldDelegate.uv != uv ||
      oldDelegate.scale != scale ||
      oldDelegate.brightness != brightness;
}

class Voronoise3Painter extends NoisePainter with _Noise3Painter {
  @override
  final vm.Vector3 xyz;
  final vm.Vector2 uv;

  Voronoise3Painter({
    super.repaint,
    required super.shader,
    required super.size,
    required super.elapsed,
    required this.xyz,
    required this.uv,
    required super.scale,
    required super.brightness,
  });

  @override
  void paint(ui.Canvas canvas, ui.Size size) {
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);
    shader.setFloat(2, elapsed);
    shader.setFloat(3, xyz.x);
    shader.setFloat(4, xyz.y);
    shader.setFloat(5, xyz.z);
    shader.setFloat(6, uv.x);
    shader.setFloat(7, uv.y);
    shader.setFloat(8, scale);
    shader.setFloat(9, brightness);

    canvas.drawRect(ui.Offset.zero & size, shaderPaint..shader = shader);
  }

  @override
  bool shouldRepaint(Voronoise3Painter oldDelegate) =>
      oldDelegate.shader != shader ||
      oldDelegate.size != size ||
      oldDelegate.xyz != xyz ||
      oldDelegate.uv != uv ||
      oldDelegate.scale != scale ||
      oldDelegate.brightness != brightness;
}

class Wavelet2Painter extends NoisePainter with _Noise2Painter {
  @override
  final vm.Vector2 xy;
  final double phase;
  final double k;

  Wavelet2Painter({
    super.repaint,
    required super.shader,
    required super.size,
    required super.elapsed,
    required this.xy,
    required this.phase,
    required this.k,
    required super.scale,
    required super.brightness,
  });

  @override
  void paint(ui.Canvas canvas, ui.Size size) {
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);
    shader.setFloat(2, elapsed);
    shader.setFloat(3, xy.x);
    shader.setFloat(4, xy.y);
    shader.setFloat(5, phase);
    shader.setFloat(6, k);
    shader.setFloat(7, scale);
    shader.setFloat(8, brightness);

    canvas.drawRect(ui.Offset.zero & size, shaderPaint..shader = shader);
  }

  @override
  bool shouldRepaint(Wavelet2Painter oldDelegate) =>
      oldDelegate.shader != shader ||
      oldDelegate.size != size ||
      oldDelegate.xy != xy ||
      oldDelegate.phase != phase ||
      oldDelegate.k != k ||
      oldDelegate.scale != scale ||
      oldDelegate.brightness != brightness;
}
