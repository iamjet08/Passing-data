import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Flutter',
    home: ScreenOne(),
  ));
}

class ScreenOne extends StatefulWidget {
  const ScreenOne({super.key});

  @override
  _ScreenOneState createState() {
    return _ScreenOneState();
  }
}

class _ScreenOneState extends State<ScreenOne> {
  TextEditingController textFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Page'),
        backgroundColor: const Color(0xFF765EFC),
        elevation: 10,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: TextField(
              decoration: const InputDecoration(
                  hintText: "Another Hint Text", labelText: "[Some Hint Text]"),
              controller: textFieldController,
              style: const TextStyle(
                fontSize: 24,
                color: Colors.black,
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF765EFC),
                padding: const EdgeInsets.all(15),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15))),
            child: const Text(
              'Send Data',
              style: TextStyle(fontSize: 24),
            ),
            onPressed: () {
              _sendDataToScreenTwo(context);
            },
          )
        ],
      ),
    );
  }

  void _sendDataToScreenTwo(BuildContext context) {
    String textToSend = textFieldController.text;
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ScreenTwo(
            text: textToSend,
          ),
        ));
  }
}

class ScreenTwo extends StatelessWidget {
  final String text;

  const ScreenTwo({Key? key, required this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
        backgroundColor: const Color(0xFF765EFC),
        elevation: 10,
      ),
      body: Center(
        child: Text(
          text,
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
