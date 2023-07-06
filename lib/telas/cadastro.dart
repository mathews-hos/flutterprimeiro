import 'package:flutter/material.dart';

class Porfil extends StatefulWidget {
  const Porfil({super.key, required this.title});

  final String title;

  @override
  State<Porfil> createState() => _porfilState();
}

class _porfilState extends State<Porfil> {
  void abelha(a) {
    print("object");
  }

  final TextEditingController _desccurso =
      TextEditingController(text: "escolha");
  final TextEditingController _cargahoracurso = TextEditingController();
  final TextEditingController _modalidade = TextEditingController();
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
            child: Column(
              children: [
                Text(
                  "Cadastro de curso",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                TextFormField(
                  controller: _desccurso,
                  decoration: const InputDecoration(
                      labelText: "descrição",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.text_snippet)),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 7),
                ),
                TextFormField(
                  controller: _cargahoracurso,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      labelText: "cargahorária",
                      border: UnderlineInputBorder(),
                      prefixIcon: Icon(Icons.av_timer)),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 7),
                ),
                Row(
                  children: [
                    Column(
                      children: [Text(_modalidade.text)],
                    ),
                    Column(
                      children: [
                        DropdownButton(
                          items: const [
                            DropdownMenuItem(
                                value: "Qualificação",
                                child: Text("Qualificação")),
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
                              print(_modalidade.text);
                            });
                          },
                          autofocus: true,
                        ),
                      ],
                    )
                  ],
                ),

                const Padding(
                  padding: EdgeInsets.only(top: 7),
                ),
                TextFormField(
                  controller: _eixo,
                  decoration: const InputDecoration(
                      labelText: "eixo",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.widgets_outlined)),
                ),
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
            ),
          )),
    );
  }
}
