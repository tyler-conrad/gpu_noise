import 'dart:math' as math;
import 'dart:async' as a;
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart' as f;
import 'package:flutter/gestures.dart' as g;
import 'package:flutter/material.dart' as m;

import 'package:vector_math/vector_math.dart' as vm;

import 'package:gpu_noise/gpu_noise.dart' as gn;

/// Error thrown when code should be unreachable.
class _UnreachableError extends Error {
  final String message;

  _UnreachableError(this.message);

  @override
  String toString() => 'UnreachableError: $message';
}

/// Typedef for a function that returns a [gn.NoisePainter].
///
/// This typedef is used to generalize the construction of any of the provided
/// subclasses of [gn.NoisePainter]. For this reason it provides a superset of
/// the parameters used by each function. The [repaint] parameter is optional
/// and is used to trigger a repaint of the [m.CustomPainter].
typedef _PainterBuilder = gn.NoisePainter Function({
  m.Listenable? repaint,
  required ui.FragmentShader shader,
  required m.Size size,
  required double elapsed,
  required double scale,
  required double brightness,
  required vm.Vector2 xy,
  required vm.Vector3 xyz,
  required vm.Vector4 xyzw,
  required vm.Vector2 uv,
  required double period,
  required vm.Vector2 period2,
  required vm.Vector3 period3,
  required vm.Vector4 period4,
  required vm.Vector2 dir,
  required double steepness,
  required double wavelength,
  required double time,
  required double alpha,
  required double phase,
  required double k,
});

/// Creates a [gn.NoisePainter] for 2D noise.
gn.Noise2Painter _noise2Painter({
  m.Listenable? repaint,
  required ui.FragmentShader shader,
  required m.Size size,
  required double elapsed,
  required double scale,
  required double brightness,
  required vm.Vector2 xy,
  required vm.Vector3 xyz,
  required vm.Vector4 xyzw,
  required vm.Vector2 uv,
  required double period,
  required vm.Vector2 period2,
  required vm.Vector3 period3,
  required vm.Vector4 period4,
  required vm.Vector2 dir,
  required double steepness,
  required double wavelength,
  required double time,
  required double alpha,
  required double phase,
  required double k,
}) =>
    gn.Noise2Painter(
      repaint: repaint,
      shader: shader,
      size: size,
      elapsed: elapsed,
      xy: xy,
      scale: scale,
      brightness: brightness,
    );

/// Creates a [gn.NoisePainter] for 3D noise;
gn.Noise3Painter _noise3Painter({
  m.Listenable? repaint,
  required ui.FragmentShader shader,
  required m.Size size,
  required double elapsed,
  required double scale,
  required double brightness,
  required vm.Vector2 xy,
  required vm.Vector3 xyz,
  required vm.Vector4 xyzw,
  required vm.Vector2 uv,
  required double period,
  required vm.Vector2 period2,
  required vm.Vector3 period3,
  required vm.Vector4 period4,
  required vm.Vector2 dir,
  required double steepness,
  required double wavelength,
  required double time,
  required double alpha,
  required double phase,
  required double k,
}) =>
    gn.Noise3Painter(
      repaint: repaint,
      shader: shader,
      size: size,
      elapsed: elapsed,
      xyz: xyz,
      scale: scale,
      brightness: brightness,
    );

/// Creates a [gn.NoisePainter] for 4D noise.
gn.Noise4Painter _noise4Painter({
  m.Listenable? repaint,
  required ui.FragmentShader shader,
  required m.Size size,
  required double elapsed,
  required double scale,
  required double brightness,
  required vm.Vector2 xy,
  required vm.Vector3 xyz,
  required vm.Vector4 xyzw,
  required vm.Vector2 uv,
  required double period,
  required vm.Vector2 period2,
  required vm.Vector3 period3,
  required vm.Vector4 period4,
  required vm.Vector2 dir,
  required double steepness,
  required double wavelength,
  required double time,
  required double alpha,
  required double phase,
  required double k,
}) =>
    gn.Noise4Painter(
      repaint: repaint,
      shader: shader,
      size: size,
      elapsed: elapsed,
      xyzw: xyzw,
      scale: scale,
      brightness: brightness,
    );

/// Creates a [gn.NoisePainter]. for Gerstner wave 2D noise.
gn.GerstnerWave2Painter _gerstnerWave2Painter({
  m.Listenable? repaint,
  required ui.FragmentShader shader,
  required m.Size size,
  required double elapsed,
  required double scale,
  required double brightness,
  required vm.Vector2 xy,
  required vm.Vector3 xyz,
  required vm.Vector4 xyzw,
  required vm.Vector2 uv,
  required double period,
  required vm.Vector2 period2,
  required vm.Vector3 period3,
  required vm.Vector4 period4,
  required vm.Vector2 dir,
  required double steepness,
  required double wavelength,
  required double time,
  required double alpha,
  required double phase,
  required double k,
}) =>
    gn.GerstnerWave2Painter(
      repaint: repaint,
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
    );

