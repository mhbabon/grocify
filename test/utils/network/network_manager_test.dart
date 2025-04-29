import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:grocify/utils/helpers/network_manager.dart';
import 'package:mocktail/mocktail.dart';


class MockConnectivity extends Mock implements Connectivity {}

void main() {
  late MockConnectivity mockConnectivity;
  late NetworkManager networkManager;

  setUp(() {
    mockConnectivity = MockConnectivity();

    // ✅ Return a fake stream to prevent crash
    when(() => mockConnectivity.onConnectivityChanged)
        .thenAnswer((_) => Stream<List<ConnectivityResult>>.fromIterable([
      [ConnectivityResult.wifi]
    ]));

    networkManager = NetworkManager(connectivity: mockConnectivity);
    Get.put(networkManager);
  });
  tearDown(() {
    networkManager.onClose();
    Get.reset();
  });

  test('should return true when connected', () async {
    when(() => mockConnectivity.checkConnectivity())
        .thenAnswer((_) async => [ConnectivityResult.wifi]);

    final result = await networkManager.isConnected();
    expect(result, true);
  });

  test('should return false when not connected', () async {
    when(() => mockConnectivity.checkConnectivity())
        .thenAnswer((_) async => [ConnectivityResult.none]);

    final result = await networkManager.isConnected();
    expect(result, false);
  });

  test('should return false on PlatformException', () async {
    when(() => mockConnectivity.checkConnectivity())
        .thenThrow(PlatformException(code: 'error'));

    final result = await networkManager.isConnected();
    expect(result, false);
  });
}
