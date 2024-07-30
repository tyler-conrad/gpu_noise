import 'dart:math' as math;
import 'dart:async' as a;
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart' as f;
import 'package:flutter/gestures.dart' as g;
import 'package:flutter/material.dart' as m;

import 'package:vector_math/vector_math.dart' as vm;

import 'package:gpu_noise/gpu_noise.dart' as gn;

double scale(m.Size size) => math.sqrt(size.width * size.height) * 0.00125;

typedef PainterBuilder = gn.NoisePainter Function({
  m.Listenable? repaint,
  required ui.FragmentShader shader,
  required m.Size size,
  required double time,
  required vm.Vector2 xy,
  required vm.Vector3 xyz,
  required vm.Vector4 xyzw,
  required vm.Vector2 dir,
  required double period,
  required vm.Vector2 period2,
  required vm.Vector3 period3,
  required vm.Vector4 period4,
  required double steepness,
  required double wavelength,
  required double alpha,
  required double scale,
  required double brightness,
});

gn.Noise2Painter noise2Painter({
  m.Listenable? repaint,
  required ui.FragmentShader shader,
  required m.Size size,
  required double time,
  required vm.Vector2 xy,
  required vm.Vector3 xyz,
  required vm.Vector4 xyzw,
  required vm.Vector2 dir,
  required double period,
  required vm.Vector2 period2,
  required vm.Vector3 period3,
  required vm.Vector4 period4,
  required double steepness,
  required double wavelength,
  required double alpha,
  required double scale,
  required double brightness,
}) =>
    gn.Noise2Painter(
      repaint: repaint,
      shader: shader,
      size: size,
      time: time,
      xy: xy,
      scale: scale,
      brightness: brightness,
    );

gn.Noise3Painter noise3Painter({
  m.Listenable? repaint,
  required ui.FragmentShader shader,
  required m.Size size,
  required double time,
  required vm.Vector2 xy,
  required vm.Vector3 xyz,
  required vm.Vector4 xyzw,
  required vm.Vector2 dir,
  required double period,
  required vm.Vector2 period2,
  required vm.Vector3 period3,
  required vm.Vector4 period4,
  required double steepness,
  required double wavelength,
  required double alpha,
  required double scale,
  required double brightness,
}) =>
    gn.Noise3Painter(
      repaint: repaint,
      shader: shader,
      size: size,
      time: time,
      xyz: xyz,
      scale: scale,
      brightness: brightness,
    );

gn.Noise4Painter noise4Painter({
  m.Listenable? repaint,
  required ui.FragmentShader shader,
  required m.Size size,
  required double time,
  required vm.Vector2 xy,
  required vm.Vector3 xyz,
  required vm.Vector4 xyzw,
  required vm.Vector2 dir,
  required double period,
  required vm.Vector2 period2,
  required vm.Vector3 period3,
  required vm.Vector4 period4,
  required double steepness,
  required double wavelength,
  required double alpha,
  required double scale,
  required double brightness,
}) =>
    gn.Noise4Painter(
      repaint: repaint,
      shader: shader,
      size: size,
      time: time,
      xyzw: xyzw,
      scale: scale,
      brightness: brightness,
    );

gn.GerstnerWave2Painter gerstnerWave2Painter({
  m.Listenable? repaint,
  required ui.FragmentShader shader,
  required m.Size size,
  required double time,
  required vm.Vector2 xy,
  required vm.Vector3 xyz,
  required vm.Vector4 xyzw,
  required vm.Vector2 dir,
  required double period,
  required vm.Vector2 period2,
  required vm.Vector3 period3,
  required vm.Vector4 period4,
  required double steepness,
  required double wavelength,
  required double alpha,
  required double scale,
  required double brightness,
}) =>
    gn.GerstnerWave2Painter(
      repaint: repaint,
      shader: shader,
      size: size,
      time: time,
      xy: xy,
      dir: dir,
      steepness: steepness,
      wavelength: wavelength,
      scale: scale,
      brightness: brightness,
    );

