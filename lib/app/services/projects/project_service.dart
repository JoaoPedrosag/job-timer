import 'package:job_timer/app/entities/project.dart';
import 'package:job_timer/app/entities/project.status.dart';
import 'package:job_timer/app/view_models/project_task_model.dart';
import 'package:job_timer/app/view_models/project_view_model.dart';

abstract class ProjectService {
  Future<void> register(ProjectModel projectModel);
  Future<List<ProjectModel>> findByStatus(ProjectStatus status);
  Future<ProjectModel> findById(int projectId);
  Future<ProjectModel> addTask(int projectId, ProjectTaskModel task);
  Future<void> finish(int projectId);
}
