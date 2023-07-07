import 'package:flutter/material.dart';

class Porfil extends StatefulWidget {
  const Porfil({super.key, required this.title});

  final String title;

  @override
  State<Porfil> createState() => _PorfilState();
}

class _PorfilState extends State<Porfil> {
  final TextEditingController _desccurso = TextEditingController();
  final TextEditingController _cargahoracurso = TextEditingController();
  final TextEditingController _modalidade =
      TextEditingController(text: "escolha um");
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
                  decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(color: Colors.blue)),
                      labelText: "descrição",
                      prefixIcon: const Icon(Icons.text_snippet)),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 7),
                ),
                TextFormField(
                  controller: _cargahoracurso,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "cargahorária",
                      border: const OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(color: Colors.blue)),
                      prefixIcon: const Icon(Icons.av_timer)),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 7),
                ),

                DropdownButton(
                  value: _modalidade.text,
                  items: const [
                    DropdownMenuItem(
                      value: "escolha um",
                      child: Text("escolha um"),
                    ),
                    DropdownMenuItem(
                        value: "Qualificação", child: Text("Qualificação")),
                    DropdownMenuItem(
                        value: "Aperfeiçoamento",
                        child: Text("Aperfeiçoamento")),
                    DropdownMenuItem(value: "Técnico", child: Text("Técnico")),
                    DropdownMenuItem(
                        value: "Graduação", child: Text("Graduação")),
                    DropdownMenuItem(
                        value: "Pós-Graduação", child: Text("Pós-Graduação")),
                  ],
                  onChanged: (a) {
                    setState(() {
                      _modalidade.text = a!;
                      // ignore: avoid_print
                      print(a);
                    });
                  },
                  autofocus: true,
                ),

                const Padding(
                  padding: EdgeInsets.only(top: 7),
                ),
                TextFormField(
                  validator: (valor) {
                    if (valor!.isEmpty) {
                      return "a";
                    }
                    return null;
                  },
                  controller: _eixo,
                  decoration: InputDecoration(
                      labelText: "eixo",
                      border: const OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: const BorderSide(color: Colors.blue)),
                      prefixIcon: const Icon(Icons.widgets_outlined)),
                ),
                ElevatedButton(
                    onPressed: () {}, child: const Icon(Icons.add_box_rounded))
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
