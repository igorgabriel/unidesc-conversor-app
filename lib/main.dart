import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  // var url = Uri.https('api.hgbrasil.com', '/finance',
  //     {'key': '757176bc', 'fields': 'only_results,currencies'});
  // http.get(url).then((response) => print(response.body));

  runApp(const ConversorApp());
}

class ConversorApp extends StatelessWidget {
  const ConversorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData(
          hintColor: Colors.amber,
          primaryColor: Colors.white,
          inputDecorationTheme: const InputDecorationTheme(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.amber)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.amber)),
              hintStyle: TextStyle(color: Colors.amber))),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          '\$ Conversor \$',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.amber,
        centerTitle: true,
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        const Icon(
          Icons.monetization_on,
          size: 150,
          color: Colors.amber,
        ),
        TextField(
          decoration: _textFieldDecoration('Reais', 'R\$'),
          style: _textFieldStyle(),
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
        ),
        const Divider(height: 50),
        TextField(
          decoration: _textFieldDecoration('Dólares', 'US\$'),
          style: _textFieldStyle(),
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
        ),
        const Divider(height: 50),
        TextField(
          decoration: _textFieldDecoration('Euros', '€'),
          style: _textFieldStyle(),
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
        ),
      ]),
    );
  }

  TextStyle _textFieldStyle() =>
      const TextStyle(color: Colors.amber, fontSize: 20);

  InputDecoration _textFieldDecoration(String label, String prefix) {
    return InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Colors.amber),
        prefixText: prefix);
  }
}
