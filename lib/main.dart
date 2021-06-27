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
    for (var i = 0; i < 50 / 3; i++) {
      final itemsRow = <Widget>[];
      for (var j = 0; j < 3; j++) {
        itemsRow.add(
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width / 3,
              height: MediaQuery.of(context).size.width / 3,
              color: (i + j + 1) % 2 == 0 ? Colors.green : Colors.red,
              child: Center(child: Text((3 * i + j).toString())),
            ),
          ),
        );
      }
      widgets.add(Row(
        children: itemsRow,
      ));
    }
    // Future.delayed(Duration(milliseconds: 2000)).then((_) => setState(() {}));
    setState(() {});
  }

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      buildWidgets();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView(
              gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
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
