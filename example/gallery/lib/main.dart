import 'dart:math' as math;
import 'dart:async' as a;
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart' as f;
import 'package:flutter/gestures.dart' as g;
import 'package:flutter/material.dart' as m;

import 'package:vector_math/vector_math.dart' as vm;

import 'package:gpu_noise/gpu_noise.dart' as gn;

typedef PainterBuilder = gn.NoisePainter Function({
  required m.Listenable repaint,
  required ui.FragmentShader shader,
  required m.Size size,
  required double time,
  required vm.Vector2 xy,
  required vm.Vector3 xyz,
  required vm.Vector4 xyzw,
  required vm.Vector2 period2,
  required vm.Vector3 period3,
  required vm.Vector4 period4,
  required double alpha,
  required double scale,
  required double dilation,
});

gn.Cellular2Painter cellular2painter({
  required m.Listenable repaint,
  required ui.FragmentShader shader,
  required m.Size size,
  required double time,
  required vm.Vector2 xy,
  required vm.Vector3 xyz,
  required vm.Vector4 xyzw,
  required vm.Vector2 period2,
  required vm.Vector3 period3,
  required vm.Vector4 period4,
  required double alpha,
  required double scale,
  required double dilation,
}) =>
    gn.Cellular2Painter(
      repaint: repaint,
      shader: shader,
      size: size,
      time: time,
      xy: xy,
      scale: scale,
      dilation: dilation,
    );

gn.Cellular3Painter cellular3painter({
  required m.Listenable repaint,
  required ui.FragmentShader shader,
  required m.Size size,
  required double time,
  required vm.Vector2 xy,
  required vm.Vector3 xyz,
  required vm.Vector4 xyzw,
  required vm.Vector2 period2,
  required vm.Vector3 period3,
  required vm.Vector4 period4,
  required double alpha,
  required double scale,
  required double dilation,
}) =>
    gn.Cellular3Painter(
      repaint: repaint,
      shader: shader,
      size: size,
      time: time,
      xyz: xyz,
      scale: scale,
      dilation: dilation,
    );

gn.Perlin2Painter perlin2painter({
  required m.Listenable repaint,
  required ui.FragmentShader shader,
  required m.Size size,
  required double time,
  required vm.Vector2 xy,
  required vm.Vector3 xyz,
  required vm.Vector4 xyzw,
  required vm.Vector2 period2,
  required vm.Vector3 period3,
  required vm.Vector4 period4,
  required double alpha,
  required double scale,
  required double dilation,
}) =>
    gn.Perlin2Painter(
      repaint: repaint,
      shader: shader,
      size: size,
      time: time,
      xy: xy,
      scale: scale,
      dilation: dilation,
    );

gn.Perlin3Painter perlin3painter({
  required m.Listenable repaint,
  required ui.FragmentShader shader,
  required m.Size size,
  required double time,
  required vm.Vector2 xy,
  required vm.Vector3 xyz,
  required vm.Vector4 xyzw,
  required vm.Vector2 period2,
  required vm.Vector3 period3,
  required vm.Vector4 period4,
  required double alpha,
  required double scale,
  required double dilation,
}) =>
    gn.Perlin3Painter(
      repaint: repaint,
      shader: shader,
      size: size,
      time: time,
      xyz: xyz,
      scale: scale,
      dilation: dilation,
    );

gn.Perlin4Painter perlin4painter({
  required m.Listenable repaint,
  required ui.FragmentShader shader,
  required m.Size size,
  required double time,
  required vm.Vector2 xy,
  required vm.Vector3 xyz,
  required vm.Vector4 xyzw,
  required vm.Vector2 period2,
  required vm.Vector3 period3,
  required vm.Vector4 period4,
  required double alpha,
  required double scale,
  required double dilation,
}) =>
    gn.Perlin4Painter(
      repaint: repaint,
      shader: shader,
      size: size,
      time: time,
      xyzw: xyzw,
      scale: scale,
      dilation: dilation,
    );

gn.Simplex2Painter simplex2painter({
  required m.Listenable repaint,
  required ui.FragmentShader shader,
  required m.Size size,
  required double time,
  required vm.Vector2 xy,
  required vm.Vector3 xyz,
  required vm.Vector4 xyzw,
  required vm.Vector2 period2,
  required vm.Vector3 period3,
  required vm.Vector4 period4,
  required double alpha,
  required double scale,
  required double dilation,
}) =>
    gn.Simplex2Painter(
      repaint: repaint,
      shader: shader,
      size: size,
      time: time,
      xy: xy,
      scale: scale,
      dilation: dilation,
    );

