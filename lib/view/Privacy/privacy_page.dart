// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../model/privacy.dart';
import '../../widgets/Components/themes.dart';
import '../../widgets/List/privacy_list.dart';

class PrivacyPage extends StatefulWidget {
  const PrivacyPage({Key key}) : super(key: key);

  @override
  State<PrivacyPage> createState() => _PrivacyPageState();
}

class _PrivacyPageState extends State<PrivacyPage> {

  Image image;

  @override
  void initState() {
    super.initState();
    image = Image.asset(
                "assets/images/privacy.png",
                fit: BoxFit.cover,
              );
  }

  @override
  void didChangeDependencies() {
    precacheImage(image.image, context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: MyTheme.darkCreamColor,
          elevation: 0.0,
        ),
        backgroundColor: MyTheme.darkCreamColor,
        body: SafeArea(
            bottom: false,
            child: Column(children: [
              image.h24(context).p24(),
              Expanded(
                  child: SingleChildScrollView(
                      child: VxArc(
                height: 12.0,
                arcType: VxArcType.CONVEY,
                edge: VxEdge.TOP,
                child: Container(
                  color: MyTheme.darkBluishColor,
                  width: context.screenWidth,
                  padding: Vx.m4,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (PrivacyModel.items != null &&
                            PrivacyModel.items.isNotEmpty)
                          const SingleChildScrollView(child: PrivacyList())
                        else
                          const CircularProgressIndicator().centered()
                      ]),
                ),
              )))
            ])));
  }
}
