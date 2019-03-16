import 'package:flutter/material.dart';
import 'data_input.dart';

class FancyFab extends StatefulWidget {
  final Function() onPressed;
  final String tooltip;
  final IconData icon;

  FancyFab({this.onPressed, this.tooltip, this.icon});

  @override
  _FancyFabState createState() => _FancyFabState();
}

class _FancyFabState extends State<FancyFab>
    with SingleTickerProviderStateMixin {
  void _individualUdhari() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (BuildContext context) {
            return InputData();
          },
          fullscreenDialog: true),
    );
  }
  // Future<void> _individualUdhari() async {
  //   return showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         title: Text('Rewind and remember'),
  //         content: SingleChildScrollView(
  //           child: ListBody(
  //             children: <Widget>[
  //               Text(
  //                   'You will never be satisfied. This call to setState tells the Flutter framework that something has changed in this State, which causes it to rerun the build method below so that the display can reflect the updated values. If we changed counter without calling setState(), then the build method would not be called again, and so nothing would appear to happen.'),
  //               Text(
  //                   'You\’re like me. I’m never satisfied. You will never be satisfied. This call to setState tells the Flutter framework that something has changed in this State, which causes it to rerun the build method below so that the display can reflect the updated values. If we changed counter without calling setState(), then the build method would not be called again, and so nothing would appear to happen'),
  //             ],
  //           ),
  //         ),
  //         actions: <Widget>[
  //           FlatButton(
  //             child: Text('Regret'),
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  bool isOpened = false;
  AnimationController _animationController;
  Animation<Color> _buttonColor;
  Animation<double> _animateIcon;
  Animation<double> _translateButton;
  Curve _curve = Curves.easeOut;
  double _fabHeight = 28.0;

  @override
  initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200))
          ..addListener(() {
            setState(() {});
          });
    _animateIcon =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    _buttonColor = ColorTween(
      begin: Colors.blue,
      end: Colors.red,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(
          0.00,
          1.00,
          curve: Curves.linear,
        ),
      ),
    );
    _translateButton = Tween<double>(
      begin: _fabHeight,
      end: -14.0,
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Interval(
          0.0,
          0.75,
          curve: _curve,
        ),
      ),
    );
    super.initState();
  }

  @override
  dispose() {
    _animationController.dispose();
    super.dispose();
  }

  animate() {
    if (!isOpened) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
    isOpened = !isOpened;
  }

  Widget individual() {
    return Container(
      child: FloatingActionButton(
        onPressed: _individualUdhari,
        tooltip: 'Individual Udhari',
        child: Icon(Icons.person_add),
      ),
    );
  }

  Widget group() {
    return Container(
      child: FloatingActionButton(
        onPressed: _individualUdhari,
        tooltip: 'Group Udhari',
        child: Icon(Icons.group_add),
      ),
    );
  }

  Widget toggle() {
    return Container(
      child: FloatingActionButton(
        backgroundColor: _buttonColor.value,
        onPressed: animate,
        elevation: 5,
        tooltip: 'Add More',
        child: AnimatedIcon(
          icon: AnimatedIcons.menu_close,
          progress: _animateIcon,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value * 4,
            10.0,
          ),
          child: individual(),
        ),
        Transform(
          transform: Matrix4.translationValues(
            0.0,
            _translateButton.value * 2.0,
            3,
          ),
          child: group(),
        ),
        toggle(),
      ],
    );
  }
}
