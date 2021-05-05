import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {

  AnimationController _animationController;
  Animation curveAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
      duration: Duration(seconds: 4),
      vsync: this
    );

    curveAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.bounceOut
    );

    _animationController.repeat();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Explicit Animation"),
      // ),
      // body: Center(
      //   child: RotationTransition(
      //     child: Container(
      //       width: 200,
      //       height: 200,
      //       color: Colors.blue,
      //     ),
      //     alignment: Alignment.center,
      //     turns: Tween<double>(begin: 0, end: 1).animate(curveAnimation),
      //   ),
      // ),
      body: Stack(
        children: [
          PositionedTransition(
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.purple,
                  shape: BoxShape.circle
                ),
              ),
            rect: RelativeRectTween(
                begin: RelativeRect.fromLTRB(0, 0, 0, 700),
                end: RelativeRect.fromLTRB(0, 700, 0, 0)
            ).animate(curveAnimation),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.play_arrow),
        onPressed: (){
          if(_animationController.isAnimating){
            _animationController.stop();
          }else{
            _animationController.repeat();
          }
        },
      ),
    );
  }
}


