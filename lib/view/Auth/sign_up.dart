import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../widgets/Buttons/google_signup_button_widget.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        // alignment: Alignment.center,
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  HeightBox(size.height * 0.1),
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Image.asset("assets/images/splash.png"),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        child: Text(
                          ' Welcome to\n Cash It Out!',
                          style: TextStyle(
                            color: context.accentColor,
                            fontSize: size.width * 0.06,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ),
                  HeightBox(0.05 * size.height),
                  const GoogleSigninButtonWidget(),

                  // const SizedBox(height: defaultPadding),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
