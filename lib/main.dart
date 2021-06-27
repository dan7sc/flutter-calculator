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
  final widgets = <Widget>[];

  void buildWidgets() {
    for (var i = 0; i < 50; i++) {
      final itemsRow = <Widget>[];
      for (var j = 0; j < 3; j++) {
        itemsRow.add(Container(
            width: 100,
            height: 100,
            color: i % 2 == 0 ? Colors.green : Colors.red,
            child: Center(child: Text(i.toString())),
          )
        );
      }
      widgets.add(Row(
        children: itemsRow,
      ));
    }
    print(widgets);
  }

  @override
  void initState() {
    buildWidgets();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          buildWidgets();
        },
      ),
      body: ListView(
        children: widgets,
      ),
      // body: GridView(
      //   gridDelegate:
      //       SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      //   children: List.generate(
      //       50,
      //       (index) => index % 2 == 0
      //           ? Container(
      //               color: Colors.green,
      //               child: Center(
      //                 child: Text(index.toString()),
      //               ))
      //           : Container(
      //               color: Colors.red,
      //               child: Center(
      //                 child: Text(index.toString()),
      //               ),
      //             )),
      // ),
    );
  }
}
