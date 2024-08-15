import 'package:drift_stream_timer_issue/database.dart';
import 'package:drift_stream_timer_issue/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late AppDatabase db;
  setUpAll(() {
    db = AppDatabase();
  });
  tearDownAll(() {
    db.close();
  });
  testWidgets('MyApp', (tester) async {
    await tester.pumpWidget(MyApp(db));
  });
}
