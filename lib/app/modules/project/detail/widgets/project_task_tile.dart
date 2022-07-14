import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:job_timer/app/view_models/project_task_model.dart';

class ProjectTaskTile extends StatelessWidget {
  final ProjectTaskModel task;
  const ProjectTaskTile({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(task.name),
          RichText(
              text: TextSpan(children: [
            TextSpan(
              text: 'Duração: ',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            TextSpan(
              text: '   ',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
            TextSpan(
              text: '${task.duration} h',
              style: TextStyle(
                fontSize: 12,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ]))
        ],
      ),
    );
  }
}