gn.Simplex3Painter simplex3painter({
  required m.Listenable repaint,
  required ui.FragmentShader shader,
  required m.Size size,
  required double time,
  required vm.Vector2 xy,
  required vm.Vector3 xyz,
  required vm.Vector4 xyzw,
  required vm.Vector2 period2,
  required vm.Vector3 period3,
  required vm.Vector4 period4,
  required double alpha,
  required double scale,
  required double dilation,
}) =>
    gn.Simplex3Painter(
      repaint: repaint,
      shader: shader,
      size: size,
      time: time,
      xyz: xyz,
      scale: scale,
      dilation: dilation,
    );

gn.Simplex4Painter simplex4painter({
  required m.Listenable repaint,
  required ui.FragmentShader shader,
  required m.Size size,
  required double time,
  required vm.Vector2 xy,
  required vm.Vector3 xyz,
  required vm.Vector4 xyzw,
  required vm.Vector2 period2,
  required vm.Vector3 period3,
  required vm.Vector4 period4,
  required double alpha,
  required double scale,
  required double dilation,
}) =>
    gn.Simplex4Painter(
      repaint: repaint,
      shader: shader,
      size: size,
      time: time,
      xyzw: xyzw,
      scale: scale,
      dilation: dilation,
    );

gn.TilingPerlin2Painter tilingPerlin2painter({
  required m.Listenable repaint,
  required ui.FragmentShader shader,
  required m.Size size,
  required double time,
  required vm.Vector2 xy,
  required vm.Vector3 xyz,
  required vm.Vector4 xyzw,
  required vm.Vector2 period2,
  required vm.Vector3 period3,
  required vm.Vector4 period4,
  required double alpha,
  required double scale,
  required double dilation,
}) =>
    gn.TilingPerlin2Painter(
      repaint: repaint,
      shader: shader,
      size: size,
      time: time,
      xy: xy,
      period: period2,
      scale: scale,
      dilation: dilation,
    );

gn.TilingPerlin3Painter tilingPerlin3painter({
  required m.Listenable repaint,
  required ui.FragmentShader shader,
  required m.Size size,
  required double time,
  required vm.Vector2 xy,
  required vm.Vector3 xyz,
  required vm.Vector4 xyzw,
  required vm.Vector2 period2,
  required vm.Vector3 period3,
  required vm.Vector4 period4,
  required double alpha,
  required double scale,
  required double dilation,
}) =>
    gn.TilingPerlin3Painter(
      repaint: repaint,
      shader: shader,
      size: size,
      time: time,
      xyz: xyz,
      period: period3,
      scale: scale,
      dilation: dilation,
    );

gn.TilingPerlin4Painter tilingPerlin4painter({
  required m.Listenable repaint,
  required ui.FragmentShader shader,
  required m.Size size,
  required double time,
  required vm.Vector2 xy,
  required vm.Vector3 xyz,
  required vm.Vector4 xyzw,
  required vm.Vector2 period2,
  required vm.Vector3 period3,
  required vm.Vector4 period4,
  required double alpha,
  required double scale,
  required double dilation,
}) =>
    gn.TilingPerlin4Painter(
      repaint: repaint,
      shader: shader,
      size: size,
      time: time,
      xyzw: xyzw,
      period: period4,
      scale: scale,
      dilation: dilation,
    );

