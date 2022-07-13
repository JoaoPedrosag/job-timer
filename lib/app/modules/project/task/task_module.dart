import 'package:flutter_modular/flutter_modular.dart';
import 'package:job_timer/app/modules/project/task/task_controller.dart';
import 'package:job_timer/app/modules/project/task/task_page.dart';
import 'package:job_timer/app/view_models/project_view_model.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';

class TaskModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        BlocBind.lazySingleton((i) => TaskController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: ((context, args) {
          final ProjectModel projectModel = args.data;
          return TaskPage(
            controller: Modular.get()..setProject(projectModel),
          );
        })),
      ];
}
