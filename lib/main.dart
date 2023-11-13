import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tablet App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomButton('HedhiHelp', HedhiHelpScreen(), Colors.blue),
          CustomButton('OmwanaThrive', OmwanaThriveScreen(), Colors.green),
          CustomButton('ObulamuEats', ObulamuEatsScreen(), Colors.orange),
          CustomButton('SengaSafe', SengaSafeScreen(), Colors.red),
          CustomButton('Omuwala Power', OmuwalaPowerScreen(), Colors.purple),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String buttonText;
  final Widget navigateToScreen;
  final Color buttonColor;

  CustomButton(this.buttonText, this.navigateToScreen, this.buttonColor);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => navigateToScreen),
        );
      },
      style: ElevatedButton.styleFrom(
        primary: buttonColor,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      ),
      child: Text(
        buttonText,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}

class ImageSliderScreen extends StatelessWidget {
  final List<String> imagePaths;
  final String title;

  ImageSliderScreen(this.title, this.imagePaths);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ImageSlider(imagePaths),
    );
  }
}

class ImageSlider extends StatefulWidget {
  final List<String> imagePaths;

  ImageSlider(this.imagePaths);

  @override
  _ImageSliderState createState() => _ImageSliderState();
}

class _ImageSliderState extends State<ImageSlider> {
  PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      itemCount: widget.imagePaths.length,
      itemBuilder: (context, index) {
        return Image.asset(
          widget.imagePaths[index],
          height: 200, // Adjust the height as needed
          width: double.infinity,
          fit: BoxFit.cover,
        );
      },
    );
  }
}

class HedhiHelpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ImageSliderScreen(
      'HedhiHelp',
      ['assets/item1_image.jpg', 'assets/item2_image.jpg', 'assets/item3_image.jpg'],
    );
  }
}

class OmwanaThriveScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ImageSliderScreen(
      'OmwanaThrive',
      ['assets/item4_image.jpg', 'assets/item5_image.jpg', 'assets/item6_image.jpg'],
    );
  }
}

class ObulamuEatsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ImageSliderScreen(
      'ObulamuEats',
     ['assets/Slide 1 - Cover Page.png', 'assets/Slide 2 - Table of Contents.png'],

    );
  }
}

class SengaSafeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ImageSliderScreen(
      'SengaSafe',
      ['assets/item8_image.jpg', 'assets/item9_image.jpg', 'assets/item10_image.jpg'],
    );
  }
}

class OmuwalaPowerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ImageSliderScreen(
      'Omuwala Power',
      ['assets/item11_image.jpg', 'assets/item12_image.jpg', 'assets/ross_image.jpg'],
    );
  }
}
