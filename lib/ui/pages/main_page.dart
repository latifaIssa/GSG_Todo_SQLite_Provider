import 'package:flutter/material.dart';
import 'package:gsg_todo_sqlite_provider/helpers/theme_helper.dart';
import 'package:gsg_todo_sqlite_provider/models/task_model.dart';
import 'package:gsg_todo_sqlite_provider/providers/theme_provider.dart';
import 'package:gsg_todo_sqlite_provider/providers/todo_provider.dart';
import 'package:gsg_todo_sqlite_provider/ui/pages/all_tasks.dart';
import 'package:gsg_todo_sqlite_provider/ui/pages/completed_tasks.dart';
import 'package:gsg_todo_sqlite_provider/ui/pages/incompleted_tasks.dart';
import 'package:gsg_todo_sqlite_provider/ui/pages/new_task_page.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<ThemeProvider>(
        builder: (context, provider, x) => MaterialApp(
              theme: provider.themeData,
              home: HomePage(),
            ));

    // return Selector<TodoProvider, List<TaskModel>>(builder: (context, data, x) {
    //   return DefaultTabController(
    //     length: 3,
    //     child: Scaffold(
    //       appBar: AppBar(
    //         actions: [
    //           IconButton(
    //             onPressed: () {
    //               Navigator.of(context)
    //                   .push(MaterialPageRoute(builder: (context) {
    //                 return NewTaskPage();
    //               }));
    //             },
    //             icon: Icon(Icons.add),
    //           ),
    //         ],
    //         title: Text('Todo App'),
    //         bottom: TabBar(isScrollable: true, tabs: [
    //           Tab(
    //             text: 'All Tasks',
    //           ),
    //           Tab(
    //             text: 'Complete Tasks',
    //           ),
    //           Tab(
    //             text: 'InComplete Tasks',
    //           ),
    //         ]),
    //       ),
    //       body: data == null
    //           ? Center(
    //               child: CircularProgressIndicator(),
    //             )
    //           : TabBarView(children: [
    //               AllTasks(),
    //               CompleteTasks(),
    //               InCompleteTasks(),
    //             ]),
    //     ),
    //   );
    // }, selector: (context, provider) {
    //   return provider.allTasks;
    // });
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer2<TodoProvider, ThemeProvider>(
      builder: (context, todoProvider, provider, x) => DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return NewTaskPage();
                  }));
                },
                icon: Icon(Icons.add),
              ),
              Switch(
                  value: provider.themeData == ThemeHelper.lightTheme,
                  onChanged: (value) {
                    if (value) {
                      provider.setThemeData(MyThemeMode.light);
                    } else {
                      provider.setThemeData(MyThemeMode.dark);
                    }
                  })
            ],
            title: Text('Todo App'),
            bottom: TabBar(isScrollable: true, tabs: [
              Tab(
                text: 'All Tasks',
              ),
              Tab(
                text: 'Complete Tasks',
              ),
              Tab(
                text: 'InComplete Tasks',
              ),
            ]),
          ),
          body: todoProvider.allTasks == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : TabBarView(children: [
                  AllTasks(),
                  CompleteTasks(),
                  InCompleteTasks(),
                ]),
        ),
      ),
    );
  }
}
