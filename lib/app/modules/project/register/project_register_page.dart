import 'package:asuka/asuka.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_timer/app/modules/project/controller/project_register_controller.dart';
import 'package:validatorless/validatorless.dart';

class ProjectRegisterPage extends StatefulWidget {
  final ProjectRegisterController controller;
  const ProjectRegisterPage({super.key, required this.controller});

  @override
  State<ProjectRegisterPage> createState() => _ProjectRegisterPageState();
}

class _ProjectRegisterPageState extends State<ProjectRegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameEc = TextEditingController();
  final _estimateEc = TextEditingController();

  @override
  void dispose() {
    _nameEc.dispose();
    _estimateEc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProjectRegisterController, ProjectRegisterState>(
      bloc: widget.controller,
      listener: (context, state) {
        switch (state) {
          case ProjectRegisterState.success:
            Navigator.of(context).pop();
            break;
          case ProjectRegisterState.failure:
            AsukaSnackbar.alert('Erro ao salvar Projeto').show();
            break;

          default:
            break;
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Cadastro de Projeto',
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        body: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextFormField(
                    controller: _nameEc,
                    validator:
                        Validatorless.required('Nome do projeto é obrigatório'),
                    decoration: InputDecoration(
                      labelText: 'Nome',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      contentPadding: EdgeInsets.all(10),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    validator: Validatorless.multiple([
                      Validatorless.required('Estimação é obrigatória'),
                      Validatorless.number('Estimação deve ser numérica'),
                    ]),
                    controller: _estimateEc,
                    decoration: InputDecoration(
                      labelText: 'Estimativa de horas',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      contentPadding: EdgeInsets.all(10),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  BlocSelector<ProjectRegisterController, ProjectRegisterState,
                      bool>(
                    bloc: widget.controller,
                    selector: (state) => state == ProjectRegisterState.loading,
                    builder: (context, showLoading) {
                      return Visibility(
                        visible: showLoading,
                        child: const Center(
                          child: CircularProgressIndicator.adaptive(),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.height * .7,
                    height: 49,
                    child: ElevatedButton(
                        onPressed: () async {
                          final formValid =
                              _formKey.currentState?.validate() ?? false;
                          if (formValid) {
                            final name = _nameEc.text;
                            final estimate = int.parse(_estimateEc.text);
                            await widget.controller.register(name, estimate);
                          }
                        },
                        child: const Text('Salvar')),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