/// Creates a [gn.NoisePainter] for 2D tiling noise where the [period] is a
/// double.
gn.PrimitivePeriodTiling2Painter _primitiveTiling2Painter({
  m.Listenable? repaint,
  required ui.FragmentShader shader,
  required m.Size size,
  required double elapsed,
  required double scale,
  required double brightness,
  required vm.Vector2 xy,
  required vm.Vector3 xyz,
  required vm.Vector4 xyzw,
  required vm.Vector2 uv,
  required double period,
  required vm.Vector2 period2,
  required vm.Vector3 period3,
  required vm.Vector4 period4,
  required vm.Vector2 dir,
  required double steepness,
  required double wavelength,
  required double time,
  required double alpha,
  required double phase,
  required double k,
}) =>
    gn.PrimitivePeriodTiling2Painter(
      repaint: repaint,
      shader: shader,
      size: size,
      elapsed: elapsed,
      xy: xy,
      period: period,
      scale: scale,
      brightness: brightness,
    );

/// Creates a [gn.NoisePainter] for 3D tiling noise where the [period] is a
/// double.
gn.PrimitivePeriodTiling3Painter _primitivePeriodTiling3Painter({
  m.Listenable? repaint,
  required ui.FragmentShader shader,
  required m.Size size,
  required double elapsed,
  required double scale,
  required double brightness,
  required vm.Vector2 xy,
  required vm.Vector3 xyz,
  required vm.Vector4 xyzw,
  required vm.Vector2 uv,
  required double period,
  required vm.Vector2 period2,
  required vm.Vector3 period3,
  required vm.Vector4 period4,
  required vm.Vector2 dir,
  required double steepness,
  required double wavelength,
  required double time,
  required double alpha,
  required double phase,
  required double k,
}) =>
    gn.PrimitivePeriodTiling3Painter(
      repaint: repaint,
      shader: shader,
      size: size,
      elapsed: elapsed,
      xyz: xyz,
      period: period,
      scale: scale,
      brightness: brightness,
    );

/// Creates a [gn.NoisePainter] for 2D tiling noise where the [period] is a
/// [vm.Vector2].
gn.Tiling2Painter _tiling2painter({
  m.Listenable? repaint,
  required ui.FragmentShader shader,
  required m.Size size,
  required double elapsed,
  required double scale,
  required double brightness,
  required vm.Vector2 xy,
  required vm.Vector3 xyz,
  required vm.Vector4 xyzw,
  required vm.Vector2 uv,
  required double period,
  required vm.Vector2 period2,
  required vm.Vector3 period3,
  required vm.Vector4 period4,
  required vm.Vector2 dir,
  required double steepness,
  required double wavelength,
  required double time,
  required double alpha,
  required double phase,
  required double k,
}) =>
    gn.Tiling2Painter(
      repaint: repaint,
      shader: shader,
      size: size,
      elapsed: elapsed,
      xy: xy,
      period: period2,
      scale: scale,
      brightness: brightness,
    );

/// Creates a [gn.NoisePainter] for 3D tiling noise where the [period] is a
/// [vm.Vector3].
gn.Tiling3Painter _tiling3Painter({
  m.Listenable? repaint,
  required ui.FragmentShader shader,
  required m.Size size,
  required double elapsed,
  required double scale,
  required double brightness,
  required vm.Vector2 xy,
  required vm.Vector3 xyz,
  required vm.Vector4 xyzw,
  required vm.Vector2 uv,
  required double period,
  required vm.Vector2 period2,
  required vm.Vector3 period3,
  required vm.Vector4 period4,
  required vm.Vector2 dir,
  required double steepness,
  required double wavelength,
  required double time,
  required double alpha,
  required double phase,
  required double k,
}) =>
    gn.Tiling3Painter(
      repaint: repaint,
      shader: shader,
      size: size,
      elapsed: elapsed,
      xyz: xyz,
      period: period3,
      scale: scale,
      brightness: brightness,
    );

/// Creates a [gn.NoisePainter] for 4D tiling noise where the [period] is a
/// [vm.Vector4].
gn.Tiling4Painter _tiling4Painter({
  m.Listenable? repaint,
  required ui.FragmentShader shader,
  required m.Size size,
  required double elapsed,
  required double scale,
  required double brightness,
  required vm.Vector2 xy,
  required vm.Vector3 xyz,
  required vm.Vector4 xyzw,
  required vm.Vector2 uv,
  required double period,
  required vm.Vector2 period2,
  required vm.Vector3 period3,
  required vm.Vector4 period4,
  required vm.Vector2 dir,
  required double steepness,
  required double wavelength,
  required double time,
  required double alpha,
  required double phase,
  required double k,
}) =>
    gn.Tiling4Painter(
      repaint: repaint,
      shader: shader,
      size: size,
      elapsed: elapsed,
      xyzw: xyzw,
      period: period4,
      scale: scale,
      brightness: brightness,
    );

/// Creates a [gn.NoisePainter] for 2D tiling noise where the [period] is a
/// [vm.Vector2].
///
/// [alpha] is an angle in radians.
gn.TilingSimplexFlow2Painter _tilingSimplexFlow2Painter({
  m.Listenable? repaint,
  required ui.FragmentShader shader,
  required m.Size size,
  required double elapsed,
  required double scale,
  required double brightness,
  required vm.Vector2 xy,
  required vm.Vector3 xyz,
  required vm.Vector4 xyzw,
  required vm.Vector2 uv,
  required double period,
  required vm.Vector2 period2,
  required vm.Vector3 period3,
  required vm.Vector4 period4,
  required vm.Vector2 dir,
  required double steepness,
  required double wavelength,
  required double time,
  required double alpha,
  required double phase,
  required double k,
}) =>
    gn.TilingSimplexFlow2Painter(
      repaint: repaint,
      shader: shader,
      size: size,
      elapsed: elapsed,
      xy: xy,
      period: period2,
      alpha: alpha,
      scale: scale,
      brightness: brightness,
    );

