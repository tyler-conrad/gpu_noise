library gpu_noise;

import 'dart:ui' as ui;

import 'package:flutter/widgets.dart' as w;

import 'package:vector_math/vector_math.dart' as vm;

abstract class NoisePainter extends w.CustomPainter {
  final ui.FragmentShader shader;
  final ui.Size size;
  final double time;
  final shaderPaint = ui.Paint();
  final double scale;
  final double dilation;

  NoisePainter({
    super.repaint,
    required this.shader,
    required this.size,
    required this.time,
    required this.scale,
    required this.dilation,
  });
}

abstract class _Noise2Painter extends NoisePainter {
  final vm.Vector2 xy;

  _Noise2Painter({
    super.repaint,
    required super.shader,
    required super.size,
    required super.time,
    required this.xy,
    required super.scale,
    required super.dilation,
  });

  @override
  void paint(ui.Canvas canvas, ui.Size size) {
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);
    shader.setFloat(2, time);
    shader.setFloat(3, xy.x);
    shader.setFloat(4, xy.y);
    shader.setFloat(5, scale);
    shader.setFloat(6, dilation);

    canvas.drawRect(ui.Offset.zero & size, shaderPaint..shader = shader);
  }

  @override
  bool shouldRepaint(_Noise2Painter oldDelegate) =>
      oldDelegate.shader != shader ||
      oldDelegate.size != size ||
      oldDelegate.xy != xy ||
      oldDelegate.scale != scale ||
      oldDelegate.dilation != dilation;
}

abstract class _Noise3Painter extends NoisePainter {
  final vm.Vector3 xyz;

  _Noise3Painter({
    super.repaint,
    required super.shader,
    required super.size,
    required super.time,
    required this.xyz,
    required super.scale,
    required super.dilation,
  });

  @override
  void paint(ui.Canvas canvas, ui.Size size) {
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);
    shader.setFloat(2, time);
    shader.setFloat(3, xyz.x);
    shader.setFloat(4, xyz.y);
    shader.setFloat(5, xyz.z);
    shader.setFloat(6, scale);
    shader.setFloat(7, dilation);

    canvas.drawRect(ui.Offset.zero & size, shaderPaint..shader = shader);
  }

  @override
  bool shouldRepaint(_Noise3Painter oldDelegate) =>
      oldDelegate.shader != shader ||
      oldDelegate.size != size ||
      oldDelegate.xyz != xyz ||
      oldDelegate.scale != scale ||
      oldDelegate.dilation != dilation;
}

abstract class _Noise4Painter extends NoisePainter {
  final vm.Vector4 xyzw;

  _Noise4Painter({
    super.repaint,
    required super.shader,
    required super.size,
    required super.time,
    required this.xyzw,
    required super.scale,
    required super.dilation,
  });

  @override
  void paint(ui.Canvas canvas, ui.Size size) {
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);
    shader.setFloat(2, time);
    shader.setFloat(3, xyzw.x);
    shader.setFloat(4, xyzw.y);
    shader.setFloat(5, xyzw.z);
    shader.setFloat(6, xyzw.w);
    shader.setFloat(7, scale);
    shader.setFloat(8, dilation);

    canvas.drawRect(ui.Offset.zero & size, shaderPaint..shader = shader);
  }

  @override
  bool shouldRepaint(_Noise4Painter oldDelegate) =>
      oldDelegate.shader != shader ||
          oldDelegate.size != size ||
          oldDelegate.xyzw != xyzw ||
          oldDelegate.scale != scale ||
          oldDelegate.dilation != dilation;
}

class Cellular2Painter extends _Noise2Painter {
  Cellular2Painter({
    super.repaint,
    required super.shader,
    required super.size,
    required super.time,
    required super.xy,
    required super.scale,
    required super.dilation,
  });
}

class Cellular3Painter extends _Noise3Painter {
  Cellular3Painter({
    super.repaint,
    required super.shader,
    required super.size,
    required super.time,
    required super.xyz,
    required super.scale,
    required super.dilation,
  });
}

