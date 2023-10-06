import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reflectly/view/constants.dart';
import 'package:reflectly/view/buttons.dart';

import 'edit_page_designs.dart';

class EditPage extends StatefulWidget {

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {


  late bool isSwitched = false;
  double value = 50;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackGroundcolor,
      body: Stack(

        children: [ SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            color: kbackGroundcolor,
            child: Padding(
              padding: const EdgeInsets.all(23),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Material(
                        elevation: 15,
                        borderRadius: BorderRadius.circular(12),
                        shadowColor: Colors.black.withOpacity(0.6),
                        child: Container(
                          width: 160,
                          height: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            gradient: LinearGradient(
                                begin: Alignment.bottomLeft,
                                end: Alignment.topRight,
                                colors: [
                                  kstartGradient,
                                  kmidGradient,
                                  kendGradient
                                ]),
                        ),
                          child: Icon(Icons.camera_alt_outlined,size: 70,color: Colors.blueGrey.withOpacity(0.15),),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: TextFieldContainer(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 17),
                    child: EditPageContainer(title: 'Disabled', subtitle: 'BIOMETRIC PASSWORD',isSwitched: false,icon: Icon(Icons.lock_open_outlined,color: Colors.black,),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 17),
                    child: EditPageContainer2(title: 'Disabled', subtitle: 'DARK MODE',isSwitched: false,icon: Icon(Icons.lightbulb_outline,color: Colors.black,)),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 17),
                    child: DoubleContainer(title: 'Disabled', subtitle: 'CHECK-IN REMINDERS', isSwitched: isSwitched, icon: Icon(Icons.notifications_none_outlined,color: Colors.black,))
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 17),
                    child: DoubleContainer2(title: 'Disabled', subtitle: 'POSITIVITY REMINDERS',isSwitched: false,icon: Icon(Icons.notifications_none_outlined,color: Colors.black,)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 17),
                    child: TextChangeContainer(text: 'Add custom activities by selecting other when creating a moment',),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 17),
                    child: TextChangeContainer(text: 'Add custom feelings by selecting other when creating a moment',),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 17),
                    child: ColorContainer(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24,left: 13,right: 13),
                    child: Material(
                      elevation: 15,
                      borderRadius:BorderRadius.circular(50) ,
                      shadowColor: Colors.black.withOpacity(0.6),
                      child: Container(
                        width: double.infinity,
                        height: 60,
                        decoration: BoxDecoration(
                            color: Color(0xff9375CB),
                            borderRadius: BorderRadius.circular(50),
                          gradient: LinearGradient(
                              colors: [
                                kstartGradient,
                                kmidGradient,
                                kendGradient
                              ]

                          )
                        ),
                        child: Center(child: Text('SIGN OUT',style: TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w600),)),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 35),
                    child: Text('EXPORT DATA',style: GoogleFonts.aBeeZee(fontSize: 13,fontWeight: FontWeight.w600,color: Colors.grey.withOpacity(0.7)),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 35),
                    child: Text('DELETE ACCOUNT',style: GoogleFonts.aBeeZee(fontSize: 13,fontWeight: FontWeight.w600,color: Colors.grey.withOpacity(0.7)),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 35),
                    child: Text('version 4.8.3',style: GoogleFonts.aBeeZee(fontSize: 12,fontWeight: FontWeight.w600,color: Colors.grey.withOpacity(0.7)),),
                  ),

                ],
              ),
            ),
          ),
        ),
          Positioned(
            top: 35,
            left: 27,
            child: TopButtons(icon: Icon(Icons.arrow_back_rounded,size: 30,),function: (){
            // Navigator.pop(context);
            Navigator.pop(context);

          },),)
    ]
      ),
    );
  }
}
