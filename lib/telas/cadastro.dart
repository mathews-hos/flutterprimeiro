import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Porfil extends StatefulWidget {
  const Porfil({super.key, required this.title});

  final String title;

  @override
  State<Porfil> createState() => _PorfilState();
}

class _PorfilState extends State<Porfil> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _desccurso = TextEditingController();
  final TextEditingController _cargahoracurso = TextEditingController();
  final TextEditingController _modalidade =
      TextEditingController(text: "Escolha um");
  final TextEditingController _eixo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Row(children: [
          Text(widget.title),
        ]),
      ),
      body: Container(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Text(
                      "Cadastro de curso",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    TextFormField(
                      validator: (valor) {
                        if (valor!.isEmpty) {
                          return "Insira a descrição do curso";
                        }
                        return null;
                      },
                      controller: _desccurso,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(color: Colors.blue)),
                          labelText: "Descrição",
                          prefixIcon: const Icon(Icons.text_snippet)),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 7),
                    ),
                    TextFormField(
                      validator: (valor) {
                        if (valor!.isEmpty) {
                          return "Insira a carga horária do curso";
                        } else if (int.tryParse(valor) == null) {
                          return "Insira apenas números";
                        }
                        return null;
                      },
                      controller: _cargahoracurso,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          suffixText: "H",
                          labelText: "Carga horária",
                          border: const OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(color: Colors.blue)),
                          prefixIcon: const Icon(Icons.timelapse)),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 7),
                    ),

                    DropdownButtonFormField(
                      decoration:
                          InputDecoration(border: const OutlineInputBorder()),
                      validator: (value) {
                        if (value == "Escolha um") {
                          return "Escolha uma modalidade";
                        }
                        return null;
                      },
                      value: _modalidade.text,
                      items: const [
                        DropdownMenuItem(
                          value: "Escolha um",
                          child: Text("Escolha um"),
                        ),
                        DropdownMenuItem(
                            value: "Qualificação", child: Text("Qualificação")),
                        DropdownMenuItem(
                            value: "Aperfeiçoamento",
                            child: Text("Aperfeiçoamento")),
                        DropdownMenuItem(
                            value: "Técnico", child: Text("Técnico")),
                        DropdownMenuItem(
                            value: "Graduação", child: Text("Graduação")),
                        DropdownMenuItem(
                            value: "Pós-Graduação",
                            child: Text("Pós-Graduação")),
                      ],
                      onChanged: (a) {
                        setState(() {
                          _modalidade.text = a!;
                          // ignore: avoid_print
                          print(a);
                        });
                      },
                    ),

                    const Padding(
                      padding: EdgeInsets.only(top: 7),
                    ),
                    TextFormField(
                      validator: (valor) {
                        if (valor!.isEmpty) {
                          return "Escolha um eixo";
                        }
                        return null;
                      },
                      controller: _eixo,
                      decoration: InputDecoration(
                          labelText: "Eixo",
                          border: const OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(color: Colors.blue)),
                          prefixIcon: const Icon(Icons.widgets_outlined)),
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Fluttertoast.showToast(
                                msg: "a",
                                gravity: ToastGravity.CENTER_LEFT,
                                backgroundColor: Colors.green);
                          }
                        },
                        child: const Icon(Icons.add_box_rounded))
                    // DropdownButton(
                    //   items: const [
                    //     DropdownMenuItem(child: Text("data")),
                    //     DropdownMenuItem(child: Text("a"))
                    //   ],
                    //   onChanged: (abelha) {
                    //     setState(() {
                    //       print("object");
                    //     });
                    //   },
                    // )
                  ],
                )),
          )),
    );
  }
}