gn.PrimitivePeriodTiling2Painter primitiveTiling2Painter({
  m.Listenable? repaint,
  required ui.FragmentShader shader,
  required m.Size size,
  required double time,
  required vm.Vector2 xy,
  required vm.Vector3 xyz,
  required vm.Vector4 xyzw,
  required vm.Vector2 dir,
  required double period,
  required vm.Vector2 period2,
  required vm.Vector3 period3,
  required vm.Vector4 period4,
  required double steepness,
  required double wavelength,
  required double alpha,
  required double scale,
  required double brightness,
}) =>
    gn.PrimitivePeriodTiling2Painter(
      repaint: repaint,
      shader: shader,
      size: size,
      time: time,
      xy: xy,
      period: period,
      scale: scale,
      brightness: brightness,
    );

gn.PrimitivePeriodTiling3Painter primitiveTiling3Painter({
  m.Listenable? repaint,
  required ui.FragmentShader shader,
  required m.Size size,
  required double time,
  required vm.Vector2 xy,
  required vm.Vector3 xyz,
  required vm.Vector4 xyzw,
  required vm.Vector2 dir,
  required double period,
  required vm.Vector2 period2,
  required vm.Vector3 period3,
  required vm.Vector4 period4,
  required double steepness,
  required double wavelength,
  required double alpha,
  required double scale,
  required double brightness,
}) =>
    gn.PrimitivePeriodTiling3Painter(
      repaint: repaint,
      shader: shader,
      size: size,
      time: time,
      xyz: xyz,
      period: period,
      scale: scale,
      brightness: brightness,
    );

gn.Tiling2Painter tiling2painter({
  m.Listenable? repaint,
  required ui.FragmentShader shader,
  required m.Size size,
  required double time,
  required vm.Vector2 xy,
  required vm.Vector3 xyz,
  required vm.Vector4 xyzw,
  required vm.Vector2 dir,
  required double period,
  required vm.Vector2 period2,
  required vm.Vector3 period3,
  required vm.Vector4 period4,
  required double steepness,
  required double wavelength,
  required double alpha,
  required double scale,
  required double brightness,
}) =>
    gn.Tiling2Painter(
      repaint: repaint,
      shader: shader,
      size: size,
      time: time,
      xy: xy,
      period: period2,
      scale: scale,
      brightness: brightness,
    );

gn.Tiling3Painter tiling3Painter({
  m.Listenable? repaint,
  required ui.FragmentShader shader,
  required m.Size size,
  required double time,
  required vm.Vector2 xy,
  required vm.Vector3 xyz,
  required vm.Vector4 xyzw,
  required vm.Vector2 dir,
  required double period,
  required vm.Vector2 period2,
  required vm.Vector3 period3,
  required vm.Vector4 period4,
  required double steepness,
  required double wavelength,
  required double alpha,
  required double scale,
  required double brightness,
}) =>
    gn.Tiling3Painter(
      repaint: repaint,
      shader: shader,
      size: size,
      time: time,
      xyz: xyz,
      period: period3,
      scale: scale,
      brightness: brightness,
    );

gn.Tiling4Painter tiling4Painter({
  m.Listenable? repaint,
  required ui.FragmentShader shader,
  required m.Size size,
  required double time,
  required vm.Vector2 xy,
  required vm.Vector3 xyz,
  required vm.Vector4 xyzw,
  required vm.Vector2 dir,
  required double period,
  required vm.Vector2 period2,
  required vm.Vector3 period3,
  required vm.Vector4 period4,
  required double steepness,
  required double wavelength,
  required double alpha,
  required double scale,
  required double brightness,
}) =>
    gn.Tiling4Painter(
      repaint: repaint,
      shader: shader,
      size: size,
      time: time,
      xyzw: xyzw,
      period: period4,
      scale: scale,
      brightness: brightness,
    );

gn.TilingSimplex2Painter tilingSimplex2Painter({
  m.Listenable? repaint,
  required ui.FragmentShader shader,
  required m.Size size,
  required double time,
  required vm.Vector2 xy,
  required vm.Vector3 xyz,
  required vm.Vector4 xyzw,
  required vm.Vector2 dir,
  required double period,
  required vm.Vector2 period2,
  required vm.Vector3 period3,
  required vm.Vector4 period4,
  required double steepness,
  required double wavelength,
  required double alpha,
  required double scale,
  required double brightness,
}) =>
    gn.TilingSimplex2Painter(
      repaint: repaint,
      shader: shader,
      size: size,
      time: time,
      xy: xy,
      period: period2,
      alpha: alpha,
      scale: scale,
      brightness: brightness,
    );

