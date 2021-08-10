import 'package:flutter/material.dart';
import 'package:gsg_todo_sqlite_provider/models/task_model.dart';
import 'package:gsg_todo_sqlite_provider/providers/todo_provider.dart';
import 'package:gsg_todo_sqlite_provider/ui/widgets/task_widget.dart';
import 'package:provider/provider.dart';

class AllTasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // return ListView.builder(
    //     itemCount: Provider.of<TodoProvider>(context).allTasks.length,
    //     itemBuilder: (context, index) {
    //       return TaskWidget(
    //         Provider.of<TodoProvider>(context).allTasks[index],
    //       );
    //     });

    //consumer: any variable inside provider updated will updated itself according to changes
    //may be used for two providers
    // return Consumer<TodoProvider>(builder: (context, todoProvider, x) {
    //   return ListView.builder(
    //       itemCount: todoProvider.allTasks.length,
    //       itemBuilder: (context, index) {
    //         return TaskWidget(
    //           todoProvider.allTasks[index],
    //         );
    //       });
    // });

    //selector: must determine type of data that listen to it in provider and what is the provider(provider, data)
    //data: element that I listen to it (List<TaslModel> ==> provider.allTasks ==> same type)
    return Selector<TodoProvider, List<TaskModel>>(builder: (context, data, x) {
      return ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return TaskWidget(
              data[index],
            );
          });
    }, selector: (context, provider) {
      return provider.allTasks;
    });
  }
}
