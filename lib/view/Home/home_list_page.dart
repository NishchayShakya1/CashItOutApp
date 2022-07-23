import 'package:cashitout/widgets/Components/themes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../widgets/Components/catalog_image.dart';
import 'home_detail_page.dart';

// const String _kConsumableId = 'consume';
// const String _kConsumableId1 = 'consumable_product';
// const String _kConsumableId2 = 'consumuable';

class CatalogItem extends StatelessWidget {
  final ProductDetails productDetails;
  final InAppPurchase inAppPurchase;
  final Map<String, PurchaseDetails> purchases;

  const CatalogItem({
    Key key,
    this.productDetails,
    this.inAppPurchase,
    this.purchases,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return VxBox(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Hero(tag: {productDetails.id}, child: const CatalogImage()),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(padding: EdgeInsets.all(8.0)),
            // productDetails.title.text.color(Colors.black).bold.make(),
            Text("Rs. ${productDetails.id}",
                style: TextStyle(
                    color: Colors.greenAccent,
                    fontWeight: FontWeight.bold,
                    fontSize: 0.04 * size.width,
                    fontFamily: GoogleFonts.poppins().fontFamily)),
            Text(productDetails.description,
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.normal,
                    fontSize: 0.025 * size.width,
                    fontFamily: GoogleFonts.poppins().fontFamily)),

            HeightBox(0.05 * size.width),
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: Vx.mH2,
              children: [
                // productDetails.price.text.bold.xl.make(),
                Text(productDetails.price,
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 0.04 * size.width,
                        fontFamily: GoogleFonts.poppins().fontFamily)),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: MyTheme.lightBluishColor,
                      onPrimary: Colors.white,
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomeDetailPage(
                                productDetails: productDetails,
                                inAppPurchase: inAppPurchase,
                                purchases: purchases

                                //CatalogModel.getById(2)
                                ))),
                    child: Text('Proceed',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            fontFamily: GoogleFonts.poppins().fontFamily)))
              ],
            ).pOnly(right: 12.0)
          ],
        ))
      ],
    )).color(MyTheme.darkBluishColor).rounded.make().py16().px0();
  }
}