class Perlin2Painter extends _Noise2Painter {
  Perlin2Painter({
    super.repaint,
    required super.shader,
    required super.size,
    required super.time,
    required super.xy,
    required super.scale,
    required super.dilation,
  });
}

class Perlin3Painter extends _Noise3Painter {
  Perlin3Painter({
    super.repaint,
    required super.shader,
    required super.size,
    required super.time,
    required super.xyz,
    required super.scale,
    required super.dilation,
  });
}

class Perlin4Painter extends _Noise4Painter {
  Perlin4Painter({
    super.repaint,
    required super.shader,
    required super.size,
    required super.time,
    required super.xyzw,
    required super.scale,
    required super.dilation,
  });
}

class Simplex2Painter extends _Noise2Painter {
  Simplex2Painter({
    super.repaint,
    required super.shader,
    required super.size,
    required super.time,
    required super.xy,
    required super.scale,
    required super.dilation,
  });
}

class Simplex3Painter extends _Noise3Painter {
  Simplex3Painter({
    super.repaint,
    required super.shader,
    required super.size,
    required super.time,
    required super.xyz,
    required super.scale,
    required super.dilation,
  });
}

class Simplex4Painter extends _Noise4Painter {
  Simplex4Painter({
    super.repaint,
    required super.shader,
    required super.size,
    required super.time,
    required super.xyzw,
    required super.scale,
    required super.dilation,
  });
}

abstract class _Tiling2Painter extends _Noise2Painter {
  final vm.Vector2 period;

  _Tiling2Painter({
    super.repaint,
    required super.shader,
    required super.size,
    required super.time,
    required super.xy,
    required this.period,
    required super.scale,
    required super.dilation,
  });

  @override
  void paint(ui.Canvas canvas, ui.Size size) {
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);
    shader.setFloat(2, time);
    shader.setFloat(3, xy.x);
    shader.setFloat(4, xy.y);
    shader.setFloat(5, period.x);
    shader.setFloat(6, period.y);
    shader.setFloat(7, scale);
    shader.setFloat(8, dilation);

    canvas.drawRect(ui.Offset.zero & size, shaderPaint..shader = shader);
  }

  @override
  bool shouldRepaint(_Tiling2Painter oldDelegate) =>
      oldDelegate.shader != shader ||
      oldDelegate.size != size ||
      oldDelegate.xy != xy ||
      oldDelegate.scale != scale ||
      oldDelegate.dilation != dilation;
}

class TilingPerlin2Painter extends _Tiling2Painter {
  TilingPerlin2Painter({
    super.repaint,
    required super.shader,
    required super.size,
    required super.time,
    required super.xy,
    required super.period,
    required super.scale,
    required super.dilation,
  });
}

class _Tiling3Painter extends _Noise3Painter {
  final vm.Vector3 period;

  _Tiling3Painter({
    super.repaint,
    required super.shader,
    required super.size,
    required super.time,
    required super.xyz,
    required this.period,
    required super.scale,
    required super.dilation,
  });

  @override
  void paint(ui.Canvas canvas, ui.Size size) {
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);
    shader.setFloat(2, time);
    shader.setFloat(3, xyz.x);
    shader.setFloat(4, xyz.y);
    shader.setFloat(5, xyz.z);
    shader.setFloat(6, period.x);
    shader.setFloat(7, period.y);
    shader.setFloat(8, period.z);
    shader.setFloat(9, scale);
    shader.setFloat(10, dilation);

    canvas.drawRect(ui.Offset.zero & size, shaderPaint..shader = shader);
  }

  @override
  bool shouldRepaint(_Tiling3Painter oldDelegate) =>
      oldDelegate.shader != shader ||
      oldDelegate.size != size ||
      oldDelegate.xyz != xyz ||
      oldDelegate.period != period ||
      oldDelegate.scale != scale ||
      oldDelegate.dilation != dilation;
}

