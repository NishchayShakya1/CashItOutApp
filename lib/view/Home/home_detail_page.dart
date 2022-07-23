// ignore_for_file: depend_on_referenced_packages, implementation_imports, deprecated_member_use

import 'dart:io';
import 'package:cashitout/widgets/Components/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:in_app_purchase_android/src/types/google_play_purchase_details.dart';
import 'package:in_app_purchase_android/src/types/google_play_purchase_param.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:in_app_purchase_android/src/types/change_subscription_param.dart';
import 'package:in_app_purchase_android/src/billing_client_wrappers/billing_client_wrapper.dart';
import '../../controller/Home/home_controller.dart';
import '../../widgets/Buttons/custom_button.dart';
import 'homepage.dart';

const String _kConsumableId = '1';
const String _kConsumableId1 = '5';
const String _kConsumableId2 = '27.5';
const String _kConsumableId3 = '60';
const String _kConsumableId4 = '186';
const String _kConsumableId5 = '310';
const String _kConsumableId6 = '620';
const String _kConsumableId7 = '1890';
const String _kConsumableId8 = '3150';
const String _kConsumableId9 = '6400';

class HomeDetailPage extends StatefulWidget {
  final ProductDetails productDetails;
  final InAppPurchase inAppPurchase;
  final Map<String, PurchaseDetails> purchases;

  const HomeDetailPage({
    Key key,
    this.productDetails,
    this.inAppPurchase,
    this.purchases,
  }) : super(key: key);

  @override
  State<HomeDetailPage> createState() => _HomeDetailPageState();
}

class _HomeDetailPageState extends State<HomeDetailPage> {
  String UPI = '';
  final _signupFormKey = GlobalKey<FormState>();
  TextEditingController upiController = new TextEditingController();
  TextEditingController confirmUpiController = new TextEditingController();