/// Creates a [gn.NoisePainter] for 3D tiling Simplex flow noise where the
/// [period] is a [vm.Vector3].
///
/// [alpha] is an angle in radians.
gn.TilingSimplexFlow3Painter _tilingSimplexFlow3Painter({
  m.Listenable? repaint,
  required ui.FragmentShader shader,
  required m.Size size,
  required double elapsed,
  required double scale,
  required double brightness,
  required vm.Vector2 xy,
  required vm.Vector3 xyz,
  required vm.Vector4 xyzw,
  required vm.Vector2 uv,
  required double period,
  required vm.Vector2 period2,
  required vm.Vector3 period3,
  required vm.Vector4 period4,
  required vm.Vector2 dir,
  required double steepness,
  required double wavelength,
  required double time,
  required double alpha,
  required double phase,
  required double k,
}) =>
    gn.TilingSimplexFlow3Painter(
      repaint: repaint,
      shader: shader,
      size: size,
      elapsed: elapsed,
      xyz: xyz,
      period: period3,
      alpha: alpha,
      scale: scale,
      brightness: brightness,
    );

/// Creates a [gn.NoisePainter] for 2D Voronoi noise.
///
/// [time] is used to modify the output.
gn.VoronoiTime2Painter _voronoiTime2Painter({
  m.Listenable? repaint,
  required ui.FragmentShader shader,
  required m.Size size,
  required double elapsed,
  required double scale,
  required double brightness,
  required vm.Vector2 xy,
  required vm.Vector3 xyz,
  required vm.Vector4 xyzw,
  required vm.Vector2 uv,
  required double period,
  required vm.Vector2 period2,
  required vm.Vector3 period3,
  required vm.Vector4 period4,
  required vm.Vector2 dir,
  required double steepness,
  required double wavelength,
  required double time,
  required double alpha,
  required double phase,
  required double k,
}) =>
    gn.VoronoiTime2Painter(
      repaint: repaint,
      shader: shader,
      size: size,
      elapsed: elapsed,
      xy: xy,
      time: time,
      scale: scale,
      brightness: brightness,
    );

/// Creates a [gn.NoisePainter] for 2D Voronoise noise.
///
/// [uv] is used to modify the output.
gn.Voronoise2Painter _voronoise2Painter({
  m.Listenable? repaint,
  required ui.FragmentShader shader,
  required m.Size size,
  required double elapsed,
  required double scale,
  required double brightness,
  required vm.Vector2 xy,
  required vm.Vector3 xyz,
  required vm.Vector4 xyzw,
  required vm.Vector2 uv,
  required double period,
  required vm.Vector2 period2,
  required vm.Vector3 period3,
  required vm.Vector4 period4,
  required vm.Vector2 dir,
  required double steepness,
  required double wavelength,
  required double time,
  required double alpha,
  required double phase,
  required double k,
}) =>
    gn.Voronoise2Painter(
      repaint: repaint,
      shader: shader,
      size: size,
      elapsed: elapsed,
      xy: xy,
      uv: uv,
      scale: scale,
      brightness: brightness,
    );

/// Creates a [gn.NoisePainter] for 3D Voronoise noise.
///
/// [uv] is used to modify the output.
gn.Voronoise3Painter _voronoise3Painter({
  m.Listenable? repaint,
  required ui.FragmentShader shader,
  required m.Size size,
  required double elapsed,
  required double scale,
  required double brightness,
  required vm.Vector2 xy,
  required vm.Vector3 xyz,
  required vm.Vector4 xyzw,
  required vm.Vector2 uv,
  required double period,
  required vm.Vector2 period2,
  required vm.Vector3 period3,
  required vm.Vector4 period4,
  required vm.Vector2 dir,
  required double steepness,
  required double wavelength,
  required double time,
  required double alpha,
  required double phase,
  required double k,
}) =>
    gn.Voronoise3Painter(
      repaint: repaint,
      shader: shader,
      size: size,
      elapsed: elapsed,
      xyz: xyz,
      uv: uv,
      scale: scale,
      brightness: brightness,
    );

/// Creates a [gn.NoisePainter] for 2D wavelet noise.
///
/// [phase] and [k] are used to modify the output.
gn.Wavelet2Painter _wavelet2Painter({
  m.Listenable? repaint,
  required ui.FragmentShader shader,
  required m.Size size,
  required double elapsed,
  required double scale,
  required double brightness,
  required vm.Vector2 xy,
  required vm.Vector3 xyz,
  required vm.Vector4 xyzw,
  required vm.Vector2 uv,
  required double period,
  required vm.Vector2 period2,
  required vm.Vector3 period3,
  required vm.Vector4 period4,
  required vm.Vector2 dir,
  required double steepness,
  required double wavelength,
  required double time,
  required double alpha,
  required double phase,
  required double k,
}) =>
    gn.Wavelet2Painter(
      repaint: repaint,
      shader: shader,
      size: size,
      elapsed: elapsed,
      xy: xy,
      phase: phase,
      k: k,
      scale: scale,
      brightness: brightness,
    );

/// Class to represent an example of a specific noise functionl.
class _Example {
  /// Title of the example.
  final String title;

  /// Filename of the fragment shader without the path.
  final String filename;

  /// Function to build the [gn.NoisePainter].
  final _PainterBuilder builder;

  const _Example({
    required this.title,
    required this.filename,
    required this.builder,
  });
}

