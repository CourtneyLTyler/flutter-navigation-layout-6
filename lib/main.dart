import 'package:flutter/material.dart';
import 'package:flutter_application_6/art_route.dart';
import 'package:flutter_application_6/art_util.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigating art',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.yellow,
      ),
      // home: ArtRoute(
      //   art: ArtUtil.IMG_VAN_GOGH,
      // ),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text('Art Tab'),
            bottom: TabBar(tabs: [
              Tab(icon: Icon(Icons.art_track), text: ArtUtil.CARAVAGGIO),
              Tab(icon: Icon(Icons.art_track), text: ArtUtil.MONET),
              Tab(icon: Icon(Icons.art_track), text: ArtUtil.VAN_GOGH),
            ]),
          ),
          body: TabBarView(children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ArtUtil.IMG_CARAVAGGIO),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ArtUtil.IMG_MONET),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(ArtUtil.IMG_VAN_GOGH),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
