import 'package:flutter/material.dart';
import 'package:my_phones_store/screens/product_list_screen.dart';
import 'package:device_preview/device_preview.dart';

void main() => runApp(
      DevicePreview(
        enabled: true,
        builder: (context) => MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'My Phones Store',
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreen createState() => _MainScreen();
}

class _MainScreen extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<Offset> _buttonOffsetAnimation;
  late Animation<Offset> _textOffsetAnimation;
  bool _isTextAnimated = false;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    _buttonOffsetAnimation =
        Tween<Offset>(begin: Offset(0, 1), end: Offset.zero).animate(
            CurvedAnimation(parent: _animationController, curve: Curves.ease));

    _textOffsetAnimation = Tween<Offset>(begin: Offset(0, 1), end: Offset.zero)
        .animate(
            CurvedAnimation(parent: _animationController, curve: Curves.ease));

    _animationController.addListener(() {
      if (_animationController.status == AnimationStatus.completed) {
        setState(() {
          _isTextAnimated = true;
        });
      }
    });

    _animationController.forward();
  }

  @override
  void dispose() {
    // Dispose the animation controller
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/back.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SlideTransition(
                position: _textOffsetAnimation,
                child: Text(
                  'My Phones Store',
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'times new roman'),
                ),
              ),
              SizedBox(height: 50),
              SlideTransition(
                position: _textOffsetAnimation,
                child: Text(
                  'Lets start with my amazing app and buy your favourite phone',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: _isTextAnimated
                        ? Color.fromARGB(255, 255, 255, 255)
                        : Color.fromARGB(255, 255, 255, 255),
                    fontSize: 20,
                    fontFamily: 'arial',
                  ),
                ),
              ),
              SizedBox(height: 30),
              SlideTransition(
                position: _buttonOffsetAnimation,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ProductListScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 255, 255, 255),
                    onPrimary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.0),
                      side: BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
                    elevation: 5.0, // Add elevation
                    textStyle: TextStyle(fontSize: 20.0),
                    minimumSize: Size(300.0, 60.0),
                  ),
                  child: Text(
                    'Get Start',
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontWeight: FontWeight.normal,
                        fontSize: 22,
                        fontFamily: 'arial'),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
