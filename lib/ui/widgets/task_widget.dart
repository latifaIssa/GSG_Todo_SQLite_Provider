import 'package:flutter/material.dart';
import 'package:gsg_todo_sqlite_provider/models/task_model.dart';
import 'package:gsg_todo_sqlite_provider/providers/todo_provider.dart';
import 'package:provider/provider.dart';

class TaskWidget extends StatelessWidget {
  TaskModel taskModel;

  TaskWidget(this.taskModel);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<TodoProvider>(builder: (context, todoProvider, x) {
      return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: taskModel.isComplete ? Colors.green : Colors.redAccent),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        child: Row(
          children: [
            Checkbox(
                value: taskModel.isComplete,
                onChanged: (v) {
                  taskModel.isComplete = v;
                  todoProvider.updateTask(taskModel);
                }),
            SizedBox(
              width: 10,
            ),
            Text(taskModel.taskName),
            Spacer(),
            IconButton(
                onPressed: () {
                  todoProvider.deleteTask(taskModel);
                },
                icon: Icon(Icons.delete))
          ],
        ),
      );
    });

    // return Selector<TodoProvider, List<TaskModel>>(builder: (context, data, x) {
    //   return ListView.builder(
    //       itemCount: data.length,
    //       itemBuilder: (context, index) {
    //          return Container(
    //     decoration: BoxDecoration(
    //         borderRadius: BorderRadius.circular(15),
    //         color: taskModel.isComplete ? Colors.green : Colors.redAccent),
    //     margin: EdgeInsets.all(10),
    //     padding: EdgeInsets.all(10),
    //     child: Row(
    //       children: [
    //         Checkbox(
    //             value: taskModel.isComplete,
    //             onChanged: (v) {
    //               taskModel.isComplete = v;
    //               todoProvider.updateTask(taskModel);
    //             }),
    //         SizedBox(
    //           width: 10,
    //         ),
    //         Text(taskModel.taskName),
    //         Spacer(),
    //         IconButton(
    //             onPressed: () {
    //               todoProvider.deleteTask(taskModel);
    //             },
    //             icon: Icon(Icons.delete))
    //       ],
    //     ),
    //   );
    //       });
    // }, selector: (context, provider) {
    //   return provider.allTasks;
    // });
  }
}
