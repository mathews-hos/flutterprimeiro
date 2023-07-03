import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'formulários',
      darkTheme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //variáveis de estado
  final _formkey = GlobalKey<FormState>();
  final TextEditingController _titulocontroller = TextEditingController();
  final TextEditingController _duracaocontroller = TextEditingController();
  final TextEditingController _anocontroller = TextEditingController();
  final TextEditingController _generocontroller = TextEditingController();
  final TextEditingController _artistacontroller = TextEditingController();
  final TextEditingController _albumcontroller = TextEditingController();
  // fim 👍
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("formulei"),
        backgroundColor: Colors.blue.shade900,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(children: [
                const Text("cadastro de música"),
                // título
                TextFormField(
                  controller: _titulocontroller,
                  decoration: const InputDecoration(
                      labelText: "Nome",
                      prefixIcon: Icon(Icons.audiotrack_rounded)),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "obrigatório";
                    }
                    return null;
                  },
                ),
                // duração
                TextFormField(
                  controller: _duracaocontroller,
                  decoration: const InputDecoration(labelText: "Duração"),
                ),
                // ano lançamento
                TextFormField(
                  controller: _anocontroller,
                  decoration:
                      const InputDecoration(labelText: "Ano de lançamento"),
                ),
                // Gênero
                TextFormField(
                  controller: _generocontroller,
                  decoration: const InputDecoration(labelText: "Gênero"),
                ),
                // artista
                TextFormField(
                  controller: _artistacontroller,
                  decoration:
                      const InputDecoration(labelText: "Artista da música"),
                ),
                // album
                TextFormField(
                  controller: _albumcontroller,
                  decoration: const InputDecoration(labelText: "Álbum"),
                ),
                ElevatedButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        print("Música cadastrada");
                        print('${_titulocontroller.text}aa');
                        print('${_duracaocontroller.text}');
                        print('${_anocontroller.text}');
                        print('${_generocontroller.text}');
                        print('${_artistacontroller.text}');
                        print('${_albumcontroller.text}');
                      }
                    },
                    child: Text("yey"))
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
