import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(FrameApp());
}

class FrameApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Digital Picture Frame',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Digital Picture Frame',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.brown,
        body: DigitalPictureFrameScreen(),
      ),
    );
  }
}

class DigitalPictureFrameScreen extends StatefulWidget {
  @override
  _DigitalPictureFrameScreenState createState() =>
      _DigitalPictureFrameScreenState();
}

class _DigitalPictureFrameScreenState extends State<DigitalPictureFrameScreen> {
  int _currentIndex = 0;
  Timer? _timer;

  List<String> _imageUrls = [
    'assets/image1.webp',
    'assets/image2.webp',
    'assets/image3.jpeg',
    'assets/image4.jpeg',
  ];

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 10), (timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % _imageUrls.length;
      });
    });
  }

  void _resetTimer() {
    _timer?.cancel();
    _startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.yellow, width: 8.0),
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Image.asset(
          _imageUrls[_currentIndex],
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
