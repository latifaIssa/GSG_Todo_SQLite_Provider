import 'package:flutter/material.dart';
import 'package:gsg_todo_sqlite_provider/models/task_model.dart';
import 'package:gsg_todo_sqlite_provider/providers/todo_provider.dart';
import 'package:gsg_todo_sqlite_provider/ui/widgets/task_widget.dart';
import 'package:provider/provider.dart';

class InCompleteTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // return ListView.builder(
    //     itemCount: Provider.of<TodoProvider>(context).inCompleteTasks.length,
    //     itemBuilder: (context, index) {
    //       return TaskWidget(
    //         Provider.of<TodoProvider>(context).inCompleteTasks[index],
    //       );
    //     });

    // return Consumer<TodoProvider>(builder: (context, todoProvider, x) {
    //   return ListView.builder(
    //       itemCount: todoProvider.inCompleteTasks.length,
    //       itemBuilder: (context, index) {
    //         return TaskWidget(
    //           todoProvider.inCompleteTasks[index],
    //         );
    //       });
    // });

    return Selector<TodoProvider, List<TaskModel>>(builder: (context, data, x) {
      return ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return TaskWidget(
              data[index],
            );
          });
    }, selector: (context, provider) {
      return provider.inCompleteTasks;
    });
  }
}
