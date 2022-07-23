// import 'dart:async';
// import 'package:cashitout/widgets/Components/themes.dart';
// import 'package:flutter/material.dart';
// import '../../controller/Home/home.dart';
// import '../OnBoarding/onBoarding.dart';

// class SplashScreen extends StatefulWidget {
//   final bool showHome;
//   const SplashScreen({
//     Key key,
//     this.showHome,
//   }) : super(key: key);
//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     Timer(const Duration(milliseconds: 500), () {
//       Navigator.of(context).pushReplacement(MaterialPageRoute(
//           builder: (_) =>
//               widget.showHome ? const Home() : const OnboardingPage()));
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: MyTheme.darkCreamColor,
//       body: Center(
//         child:
//             // logo here
//             Image.asset(
//           'assets/images/splash.png',
//           width: size.width * 0.4,
//           height: size.height * 0.4,
//         ),

//         // CircularProgressIndicator(
//         //   valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
//         // )
//       ),
//     );
//   }
// }