gn.TilingSimplex3Painter tilingSimplex3Painter({
  m.Listenable? repaint,
  required ui.FragmentShader shader,
  required m.Size size,
  required double time,
  required vm.Vector2 xy,
  required vm.Vector3 xyz,
  required vm.Vector4 xyzw,
  required vm.Vector2 dir,
  required double period,
  required vm.Vector2 period2,
  required vm.Vector3 period3,
  required vm.Vector4 period4,
  required double steepness,
  required double wavelength,
  required double alpha,
  required double scale,
  required double brightness,
}) =>
    gn.TilingSimplex3Painter(
      repaint: repaint,
      shader: shader,
      size: size,
      time: time,
      xyz: xyz,
      period: period3,
      alpha: alpha,
      scale: scale,
      brightness: brightness,
    );

class _Example {
  final String title;
  final String filename;
  final PainterBuilder builder;

  const _Example({
    required this.title,
    required this.filename,
    required this.builder,
  });
}

const examples = [
  _Example(
    title: 'Cellular2',
    filename: 'cellular2.frag',
    builder: noise2Painter,
  ),
  _Example(
    title: 'Cellular2x2',
    filename: 'cellular2x2.frag',
    builder: noise2Painter,
  ),
  _Example(
    title: 'Cellular2x2x2',
    filename: 'cellular2x2x2.frag',
    builder: noise3Painter,
  ),
  _Example(
    title: 'Cellular3',
    filename: 'cellular3.frag',
    builder: noise3Painter,
  ),
  _Example(
    title: 'Curl2',
    filename: 'curl2.frag',
    builder: noise2Painter,
  ),
  _Example(
    title: 'Curl3',
    filename: 'curl3.frag',
    builder: noise3Painter,
  ),
  _Example(
    title: 'Curl4',
    filename: 'curl4.frag',
    builder: noise4Painter,
  ),
  _Example(
    title: 'FBM2',
    filename: 'fbm2.frag',
    builder: noise2Painter,
  ),
  _Example(
    title: 'FBM3',
    filename: 'fbm3.frag',
    builder: noise3Painter,
  ),
  _Example(
    title: 'GerstnerWave2',
    filename: 'gerstner_wave2.frag',
    builder: gerstnerWave2Painter,
  ),
  _Example(
    title: 'Gradient2',
    filename: 'gradient2.frag',
    builder: noise2Painter,
  ),
  _Example(
    title: 'Gradient3',
    filename: 'gradient3.frag',
    builder: noise3Painter,
  ),
  _Example(
    title: 'Perlin2',
    filename: 'perlin2.frag',
    builder: noise2Painter,
  ),
  _Example(
    title: 'Perlin3',
    filename: 'perlin3.frag',
    builder: noise3Painter,
  ),
  _Example(
    title: 'Perlin4',
    filename: 'perlin4.frag',
    builder: noise4Painter,
  ),
  _Example(
    title: 'Random2',
    filename: 'random2.frag',
    builder: noise2Painter,
  ),
  _Example(
    title: 'Random3',
    filename: 'random3.frag',
    builder: noise3Painter,
  ),
  _Example(
    title: 'Random4',
    filename: 'random4.frag',
    builder: noise4Painter,
  ),
  _Example(
    title: 'SignedRandom2',
    filename: 'signed_random2.frag',
    builder: noise2Painter,
  ),
  _Example(
    title: 'SignedRandom3',
    filename: 'signed_random3.frag',
    builder: noise3Painter,
  ),
  _Example(
    title: 'SignedRandom4',
    filename: 'signed_random4.frag',
    builder: noise4Painter,
  ),
  _Example(
    title: 'Simplex2',
    filename: 'simplex2.frag',
    builder: noise2Painter,
  ),
  _Example(
    title: 'Simplex3',
    filename: 'simplex3.frag',
    builder: noise3Painter,
  ),
  _Example(
    title: 'Simplex4',
    filename: 'simplex4.frag',
    builder: noise4Painter,
  ),
  _Example(
    title: 'TilingFBM3',
    filename: 'tiling_fbm3.frag',
    builder: primitiveTiling3Painter,
  ),
  _Example(
    title: 'TilingGradient3',
    filename: 'tiling_gradient3.frag',
    builder: primitiveTiling3Painter,
  ),
  _Example(
    title: 'TilingPerlin2',
    filename: 'tiling_perlin2.frag',
    builder: tiling2painter,
  ),
  _Example(
    title: 'TilingPerlin3',
    filename: 'tiling_perlin3.frag',
    builder: tiling3Painter,
  ),
  _Example(
    title: 'TilingPerlin4',
    filename: 'tiling_perlin4.frag',
    builder: tiling4Painter,
  ),
  _Example(
    title: 'TilingSignedRandom2',
    filename: 'tiling_signed_random2.frag',
    builder: primitiveTiling2Painter,
  ),
  _Example(
    title: 'TilingSignedRandom3',
    filename: 'tiling_signed_random3.frag',
    builder: primitiveTiling3Painter,
  ),
  _Example(
    title: 'TilingSimplex2',
    filename: 'tiling_simplex2.frag',
    builder: tilingSimplex2Painter,
  ),
  _Example(
    title: 'TilingSimplex3',
    filename: 'tiling_simplex3.frag',
    builder: tilingSimplex3Painter,
  ),
];

