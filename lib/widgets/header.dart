import 'package:clip_shadowx/clip_shadowx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class Header extends StatefulWidget {
  const Header(
   
  ) : super();

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      // fit: StackFit.expand,
      children: <Widget>[
        ClipShadow(
  clipper: RoundedDiagonalPathClipper(),
  shadows: const [
    BoxShadow(color: Colors.red, blurRadius: 10, spreadRadius: 10)
  ],
  child: Image.network(
      'https://upload.wikimedia.org/wikipedia/commons/thumb/2/27/CairoEgMuseumTaaMaskMostlyPhotographed.jpg/480px-CairoEgMuseumTaaMaskMostlyPhotographed.jpg'),
),
        
        TweenAnimationBuilder(
          duration: Duration(seconds: 2),
          curve: Curves.decelerate,
          tween: Tween(begin: 0.0, end: 1.0),
          builder: (context, num value, w) => Image.asset(
            'assets/fflogo.png',
            height: (50 * 1.25) * value,
          ),
        ),
      ],
    );
  }
}