/// List of examples to display.
const examples = [
  _Example(
    title: 'Cellular2',
    filename: 'cellular2.frag',
    builder: _noise2Painter,
  ),
  _Example(
    title: 'Cellular2x2',
    filename: 'cellular2x2.frag',
    builder: _noise2Painter,
  ),
  _Example(
    title: 'Cellular2x2x2',
    filename: 'cellular2x2x2.frag',
    builder: _noise3Painter,
  ),
  _Example(
    title: 'Cellular3',
    filename: 'cellular3.frag',
    builder: _noise3Painter,
  ),
  _Example(
    title: 'Curl2',
    filename: 'curl2.frag',
    builder: _noise2Painter,
  ),
  _Example(
    title: 'Curl3',
    filename: 'curl3.frag',
    builder: _noise3Painter,
  ),
  _Example(
    title: 'Curl4',
    filename: 'curl4.frag',
    builder: _noise4Painter,
  ),
  _Example(
    title: 'FBM2',
    filename: 'fbm2.frag',
    builder: _noise2Painter,
  ),
  _Example(
    title: 'FBM3',
    filename: 'fbm3.frag',
    builder: _noise3Painter,
  ),
  _Example(
    title: 'GerstnerWave2',
    filename: 'gerstner_wave2.frag',
    builder: _gerstnerWave2Painter,
  ),
  _Example(
    title: 'Gradient2',
    filename: 'gradient2.frag',
    builder: _noise2Painter,
  ),
  _Example(
    title: 'Gradient3',
    filename: 'gradient3.frag',
    builder: _noise3Painter,
  ),
  _Example(
    title: 'Perlin2',
    filename: 'perlin2.frag',
    builder: _noise2Painter,
  ),
  _Example(
    title: 'Perlin3',
    filename: 'perlin3.frag',
    builder: _noise3Painter,
  ),
  _Example(
    title: 'Perlin4',
    filename: 'perlin4.frag',
    builder: _noise4Painter,
  ),
  _Example(
    title: 'Psrd2',
    filename: 'psrd2.frag',
    builder: _noise2Painter,
  ),
  _Example(
    title: 'Psrd3',
    filename: 'psrd3.frag',
    builder: _noise3Painter,
  ),
  _Example(
    title: 'Random2',
    filename: 'random2.frag',
    builder: _noise2Painter,
  ),
  _Example(
    title: 'Random3',
    filename: 'random3.frag',
    builder: _noise3Painter,
  ),
  _Example(
    title: 'Random4',
    filename: 'random4.frag',
    builder: _noise4Painter,
  ),
  _Example(
    title: 'SignedRandom2',
    filename: 'signed_random2.frag',
    builder: _noise2Painter,
  ),
  _Example(
    title: 'SignedRandom3',
    filename: 'signed_random3.frag',
    builder: _noise3Painter,
  ),
  _Example(
    title: 'SignedRandom4',
    filename: 'signed_random4.frag',
    builder: _noise4Painter,
  ),
  _Example(
    title: 'Simplex2',
    filename: 'simplex2.frag',
    builder: _noise2Painter,
  ),
  _Example(
    title: 'Simplex3',
    filename: 'simplex3.frag',
    builder: _noise3Painter,
  ),
  _Example(
    title: 'Simplex4',
    filename: 'simplex4.frag',
    builder: _noise4Painter,
  ),
  _Example(
    title: 'TilingFBM3',
    filename: 'tiling_fbm3.frag',
    builder: _primitivePeriodTiling3Painter,
  ),
  _Example(
    title: 'TilingGradient3',
    filename: 'tiling_gradient3.frag',
    builder: _primitivePeriodTiling3Painter,
  ),
  _Example(
    title: 'TilingPerlin2',
    filename: 'tiling_perlin2.frag',
    builder: _tiling2painter,
  ),
  _Example(
    title: 'TilingPerlin3',
    filename: 'tiling_perlin3.frag',
    builder: _tiling3Painter,
  ),
  _Example(
    title: 'TilingPerlin4',
    filename: 'tiling_perlin4.frag',
    builder: _tiling4Painter,
  ),
  _Example(
    title: 'TilingSignedRandom2',
    filename: 'tiling_signed_random2.frag',
    builder: _primitiveTiling2Painter,
  ),
  _Example(
    title: 'TilingSignedRandom3',
    filename: 'tiling_signed_random3.frag',
    builder: _primitivePeriodTiling3Painter,
  ),
  _Example(
    title: 'TilingSimplex2',
    filename: 'tiling_simplex2.frag',
    builder: _tiling2painter,
  ),
  _Example(
    title: 'TilingSimplex3',
    filename: 'tiling_simplex3.frag',
    builder: _tiling3Painter,
  ),
  _Example(
    title: 'TilingSimplexFlow2',
    filename: 'tiling_simplex_flow2.frag',
    builder: _tilingSimplexFlow2Painter,
  ),
  _Example(
    title: 'TilingSimplexFlow3',
    filename: 'tiling_simplex_flow3.frag',
    builder: _tilingSimplexFlow3Painter,
  ),
  _Example(
    title: 'Voronoi2',
    filename: 'voronoi2.frag',
    builder: _noise2Painter,
  ),
  _Example(
    title: 'Voronoi3',
    filename: 'voronoi3.frag',
    builder: _noise3Painter,
  ),
  _Example(
    title: 'VoronoiTime2',
    filename: 'voronoi_time2.frag',
    builder: _voronoiTime2Painter,
  ),
  _Example(
    title: 'Voronoise2',
    filename: 'voronoise2.frag',
    builder: _voronoise2Painter,
  ),
  _Example(
    title: 'Voronoise3',
    filename: 'voronoise3.frag',
    builder: _voronoise3Painter,
  ),
  _Example(
    title: 'Wavelet2',
    filename: 'wavelet2.frag',
    builder: _wavelet2Painter,
  ),
  _Example(
    title: 'Worley2',
    filename: 'worley2.frag',
    builder: _noise2Painter,
  ),
  _Example(
    title: 'Worley3',
    filename: 'worley3.frag',
    builder: _noise3Painter,
  ),
];

