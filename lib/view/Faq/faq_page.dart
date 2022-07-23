// ignore_for_file: deprecated_member_use
import 'package:cashitout/widgets/Components/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../model/faq.dart';
import '../../widgets/List/faq_list.dart';

class FaqPage extends StatefulWidget {
  const FaqPage({Key key}) : super(key: key);

  @override
  State<FaqPage> createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {

  Image image;

  @override
  void initState() {
    super.initState();
    image = Image.asset(
                "assets/images/faq.png",
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
                        if (FaqModel.items != null && FaqModel.items.isNotEmpty)
                          const SingleChildScrollView(child: FaqList())
                        else
                          const CircularProgressIndicator().centered()
                      ]),
                ),
              )))
            ])));
  }
}
