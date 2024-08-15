import 'dart:ui' as ui;

import 'package:flutter/widgets.dart' as w;

import 'package:vector_math/vector_math.dart' as vm;

/// This abstract class serves as a base class that extends the
/// [w.CustomPainter] class, providing a common set of parameters and
/// functionality for all its subclasses.
///
/// The primary purpose of this class is to encapsulate shared properties and
/// methods that are common across different types of noise painters.
abstract class NoisePainter extends w.CustomPainter {
  int get uniformsOffset => 4;

  final ui.FragmentShader shader;
  final ui.Size size;
  final double elapsed;
  final shaderPaint = ui.Paint();
  final double scale;
  final double brightness;

  /// Sets the uniform values common to all [NoisePainter] subclasses.
  void setFloats(ui.Size size) {
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);
    shader.setFloat(2, elapsed);
    shader.setFloat(3, scale);
    shader.setFloat(4, brightness);
  }

  /// Constructor for [NoisePainter] with parameters that are common to all
  /// subclasses.
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

/// Mixin for 2D [NoisePainter] subclasses that require a [vm.Vector2] parameter.
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

/// Subclass of [NoisePainter] that generates 2D noise and requires a
/// [vm.Vector2] parameter.
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

/// Subclass of [Noise2Painter] that generates Voronoi noise and  requires a
/// [time] parameter.
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

/// Mixin for 3D [NoisePainter] subclasses that require a [vm.Vector3]
/// parameter.
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

/// Subclass of [NoisePainter] that generates 3D noise and requires a
/// [vm.Vector3] parameter.
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

/// Mixin for 4D [NoisePainter] subclasses that require a [vm.Vector4]
/// parameter.
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

/// Subclass of [NoisePainter] that generates 4D noise and requires a
/// [vm.Vector4] parameter.
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

/// Subclass of [NoisePainter] that generates 2D Gerstner wave noise and
/// requires a [steepness], [wavelength], and [time] parameter.
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

/// Subclass of [NoisePainter] that requires a double for the [period]
/// parameter.
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

/// Subclass of [NoisePainter] that generates 3D noise and requires a double for
/// the [period] parameter.
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

/// Mixin for [NoisePainter] subclasses that generate 2D noise and require a
/// [period] parameter.
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

/// Subclass of [NoisePainter] that generates 2D noise and require a [period]
/// parameter.
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

/// Mixin for [NoisePainter] subclasses that generate 3D noise and require a
/// [period] parameter.
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

/// Subclass of [NoisePainter] that generate 3D tiling noise and require a
/// [period] parameter.
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

/// Mixin for [NoisePainter] subclasses that generate 4D tiling noise and
/// require a [period] parameter.
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

/// Subclass of [NoisePainter] that generates 4D tiling noise and requires a
/// [period] parameter.
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

/// Subclass of [NoisePainter] that generates 2D tiling Simplex flow noise and
/// requires [period] and [alpha] parameters.
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
      super.shouldRepaint(oldDelegate) || oldDelegate.alpha != alpha;
}

/// Subclass of [NoisePainter] that generates 3D Simplex flow noise and requires
/// [period] and [alpha] parameters.
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
      super.shouldRepaint(oldDelegate) || oldDelegate.alpha != alpha;
}

/// Subclass of [NoisePainter] that generates 2D Voronoise and requires a [uv]
/// parameter.
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
      super.shouldRepaint(oldDelegate) || oldDelegate.uv != uv;
}

/// Subclass of [NoisePainter] that generates 3D Voronoise and requires a [uv]
/// parameter.
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
      super.shouldRepaint(oldDelegate) || oldDelegate.uv != uv;
}

/// Subclass of [NoisePainter] that generates 2D wavelet noise and requires
/// [phase] and [k] parameters.
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