gn.TilingSimplex2Painter tilingSimplex2painter({
  required m.Listenable repaint,
  required ui.FragmentShader shader,
  required m.Size size,
  required double time,
  required vm.Vector2 xy,
  required vm.Vector3 xyz,
  required vm.Vector4 xyzw,
  required vm.Vector2 period2,
  required vm.Vector3 period3,
  required vm.Vector4 period4,
  required double alpha,
  required double scale,
  required double dilation,
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
      dilation: dilation,
    );

gn.TilingSimplex3Painter tilingSimplex3painter({
  required m.Listenable repaint,
  required ui.FragmentShader shader,
  required m.Size size,
  required double time,
  required vm.Vector2 xy,
  required vm.Vector3 xyz,
  required vm.Vector4 xyzw,
  required vm.Vector2 period2,
  required vm.Vector3 period3,
  required vm.Vector4 period4,
  required double alpha,
  required double scale,
  required double dilation,
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
      dilation: dilation,
    );

class _Example {
  final String title;
  final String path;
  final PainterBuilder builder;

  const _Example({
    required this.title,
    required this.path,
    required this.builder,
  });
}

const examples = [
  _Example(
    title: 'Cellular2F1',
    path: 'cellular2F1.frag',
    builder: cellular2painter,
  ),
  _Example(
    title: 'Cellular2F2',
    path: 'cellular2F2.frag',
    builder: cellular2painter,
  ),
  _Example(
    title: 'Cellular2x2F1',
    path: 'cellular2x2F1.frag',
    builder: cellular2painter,
  ),
  _Example(
    title: 'Cellular2x2F2',
    path: 'cellular2x2F2.frag',
    builder: cellular2painter,
  ),
  _Example(
    title: 'Cellular2x2x2F1',
    path: 'cellular2x2x2F1.frag',
    builder: cellular3painter,
  ),
  _Example(
    title: 'Cellular2x2x2F2',
    path: 'cellular2x2x2F2.frag',
    builder: cellular3painter,
  ),
  _Example(
    title: 'Cellular3F1',
    path: 'cellular3F1.frag',
    builder: cellular3painter,
  ),
  _Example(
    title: 'Cellular3F2',
    path: 'cellular3F2.frag',
    builder: cellular3painter,
  ),
  _Example(
    title: 'Perlin2',
    path: 'perlin2.frag',
    builder: perlin2painter,
  ),
  _Example(
    title: 'Perlin3',
    path: 'perlin3.frag',
    builder: perlin3painter,
  ),
  _Example(
    title: 'Perlin4',
    path: 'perlin4.frag',
    builder: perlin4painter,
  ),
  _Example(
    title: 'Simplex2',
    path: 'simplex2.frag',
    builder: simplex2painter,
  ),
  _Example(
    title: 'Simplex3',
    path: 'simplex3.frag',
    builder: simplex3painter,
  ),
  _Example(
    title: 'Simplex4',
    path: 'simplex4.frag',
    builder: simplex4painter,
  ),
  _Example(
    title: 'TilingPerlin2',
    path: 'tiling_perlin2.frag',
    builder: tilingPerlin2painter,
  ),
  _Example(
    title: 'TilingPerlin3',
    path: 'tiling_perlin3.frag',
    builder: tilingPerlin3painter,
  ),
  _Example(
    title: 'TilingPerlin4',
    path: 'tiling_perlin4.frag',
    builder: tilingPerlin4painter,
  ),
  _Example(
    title: 'TilingSimplex2',
    path: 'tiling_simplex2.frag',
    builder: tilingSimplex2painter,
  ),
  _Example(
    title: 'TilingSimplex3',
    path: 'tiling_simplex3.frag',
    builder: tilingSimplex3painter,
  ),
];

const color = m.Colors.cyan;
const outline = m.Colors.red;

List<m.Shadow> shadows() => List.generate(
      4,
      (_) => const m.Shadow(
        color: outline,
        blurRadius: 2.0,
      ),
    );

class _ShaderWidget extends m.StatefulWidget {
  final _Example example;

  const _ShaderWidget({super.key, required this.example});

  @override
  m.State<_ShaderWidget> createState() => _ShaderWidgetState();
}

class Text extends m.StatelessWidget {
  final String text;
  final double fontSize;

  const Text(this.text, {super.key, this.fontSize = 16.0});

  @override
  m.Widget build(m.BuildContext context) => m.Stack(
        children: [
          m.Text(
            text,
            style: m.TextStyle(
              fontSize: fontSize,
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

class _ShaderWidgetState extends m.State<_ShaderWidget> {
  late final a.Timer timer;

  ui.FragmentShader? shader;
  m.ValueNotifier<double> delta = m.ValueNotifier(0.0);

  double x = 0.0;
  double y = 0.0;
  double z = 0.0;
  double w = 0.0;
  double px = 0.0;
  double py = 0.0;
  double pz = 0.0;
  double pw = 0.0;
  double alpha = 0.0;
  double scale = 32.0;
  double dilation = 16.0;

  Future<void> load(String path) async {
    final program = await ui.FragmentProgram.fromAsset(path);
    setState(() {
      shader = program.fragmentShader();
    });

    timer = a.Timer.periodic(const Duration(microseconds: 33333), (_) {
      delta.value += 0.03333333333333333;
    });
  }

  @override
  void initState() {
    super.initState();
    load('../../lib/src/shaders/${widget.example.path}');
  }

  @override
  void dispose() {
    timer.cancel();
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
                      } else {
                        setState(() {
                          px += event.delta.dx * 0.001;
                          py += event.delta.dy * 0.001;
                        });
                      }
                    },
                    onPointerSignal: (event) {
                      if (event is g.PointerScrollEvent) {
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
                        painter: widget.example.builder(
                          repaint: delta,
                          shader: shader!,
                          size: size,
                          time: delta.value,
                          xy: vm.Vector2(x, y),
                          xyz: vm.Vector3(x, y, z),
                          xyzw: vm.Vector4(x, y, z, w),
                          period2: vm.Vector2(px, py),
                          period3: vm.Vector3(px, py, pz),
                          period4: vm.Vector4(px, py, pz, pw),
                          alpha: alpha,
                          scale: scale,
                          dilation: dilation,
                        ),
                        child: const m.SizedBox.expand(),
                      ),
                    ),
                  ),
                  m.Column(
                    children: [
                      m.Center(child: Text(widget.example.title)),
                      const m.Spacer(),
                      m.Row(
                        children: [
                          m.Expanded(
                            child: m.Column(
                              children: [
                                Slider(
                                    label: 'Z',
                                    value: z,
                                    max: 0.25,
                                    onChanged: (value) {
                                      setState(() {
                                        z = value;
                                      });
                                    }),
                                Slider(
                                    label: 'W',
                                    value: w,
                                    max: 0.25,
                                    onChanged: (value) {
                                      setState(() {
                                        w = value;
                                      });
                                    }),
                                Slider(
                                    label: 'PZ',
                                    value: pz,
                                    max: 1.0,
                                    onChanged: (value) {
                                      setState(() {
                                        pz = value;
                                      });
                                    }),
                                Slider(
                                    label: 'PW',
                                    value: pw,
                                    max: 1.0,
                                    onChanged: (value) {
                                      setState(() {
                                        pw = value;
                                      });
                                    }),
                                Slider(
                                    label: 'Dilation',
                                    value: dilation,
                                    max: 32.0,
                                    onChanged: (value) {
                                      setState(() {
                                        dilation = value;
                                      });
                                    }),
                                Slider(
                                    label: 'Alpha',
                                    value: alpha,
                                    max: 2.0 * math.pi,
                                    onChanged: (value) {
                                      setState(() {
                                        alpha = value;
                                      });
                                    }),
                              ],
                            ),
                          ),
                          m.SizedBox(
                            width: size.width * 0.3,
                            height: size.height * 0.3,
                            child: m.Padding(
                              padding: const m.EdgeInsets.fromLTRB(
                                0.0,
                                0.0,
                                24.0,
                                0.0,
                              ),
                              child: m.Row(
                                mainAxisAlignment:
                                    m.MainAxisAlignment.spaceBetween,
                                children: [
                                  m.Column(
                                    mainAxisAlignment:
                                        m.MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        m.CrossAxisAlignment.start,
                                    children: [
                                      Text('X: ${x.toStringAsFixed(2)}'),
                                      Text('PX: ${px.toStringAsFixed(2)}'),
                                      Text(
                                          'Alpha: ${alpha.toStringAsFixed(2)}'),
                                    ],
                                  ),
                                  m.Column(
                                    mainAxisAlignment:
                                        m.MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        m.CrossAxisAlignment.start,
                                    children: [
                                      Text('Y: ${y.toStringAsFixed(2)}'),
                                      Text('PY: ${py.toStringAsFixed(2)}'),
                                      Text(
                                          'Scale: ${scale.toStringAsFixed(2)}'),
                                    ],
                                  ),
                                  m.Column(
                                    mainAxisAlignment:
                                        m.MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        m.CrossAxisAlignment.start,
                                    children: [
                                      Text('Z: ${z.toStringAsFixed(2)}'),
                                      Text('PZ: ${pz.toStringAsFixed(2)}'),
                                      Text(
                                          'Dilation: ${dilation.toStringAsFixed(2)}'),
                                    ],
                                  ),
                                  m.Column(
                                    mainAxisAlignment:
                                        m.MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        m.CrossAxisAlignment.start,
                                    children: [
                                      Text('W: ${w.toStringAsFixed(2)}'),
                                      const Text(''),
                                      const Text(''),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
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
