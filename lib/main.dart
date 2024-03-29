import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flutter_demo/animation_page.dart';
import 'package:my_flutter_demo/error_page.dart';
import 'package:my_flutter_demo/stream/my_stream_page.dart';
import 'package:my_flutter_demo/test_widget_level_page.dart';
import 'package:my_flutter_demo/texture_page.dart';

import 'getx/dl_user_services.dart';
import 'key/test_animation_list_page.dart';
import 'key/test_key_page.dart';
import 'nil/test_nil_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ErrorPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? ""),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TexturePage()));
              },
              child: Text("Texture"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TestKeyPage()));
              },
              child: Text("Flutter Key Test"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TestAnimationListPage()));
              },
              child: Text("Flutter Key And AnimationList"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => TestNilPage()));
              },
              child: Text("Flutter nil Test"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TestWidgetLevelPage()));
              },
              child: Text("Test Widget Level"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.put(DLUserServices(), permanent: true);
              },
              child: Text("App background"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => AnimationPage()));
              },
              child: Text("Animation"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyStreamPage()));
              },
              child: Text("MyStreamPage"),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
