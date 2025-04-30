import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:grocify/utils/helpers/cloud_helper_functions.dart';
import 'package:mockito/mockito.dart';
import 'package:firebase_storage/firebase_storage.dart';

class MockReference extends Mock implements Reference {}

class MockFirebaseStorage extends Mock implements FirebaseStorage {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();


  testWidgets('checkSingleRecordState shows loading widget when waiting', (
      tester) async {
    final snapshot = const AsyncSnapshot<int>.withData(
        ConnectionState.waiting, 1);
    final widget = TCloudHelperFunctions.checkSingleRecordState(snapshot);

    expect(widget, isA<Center>());
    expect((widget as Center).child, isA<CircularProgressIndicator>());
  });




  testWidgets('checkSingleRecordState returns null when data is present', (
      tester) async {
    final snapshot = const AsyncSnapshot<int>.withData(ConnectionState.done, 1);
    final widget = TCloudHelperFunctions.checkSingleRecordState(snapshot);

    expect(widget, isNull);
  });

  testWidgets('checkMultiRecordState shows loading widget when waiting', (
      tester) async {
    final snapshot = const AsyncSnapshot<List<int>>.withData(
        ConnectionState.waiting, []);
    final widget = TCloudHelperFunctions.checkMultiRecordState(
        snapshot: snapshot);

    expect(widget, isA<Center>());
    expect((widget as Center).child, isA<CircularProgressIndicator>());
  });





  testWidgets('checkMultiRecordState returns null when data is present', (
      tester) async {
    final snapshot = const AsyncSnapshot<List<int>>.withData(
        ConnectionState.done, [1, 3]);
    final widget = TCloudHelperFunctions.checkMultiRecordState(
        snapshot: snapshot);

    expect(widget, isNull);
  });

}