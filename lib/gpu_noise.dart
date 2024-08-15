/// This library provides GPU-based noise generation functions with
/// corresponding CustomPainters and a NoiseBytes accessing noise values on the
/// CPU.
///
/// The primary components of this library include:
///
/// 1. **GPU Noise Generation Functions**:
///    - These functions utilize GPU shaders to generate noise patterns. By
///      offloading the computationally intensive task of noise generation to
///      the GPU.
///
/// 2. **CustomPainters**:
///    - The library includes CustomPainters that can be used to render the
///      generated noise directly onto the screen.
///
/// 3. **NoiseBytes**:
///    - This component allows for accessing the generated noise values on the
///      CPU. While the primary noise generation happens on the GPU, there are
///      scenarios where you might need to access these values on the CPU for
///      further processing or analysis. NoiseBytes provides a convenient
///      interface for this purpose.
///
/// The noise shaders utilized in this library are sourced from the
/// [lygia](https://github.com/patriciogonzalezvivo/lygia) project.
///
/// Additionally, the `example/gallery` directory provides a simple interface
/// for viewing the noise functions and adjusting their parameters. This example
/// gallery serves as both a demonstration of the library's capabilities and a
/// useful tool for developers to experiment with different noise parameters and
/// see the results in real-time.
library gpu_noise;

export 'src/noise_painter.dart';
export 'src/noise_image.dart';