  HomeVerify verify = Get.put(HomeVerify());
  @override
  void initState() {
    verify.toggleuser(false);
    verify.toggleadminPanel(false);
    verify.toggleparticularUser(false);
    super.initState();
    upiController.addListener(() => setState(() {}));
    confirmUpiController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    upiController.dispose();
    confirmUpiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: MyTheme.darkCreamColor,
        elevation: 0.0,
      ),
      backgroundColor: MyTheme.darkCreamColor,
      bottomNavigationBar: Visibility(
        visible: !isKeyboard,
        child: Container(
          color: MyTheme.darkCreamColor,
          child: ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            buttonPadding: Vx.mH0,
            children: [
              Text("Token Price: ${widget.productDetails.price}",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 0.05 * size.width,
                      fontFamily: GoogleFonts.poppins().fontFamily))
            ],
          ).py8().px16(),
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Hero(
                tag: {widget.productDetails.id},
                child:
                    Image.asset('assets/images/rupee.png').h24(context).p24(),
              ),
            ),
            Expanded(
                flex: 3,
                child: SingleChildScrollView(
                    // physics: ClampingScrollPhysics(),
                    child: VxArc(
                  height: 30.0,
                  arcType: VxArcType.CONVEY,
                  edge: VxEdge.TOP,
                  child: Container(
                    color: MyTheme.darkBluishColor,
                    width: context.screenWidth,
                    // height: context.screenHeight,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text.rich(
                              TextSpan(
                                // with no TextStyle it will have default text style
                                children: <TextSpan>[
                                  TextSpan(
                                      text: "Token Amount : ",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 0.05 * size.width,
                                          fontFamily: GoogleFonts.poppins()
                                              .fontFamily)),
                                  TextSpan(
                                      text: "Rs. ${widget.productDetails.id}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.greenAccent,
                                          fontSize: 0.05 * size.width,
                                          fontFamily: GoogleFonts.poppins()
                                              .fontFamily)),
                                ],
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              "Conversion Details: ${widget.productDetails.description}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 0.04 * size.width,
                                  fontFamily:
                                      GoogleFonts.poppins().fontFamily)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              "Policy: Google Play will take 30% of your Money.",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 0.03 * size.width,
                                  fontFamily:
                                      GoogleFonts.poppins().fontFamily)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                              "Processing Time: Will be Transferred within 48 hours.",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 0.03 * size.width,
                                  fontFamily:
                                      GoogleFonts.poppins().fontFamily)),
                        ),
                        Form(
                          key: _signupFormKey,
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(30, 30, 30, 5),
                                child: TextFormField(
                                  obscureText: true,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 0.045 * size.width,
                                      fontFamily:
                                          GoogleFonts.poppins().fontFamily),
                                  controller: upiController,
                                  decoration: InputDecoration(
                                    hintText: "Enter your UPI",
                                    labelText: "UPI",
                                    hintStyle: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 0.040 * size.width,
                                        fontFamily:
                                            GoogleFonts.poppins().fontFamily),
                                    labelStyle: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 0.05 * size.width,
                                        fontFamily:
                                            GoogleFonts.poppins().fontFamily),
                                    prefixIcon: Icon(
                                      Icons.account_balance_rounded,
                                      color: Colors.white,
                                    ),
                                    suffixIcon: upiController.text.isEmpty
                                        ? Container(width: 0)
                                        : IconButton(
                                            color: Colors.white,
                                            icon: const Icon(Icons.close),
                                            onPressed: () =>
                                                upiController.clear(),
                                          ),
                                    border: const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                  ),
                                  textInputAction: TextInputAction.done,
                                  maxLines: 1,
                                  onChanged: (value) {
                                    UPI = value;
                                    setState(() {});
                                  },
                                  validator: (val) {
                                    if (val == null || val.isEmpty) {
                                      return 'Enter your UPI';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(30, 15, 30, 15),
                                  child: TextFormField(
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 0.045 * size.width,
                                        fontFamily:
                                            GoogleFonts.poppins().fontFamily),
                                    controller: confirmUpiController,
                                    decoration: InputDecoration(
                                      hintText: "Confirm Your UPI",
                                      labelText: "Confirm UPI",
                                      hintStyle: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 0.040 * size.width,
                                          fontFamily:
                                              GoogleFonts.poppins().fontFamily),
                                      labelStyle: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 0.05 * size.width,
                                          fontFamily:
                                              GoogleFonts.poppins().fontFamily),
                                      prefixIcon: Icon(
                                        Icons.account_balance_rounded,
                                        color: Colors.white,
                                      ),
                                      suffixIcon: confirmUpiController
                                              .text.isEmpty
                                          ? Container(width: 0)
                                          : IconButton(
                                              color: Colors.white,
                                              icon: const Icon(Icons.close),
                                              onPressed: () =>
                                                  confirmUpiController.clear(),
                                            ),
                                      border: const OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white)),
                                    ),
                                    textInputAction: TextInputAction.done,
                                    maxLines: 1,
                                    validator: (val) {
                                      if (val == null || val.isEmpty) {
                                        return 'Confirm your UPI';
                                      } else if (val != UPI) {
                                        return 'UPI does not Match';
                                      }
                                      return null;
                                    },
                                  )),
                              const HeightBox(8),
                              CustomButton(
                                  text: 'Buy',
                                  buttonColor: Color.fromARGB(255, 20, 177, 96),
                                  onTap: () async {
                                    if (_signupFormKey.currentState
                                        .validate()) {
                                      setState(() {
                                        HomePage.Upi = upiController.text;
                                        HomePage.Token =
                                            widget.productDetails.id.toString();
                                        HomePage.TokenPrice = widget
                                            .productDetails.price
                                            .toString();
                                      });
                                      PurchaseParam purchaseParam;

                                      if (Platform.isAndroid) {
                                        final GooglePlayPurchaseDetails
                                            oldSubscription =
                                            _getOldSubscription(
                                                widget.productDetails,
                                                widget.purchases);

                                        purchaseParam = GooglePlayPurchaseParam(
                                            productDetails:
                                                widget.productDetails,
                                            applicationUserName: null,
                                            changeSubscriptionParam:
                                                (oldSubscription != null)
                                                    ? ChangeSubscriptionParam(
                                                        oldPurchaseDetails:
                                                            oldSubscription,
                                                        prorationMode: ProrationMode
                                                            .immediateWithTimeProration,
                                                      )
                                                    : null);
                                      } else {
                                        purchaseParam = PurchaseParam(
                                          productDetails: widget.productDetails,
                                          applicationUserName: null,
                                        );
                                      }

                                      if (widget.productDetails.id ==
                                          _kConsumableId) {
                                        widget.inAppPurchase.buyConsumable(
                                            purchaseParam: purchaseParam,
                                            autoConsume: true);
                                      } else if (widget.productDetails.id ==
                                          _kConsumableId1) {
                                        widget.inAppPurchase.buyConsumable(
                                            purchaseParam: purchaseParam,
                                            autoConsume: true);
                                      } else if (widget.productDetails.id ==
                                          _kConsumableId2) {
                                        widget.inAppPurchase.buyConsumable(
                                            purchaseParam: purchaseParam,
                                            autoConsume: true);
                                      } else if (widget.productDetails.id ==
                                          _kConsumableId3) {
                                        widget.inAppPurchase.buyConsumable(
                                            purchaseParam: purchaseParam,
                                            autoConsume: true);
                                      } else if (widget.productDetails.id ==
                                          _kConsumableId4) {
                                        widget.inAppPurchase.buyConsumable(
                                            purchaseParam: purchaseParam,
                                            autoConsume: true);
                                      } else if (widget.productDetails.id ==
                                          _kConsumableId5) {
                                        widget.inAppPurchase.buyConsumable(
                                            purchaseParam: purchaseParam,
                                            autoConsume: true);
                                      } else if (widget.productDetails.id ==
                                          _kConsumableId6) {
                                        widget.inAppPurchase.buyConsumable(
                                            purchaseParam: purchaseParam,
                                            autoConsume: true);
                                      } else if (widget.productDetails.id ==
                                          _kConsumableId7) {
                                        widget.inAppPurchase.buyConsumable(
                                            purchaseParam: purchaseParam,
                                            autoConsume: true);
                                      } else if (widget.productDetails.id ==
                                          _kConsumableId8) {
                                        widget.inAppPurchase.buyConsumable(
                                            purchaseParam: purchaseParam,
                                            autoConsume: true);
                                      } else if (widget.productDetails.id ==
                                          _kConsumableId9) {
                                        widget.inAppPurchase.buyConsumable(
                                            purchaseParam: purchaseParam,
                                            autoConsume: true);
                                      }
                                    }
                                  }),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
                          child: Text(
                              "Note :- \n1. Please make sure you purchase the token from the account you are logged in.\n2. Please make sure you provide correct UPI.",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 0.032 * size.width,
                                  fontFamily:
                                      GoogleFonts.poppins().fontFamily)),
                        ),
                      ],
                    ).py64(),
                  ),
                )))
          ],
        ),
      ),
    );
  }

  GooglePlayPurchaseDetails _getOldSubscription(
      ProductDetails productDetails, Map<String, PurchaseDetails> purchases) {
    GooglePlayPurchaseDetails oldSubscription;
    return oldSubscription;
  }
}
