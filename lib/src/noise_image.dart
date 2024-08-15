import 'dart:typed_data' as td;
import 'dart:ui' as ui;

import 'package:vector_math/vector_math.dart' as vm;

import 'noise_painter.dart' as np;

/// Loads a fragment shader from the specified asset path.
///
/// The [path] parameter is the path to the asset containing the fragment shader.
Future<ui.FragmentShader> load(String path) async =>
    (await ui.FragmentProgram.fromAsset(path)).fragmentShader();

/// Converts the noise painter to an image asynchronously.
///
/// The [painter] parameter is an instance of [np.NoisePainter] that defines how the noise is painted.
Future<ui.Image> toImage(np.NoisePainter painter) {
  final recorder = ui.PictureRecorder();
  final canvas = ui.Canvas(recorder, ui.Offset.zero & painter.size);
  painter.paint(canvas, painter.size);
  return recorder
      .endRecording()
      .toImage(painter.size.width.toInt(), painter.size.height.toInt());
}

/// Generates a cellular noise image.
Future<ui.Image> cellular2Image({
  required ui.Size size,
  required double scale,
  required double brightness,
  required vm.Vector2 xy,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/cellular2.frag');
  return toImage(
    np.Noise2Painter(
      shader: shader,
      size: size,
      elapsed: elapsed,
      xy: xy,
      scale: scale,
      brightness: brightness,
    ),
  );
}

/// Generates a 2D 2x2 cellular noise image.
Future<ui.Image> cellular2x2Image({
  required ui.Size size,
  required double scale,
  required double brightness,
  required vm.Vector2 xy,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/cellular2x2.frag');
  return toImage(
    np.Noise2Painter(
      shader: shader,
      size: size,
      elapsed: elapsed,
      xy: xy,
      scale: scale,
      brightness: brightness,
    ),
  );
}

/// Generates a 3D 2x2x2 cellular noise image.
Future<ui.Image> cellular2x2x2Image({
  required ui.Size size,
  required double scale,
  required double brightness,
  required vm.Vector3 xyz,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/cellular2x2x2.frag');
  return toImage(
    np.Noise3Painter(
      shader: shader,
      size: size,
      elapsed: elapsed,
      xyz: xyz,
      scale: scale,
      brightness: brightness,
    ),
  );
}

/// Generates a 3-dimensional cellular noise image.
Future<ui.Image> cellular3Image({
  required ui.Size size,
  required double scale,
  required double brightness,
  required vm.Vector3 xyz,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/cellular3.frag');
  return toImage(
    np.Noise3Painter(
      shader: shader,
      size: size,
      elapsed: elapsed,
      xyz: xyz,
      scale: scale,
      brightness: brightness,
    ),
  );
}

/// Generates an image using the curl noise algorithm.
Future<ui.Image> curl2Image({
  required ui.Size size,
  required double scale,
  required double brightness,
  required vm.Vector2 xy,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/curl2.frag');
  return toImage(
    np.Noise2Painter(
      shader: shader,
      size: size,
      elapsed: elapsed,
      xy: xy,
      scale: scale,
      brightness: brightness,
    ),
  );
}

/// Generates a 3D curl noise image.
Future<ui.Image> curl3Image({
  required ui.Size size,
  required double scale,
  required double brightness,
  required vm.Vector3 xyz,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/curl3.frag');
  return toImage(
    np.Noise3Painter(
      shader: shader,
      size: size,
      elapsed: elapsed,
      xyz: xyz,
      scale: scale,
      brightness: brightness,
    ),
  );
}

/// Generates a 4D curl noise image.
Future<ui.Image> curl4Image({
  required ui.Size size,
  required double scale,
  required double brightness,
  required vm.Vector4 xyzw,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/curl4.frag');
  return toImage(
    np.Noise4Painter(
      shader: shader,
      size: size,
      elapsed: elapsed,
      xyzw: xyzw,
      scale: scale,
      brightness: brightness,
    ),
  );
}

/// Generates a 2D fractal brownian motion (FBM) image.
Future<ui.Image> fbm2Image({
  required ui.Size size,
  required double scale,
  required double brightness,
  required vm.Vector2 xy,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/fbm2.frag');
  return toImage(
    np.Noise2Painter(
      shader: shader,
      size: size,
      elapsed: elapsed,
      xy: xy,
      scale: scale,
      brightness: brightness,
    ),
  );
}

/// Generates a 3D fractal Brownian motion (FBM) image.
Future<ui.Image> fbm3Image({
  required ui.Size size,
  required double scale,
  required double brightness,
  required vm.Vector3 xyz,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/fbm3.frag');
  return toImage(
    np.Noise3Painter(
      shader: shader,
      size: size,
      elapsed: elapsed,
      xyz: xyz,
      scale: scale,
      brightness: brightness,
    ),
  );
}

/// Generates a 2D Gerstner wave image.
///
/// The was has [dir] direction with the specified [steepness], [wavelength],
/// and [time].
Future<ui.Image> gerstnerWaveImage({
  required ui.Size size,
  required double scale,
  required double brightness,
  required vm.Vector2 xy,
  required vm.Vector2 dir,
  required double steepness,
  required double wavelength,
  required double time,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/gerstner_wave.frag');
  return toImage(
    np.GerstnerWave2Painter(
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

/// Generates a 2D gradient image.
Future<ui.Image> gradient2Image({
  required ui.Size size,
  required double scale,
  required double brightness,
  required vm.Vector2 xy,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/gradient2.frag');
  return toImage(
    np.Noise2Painter(
      shader: shader,
      size: size,
      elapsed: elapsed,
      xy: xy,
      scale: scale,
      brightness: brightness,
    ),
  );
}

/// Generates 3D gradient noise image.
Future<ui.Image> gradient3Image({
  required ui.Size size,
  required double scale,
  required double brightness,
  required vm.Vector3 xyz,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/gradient3.frag');
  return toImage(
    np.Noise3Painter(
      shader: shader,
      size: size,
      elapsed: elapsed,
      xyz: xyz,
      scale: scale,
      brightness: brightness,
    ),
  );
}

/// Generates a 2D Perlin noise image.
Future<ui.Image> perlin2Image({
  required ui.Size size,
  required double scale,
  required double brightness,
  required vm.Vector2 xy,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/perlin2.frag');
  return toImage(
    np.Noise2Painter(
      shader: shader,
      size: size,
      elapsed: elapsed,
      xy: xy,
      scale: scale,
      brightness: brightness,
    ),
  );
}

/// Generates a 3D Perlin noise image.
Future<ui.Image> perlin3Image({
  required ui.Size size,
  required double scale,
  required double brightness,
  required vm.Vector3 xyz,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/perlin3.frag');
  return toImage(
    np.Noise3Painter(
      shader: shader,
      size: size,
      elapsed: elapsed,
      xyz: xyz,
      scale: scale,
      brightness: brightness,
    ),
  );
}

/// Generates a 4D Perlin noise image.
Future<ui.Image> perlin4Image({
  required ui.Size size,
  required double scale,
  required double brightness,
  required vm.Vector4 xyzw,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/perlin4.frag');
  return toImage(
    np.Noise4Painter(
      shader: shader,
      size: size,
      elapsed: elapsed,
      xyzw: xyzw,
      scale: scale,
      brightness: brightness,
    ),
  );
}

/// Generates a 2D tiling Simplex flow noise image.
Future<ui.Image> psrd2Image({
  required ui.Size size,
  required double scale,
  required double brightness,
  required vm.Vector2 xy,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/psrd2.frag');
  return toImage(
    np.Noise2Painter(
      shader: shader,
      size: size,
      elapsed: elapsed,
      xy: xy,
      scale: scale,
      brightness: brightness,
    ),
  );
}

/// Generates a 3D tiling Simplex flow noise image.
Future<ui.Image> psrd3Image({
  required ui.Size size,
  required double scale,
  required double brightness,
  required vm.Vector3 xyz,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/psrd3.frag');
  return toImage(
    np.Noise3Painter(
      shader: shader,
      size: size,
      elapsed: elapsed,
      xyz: xyz,
      scale: scale,
      brightness: brightness,
    ),
  );
}

/// Generates a 2D random noise image.
Future<ui.Image> random2Image({
  required ui.Size size,
  required double scale,
  required double brightness,
  required vm.Vector2 xy,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/random2.frag');
  return toImage(
    np.Noise2Painter(
      shader: shader,
      size: size,
      elapsed: elapsed,
      xy: xy,
      scale: scale,
      brightness: brightness,
    ),
  );
}

/// Generates a 3D random noise image.
Future<ui.Image> random3Image({
  required ui.Size size,
  required double scale,
  required double brightness,
  required vm.Vector3 xyz,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/random3.frag');
  return toImage(
    np.Noise3Painter(
      shader: shader,
      size: size,
      elapsed: elapsed,
      xyz: xyz,
      scale: scale,
      brightness: brightness,
    ),
  );
}

/// Generates a 4D random noise image.
Future<ui.Image> random4Image({
  required ui.Size size,
  required double scale,
  required double brightness,
  required vm.Vector4 xyzw,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/random4.frag');
  return toImage(
    np.Noise4Painter(
      shader: shader,
      size: size,
      elapsed: elapsed,
      xyzw: xyzw,
      scale: scale,
      brightness: brightness,
    ),
  );
}

/// Generates a 2D signed random noise image.
Future<ui.Image> signedRandom2Image({
  required ui.Size size,
  required double scale,
  required double brightness,
  required vm.Vector2 xy,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/signed_random2.frag');
  return toImage(
    np.Noise2Painter(
      shader: shader,
      size: size,
      elapsed: elapsed,
      xy: xy,
      scale: scale,
      brightness: brightness,
    ),
  );
}

/// Generates a 3D signed random noise image.
Future<ui.Image> signedRandom3Image({
  required ui.Size size,
  required double scale,
  required double brightness,
  required vm.Vector3 xyz,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/signed_random3.frag');
  return toImage(
    np.Noise3Painter(
      shader: shader,
      size: size,
      elapsed: elapsed,
      xyz: xyz,
      scale: scale,
      brightness: brightness,
    ),
  );
}

/// Generates a 4D signed random noise image.
Future<ui.Image> signedRandom4Image({
  required ui.Size size,
  required double scale,
  required double brightness,
  required vm.Vector4 xyzw,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/signed_random4.frag');
  return toImage(
    np.Noise4Painter(
      shader: shader,
      size: size,
      elapsed: elapsed,
      xyzw: xyzw,
      scale: scale,
      brightness: brightness,
    ),
  );
}

/// Generates a 2D simplex noise image.
Future<ui.Image> simplex2Image({
  required ui.Size size,
  required double scale,
  required double brightness,
  required vm.Vector2 xy,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/simplex2.frag');
  return toImage(
    np.Noise2Painter(
      shader: shader,
      size: size,
      elapsed: elapsed,
      xy: xy,
      scale: scale,
      brightness: brightness,
    ),
  );
}

/// Generates a 3D simplex noise image.
Future<ui.Image> simplex3Image({
  required ui.Size size,
  required double scale,
  required double brightness,
  required vm.Vector3 xyz,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/simplex3.frag');
  return toImage(
    np.Noise3Painter(
      shader: shader,
      size: size,
      elapsed: elapsed,
      xyz: xyz,
      scale: scale,
      brightness: brightness,
    ),
  );
}

/// Generates a 4D simplex noise image.
Future<ui.Image> simplex4Image({
  required ui.Size size,
  required double scale,
  required double brightness,
  required vm.Vector4 xyzw,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/simplex4.frag');
  return toImage(
    np.Noise4Painter(
      shader: shader,
      size: size,
      elapsed: elapsed,
      xyzw: xyzw,
      scale: scale,
      brightness: brightness,
    ),
  );
}

/// Generates a 2D tiling FBM noise image.
///
/// This image parameterized by a [period].
Future<ui.Image> tilingFbm3Image({
  required ui.Size size,
  required double scale,
  required double brightness,
  required vm.Vector3 xyz,
  required double period,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/tiling_fbm3.frag');
  return toImage(
    np.PrimitivePeriodTiling3Painter(
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

/// Generates a 3D tiling gradient noise image.
///
/// This image parameterized by a [period].
Future<ui.Image> tilingGradient3Image({
  required ui.Size size,
  required double scale,
  required double brightness,
  required vm.Vector3 xyz,
  required double period,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/tiling_gradient3.frag');
  return toImage(
    np.PrimitivePeriodTiling3Painter(
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

/// Generates a 2D tiling Perlin noise image.
///
/// This image parameterized by a [period].
Future<ui.Image> tilingPerlin2Image({
  required ui.Size size,
  required double scale,
  required double brightness,
  required vm.Vector2 xy,
  required vm.Vector2 period,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/tiling_perlin2.frag');
  return toImage(
    np.Tiling2Painter(
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

/// Generates a 3D tiling Perlin noise image.
///
/// This image parameterized by a [period].
Future<ui.Image> tilingPerlin3Image({
  required ui.Size size,
  required double scale,
  required double brightness,
  required vm.Vector3 xyz,
  required vm.Vector3 period,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/tiling_perlin3.frag');
  return toImage(
    np.Tiling3Painter(
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

/// Generates a 4D tiling Perlin noise image.
///
/// This image parameterized by a [period].
Future<ui.Image> tilingPerlin4Image({
  required ui.Size size,
  required double scale,
  required double brightness,
  required vm.Vector4 xyzw,
  required vm.Vector4 period,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/tiling_perlin4.frag');
  return toImage(
    np.Tiling4Painter(
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

/// Generates a 2D tiling signed random noise image.
///
/// This image parameterized by a [period].
Future<ui.Image> tilingSignedRandom2Image({
  required ui.Size size,
  required double scale,
  required double brightness,
  required vm.Vector2 xy,
  required double period,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/tiling_signed_random2.frag');
  return toImage(
    np.PrimitivePeriodTiling2Painter(
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

/// Generates a 3D tiling signed random noise image.
///
/// This image parameterized by a [period].
Future<ui.Image> tilingSignedRandom3Image({
  required ui.Size size,
  required double scale,
  required double brightness,
  required vm.Vector3 xyz,
  required double period,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/tiling_signed_random3.frag');
  return toImage(
    np.PrimitivePeriodTiling3Painter(
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

/// Generates a 2D tiling Simplex noise image.
///
/// This image parameterized by a [period].
Future<ui.Image> tilingSimplex2Image({
  required ui.Size size,
  required double scale,
  required double brightness,
  required vm.Vector2 xy,
  required vm.Vector2 period,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/tiling_simplex2.frag');
  return toImage(
    np.Tiling2Painter(
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

/// Generates a 3D tiling Simplex noise image.
///
/// This image parameterized by a [period].
Future<ui.Image> tilingSimplex3Image({
  required ui.Size size,
  required double scale,
  required double brightness,
  required vm.Vector3 xyz,
  required vm.Vector3 period,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/tiling_simplex3.frag');
  return toImage(
    np.Tiling3Painter(
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

/// Generates a 2D tiling Simplex flow noise image.
///
/// This image parameterized by a [period] and an [alpha] angle specified in
/// radians.
Future<ui.Image> tilingSimplexFlow2Image({
  required ui.Size size,
  required double scale,
  required double brightness,
  required vm.Vector2 xy,
  required vm.Vector2 period,
  required double alpha,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/tiling_simplex_flow2.frag');
  return toImage(
    np.TilingSimplexFlow2Painter(
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

/// Generates a 3D tiling Simplex flow noise image.
///
/// This image parameterized by a [period] and an [alpha] angle specified
/// in radians.
Future<ui.Image> tilingSimplexFlow3Image({
  required ui.Size size,
  required double scale,
  required double brightness,
  required vm.Vector3 xyz,
  required vm.Vector3 period,
  required double alpha,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/tiling_simplex_flow3.frag');
  return toImage(
    np.TilingSimplexFlow3Painter(
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

/// Generates a 2D Voronoi noise image.
Future<ui.Image> voronoi2Image({
  required ui.Size size,
  required double scale,
  required double brightness,
  required vm.Vector2 xy,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/voronoi2.frag');
  return toImage(
    np.Noise2Painter(
      shader: shader,
      size: size,
      elapsed: elapsed,
      xy: xy,
      scale: scale,
      brightness: brightness,
    ),
  );
}

/// Generates a 3D Voronoi noise image.
Future<ui.Image> voronoi3Image({
  required ui.Size size,
  required double scale,
  required double brightness,
  required vm.Vector3 xyz,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/voronoi3.frag');
  return toImage(
    np.Noise3Painter(
      shader: shader,
      size: size,
      elapsed: elapsed,
      xyz: xyz,
      scale: scale,
      brightness: brightness,
    ),
  );
}

/// Generates a 2D Voronoi noise image parameterized by [time].
Future<ui.Image> voronoiTime2Image({
  required ui.Size size,
  required double scale,
  required double brightness,
  required vm.Vector2 xy,
  required double time,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/voronoi_time2.frag');
  return toImage(
    np.VoronoiTime2Painter(
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

/// Generates a 2D Voronoi noise image.
Future<ui.Image> voronoise2Image({
  required ui.Size size,
  required double scale,
  required double brightness,
  required vm.Vector2 xy,
  required vm.Vector2 uv,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/voronoise2.frag');
  return toImage(
    np.Voronoise2Painter(
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

/// Generates a 3D Voronoi noise image.
Future<ui.Image> voronoise3Image({
  required ui.Size size,
  required double scale,
  required double brightness,
  required vm.Vector3 xyz,
  required vm.Vector2 uv,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/voronoise3.frag');
  return toImage(
    np.Voronoise3Painter(
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

/// Generates a 2D wavelet noise image.
///
/// This image is parameterized by a [phase] and a [k] value.
Future<ui.Image> wavelet2Image({
  required ui.Size size,
  required double scale,
  required double brightness,
  required vm.Vector2 xy,
  required double phase,
  required double k,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/wavelet2.frag');
  return toImage(
    np.Wavelet2Painter(
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

/// Generates a 3D wavelet noise image.
Future<ui.Image> worley2Image({
  required ui.Size size,
  required double scale,
  required double brightness,
  required vm.Vector2 xy,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/worley2.frag');
  return toImage(
    np.Noise2Painter(
      shader: shader,
      size: size,
      elapsed: elapsed,
      xy: xy,
      scale: scale,
      brightness: brightness,
    ),
  );
}

/// Generates a 3D Worley noise image.
Future<ui.Image> worley3Image({
  required ui.Size size,
  required double scale,
  required double brightness,
  required vm.Vector3 xyz,
  double elapsed = 0.0,
}) async {
  final shader = await load('lib/src/shaders/worley3.frag');
  return toImage(
    np.Noise3Painter(
      shader: shader,
      size: size,
      elapsed: elapsed,
      xyz: xyz,
      scale: scale,
      brightness: brightness,
    ),
  );
}

/// Exception thrown when an image cannot be decoded by [NoiseBytes].
class ImageDecodeException implements Exception {
  final String message;

  ImageDecodeException(this.message);

  @override
  String toString() => 'ImageDecodeException: $message';
}

/// A class that provides access to the bytes of an image.
///
/// This class is used to access the bytes of an image asynchronously. The bytes
/// are accessed using the [byte] method. The [loaded] future is used to
/// determine when the bytes are ready to be accessed.
class NoiseBytes {
  /// The number of channels in the image.
  static const int channels = 4;

  final ui.Image _image;
  late final Future<void> loaded;
  late final td.ByteData? _bytes;

  NoiseBytes({required ui.Image image}) : _image = image {
    loaded = load();
  }

  /// Populates the [_bytes] field with the bytes of the image.
  Future<void> load() async {
    _bytes = await _image.toByteData();
    if (_bytes == null) {
      throw ImageDecodeException('Image().toByteData() returned null.');
    }
  }

  /// Returns the int at `r` channel position for they byte at [x], [y].
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
