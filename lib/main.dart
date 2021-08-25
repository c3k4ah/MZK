import 'package:flutter/material.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late double width, height;
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
            _timesBar(),
            titre(),
            timesCode(),
            Positioned(
              top: 0.05 * height,
              right: 0.81 * width,
              child: MaterialButton(
                shape: CircleBorder(),
                color: Colors.black,
                onPressed: () {},
                child: Icon(
                  Icons.settings_outlined,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              top: 0.05 * height,
              left: 0.81 * width,
              child: MaterialButton(
                shape: CircleBorder(),
                color: Colors.black,
                onPressed: () {},
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
          _musicBar(),
        ]),
      ),
    );
  }

/* -------------------------------------------------------------------------- */
  Widget timesCode() => Positioned(
      bottom: 0.03 * height,
      left: 0.43 * width,
      /*right: 0.5 * width,*/
      child: Stack(children: <Widget>[
        Text('02:30',
            style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold)),
      ]));
/* -------------------------------------------------------------------------- */
  Widget titre() => Positioned(
      bottom: 0.17 * height,
      left: 0.3 * width,
      /*right: 0.5 * width,*/
      child: Column(children: <Widget>[
        Text(
          'Tsara Joro',
          style: TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
            shadows: [
              Shadow(
                blurRadius: 10.0,
                color: Colors.black,
                offset: Offset(5.0, 5.0),
              ),
            ],
          ),
        ),
        Text('Amino',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              shadows: [
                Shadow(
                  blurRadius: 10.0,
                  color: Colors.black,
                  offset: Offset(5.0, 5.0),
                ),
              ],
            )),
        /*IconButton(
          icon: Icon(
            Icons.favorite_rounded,
            size: 30,
            color: Colors.red.shade400,
          ),
          onPressed: () {},
        ),
        CircleAvatar(
          backgroundColor: Colors.white,
          radius:50,
          child:IconButton(
          icon: Icon(
            Icons.favorite_rounded,
            size: 30,
            color: Colors.red.shade400,
          ),
          onPressed: () {},
        ),
        ),*/
        MaterialButton(
          shape: CircleBorder(),
          color: Colors.white,
          onPressed: () {},
          child: Icon(
            Icons.favorite_rounded,
            size: 30,
            color: Colors.red.shade400,
          ),
        )
      ]));
/* -------------------------------------------------------------------------- */
  Widget _musicBar() => Container(
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
                size: 35,
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
              icon: Icon(
                Icons.play_arrow_rounded,
                size: 35,
                color: Colors.white,
              ),
              onPressed: () {},
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
                size: 35,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ],
        ),
      );
/* -------------------------------------------------------------------------- */
  Widget _timesBar() => Positioned(
      left: 0,
      right: 0,
      bottom: 0.1 * height,
      child: SleekCircularSlider(
        min: 0,
        max: 100,
        initialValue: 25,
        onChange: (value) {},
        /*onChange valeur durant le changement */
        onChangeEnd: (value) {},
        /*onChangeEnd valeur à la fin */
        onChangeStart: (value) {},
        /* onChangeStart valeur au début */
        innerWidget: (value) => Container(),
        appearance: CircularSliderAppearance(
            angleRange: 180,
            /* angleRange dégré de l'angle*/
            startAngle: 0,
            /*startAngle orientation, là on en forme U */
            size: width - 50,
            customWidths: CustomSliderWidths(
              progressBarWidth: 8.0,
              trackWidth: 8.0,
              handlerSize: 8.0,
            ),
            customColors: CustomSliderColors(
              trackColor: Colors.black,
              /*track prog déjà faut sur la bar de progression*/
              progressBarColor: Colors.grey,
              /*progressBar prog restant sur la bar de progression*/
              dotColor: Colors.black,
              /*dot(anglais)=point ,c'est le point qui indique la progression*/
            )),
      ));
/* -------------------------------------------------------------------------- */
  Widget artisteImage() => Container(
      width: double.infinity,
      height: double.infinity,
      margin: EdgeInsets.only(
        left: 50,
        right: 50,
        bottom: 0.15 * height,
      ),
      decoration: BoxDecoration(
          image: DecorationImage(
            image: ExactAssetImage('assets/images/denise1.jpg'),
            /*doit changer en fonction du photo  de l'album
            les primaryWatch doit hériter du même couleur que cette album..sinon l'user peut choisir sa couleur 'color picker'*/
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular((width - 100) / 2),
            bottomRight: Radius.circular((width - 100) / 2),
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.5),
                offset: Offset(0, 8),
                blurRadius: 5.0),
          ]));
}
