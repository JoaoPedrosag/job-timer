import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProjectTaskTile extends StatelessWidget {
  const ProjectTaskTile({Key? key}) : super(key: key);

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
          Text('Nome da Task'),
          RichText(
              text: const TextSpan(children: [
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
              text: '4h',
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