const color = m.Colors.red;
const outline = m.Colors.cyan;

List<m.Shadow> shadows() => List.generate(
      4,
      (_) => const m.Shadow(
        color: outline,
        blurRadius: 4.0,
      ),
    );

// class Notifier extends m.ChangeNotifier {
//   void notify() => notifyListeners();
// }

class _ShaderWidget extends m.StatefulWidget {
  final _Example example;

  const _ShaderWidget({super.key, required this.example});

  @override
  m.State<_ShaderWidget> createState() => _ShaderWidgetState();
}

class Text extends m.StatelessWidget {
  final String text;
  final double fontSize;
  final m.Size size;

  const Text(this.text, {super.key, this.fontSize = 12.0, required this.size});

  @override
  m.Widget build(m.BuildContext context) => m.Stack(
        children: [
          m.Text(
            text,
            style: m.TextStyle(
              fontSize: fontSize * scale(size),
              fontWeight: m.FontWeight.bold,
              color: color,
              shadows: shadows(),
            ),
          ),
        ],
      );
}

class Slider extends m.StatelessWidget {
  final double value;
  final double max;
  final String label;
  final void Function(double) onChanged;

  const Slider(
      {super.key,
      required this.label,
      required this.value,
      required this.max,
      required this.onChanged});

  @override
  m.Widget build(m.BuildContext context) => m.Slider(
        label: label,
        value: value,
        min: 0.0,
        max: max,
        divisions: 96,
        overlayColor: m.WidgetStateProperty.all(outline),
        secondaryActiveColor: color,
        activeColor: color,
        thumbColor: color,
        inactiveColor: outline,
        onChanged: onChanged,
      );
}

class _NoisePainterControls extends m.StatelessWidget {
  final m.Size size;
  final double x;
  final double y;
  final double? z;
  final double? w;
  final double? dirX;
  final double? dirY;
  final double? px;
  final double? py;
  final double? pz;
  final double? pw;
  final double? steepness;
  final double? wavelength;
  final double? alpha;
  final double scale;
  final double brightness;
  final void Function(double)? onZChanged;
  final void Function(double)? onWChanged;
  final void Function(double)? onPzChanged;
  final void Function(double)? onPwChanged;
  final void Function(double)? onSteepnessChanged;
  final void Function(double)? onWavelengthChanged;
  final void Function(double)? onAlphaChanged;
  final void Function(double) onBrightnessChanged;

  const _NoisePainterControls({
    super.key,
    required this.size,
    required this.x,
    required this.y,
    this.z,
    this.w,
    this.dirX,
    this.dirY,
    this.steepness,
    this.wavelength,
    this.px,
    this.py,
    this.pz,
    this.pw,
    this.alpha,
    required this.scale,
    required this.brightness,
    this.onSteepnessChanged,
    this.onWavelengthChanged,
    this.onZChanged,
    this.onWChanged,
    this.onPzChanged,
    this.onPwChanged,
    this.onAlphaChanged,
    required this.onBrightnessChanged,
  });

