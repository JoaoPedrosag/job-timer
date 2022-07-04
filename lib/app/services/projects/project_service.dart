import 'package:job_timer/app/entities/project.status.dart';
import 'package:job_timer/app/view_models/project_view_model.dart';

abstract class ProjectService {
  Future<void> register(ProjectModel projectModel);
  Future<List<ProjectModel>> findByStatus(ProjectStatus status);
}
