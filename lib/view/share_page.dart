
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reflectly/widgets/sharepage_container.dart';

import '../widgets/custom_share_card.dart';
import 'constants.dart';

class SharePage extends StatefulWidget {
  const SharePage({super.key});

  @override
  State<SharePage> createState() => _SharePageState();
}

class _SharePageState extends State<SharePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kbackGroundcolor,
      body: Padding(
        padding: const EdgeInsets.only(left: 30,right: 30,top: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const CustomShareCard(),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Share to',style: TextStyle(fontSize: 44,color: Colors.grey.withOpacity(0.2),fontWeight: FontWeight.w800),),
                Row(
                  children: [
                    SharePageContainer(icon: FaIcon(FontAwesomeIcons.instagram,color: Colors.white,), text: 'IG STORY'),
                    SizedBox(width: 13,),
                    SharePageContainer(icon: FaIcon(FontAwesomeIcons.floppyDisk,color: Colors.white,), text: 'SAVE'),
                  ],
                )
              ],
            ),
            SizedBox(height: 20,),
            CupertinoButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: Text('CANCEL',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.grey.withOpacity(0.6)),),
            )
          ],
        ),
      ),
    );
  }
}