const color = m.Colors.red;
const outline = m.Colors.cyan;

List<m.Shadow> _shadows() => List.generate(
      4,
      (_) => const m.Shadow(
        color: outline,
        blurRadius: 4.0,
      ),
    );

/// Custom text widget for displaying noise parameters.
class _Text extends m.StatelessWidget {
  final String text;
  final double fontSize;
  final m.Size size;

  const _Text(this.text, {this.fontSize = 12.0, required this.size});

  @override
  m.Widget build(m.BuildContext context) => m.Stack(
        children: [
          m.Text(
            text,
            style: m.TextStyle(
              fontSize:
                  fontSize * math.sqrt(size.width * size.height) * 0.00125,
              fontWeight: m.FontWeight.bold,
              color: color,
              shadows: _shadows(),
            ),
          ),
        ],
      );
}

/// Custom slider widget for adjusting noise parameters.
class _Slider extends m.StatelessWidget {
  final double value;
  final double max;
  final String label;
  final void Function(double) onChanged;

  const _Slider({
    required this.label,
    required this.value,
    required this.max,
    required this.onChanged,
  });

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

/// Custom widget for displaying sliders and parameter text.
class _NoisePainterControls extends m.StatelessWidget {
  final m.Size size;
  final double scale;
  final double brightness;
  final double x;
  final double y;
  final double? z;
  final double? w;
  final double? u;
  final double? v;
  final double? px;
  final double? py;
  final double? pz;
  final double? pw;
  final double? dirX;
  final double? dirY;
  final double? steepness;
  final double? wavelength;
  final double? time;
  final double? alpha;
  final double? phase;
  final double? k;

  final void Function(double) onBrightnessChanged;
  final void Function(double)? onZChanged;
  final void Function(double)? onWChanged;
  final void Function(double)? onPzChanged;
  final void Function(double)? onPwChanged;
  final void Function(double)? onSteepnessChanged;
  final void Function(double)? onWavelengthChanged;
  final void Function(double)? onTimeChanged;
  final void Function(double)? onAlphaChanged;

  const _NoisePainterControls({
    required this.size,
    required this.scale,
    required this.brightness,
    required this.x,
    required this.y,
    this.z,
    this.w,
    this.u,
    this.v,
    this.px,
    this.py,
    this.pz,
    this.pw,
    this.dirX,
    this.dirY,
    this.steepness,
    this.wavelength,
    this.time,
    this.alpha,
    this.phase,
    this.k,
    required this.onBrightnessChanged,
    this.onZChanged,
    this.onWChanged,
    this.onPzChanged,
    this.onPwChanged,
    this.onTimeChanged,
    this.onSteepnessChanged,
    this.onWavelengthChanged,
    this.onAlphaChanged,
  });

