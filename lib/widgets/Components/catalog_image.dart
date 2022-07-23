import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogImage extends StatefulWidget {
  // final String image;

  const CatalogImage({Key key}) : super(key: key);

  @override
  State<CatalogImage> createState() => _CatalogImageState();
}

class _CatalogImageState extends State<CatalogImage> {
  Image image;

  @override
  void initState() {
    super.initState();
    image = Image.asset('assets/images/rupee.png');
  }

  @override
  void didChangeDependencies() {
    precacheImage(image.image, context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return image
        .box
        .rounded
        .p8
        .color(context.canvasColor)
        .make()
        .p16()
        .w32(context);
  }
}
