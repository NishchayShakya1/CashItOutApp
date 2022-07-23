import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../view/Auth/sign_up.dart';
import '../../view/Home/homepage.dart';
import '../Provider/google_sign_in.dart';



class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) => Scaffold(
        body: ChangeNotifierProvider(
          create: (context) => GoogleSignInProvider(),
          child: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              final provider = Provider.of<GoogleSignInProvider>(context);

              if (provider.isSigningIn) {
                return buildLoading();
              } else if (snapshot.hasData) {
                return const HomePage();
              } else {
                return const WelcomeScreen();
                // SignUpWidget();
              }
            },
          ),
        ),   
      );

  Widget buildLoading() => Stack(
        fit: StackFit.expand,
        children: const [
          // SvgPicture.asset("assets/images/splash_bg.svg"),
           Center(child: CircularProgressIndicator()),
          
        ],
      );
}
