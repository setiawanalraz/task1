import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My App"),
        ),
        body: SnackBarMessage(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class SnackBarMessage extends StatefulWidget {
  @override
  State<SnackBarMessage> createState() => _SnackBarMessageState();
}

class _SnackBarMessageState extends State<SnackBarMessage> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _age = TextEditingController();
  bool _validate = false;

  @override
  void dispose() {
    _name.dispose();
    _age.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                labelText: "Name",
                hintText: "Enter your name",
                errorText: _validate ? "name can't be empty!" : null,
                prefixIcon: Icon(Icons.account_box),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              controller: _name,
              keyboardType: TextInputType.name,
              maxLength: 25,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                labelText: "Age",
                hintText: "Enter your age",
                errorText: _validate ? "age can't be empty!" : null,
                prefixIcon: Icon(Icons.cake),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              controller: _age,
              keyboardType: TextInputType.number,
              maxLength: 2,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              String name = _name.text;
              String age = _age.text;
              int ageBefore100 = 100 - int.parse(age);
              String result = ageBefore100.toString();
              final snackBar = SnackBar(
                content: Text(name +
                    ", " +
                    "you have " +
                    result +
                    " years until you're 100 years old"),
                action: SnackBarAction(
                  label: "Close",
                  onPressed: () {},
                ),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              setState(() {
                _name.text.isEmpty && _age.text.isEmpty
                    ? _validate = true
                    : _validate = false;
              });
            },
            child: Text("Submit"),
          ),
        ],
      ),
    );
  }
}
