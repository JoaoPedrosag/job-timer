import 'dart:developer' as developer;

import 'package:bloc/bloc.dart';
import 'package:job_timer/app/entities/project.status.dart';

import 'package:job_timer/app/services/projects/project_service.dart';
import 'package:job_timer/app/view_models/project_view_model.dart';

part 'project_register_state.dart';

class ProjectRegisterController extends Cubit<ProjectRegisterState> {
  final ProjectService _projectService;

  ProjectRegisterController({
    required ProjectService projectService,
  })  : _projectService = projectService,
        super(ProjectRegisterState.initial);

  Future<void> register(String name, int estimate) async {
    try {
      emit(ProjectRegisterState.loading);
      final project = ProjectModel(
        name: name,
        estimate: estimate,
        status: ProjectStatus.em_andamento,
        tasks: [],
      );
      await _projectService.register(project);
      emit(ProjectRegisterState.success);
    } catch (e, s) {
      developer.log('Error to save project', error: e, stackTrace: s);
      emit(ProjectRegisterState.failure);
    }
  }
}
