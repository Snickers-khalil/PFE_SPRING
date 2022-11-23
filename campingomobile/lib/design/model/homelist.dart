
import 'package:Campingo/design/design_course/home_design_course.dart';
import 'package:Campingo/design/fitness_app/fitness_app_home_screen.dart';
import 'package:Campingo/design/hotel_booking/hotel_home_screen.dart';
import 'package:Campingo/design/introduction_animation/introduction_animation_screen.dart';
import 'package:flutter/widgets.dart';

class HomeList {
  HomeList({
    this.navigateScreen,
    this.imagePath = '',
  });

  Widget? navigateScreen;
  String imagePath;

  static List<HomeList> homeList = [
    HomeList(
      imagePath: 'assets/imgs/ann.jpg',
      navigateScreen: IntroductionAnimationScreen(),
    ),
    HomeList(
      imagePath: 'assets/imgs/ev.jpg',
      navigateScreen: HotelHomeScreen(),
    ),
    HomeList(
      imagePath: 'assets/fitness_app/fitness_app.png',
      navigateScreen: FitnessAppHomeScreen(),
    ),
    HomeList(
      imagePath: 'assets/imgs/anno.jpg',
      navigateScreen: DesignCourseHomeScreen(),
    ),
  ];
}
