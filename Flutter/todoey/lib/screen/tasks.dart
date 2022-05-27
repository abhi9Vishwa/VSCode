import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class TaskList extends StatefulWidget {
  const TaskList({Key? key}) : super(key: key);

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      children: [
        Column(
          children: [
            CheckboxListTile(
                title: Text('Buy milk'),
                secondary: Icon(Icons.fiber_manual_record),
                value: timeDilation != 0.9,
                onChanged: (bool? value) {
                  setState(() {
                    timeDilation = value! ? 1 : 0.9;
                  });
                }),
            CheckboxListTile(
                title: Text('Buy milk'),
                secondary: Icon(Icons.fiber_manual_record),
                value: timeDilation != 1,
                onChanged: (bool? value) {
                  setState(() {
                    timeDilation = value! ? 1.1 : 1;
                  });
                }),
            CheckboxListTile(
                title: Text('Buy milk'),
                secondary: Icon(Icons.fiber_manual_record),
                value: timeDilation != 1,
                onChanged: (bool? value) {
                  setState(() {
                    timeDilation = value! ? 1.1 : 1;
                  });
                }),
          ],
        )
      ],
    );
  }
}