class TilingPerlin3Painter extends _Tiling3Painter {
  TilingPerlin3Painter({
    super.repaint,
    required super.shader,
    required super.size,
    required super.time,
    required super.xyz,
    required super.period,
    required super.scale,
    required super.dilation,
  });
}

class TilingPerlin4Painter extends _Noise4Painter {
  final vm.Vector4 period;

  TilingPerlin4Painter({
    super.repaint,
    required super.shader,
    required super.size,
    required super.time,
    required super.xyzw,
    required this.period,
    required super.scale,
    required super.dilation,
  });

  @override
  void paint(ui.Canvas canvas, ui.Size size) {
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);
    shader.setFloat(2, time);
    shader.setFloat(3, xyzw.x);
    shader.setFloat(4, xyzw.y);
    shader.setFloat(5, xyzw.z);
    shader.setFloat(6, xyzw.w);
    shader.setFloat(7, period.x);
    shader.setFloat(8, period.y);
    shader.setFloat(9, period.z);
    shader.setFloat(10, period.w);
    shader.setFloat(11, scale);
    shader.setFloat(12, dilation);

    canvas.drawRect(ui.Offset.zero & size, shaderPaint..shader = shader);
  }

  @override
  bool shouldRepaint(TilingPerlin4Painter oldDelegate) =>
      oldDelegate.shader != shader ||
      oldDelegate.size != size ||
      oldDelegate.xyzw != xyzw ||
      oldDelegate.period != period ||
      oldDelegate.scale != scale ||
      oldDelegate.dilation != dilation;
}

class TilingSimplex2Painter extends _Tiling2Painter {
  final double alpha;

  TilingSimplex2Painter({
    super.repaint,
    required super.shader,
    required super.size,
    required super.time,
    required super.xy,
    required super.period,
    required this.alpha,
    required super.scale,
    required super.dilation,
  });


  @override
  void paint(ui.Canvas canvas, ui.Size size) {
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);
    shader.setFloat(2, time);
    shader.setFloat(3, xy.x);
    shader.setFloat(4, xy.y);
    shader.setFloat(5, period.x);
    shader.setFloat(6, period.y);
    shader.setFloat(7, alpha);
    shader.setFloat(8, scale);
    shader.setFloat(9, dilation);

    canvas.drawRect(ui.Offset.zero & size, shaderPaint..shader = shader);
  }

  @override
  bool shouldRepaint(TilingSimplex2Painter oldDelegate) =>
      oldDelegate.shader != shader ||
      oldDelegate.size != size ||
      oldDelegate.xy != xy ||
      oldDelegate.period != period ||
      oldDelegate.alpha != alpha ||
      oldDelegate.scale != scale ||
      oldDelegate.dilation != dilation;
}

class TilingSimplex3Painter extends _Tiling3Painter {
  final double alpha;

  TilingSimplex3Painter({
    super.repaint,
    required super.shader,
    required super.size,
    required super.time,
    required super.xyz,
    required super.period,
    required this.alpha,
    required super.scale,
    required super.dilation,
  });

  @override
  void paint(ui.Canvas canvas, ui.Size size) {
    shader.setFloat(0, size.width);
    shader.setFloat(1, size.height);
    shader.setFloat(2, time);
    shader.setFloat(3, xyz.x);
    shader.setFloat(4, xyz.y);
    shader.setFloat(5, xyz.z);
    shader.setFloat(6, period.x);
    shader.setFloat(7, period.y);
    shader.setFloat(8, period.z);
    shader.setFloat(9, alpha);
    shader.setFloat(10, scale);
    shader.setFloat(11, dilation);

    canvas.drawRect(ui.Offset.zero & size, shaderPaint..shader = shader);
  }

  @override
  bool shouldRepaint(TilingSimplex3Painter oldDelegate) =>
      oldDelegate.shader != shader ||
      oldDelegate.size != size ||
      oldDelegate.xyz != xyz ||
      oldDelegate.period != period ||
      oldDelegate.alpha != alpha ||
      oldDelegate.scale != scale ||
      oldDelegate.dilation != dilation;
}
