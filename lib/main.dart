import 'package:flutter/material.dart';
import 'package:gsg_todo_sqlite_provider/helpers/db_helper.dart';
import 'package:gsg_todo_sqlite_provider/providers/theme_provider.dart';
import 'package:gsg_todo_sqlite_provider/providers/todo_provider.dart';
import 'package:gsg_todo_sqlite_provider/ui/pages/main_page.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbHelper.dbHelper.initDatabase();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<TodoProvider>(
          create: (context) => TodoProvider(),
        ),
        ChangeNotifierProvider<ThemeProvider>(
          create: (context) => ThemeProvider(),
        ),
      ],
      child: MainPage(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<TodoProvider>(builder: (context, provider, x) {
      return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              provider.testName,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25),
            ),
            ElevatedButton(
              child: Text('Change Provider Value'),
              onPressed: () {
                provider.changeTestName('Flutter Course');
              },
            ),
          ],
        ),
      );
    });
  }
}
