import 'package:flutter/material.dart';

class Registermed1 extends StatefulWidget {
  const Registermed1({super.key});

  @override
  State<Registermed1> createState() => _Registermed1State();
}

class _Registermed1State extends State<Registermed1> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(padding: EdgeInsets.fromLTRB(90, 0, 90, 0),
            child: Container(

            )
          ),
          Padding(padding: EdgeInsets.fromLTRB(90, 0, 90, 0),
              child: SizedBox(

              )
          ),
        ]
      )

    );
  }
}
