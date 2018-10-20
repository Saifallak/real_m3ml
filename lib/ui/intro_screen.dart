import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';

class IntroSlideShow extends StatefulWidget {
  @override
  _IntroSlideShowState createState() => _IntroSlideShowState();
}

// Custom config
class _IntroSlideShowState extends State<IntroSlideShow> {
  List<Slide> slides = List();

  @override
  void initState() {
    super.initState();

    slides.add(
      Slide(
        title: "SCHOOL",
        styleTitle: TextStyle(
            color: Color(0xffD02090),
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description:
            "Allow miles wound place the leave had. To sitting subject no improve studied limited",
        styleDescription: TextStyle(
            color: Color(0xffD02090),
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
        pathImage: "assets/images/BloodLogo.png",
        colorBegin: 0xffFFDAB9,
        colorEnd: 0xff40E0D0,
        directionColorBegin: Alignment.topLeft,
        directionColorEnd: Alignment.bottomRight,
        onImagePress: () {},
      ),
    );
    slides.add(
      Slide(
        title: "MUSEUM",
        styleTitle: TextStyle(
            color: Color(0xffD02090),
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description:
            "Ye indulgence unreserved connection alteration appearance",
        styleDescription: TextStyle(
            color: Color(0xffD02090),
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
        pathImage: "assets/images/BloodLogo.png",
        colorBegin: 0xffFFFACD,
        colorEnd: 0xffFF6347,
        directionColorBegin: Alignment.topRight,
        directionColorEnd: Alignment.bottomLeft,
      ),
    );
    slides.add(
      Slide(
        title: "COFFEE",
        styleTitle: TextStyle(
            color: Color(0xffD02090),
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description:
            "Much evil soon high in hope do view. Out may few northward believing attempted. Yet timed being songs marry one defer men our. Although finished blessing do of",
        styleDescription: TextStyle(
            color: Color(0xffD02090),
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
        pathImage: "assets/images/BloodLogo.png",
        colorBegin: 0xffFFA500,
        colorEnd: 0xff7FFFD4,
        directionColorBegin: Alignment.topCenter,
        directionColorEnd: Alignment.bottomCenter,
        maxLineTextDescription: 3,
      ),
    );
  }

  void onDonePress() {
    onSkipPress();
  }

  void onSkipPress() {
    Navigator.of(context).pushReplacementNamed("/auth");
  }

  Widget renderNextBtn() {
    return Icon(
      Icons.navigate_next,
      color: Color(0xffD02090),
      size: 35.0,
    );
  }

  Widget renderDoneBtn() {
    return Icon(
      Icons.done,
      color: Color(0xffD02090),
    );
  }

  Widget renderSkipBtn() {
    return Icon(
      Icons.skip_next,
      color: Color(0xffD02090),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      // List slides
      slides: this.slides,

      // Skip button
//      renderSkipBtn: this.renderSkipBtn(),
      onSkipPress: this.onSkipPress,
      colorSkipBtn: 0x33000000,
      highlightColorSkipBtn: 0xff000000,

      // Next, Done button
      onDonePress: this.onDonePress,
      renderNextBtn: this.renderNextBtn(),
      renderDoneBtn: this.renderDoneBtn(),
      colorDoneBtn: 0x33000000,
      highlightColorDoneBtn: 0xff000000,

      // Dot indicator
      colorDot: 0x33D02090,
      colorActiveDot: 0xffD02090,
      sizeDot: 13.0,
    );
  }
}
