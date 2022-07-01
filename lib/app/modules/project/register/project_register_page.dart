import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:validatorless/validatorless.dart';

class ProjectRegisterPage extends StatefulWidget {
  const ProjectRegisterPage({Key? key}) : super(key: key);

  @override
  State<ProjectRegisterPage> createState() => _ProjectRegisterPageState();
}

class _ProjectRegisterPageState extends State<ProjectRegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameEc = TextEditingController();
  final _descriptionEc = TextEditingController();

  @override
  void dispose() {
    _nameEc.dispose();
    _descriptionEc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  validator: Validatorless.multiple([
                    Validatorless.required('Estimação é obrigatória'),
                    Validatorless.number('Estimação deve ser numérica'),
                  ]),
                  controller: _descriptionEc,
                  decoration: InputDecoration(
                    labelText: 'Estimativa de horas',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    contentPadding: EdgeInsets.all(10),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.height * .7,
                  height: 49,
                  child: ElevatedButton(
                      onPressed: () {
                        final formValid = _formKey.currentState?.validate() ?? false;
                        if(formValid){
                          
                        }
                      },
                      child: const Text('Salvar')),
                ),
              ],
            ),
          )),
    );
  }
}
