import 'package:flutter/material.dart';
import 'package:gsg_todo_sqlite_provider/providers/todo_provider.dart';
import 'package:gsg_todo_sqlite_provider/ui/widgets/task_widget.dart';
import 'package:provider/provider.dart';

class CompleteTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // return ListView.builder(
    //     itemCount: Provider.of<TodoProvider>(context).completeTasks.length,
    //     itemBuilder: (context, index) {
    //       return TaskWidget(
    //         Provider.of<TodoProvider>(context).completeTasks[index],
    //       );
    //     });
    return Consumer<TodoProvider>(builder: (context, todoProvider, x) {
      return ListView.builder(
          itemCount: todoProvider.completeTasks.length,
          itemBuilder: (context, index) {
            return TaskWidget(
              todoProvider.completeTasks[index],
            );
          });
    });
  }
}