  @override
  m.Widget build(m.BuildContext context) {
    return m.Row(
      children: [
        m.Expanded(
          child: m.Column(
            children: [
              if (z != null && onZChanged != null)
                _Slider(
                  label: 'Z',
                  value: z!,
                  max: 1.0,
                  onChanged: onZChanged!,
                ),
              if (w != null && onWChanged != null)
                _Slider(
                  label: 'W',
                  value: w!,
                  max: 1.0,
                  onChanged: onWChanged!,
                ),
              if (pz != null && onPzChanged != null)
                _Slider(
                  label: 'Period Z',
                  value: pz!,
                  max: 1024.0,
                  onChanged: onPzChanged!,
                ),
              if (pw != null && onPwChanged != null)
                _Slider(
                  label: 'Period W',
                  value: pw!,
                  max: 1024.0,
                  onChanged: onPwChanged!,
                ),
              if (steepness != null && onSteepnessChanged != null)
                _Slider(
                  label: 'Steepness',
                  value: steepness!,
                  max: 1.0,
                  onChanged: onSteepnessChanged!,
                ),
              if (wavelength != null && onWavelengthChanged != null)
                _Slider(
                  label: 'Wavelength',
                  value: wavelength!,
                  max: 32.0,
                  onChanged: onWavelengthChanged!,
                ),
              if (time != null && onTimeChanged != null)
                _Slider(
                  label: 'Time',
                  value: time!,
                  max: 2.0 * math.pi,
                  onChanged: onTimeChanged!,
                ),
              if (alpha != null && onAlphaChanged != null)
                _Slider(
                  label: 'Alpha',
                  value: alpha!,
                  max: 2.0 * math.pi,
                  onChanged: onAlphaChanged!,
                ),
              _Slider(
                label: 'Brightness',
                value: brightness,
                max: 8.0,
                onChanged: onBrightnessChanged,
              ),
            ],
          ),
        ),
        m.SizedBox(
          width: size.width * 0.35,
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
                    _Text('X: ${x.toStringAsFixed(2)}', size: size),
                    _Text('Y: ${y.toStringAsFixed(2)}', size: size),
                    if (z == null && dirX == null) _Text('', size: size),
                    if (z != null)
                      _Text('Z: ${z!.toStringAsFixed(2)}', size: size),
                    if (dirX != null)
                      _Text(
                        'Dir X: ${dirX!.toStringAsFixed(2)}',
                        size: size,
                      ),
                    if (w == null && dirY == null) _Text('', size: size),
                    if (w != null)
                      _Text('W: ${w!.toStringAsFixed(2)}', size: size),
                    if (dirY != null)
                      _Text(
                        'Dir Y: ${dirY!.toStringAsFixed(2)}',
                        size: size,
                      ),
                  ],
                ),
                if (px != null)
                  m.Column(
                    mainAxisAlignment: m.MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: m.CrossAxisAlignment.start,
                    children: [
                      if (px == null && time == null) _Text('', size: size),
                      if (px != null)
                        _Text(
                          'Period X: ${px!.toStringAsFixed(2)}',
                          size: size,
                        ),
                      if (time != null)
                        _Text(
                          'Time: ${time!.toStringAsFixed(2)}',
                          size: size,
                        ),
                      if (py == null) _Text('', size: size),
                      if (py != null)
                        _Text(
                          'Period Y: ${py!.toStringAsFixed(2)}',
                          size: size,
                        ),
                      if (pz == null) _Text('', size: size),
                      if (pz != null)
                        _Text(
                          'Period Z: ${pz!.toStringAsFixed(2)}',
                          size: size,
                        ),
                      if (pw == null) _Text('', size: size),
                      if (pw != null)
                        _Text(
                          'Period W: ${pw!.toStringAsFixed(2)}',
                          size: size,
                        ),
                    ],
                  ),
                m.Column(
                  mainAxisAlignment: m.MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: m.CrossAxisAlignment.start,
                  children: [
                    _Text('Scale: ${scale.toStringAsFixed(2)}', size: size),
                    _Text('Brightness: ${brightness.toStringAsFixed(2)}',
                        size: size),
                    if (alpha == null &&
                        wavelength == null &&
                        u == null &&
                        phase == null)
                      _Text('', size: size),
                    if (alpha != null)
                      _Text('Alpha: ${alpha!.toStringAsFixed(2)}', size: size),
                    if (wavelength != null)
                      _Text(
                        'Wavelength: ${wavelength!.toStringAsFixed(2)}',
                        size: size,
                      ),
                    if (u != null)
                      _Text('U: ${u!.toStringAsFixed(2)}', size: size),
                    if (phase != null)
                      _Text(
                        'Phase: ${phase!.toStringAsFixed(2)}',
                        size: size,
                      ),
                    if (steepness == null && v == null && k == null)
                      _Text(
                        '',
                        size: size,
                      ),
                    if (steepness != null)
                      _Text(
                        'Steepness: ${steepness!.toStringAsFixed(2)}',
                        size: size,
                      ),
                    if (v != null)
                      _Text('V: ${v!.toStringAsFixed(2)}', size: size),
                    if (k != null)
                      _Text(
                        'K: ${k!.toStringAsFixed(2)}',
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

/// Custom widget for displaying a noise shaders.  Contains default values for
/// noise parameters and is responsible for displaying the
/// [_NoisePainterControls] and the [gn.NoisePainter].
class _ShaderWidget extends m.StatefulWidget {
  final _Example example;

  const _ShaderWidget({required this.example});

  @override
  m.State<_ShaderWidget> createState() => _ShaderWidgetState();
}

class _ShaderWidgetState extends m.State<_ShaderWidget> {
  a.Timer? timer;
  ui.FragmentShader? shader;

  double elapsed = 0.0;
  double scale = 64.0;
  double brightness = 1.0;
  double x = 0.0;
  double y = 0.0;
  double z = 0.0;
  double w = 0.0;
  double u = 0.0;
  double v = 0.0;
  double px = 128.0;
  double py = 128.0;
  double pz = 1.0;
  double pw = 1.0;
  double dirX = 1.0;
  double dirY = 1.0;
  double steepness = 0.25;
  double wavelength = 16.0;
  double time = 0.0;
  double alpha = 0.0;
  double phase = 0.0;
  double k = 0.5;

  @override
  void initState() {
    super.initState();
    gn.load('lib/src/shaders/${widget.example.filename}').then(
      (shader) {
        setState(() {
          this.shader = shader;
        });
        timer = a.Timer.periodic(
          const Duration(microseconds: 33333),
          (timer) {
            elapsed = timer.tick / 30.0;
          },
        );
      },
    );
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
        ? m.Container(color: m.Colors.black)
        : m.LayoutBuilder(
            builder: (context, constraints) {
              final size = m.Size(constraints.maxWidth, constraints.maxHeight);
              final painter = widget.example.builder(
                shader: shader!,
                size: size,
                elapsed: elapsed,
                scale: scale,
                brightness: brightness,
                xy: vm.Vector2(x, y),
                xyz: vm.Vector3(x, y, z),
                xyzw: vm.Vector4(x, y, z, w),
                uv: vm.Vector2(u, v),
                dir: vm.Vector2(dirX, dirY),
                period: px,
                period2: vm.Vector2(px, py),
                period3: vm.Vector3(px, py, pz),
                period4: vm.Vector4(px, py, pz, pw),
                steepness: steepness,
                wavelength: wavelength,
                time: time,
                alpha: alpha,
                phase: phase,
                k: k,
              );
              // `switch` on the painter to determine which controls to display.
              final controls = switch (painter) {
                gn.GerstnerWave2Painter() => _NoisePainterControls(
                    size: size,
                    scale: scale,
                    brightness: brightness,
                    x: x,
                    y: y,
                    dirX: dirX,
                    dirY: dirY,
                    steepness: steepness,
                    wavelength: wavelength,
                    time: time,
                    onBrightnessChanged: (value) {
                      setState(() {
                        brightness = value;
                      });
                    },
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
                    onTimeChanged: (value) {
                      setState(() {
                        time = value;
                      });
                    },
                  ),
                gn.TilingSimplexFlow2Painter() => _NoisePainterControls(
                    size: size,
                    scale: scale,
                    brightness: brightness,
                    x: x,
                    y: y,
                    px: px,
                    py: py,
                    alpha: alpha,
                    onBrightnessChanged: (value) {
                      setState(() {
                        brightness = value;
                      });
                    },
                    onAlphaChanged: (value) {
                      setState(() {
                        alpha = value;
                      });
                    },
                  ),
                gn.TilingSimplexFlow3Painter() => _NoisePainterControls(
                    size: size,
                    scale: scale,
                    brightness: brightness,
                    x: x,
                    y: y,
                    z: z,
                    px: px,
                    py: py,
                    pz: pz,
                    alpha: alpha,
                    onBrightnessChanged: (value) {
                      setState(() {
                        brightness = value;
                      });
                    },
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
                  ),
                gn.VoronoiTime2Painter() => _NoisePainterControls(
                    size: size,
                    scale: scale,
                    brightness: brightness,
                    x: x,
                    y: y,
                    time: time,
                    onBrightnessChanged: (value) {
                      setState(() {
                        brightness = value;
                      });
                    },
                    onTimeChanged: (value) {
                      setState(() {
                        time = value;
                      });
                    },
                  ),
                gn.Voronoise2Painter() => _NoisePainterControls(
                    size: size,
                    scale: scale,
                    brightness: brightness,
                    x: x,
                    y: y,
                    u: u,
                    v: v,
                    onBrightnessChanged: (value) {
                      setState(() {
                        brightness = value;
                      });
                    },
                  ),
                gn.Voronoise3Painter() => _NoisePainterControls(
                    size: size,
                    scale: scale,
                    brightness: brightness,
                    x: x,
                    y: y,
                    z: z,
                    u: u,
                    v: v,
                    onBrightnessChanged: (value) {
                      setState(() {
                        brightness = value;
                      });
                    },
                    onZChanged: (value) {
                      setState(() {
                        z = value;
                      });
                    },
                  ),
                gn.Wavelet2Painter() => _NoisePainterControls(
                    size: size,
                    scale: scale,
                    brightness: brightness,
                    x: x,
                    y: y,
                    phase: phase,
                    k: k,
                    onBrightnessChanged: (value) {
                      setState(() {
                        brightness = value;
                      });
                    },
                  ),
                gn.PrimitivePeriodTiling2Painter() => _NoisePainterControls(
                    size: size,
                    scale: scale,
                    brightness: brightness,
                    x: x,
                    y: y,
                    px: px,
                    onBrightnessChanged: (value) {
                      setState(() {
                        brightness = value;
                      });
                    },
                  ),
                gn.PrimitivePeriodTiling3Painter() => _NoisePainterControls(
                    size: size,
                    scale: scale,
                    brightness: brightness,
                    x: x,
                    y: y,
                    z: z,
                    px: px,
                    onBrightnessChanged: (value) {
                      setState(() {
                        brightness = value;
                      });
                    },
                    onZChanged: (value) {
                      setState(() {
                        z = value;
                      });
                    },
                  ),
                gn.Tiling2Painter() => _NoisePainterControls(
                    size: size,
                    scale: scale,
                    brightness: brightness,
                    x: x,
                    y: y,
                    px: px,
                    py: py,
                    onBrightnessChanged: (value) {
                      setState(() {
                        brightness = value;
                      });
                    },
                  ),
                gn.Tiling3Painter() => _NoisePainterControls(
                    size: size,
                    scale: scale,
                    brightness: brightness,
                    x: x,
                    y: y,
                    z: z,
                    px: px,
                    py: py,
                    pz: pz,
                    onBrightnessChanged: (value) {
                      setState(() {
                        brightness = value;
                      });
                    },
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
                  ),
                gn.Tiling4Painter() => _NoisePainterControls(
                    size: size,
                    scale: scale,
                    brightness: brightness,
                    x: x,
                    y: y,
                    z: z,
                    w: w,
                    px: px,
                    py: py,
                    pz: pz,
                    pw: pw,
                    onBrightnessChanged: (value) {
                      setState(() {
                        brightness = value;
                      });
                    },
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
                  ),
                gn.Noise2Painter() => _NoisePainterControls(
                    size: size,
                    scale: scale,
                    brightness: brightness,
                    x: x,
                    y: y,
                    onBrightnessChanged: (value) {
                      setState(() {
                        brightness = value;
                      });
                    },
                  ),
                gn.Noise3Painter() => _NoisePainterControls(
                    size: size,
                    scale: scale,
                    brightness: brightness,
                    x: x,
                    y: y,
                    z: z,
                    onBrightnessChanged: (value) {
                      setState(() {
                        brightness = value;
                      });
                    },
                    onZChanged: (value) {
                      setState(() {
                        z = value;
                      });
                    },
                  ),
                gn.Noise4Painter() => _NoisePainterControls(
                    size: size,
                    scale: scale,
                    brightness: brightness,
                    x: x,
                    y: y,
                    z: z,
                    w: w,
                    onBrightnessChanged: (value) {
                      setState(() {
                        brightness = value;
                      });
                    },
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
                  ),
                gn.NoisePainter() => throw _UnreachableError(
                    'Error matching NoisePainter types to construct NoisePainterControls.',
                  ),
              };

              return m.Stack(
                children: [
                  m.Listener(
                    behavior: m.HitTestBehavior.opaque,
                    onPointerMove: (event) {
                      if (event.buttons == g.kPrimaryButton) {
                        // Left mouse drag
                        setState(() {
                          x -= event.delta.dx;
                          y -= event.delta.dy;
                        });
                      } else {
                        // Right mouse drag
                        setState(() {
                          px += event.delta.dx * 0.1;
                          py += event.delta.dy * 0.1;
                          dirX += event.delta.dx * 0.01;
                          dirY += event.delta.dy * 0.01;
                          u += event.delta.dx * 0.01;
                          v += event.delta.dy * 0.01;
                          phase += event.delta.dx * 0.1;
                          k += event.delta.dy * 0.001;
                        });
                      }
                    },
                    onPointerSignal: (event) {
                      if (event is g.PointerScrollEvent) {
                        // Scroll
                        if (event.scrollDelta.dy > 0) {
                          setState(() {
                            scale += 1.0;
                          });
                        } else {
                          setState(() {
                            scale -= 1.0;
                          });
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
                  m.SizedBox(
                    height: size.height * 0.95,
                    child: m.Column(
                      children: [
                        m.Center(
                            child: _Text(widget.example.title,
                                fontSize: 16.0, size: size)),
                        const m.Spacer(),
                        controls,
                      ],
                    ),
                  ),
                ],
              );
            },
          );
  }
}

/// Custom button widget for changing the displayed noise pattern.
class ChangePageButton extends m.StatelessWidget {
  final m.IconData icon;
  final void Function() onPressed;

  const ChangePageButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  m.Widget build(m.BuildContext context) {
    return m.IconButton(
      icon: m.Icon(icon),
      style: m.ButtonStyle(
        backgroundColor: m.WidgetStateProperty.all(color),
        elevation: m.WidgetStateProperty.all(3.0),
        shadowColor: m.WidgetStateProperty.all(outline),
      ),
      onPressed: onPressed,
    );
  }
}

/// Custom widget for displaying the gallery of noise patterns.
class _GpuNoiseGallery extends m.StatefulWidget {
  const _GpuNoiseGallery();

  @override
  m.State<_GpuNoiseGallery> createState() => _GpuNoiseGalleryState();
}

class _GpuNoiseGalleryState extends m.State<_GpuNoiseGallery>
    with m.TickerProviderStateMixin {
  static const inset = 16.0;

  final showDialog = m.ValueNotifier<bool>(false);

  late m.PageController _pageViewController;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageViewController = m.PageController();

    showDialog.addListener(() {
      if (showDialog.value) {
        m.Navigator.of(context).push(_dialogBuilder(context));
      }
    });

    Future.delayed(const Duration(milliseconds: 300), () {
      showDialog.value = true;
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageViewController.dispose();
  }

  static m.Route<Object?> _dialogBuilder(
    m.BuildContext context,
  ) {
    return m.DialogRoute<void>(
      context: context,
      builder: (m.BuildContext context) {
        return m.AlertDialog(
          title: const m.Text('Instructions'),
          content: const m.Text(
            'Click and drag to move the noise pattern.\n'
            'Some examples allow for right click and drag to change parameters.\n'
            'Scroll to zoom in and out.\n'
            'Click the arrows to change the noise pattern.',
          ),
          actions: [
            m.TextButton(
              onPressed: () {
                m.Navigator.of(context).pop();
              },
              child: const m.Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  m.Widget build(m.BuildContext context) {
    return m.MaterialApp(home: m.Scaffold(
      body: m.LayoutBuilder(
        builder: (context, constraints) {
          return m.Stack(
            children: [
              m.PageView(
                  controller: _pageViewController,
                  onPageChanged: _handlePageViewChanged,
                  children: examples.map((example) {
                    return _ShaderWidget(
                      example: example,
                    );
                  }).toList()),
              m.Positioned(
                bottom: inset,
                left: inset,
                child: ChangePageButton(
                  icon: m.Icons.arrow_left_rounded,
                  onPressed: () {
                    if (_currentPageIndex == 0) {
                      _pageViewController.jumpToPage(examples.length - 1);
                      return;
                    }
                    _pageViewController.animateToPage(
                      _currentPageIndex - 1,
                      duration: const Duration(milliseconds: 300),
                      curve: m.Curves.easeInOut,
                    );
                  },
                ),
              ),
              m.Positioned(
                bottom: inset,
                right: inset,
                child: ChangePageButton(
                  icon: m.Icons.arrow_right_rounded,
                  onPressed: () {
                    if (_currentPageIndex == examples.length - 1) {
                      _pageViewController.jumpToPage(0);
                      return;
                    }

                    _pageViewController.animateToPage(
                      _currentPageIndex + 1,
                      duration: const Duration(milliseconds: 300),
                      curve: m.Curves.easeInOut,
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    ));
  }

  void _handlePageViewChanged(int currentPageIndex) {
    if (!_isOnDesktopAndWeb) {
      return;
    }
    setState(() {
      _currentPageIndex = currentPageIndex;
    });
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
