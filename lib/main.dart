import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

import 'package:mzk/lecture_page.dart';
import 'package:mzk/settings_page.dart';
import 'package:mzk/liste_page.dart';

void main() => runApp(MaterialApp(
        //home: MyApp(),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => MyApp(),
          '/setting': (context) => SettingPage(),
          '/playList': (context) => PlayListPage(),
        }));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  bool isPlaying = false;
  late Animation animation;
  late AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(microseconds: 500), vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            artisteImage(),
            timesBar(),
            titre(),
            timesCode(),
            Positioned(
              top: 0.05 * height,
              right: 0.81 * width,
              child: MaterialButton(
                shape: CircleBorder(),
                color: Colors.black,
                onPressed: () {
                  Navigator.pushNamed(context, '/setting');
                },
                child: Icon(
                  Icons.settings_outlined,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ),
            /*il est préferable d'utiliser MaterialButton si tu veux contenir une icon ,
            elle sera plus centre. CircularAvatar est plutôt pour l'image*/
            Positioned(
              top: 0.05 * height,
              left: 0.81 * width,
              child: MaterialButton(
                shape: CircleBorder(),
                color: Colors.black,
                onPressed: () {
                  Navigator.pushNamed(context, '/playList');
                },
                child: Icon(
                  Icons.queue_music_outlined,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        child: Stack(children: <Widget>[
          musicBar(),
        ]),
      ),
    );
  }

  Widget musicBar() => Container(
        height: 0.15 * height,
        decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            )),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Icon(
                Icons.shuffle_outlined,
                size: 34,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.skip_previous_outlined,
                size: 35,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            IconButton(
              iconSize: 45,
              color: Colors.white,
              icon: AnimatedIcon(
                icon: AnimatedIcons.play_pause,
                progress: controller,
              ),
              onPressed: () {
                setState(() {
                  isPlaying = !isPlaying;
                  isPlaying ? controller.forward() : controller.reverse();
                });
              },
            ),
            IconButton(
              icon: Icon(
                Icons.skip_next_outlined,
                size: 35,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(
                Icons.playlist_add_rounded,
                size: 40,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ],
        ),
      );
}
