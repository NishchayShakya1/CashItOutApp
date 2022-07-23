// ignore_for_file: deprecated_member_use, import_of_legacy_library_into_null_safe
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../../controller/Provider/google_sign_in.dart';

class GoogleSigninButtonWidget extends StatelessWidget {
  const GoogleSigninButtonWidget({Key key}) : super(key: key);

  signinMethod(context) async {
    final provider = Provider.of<GoogleSignInProvider>(context, listen: false);
    provider.login();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.all(4),
      child: OutlinedButton.icon(
        label: Text(
          'Continue With Google',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 0.052 * size.width,
            color: Colors.blue[400],
          ),
        ),
        icon: FaIcon(
          FontAwesomeIcons.google,
          color: Colors.blue[400],
          size: 0.05 * size.width,
        ),
        onPressed: () {
          signinMethod(context);
        },
      ),
    );
  }
}
