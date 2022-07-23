// ignore_for_file: deprecated_member_use

import 'dart:developer';

import 'package:cashitout/widgets/Components/themes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../controller/Contact/contact_controller.dart';
import '../../controller/Email/email.dart';
import '../../widgets/Buttons/custom_button.dart';
import '../../widgets/TextField/custom_textfield.dart';
import 'package:intl/src/intl/date_format.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key key}) : super(key: key);

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _contactFormKey = GlobalKey<FormState>();
  final dateController = TextEditingController();
  final queryController = TextEditingController();
  final nameController = TextEditingController();
  final upiController = TextEditingController();
  ContactVerify verify = Get.put(ContactVerify());

  @override
  void initState() {
    verify.toggleaddUser(false);
    verify.toggleaddUserQueryToAdmin(false);
    verify.toggleaddParticularUser(false);
    log(verify.addUser.value.toString());
    log(verify.addParticularUser.value.toString());
    log(verify.addUserQueryToAdmin.value.toString());
    super.initState();
    dateController.addListener(() => setState(() {}));
    queryController.addListener(() => setState(() {}));
    nameController.addListener(() => setState(() {}));
    upiController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    dateController.dispose();
    queryController.dispose();
    nameController.dispose();
    upiController.dispose();

    super.dispose();
  }

  CollectionReference addUser = FirebaseFirestore.instance
      .collection('userQuery')
      .doc(DateFormat("MMMM, dd, yyyy").format(DateTime.now()).toString())
      .collection(LevelUp().myTest.toString());
  Future<void> addUserQuery(
      String date, String name, String upi, String query) {
    return addUser
        .add(
          {
            'email': LevelUp().myTest.toString(),
            'name': name,
            'upi': upi,
            'query': query,
            'createdAt': Timestamp.now(),
            'date': date,
           
          },
        )
        .then((value) => verify.toggleaddUser(true))
        .catchError((error) => log('Failed to Add Particular user: $error'));
  }

  CollectionReference addUserQueryToAdmin =
      FirebaseFirestore.instance.collection('userQueryToAdmin');

  Future<void> addUserQueryToAdminPanel(
      String date, String name, String upi, String query) {
    return addUserQueryToAdmin
        .add(
          {
            'email': LevelUp().myTest.toString(),
            'name': name,
            'upi': upi,
            'query': query,
            'createdAt': Timestamp.now(),
            'date': date,
            'status': 'Open'
          },
        )
        .then((value) => verify.toggleaddUserQueryToAdmin(true))
        .catchError((error) => log('Failed to Add Particular user: $error'));
  }

  CollectionReference addParticularUser = FirebaseFirestore.instance
      .collection('particularUserQuery')
      .doc(LevelUp().myTest.toString())
      .collection(LevelUp().myTest.toString());
  Future<void> addParticularUserQuery(
      String date, String name, String upi, String query) {
    return addParticularUser
        .add(
          {
            'email': LevelUp().myTest.toString(),
            'name': name,
            'upi': upi,
            'query': query,
            'createdAt': Timestamp.now(),
            'date': date,
            'status': 'Open'
          },
        )
        .then((value) => verify.toggleaddParticularUser(true))
        .catchError((error) => log('Failed to Add Particular user: $error'));
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Assistance",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
                fontFamily: GoogleFonts.poppins().fontFamily)),
        backgroundColor: MyTheme.darkCreamColor,
        centerTitle: true,
      ),
      backgroundColor: MyTheme.darkBluishColor,
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Form(
                key: _contactFormKey,
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 5, 0, 10),
                    child: CustomTextField(
                        controller: nameController,
                        hintText: 'Name',
                        labelText: 'Name',
                        maxlines: 1,
                        icon: Icons.person,
                      ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 10),
                    child: CustomTextField(
                      controller: dateController,
                      hintText: 'dd-mm-yyyy',
                      labelText: 'Date of Purchase',
                      maxlines: 1,
                      icon: Icons.date_range,
                  
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 10),
                    child: CustomTextField(
                      controller: upiController,
                      hintText: 'At the Time of Purchase',
                      labelText: 'UPI',
                      maxlines: 1,
                 
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 10),
                    child: CustomTextField(
                        controller: queryController,
                        hintText: 'My problem is...',
                        labelText: 'Query',
                        maxlines: 5,
                        icon: Icons.chat_sharp,
                      
                        ),
                  ),
                  HeightBox(size.height * 0.02),
                  CustomButton(
                      text: 'Submit',
                      onTap: () async {
                        if (_contactFormKey.currentState.validate()) {
                          await addUserQuery(
                              dateController.text,
                              nameController.text,
                              upiController.text,
                              queryController.text);

                          await addParticularUserQuery(
                              dateController.text,
                              nameController.text,
                              upiController.text,
                              queryController.text);

                          await addUserQueryToAdminPanel(
                              dateController.text,
                              nameController.text,
                              upiController.text,
                              queryController.text);
                        }

                        if (verify.addUser.value == true &&
                            verify.addParticularUser.value == true &&
                            verify.addUserQueryToAdmin.value == true) {
                          await _handleWillPop(size, true);
                        } else {
                          await _handleWillPop(size, false);
                        }

                        dateController.clear();
                        queryController.clear();
                        nameController.clear();
                        upiController.clear();
                      })
                ])),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: Center(
                child: Text(
                    "Note : You will be Notified on Your G-Mail about the Query.",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 0.030 * size.width,
                        fontFamily: GoogleFonts.poppins().fontFamily)),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<bool> _handleWillPop(var size, bool snacktext) async {
    Scaffold.of(context).removeCurrentSnackBar();
    Scaffold.of(context).showSnackBar(
      _getExitSnackBar(context, size, snacktext),
    );
    return true;
  }

  SnackBar _getExitSnackBar(BuildContext context, var size, bool snacktext) {
    return SnackBar(
      content: Text(
        snacktext ? 'Query Sent Successfully' : "Query Not Sent",
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 0.045 * size.width,
            fontFamily: GoogleFonts.poppins().fontFamily),
        textAlign: TextAlign.center, //color: Colors.white,
      ),
      backgroundColor: MyTheme.darkCreamColor,
      duration: const Duration(
        seconds: 1,
      ),
      behavior: SnackBarBehavior.floating,
    );
  }

  // Widget buildName() => TextField(
  //       controller: nameController,
  //       decoration: InputDecoration(
  //         hintText: 'Nishchay Shakya',
  //         labelText: 'Your Name',
  //         prefixIcon: const Icon(Icons.person),
  //         // icon: Icon(Icons.mail),
  //         suffixIcon: nameController.text.isEmpty
  //             ? Container(width: 0)
  //             : IconButton(
  //                 icon: const Icon(Icons.close),
  //                 onPressed: () => nameController.clear(),
  //               ),
  //         border: const OutlineInputBorder(),
  //       ),
  //       // keyboardType: TextInputType.emailAddress,
  //       textInputAction: TextInputAction.done,
  //       // autofocus: true,
  //     );

  // Widget buildEmail() => TextField(
  //       controller: dateController,
  //       decoration: InputDecoration(
  //         hintText: 'xyz123@gmail.com',
  //         labelText: 'E-Mail',
  //         prefixIcon: const Icon(Icons.mail),
  //         // icon: Icon(Icons.mail),
  //         suffixIcon: dateController.text.isEmpty
  //             ? Container(width: 0)
  //             : IconButton(
  //                 icon: const Icon(Icons.close),
  //                 onPressed: () => dateController.clear(),
  //               ),
  //         border: const OutlineInputBorder(),
  //       ),
  //       keyboardType: TextInputType.emailAddress,
  //       textInputAction: TextInputAction.done,
  //       // autofocus: true,
  //     );

  // Widget buildUPI() => TextField(
  //       controller: upiController,
  //       decoration: InputDecoration(
  //         hintText: '9755XXXXXX@paytm',
  //         labelText: 'UPI',
  //         prefixIcon: const Icon(Icons.account_balance),
  //         // icon: Icon(Icons.mail),
  //         suffixIcon: upiController.text.isEmpty
  //             ? Container(width: 0)
  //             : IconButton(
  //                 icon: const Icon(Icons.close),
  //                 onPressed: () => upiController.clear(),
  //               ),
  //         border: const OutlineInputBorder(),
  //       ),
  //       //  keyboardType: TextInputType.emailAddress,
  //       textInputAction: TextInputAction.done,
  //       // autofocus: true,
  //     );

  // Widget buildQuery() => TextField(
  //       controller: queryController,
  //       decoration: InputDecoration(
  //         hintText: 'Describe Your Problem!',
  //         labelText: 'Query',
  //         prefixIcon: const Icon(Icons.description_sharp),
  //         // icon: Icon(Icons.mail),
  //         suffixIcon: queryController.text.isEmpty
  //             ? Container(width: 0)
  //             : IconButton(
  //                 icon: const Icon(Icons.close),
  //                 onPressed: () => queryController.clear(),
  //               ),
  //         border: const OutlineInputBorder(),
  //       ),
  //       //  keyboardType: TextInputType.emailAddress,
  //       textInputAction: TextInputAction.done,
  //       maxLines: 5,
  //       // autofocus: true,
  //     );
}
