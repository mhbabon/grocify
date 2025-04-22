import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:grocify/common/widgets/custom_shapes/curved_edges/curved_edgs.dart';

void main() {
  group('TCustomCurvedEdges', () {
    test('should return a non-empty Path for a given size', () {
      final clipper = TCustomCurvedEdges();
      final size = const Size(300, 100);
      final path = clipper.getClip(size);

      expect(path, isA<Path>());
      expect(path.computeMetrics().length, greaterThan(0));
    });

    test('should reclip always returns true', () {
      final clipper = TCustomCurvedEdges();
      final shouldReclip = clipper.shouldReclip(TCustomCurvedEdges());

      expect(shouldReclip, true);
    });
  });
}