  @override
  m.Widget build(m.BuildContext context) {
    return m.Row(
      children: [
        m.Expanded(
          child: m.Column(
            children: [
              if (onSteepnessChanged != null)
                Slider(
                  label: 'Steepness',
                  value: steepness!,
                  max: 1.0,
                  onChanged: onSteepnessChanged!,
                ),
              if (wavelength != null && onWavelengthChanged != null)
                Slider(
                  label: 'Wavelength',
                  value: wavelength!,
                  max: 32.0,
                  onChanged: onWavelengthChanged!,
                ),
              if (z != null && onZChanged != null)
                Slider(
                  label: 'Z',
                  value: z!,
                  max: 1.0,
                  onChanged: onZChanged!,
                ),
              if (w != null && onWChanged != null)
                Slider(
                  label: 'W',
                  value: w!,
                  max: 1.0,
                  onChanged: onWChanged!,
                ),
              if (pz != null && onPzChanged != null)
                Slider(
                  label: 'Period Z',
                  value: pz!,
                  max: 1024.0,
                  onChanged: onPzChanged!,
                ),
              if (pw != null && onPwChanged != null)
                Slider(
                  label: 'Period W',
                  value: pw!,
                  max: 1024.0,
                  onChanged: onPwChanged!,
                ),
              if (alpha != null && onAlphaChanged != null)
                Slider(
                  label: 'Alpha',
                  value: alpha!,
                  max: 2.0 * math.pi,
                  onChanged: onAlphaChanged!,
                ),
              Slider(
                label: 'Brightness',
                value: brightness,
                max: 8.0,
                onChanged: onBrightnessChanged,
              ),
            ],
          ),
        ),
        m.SizedBox(
          width: size.width * 0.3,
          height: size.height * 0.2,
          child: m.Padding(
            padding: const m.EdgeInsets.fromLTRB(
              0.0,
              0.0,
              24.0,
              0.0,
            ),
            child: m.Row(
              mainAxisAlignment: m.MainAxisAlignment.spaceBetween,
              children: [
                m.Column(
                  mainAxisAlignment: m.MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: m.CrossAxisAlignment.start,
                  children: [
                    Text('X: ${x.toStringAsFixed(2)}', size: size),
                    Text('Y: ${y.toStringAsFixed(2)}', size: size),
                    if (z == null && dirX == null) Text('', size: size),
                    if (z != null)
                      Text('Z: ${z?.toStringAsFixed(2) ?? ''}', size: size),
                    if (dirX != null)
                      Text(
                        'Dir X: ${dirX?.toStringAsFixed(2) ?? ''}',
                        size: size,
                      ),
                    if (w == null && dirY == null) Text('', size: size),
                    if (w != null)
                      Text('W: ${w?.toStringAsFixed(2) ?? ''}', size: size),
                    if (dirY != null)
                      Text(
                        'Dir Y: ${dirY?.toStringAsFixed(2) ?? ''}',
                        size: size,
                      ),
                  ],
                ),
                if (px != null)
                  m.Column(
                    mainAxisAlignment: m.MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: m.CrossAxisAlignment.start,
                    children: [
                      if (px == null) Text('', size: size),
                      if (px != null)
                        Text(
                          'Period X: ${px!.toStringAsFixed(2)}',
                          size: size,
                        ),
                      if (py == null) Text('', size: size),
                      if (py != null)
                        Text(
                          'Period Y: ${py!.toStringAsFixed(2)}',
                          size: size,
                        ),
                      if (pz == null) Text('', size: size),
                      if (pz != null)
                        Text(
                          'Period Z: ${pz!.toStringAsFixed(2)}',
                          size: size,
                        ),
                      if (pw == null) Text('', size: size),
                      if (pw != null)
                        Text(
                          'Period W: ${pw!.toStringAsFixed(2)}',
                          size: size,
                        ),
                    ],
                  ),
                m.Column(
                  mainAxisAlignment: m.MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: m.CrossAxisAlignment.start,
                  children: [
                    Text('Scale: ${scale.toStringAsFixed(2)}', size: size),
                    Text('Brightness: ${brightness.toStringAsFixed(2)}',
                        size: size),
                    if (alpha == null && wavelength == null)
                      Text('', size: size),
                    if (alpha != null)
                      Text('Alpha: ${alpha!.toStringAsFixed(2)}', size: size),
                    if (wavelength != null)
                      Text(
                        'Wavelength: ${wavelength?.toStringAsFixed(2) ?? ''}',
                        size: size,
                      ),
                    if (steepness == null) Text('', size: size),
                    if (steepness != null)
                      Text(
                        'Steepness: ${steepness?.toStringAsFixed(2) ?? ''}',
                        size: size,
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _ShaderWidgetState extends m.State<_ShaderWidget> {
  // final notifier = Notifier();

  a.Timer? timer;
  ui.FragmentShader? shader;

  double elapsed = 0.0;

  double x = 0.0;
  double y = 0.0;
  double z = 0.0;
  double w = 0.0;
  double dirX = 1.0;
  double dirY = 1.0;
  double px = 128.0;
  double py = 128.0;
  double pz = 1.0;
  double pw = 1.0;
  double steepness = 0.25;
  double wavelength = 16.0;
  double alpha = 0.0;
  double scale = 64.0;
  double brightness = 1.0;

  @override
  void initState() {
    super.initState();
    gn.load('../../lib/src/shaders/${widget.example.filename}').then((value) {
      setState(() {
        shader = value;
      });
      timer = a.Timer.periodic(
        const Duration(microseconds: 33333),
        (timer) {
          elapsed = timer.tick / 30.0;
        },
      );
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    shader?.dispose();
    super.dispose();
  }

  @override
  m.Widget build(m.BuildContext context) {
    return shader == null
        ? m.Container()
        : m.LayoutBuilder(
            builder: (context, constraints) {
              final size = m.Size(constraints.maxWidth, constraints.maxHeight);
              final painter = widget.example.builder(
                shader: shader!,
                size: size,
                time: elapsed,
                xy: vm.Vector2(x, y),
                xyz: vm.Vector3(x, y, z),
                xyzw: vm.Vector4(x, y, z, w),
                dir: vm.Vector2(dirX, dirY),
                period: px,
                period2: vm.Vector2(px, py),
                period3: vm.Vector3(px, py, pz),
                period4: vm.Vector4(px, py, pz, pw),
                steepness: steepness,
                wavelength: wavelength,
                alpha: alpha,
                scale: scale,
                brightness: brightness,
              );
              return m.Stack(
                children: [
                  m.Listener(
                    behavior: m.HitTestBehavior.opaque,
                    onPointerMove: (event) {
                      if (event.buttons == g.kPrimaryButton) {
                        setState(() {
                          x -= event.delta.dx;
                          y -= event.delta.dy;
                        });
                        // notifier.notify();
                      } else {
                        setState(() {
                          px += event.delta.dx * 0.1;
                          py += event.delta.dy * 0.1;
                          dirX += event.delta.dx * 0.01;
                          dirY += event.delta.dy * 0.01;
                        });
                        // notifier.notify();
                      }
                    },
                    onPointerSignal: (event) {
                      if (event is g.PointerScrollEvent) {
                        if (event.scrollDelta.dy > 0) {
                          setState(() {
                            scale += 1.0;
                          });
                          // notifier.notify();
                        } else {
                          setState(() {
                            scale -= 1.0;
                          });
                          // notifier.notify();
                        }
                      }
                    },
                    child: m.RepaintBoundary(
                      child: m.CustomPaint(
                        isComplex: false,
                        willChange: true,
                        size: size,
                        painter: painter,
                        child: const m.SizedBox.expand(),
                      ),
                    ),
                  ),
                  m.Column(
                    children: [
                      m.Center(
                          child: Text(widget.example.title,
                              fontSize: 16.0, size: size)),
                      const m.Spacer(),
                      if (painter is gn.Noise2Painter)
                        _NoisePainterControls(
                          size: size,
                          x: x,
                          y: y,
                          scale: scale,
                          brightness: brightness,
                          onBrightnessChanged: (value) {
                            setState(() {
                              brightness = value;
                            });
                          },
                        ),
                      if (painter is gn.Noise3Painter)
                        _NoisePainterControls(
                          size: size,
                          x: x,
                          y: y,
                          z: z,
                          scale: scale,
                          brightness: brightness,
                          onZChanged: (value) {
                            setState(() {
                              z = value;
                            });
                          },
                          onBrightnessChanged: (value) {
                            setState(() {
                              brightness = value;
                            });
                          },
                        ),
                      if (painter is gn.Noise4Painter)
                        _NoisePainterControls(
                          size: size,
                          x: x,
                          y: y,
                          z: z,
                          w: w,
                          scale: scale,
                          brightness: brightness,
                          onZChanged: (value) {
                            setState(() {
                              z = value;
                            });
                          },
                          onWChanged: (value) {
                            setState(() {
                              w = value;
                            });
                          },
                          onBrightnessChanged: (value) {
                            setState(() {
                              brightness = value;
                            });
                          },
                        ),
                      if (painter is gn.GerstnerWave2Painter)
                        _NoisePainterControls(
                          size: size,
                          x: x,
                          y: y,
                          dirX: dirX,
                          dirY: dirY,
                          steepness: steepness,
                          wavelength: wavelength,
                          scale: scale,
                          brightness: brightness,
                          onSteepnessChanged: (value) {
                            setState(() {
                              steepness = value;
                            });
                          },
                          onWavelengthChanged: (value) {
                            setState(() {
                              wavelength = value;
                            });
                          },
                          onBrightnessChanged: (value) {
                            setState(() {
                              brightness = value;
                            });
                          },
                        ),
                      if (painter is gn.PrimitivePeriodTiling2Painter)
                        _NoisePainterControls(
                          size: size,
                          x: x,
                          y: y,
                          px: px,
                          scale: scale,
                          brightness: brightness,
                          onBrightnessChanged: (value) {
                            setState(() {
                              brightness = value;
                            });
                          },
                        ),
                      if (painter is gn.PrimitivePeriodTiling3Painter)
                        _NoisePainterControls(
                          size: size,
                          x: x,
                          y: y,
                          z: z,
                          px: px,
                          scale: scale,
                          brightness: brightness,
                          onZChanged: (value) {
                            setState(() {
                              z = value;
                            });
                          },
                          onBrightnessChanged: (value) {
                            setState(() {
                              brightness = value;
                            });
                          },
                        ),
                      if (painter is gn.Tiling2Painter)
                        _NoisePainterControls(
                          size: size,
                          x: x,
                          y: y,
                          px: px,
                          py: py,
                          scale: scale,
                          brightness: brightness,
                          onBrightnessChanged: (value) {
                            setState(() {
                              brightness = value;
                            });
                          },
                        ),
                      if (painter is gn.Tiling3Painter)
                        _NoisePainterControls(
                          size: size,
                          x: x,
                          y: y,
                          z: z,
                          px: px,
                          py: py,
                          pz: pz,
                          scale: scale,
                          brightness: brightness,
                          onZChanged: (value) {
                            setState(() {
                              z = value;
                            });
                          },
                          onPzChanged: (value) {
                            setState(() {
                              pz = value;
                            });
                          },
                          onBrightnessChanged: (value) {
                            setState(() {
                              brightness = value;
                            });
                          },
                        ),
                      if (painter is gn.Tiling4Painter)
                        _NoisePainterControls(
                          size: size,
                          x: x,
                          y: y,
                          z: z,
                          w: w,
                          px: px,
                          py: py,
                          pz: pz,
                          pw: pw,
                          scale: scale,
                          brightness: brightness,
                          onZChanged: (value) {
                            setState(() {
                              z = value;
                            });
                          },
                          onWChanged: (value) {
                            setState(() {
                              w = value;
                            });
                          },
                          onPzChanged: (value) {
                            setState(() {
                              pz = value;
                            });
                          },
                          onPwChanged: (value) {
                            setState(() {
                              pw = value;
                            });
                          },
                          onBrightnessChanged: (value) {
                            setState(() {
                              brightness = value;
                            });
                          },
                        ),
                      if (painter is gn.TilingSimplex2Painter)
                        _NoisePainterControls(
                          size: size,
                          x: x,
                          y: y,
                          px: px,
                          py: py,
                          alpha: alpha,
                          scale: scale,
                          brightness: brightness,
                          onAlphaChanged: (value) {
                            setState(() {
                              alpha = value;
                            });
                          },
                          onBrightnessChanged: (value) {
                            setState(() {
                              brightness = value;
                            });
                          },
                        ),
                      if (painter is gn.TilingSimplex3Painter)
                        _NoisePainterControls(
                          size: size,
                          x: x,
                          y: y,
                          z: z,
                          px: px,
                          py: py,
                          pz: pz,
                          alpha: alpha,
                          scale: scale,
                          brightness: brightness,
                          onZChanged: (value) {
                            setState(() {
                              z = value;
                            });
                          },
                          onPzChanged: (value) {
                            setState(() {
                              pz = value;
                            });
                          },
                          onAlphaChanged: (value) {
                            setState(() {
                              alpha = value;
                            });
                          },
                          onBrightnessChanged: (value) {
                            setState(() {
                              brightness = value;
                            });
                          },
                        ),
                      const m.SizedBox(height: 24.0),
                    ],
                  ),
                ],
              );
            },
          );
  }
}

class PageIndicator extends m.StatelessWidget {
  const PageIndicator({
    super.key,
    required this.tabController,
    required this.currentPageIndex,
    required this.onUpdateCurrentPageIndex,
    required this.isOnDesktopAndWeb,
  });

  final int currentPageIndex;
  final m.TabController tabController;
  final void Function(int) onUpdateCurrentPageIndex;
  final bool isOnDesktopAndWeb;

  @override
  m.Widget build(m.BuildContext context) {
    if (!isOnDesktopAndWeb) {
      return const m.SizedBox.shrink();
    }
    return m.Padding(
      padding: const m.EdgeInsets.all(8.0),
      child: m.Row(
        mainAxisAlignment: m.MainAxisAlignment.center,
        children: <m.Widget>[
          m.IconButton(
            splashRadius: 16.0,
            padding: m.EdgeInsets.zero,
            onPressed: () {
              if (currentPageIndex == 0) {
                return;
              }
              onUpdateCurrentPageIndex(currentPageIndex - 1);
            },
            icon: m.Icon(
              m.Icons.arrow_left_rounded,
              color: color,
              size: 32.0,
              shadows: shadows(),
            ),
          ),
          m.TabPageSelector(
            controller: tabController,
            color: color,
            selectedColor: outline,
          ),
          m.IconButton(
            splashRadius: 16.0,
            padding: m.EdgeInsets.zero,
            onPressed: () {
              if (currentPageIndex == examples.length - 1) {
                return;
              }
              onUpdateCurrentPageIndex(currentPageIndex + 1);
            },
            icon: m.Icon(
              m.Icons.arrow_right_rounded,
              color: color,
              size: 32.0,
              shadows: shadows(),
            ),
          ),
        ],
      ),
    );
  }
}

class _GpuNoiseGallery extends m.StatefulWidget {
  const _GpuNoiseGallery({super.key});

  @override
  m.State<_GpuNoiseGallery> createState() => _GpuNoiseGalleryState();
}

class _GpuNoiseGalleryState extends m.State<_GpuNoiseGallery>
    with m.TickerProviderStateMixin {
  late m.PageController _pageViewController;
  late m.TabController _tabController;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageViewController = m.PageController();
    _tabController = m.TabController(length: examples.length, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
    _tabController.dispose();
  }

  @override
  m.Widget build(m.BuildContext context) {
    return m.MaterialApp(
      home: m.Scaffold(
        body: m.Stack(
          alignment: m.Alignment.bottomCenter,
          children: <m.Widget>[
            m.PageView(
                controller: _pageViewController,
                onPageChanged: _handlePageViewChanged,
                children: examples.map((example) {
                  return _ShaderWidget(
                    example: example,
                  );
                }).toList()),
            PageIndicator(
              tabController: _tabController,
              currentPageIndex: _currentPageIndex,
              onUpdateCurrentPageIndex: _updateCurrentPageIndex,
              isOnDesktopAndWeb: _isOnDesktopAndWeb,
            ),
          ],
        ),
      ),
    );
  }

  void _handlePageViewChanged(int currentPageIndex) {
    if (!_isOnDesktopAndWeb) {
      return;
    }
    _tabController.index = currentPageIndex;
    setState(() {
      _currentPageIndex = currentPageIndex;
    });
  }

  void _updateCurrentPageIndex(int index) {
    _tabController.index = index;
    _pageViewController.animateToPage(
      index,
      duration: const Duration(milliseconds: 400),
      curve: m.Curves.easeInOut,
    );
  }

  bool get _isOnDesktopAndWeb {
    if (f.kIsWeb) {
      return true;
    }
    switch (f.defaultTargetPlatform) {
      case f.TargetPlatform.macOS:
      case f.TargetPlatform.linux:
      case f.TargetPlatform.windows:
        return true;
      case f.TargetPlatform.android:
      case f.TargetPlatform.iOS:
      case f.TargetPlatform.fuchsia:
        return false;
    }
  }
}

void main() {
  m.runApp(
    const m.MaterialApp(
      home: m.Scaffold(
        body: _GpuNoiseGallery(),
      ),
    ),
  );
}
