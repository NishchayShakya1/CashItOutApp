import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../model/about.dart';
import '../../widgets/Components/themes.dart';
import '../../widgets/List/about_list.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({Key key}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {

  Image image;

  @override
  void initState() {
    super.initState();
    image = Image.asset(
                "assets/images/about.png",
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
                        if (AboutModel.items != null &&
                            AboutModel.items.isNotEmpty)
                          const SingleChildScrollView(child: AboutList())
                        else
                          const CircularProgressIndicator().centered()
                      ]),
                ),
              )))
            ])));
  }
}
