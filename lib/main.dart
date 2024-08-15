import 'package:drift_stream_timer_issue/database.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final db = AppDatabase();
  runApp(MyApp(db));
}

class MyApp extends StatefulWidget {
  const MyApp(this.db, {super.key});
  final AppDatabase db;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final stream = widget.db.select(widget.db.todoItems).watch();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Demo'),
          ),
          body: StreamBuilder(
            stream: stream,
            builder: (context, snapshot) {
              final items = snapshot.data ?? const [];
              return ListView(
                children: items
                    .map((item) => ListTile(title: Text(item.title)))
                    .toList(),
              );
            },
          ),
        ));
  }
}
