import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_timer/app/core/ui/button_with_loader.dart';
import 'package:job_timer/app/modules/project/task/task_controller.dart';
import 'package:validatorless/validatorless.dart';

class TaskPage extends StatefulWidget {
  final TaskController controller;
  const TaskPage({Key? key, required this.controller}) : super(key: key);

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameEc = TextEditingController();
  final _duration = TextEditingController();

  @override
  void dispose() {
    _nameEc.dispose();
    _duration.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TaskController, TaskStatus>(
      bloc: widget.controller,
      listener: (context, state) {
        if (state == TaskStatus.complete) {
          Navigator.of(context).pop();
        } else if (state == TaskStatus.failure) {
          AsukaSnackbar.alert('Erro ao salvar tarefa').show();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Criar nova task',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextFormField(
                  controller: _nameEc,
                  validator: Validatorless.required('Nome é obrigatório'),
                  decoration: const InputDecoration(
                    label: Text('Nome da task'),
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  validator: Validatorless.multiple([
                    Validatorless.required('Duração é obrigatória'),
                    Validatorless.number('Somente números'),
                  ]),
                  keyboardType: TextInputType.number,
                  controller: _duration,
                  decoration: const InputDecoration(
                    label: Text('Duraçao da task'),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: ButtonWithLoader<TaskController, TaskStatus>(
                      bloc: widget.controller,
                      selector: (state) => state == TaskStatus.loading,
                      onPressed: () {
                        final formValid =
                            _formKey.currentState?.validate() ?? false;
                        if (formValid) {
                          final duration = int.parse(_duration.text);
                          widget.controller.register(_nameEc.text, duration);
                        }
                      },
                      label: 'Salvar'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
