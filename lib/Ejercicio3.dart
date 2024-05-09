import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Page1(),
        '/page2': (context) => Page2(),
      },
    );
  }
}

class Page1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController _textController = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: Text('Page 1')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                labelText: 'Enter Text',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Page2(text: _textController.text),
                  ),
                );
              },
              child: Text('Ir a pagina 2'),
            ),
          ],
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  final String? text; // Cambio: text ahora es opcional

  Page2({this.text}); // Cambio: text ahora es opcional

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pagina 2')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'La pagina 1 dice:',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              text ?? 'No text provided', // Cambio: Manejo de texto nulo
              style: TextStyle(fontSize: 18),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Ir a pagina 1'),
            ),
          ],
        ),
      ),
    );
  }
}
