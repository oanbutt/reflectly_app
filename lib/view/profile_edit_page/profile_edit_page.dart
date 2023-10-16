import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reflectly/view/constants.dart';
import 'package:reflectly/view/buttons.dart';
import '../../widgets/color_container_function.dart';
import 'edit_page_designs.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});


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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        toolbarHeight: 85,
        elevation: 0,
          automaticallyImplyLeading: false,
          title: TopButtons(icon: const Icon(Icons.arrow_back_rounded,size: 30,color: Colors.black,),function: (){
            // Navigator.pop(context);
            Navigator.pop(context);
          },)

      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          color: kbackGroundcolor,
          child: Padding(
            padding: const EdgeInsets.all(23),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
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
                    ),
                  ],
                ),
                const SizedBox(height: 30,),
                const TextFieldContainer(),
                const SizedBox(height: 20,),
                EditPageContainer(title: 'Disabled', subtitle: 'BIOMETRIC PASSWORD',isSwitched: false,icon: const Icon(Icons.lock_open_outlined,color: Colors.black,),bgIcon: Icon(Icons.fingerprint_sharp,size: 145,color: Colors.grey.withOpacity(0.05),),),
                const SizedBox(height: 20,),
                EditPageContainer(title: 'Disabled', subtitle: 'DARK MODE',isSwitched: false,icon: const Icon(Icons.lightbulb_outline,color: Colors.black,),bgIcon: Icon(Icons.lightbulb_outline,size: 145,color: Colors.grey.withOpacity(0.05),),),
                const SizedBox(height: 20,),
                DoubleContainer(title: 'Disabled', subtitle: 'CHECK-IN REMINDERS', isSwitched: isSwitched, icon: const Icon(Icons.notifications_none_outlined,color: Colors.black,)),
                const SizedBox(height: 20,),
                DoubleContainer2(title: 'Disabled', subtitle: 'POSITIVITY REMINDERS',isSwitched: false,icon: const Icon(Icons.notifications_none_outlined,color: Colors.black,)),
                const SizedBox(height: 20,),
                TextChangeContainer(text: 'Add custom activities by selecting other when creating a moment',),
                const SizedBox(height: 20,),
                TextChangeContainer(text: 'Add custom feelings by selecting other when creating a moment',),
                const SizedBox(height: 20,),
                ColorContainer(onUpdate: () => setState(() {
                }),),
                Padding(
                  padding: const EdgeInsets.only(top: 24,left: 13,right: 13),
                  child: Material(
                    elevation: 15,
                    borderRadius:BorderRadius.circular(50) ,
                    shadowColor: Colors.black.withOpacity(0.6),
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                        gradient: LinearGradient(
                            colors: [
                              kstartGradient,
                              kmidGradient,
                              kendGradient
                            ]

                        )
                      ),
                      child: const Center(child: Text('SIGN OUT',style: TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.w600),)),
                    ),
                  ),
                ),
                const SizedBox(height: 30,),
                Text('EXPORT DATA',style: GoogleFonts.aBeeZee(fontSize: 13,fontWeight: FontWeight.w600,color: Colors.grey.withOpacity(0.7)),),
                const SizedBox(height: 30,),
                Text('DELETE ACCOUNT',style: GoogleFonts.aBeeZee(fontSize: 13,fontWeight: FontWeight.w600,color: Colors.grey.withOpacity(0.7)),),
                const SizedBox(height: 30,),
                Text('version 4.8.3',style: GoogleFonts.aBeeZee(fontSize: 12,fontWeight: FontWeight.w600,color: Colors.grey.withOpacity(0.7)),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
