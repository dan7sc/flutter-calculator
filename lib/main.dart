import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.black,
            ),
          ),
          Expanded(
            flex: 3,
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4),
              children: List.generate(
                18,
                (index) => index % 2 == 0
                ? Container(
                  color: Colors.green,
                  child: Center(
                    child: Text(index.toString()),
                  )
                )
                : Container(
                  color: Colors.red,
                  child: Center(
                    child: Text(index.toString()),
                  ),
                )
              ),
            ),
          ),
        ],
      ),
    );
  }
}
