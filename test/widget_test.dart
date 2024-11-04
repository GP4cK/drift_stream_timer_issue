import 'package:drift_stream_timer_issue/database.dart';
import 'package:drift_stream_timer_issue/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AppDatabase db;
  setUpAll(() {
    db = AppDatabase();
  });
  tearDownAll(() {
    db.close();
  });
  testWidgets('Will fail', (tester) async {
    await tester.pumpWidget(MyApp(db));
  });
  testWidgets('Workaround', (tester) async {
    await tester.runAsync(() async {
      await tester.pumpWidget(MyApp(db));
      await tester.pumpWidget(Container());
    });
  });
}
