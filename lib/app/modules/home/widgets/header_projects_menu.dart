import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:job_timer/app/entities/project.status.dart';
import 'package:job_timer/app/modules/home/controller/home_controller.dart';

class HeaderProjectsMenu extends SliverPersistentHeaderDelegate {
  final HomeController controller;

  HeaderProjectsMenu({
    required this.controller,
  });
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        height: constraints.maxHeight,
        padding: EdgeInsets.all(10),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: constraints.maxWidth * .5,
              child: DropdownButtonFormField<ProjectStatus>(
                value: ProjectStatus.em_andamento,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  contentPadding: EdgeInsets.all(
                    10,
                  ),
                  isCollapsed: true,
                ),
                items: ProjectStatus.values
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(
                            e.label,
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ))
                    .toList(),
                onChanged: (status) {
                  if (status != null) {
                    controller.filter(status);
                  }
                },
              ),
            ),
            SizedBox(
              width: constraints.maxWidth * .4,
              child: ElevatedButton.icon(
                  onPressed: () async {
                    await Modular.to.pushNamed('/project/register');
                    controller.loadProjects();
                  },
                  icon: Icon(Icons.add),
                  label: Text("Novo Projeto")),
            )
          ],
        ),
      );
    });
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 80;

  @override
  // TODO: implement minExtent
  double get minExtent => 80;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
