import 'package:flutter/material.dart';
import 'package:reflectly/model/navigation_animation.dart';
import 'package:reflectly/view/constants.dart';
import 'package:reflectly/view/buttons.dart';
import 'package:reflectly/view/profile_edit_page/profile_edit_page.dart';
import 'package:reflectly/view/profile_page/profile_page_designs.dart';
import 'package:reflectly/view/quote_page.dart';
import 'package:delayed_display/delayed_display.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 75,
        elevation: 0,
       backgroundColor: Colors.transparent,
       actions: [
         buildCustomAppbar(context),
      ]
      ),
      body: Container(
        color: kbackGroundcolor,
        child: Column(
            children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              DelayedDisplay(
                delay: const Duration(milliseconds: 300),
                child: AnimatedOpacity(
                  opacity: 1.0,
                  duration: const Duration(seconds: 1),
                  child: Container(
                    width: 185,
                    height: 165,
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.only(bottomRight: Radius.circular(20)),
                      gradient: LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight,
                          colors: [kstartGradient, kmidGradient, kendGradient]),
                    ),
                    child: Icon(
                      Icons.account_circle_outlined,
                      size: 100,
                      color: Colors.blueGrey.withOpacity(0.15),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12,),
              const DelayedDisplay(
                delay: Duration(milliseconds: 400),
                child: AnimatedOpacity(
                  opacity: 1.0,
                  duration: Duration(seconds: 1),
                  child: Text(
                    'Momi',
                    style: TextStyle(
                        fontSize: 26, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 15,right: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                DelayedDisplay(
                  delay: const Duration(milliseconds: 500),
                  child: AnimatedOpacity(
                      opacity: 1.0,
                      duration: const Duration(seconds: 1),
                      child: ContainerDesign(
                          title: 'Reflectly Basic', subtitle: 'ACTIVE PLAN')),
                ),
                const SizedBox(height: 20,),
                const DelayedDisplay(
                  delay: Duration(milliseconds: 600),
                  child: AnimatedOpacity(
                    opacity: 1.0,
                    duration: Duration(seconds: 1),
                    child: Row(
                      children: [
                        Rate(),
                        Support(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }


  // app bar holding icons

  DelayedDisplay buildCustomAppbar(BuildContext context) {
    return DelayedDisplay(
      delay: const Duration(milliseconds: 400),
      child: AnimatedOpacity(
        opacity: 1.0,
        duration: const Duration(seconds: 1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TopButtons(
                icon: const Icon(
                  Icons.edit,
                  size: 30,
                  color: Colors.black,
                ),
                function: () {
                  Navigator.push(
                    context,
                    NavigationAnimate().createRoute(
                      EditPage(),
                      const Offset(1, 0),
                    ),
                  ).whenComplete(
                        () => setState(() {}),
                  );
                }),
            const SizedBox(width: 9,),
            TopButtons(
              icon: const Icon(
                Icons.close,
                size: 30,
                color: Colors.black,
              ),
              function: () {
                Navigator.push(
                    context,
                    NavigationAnimate().createRoute(
                        const QuotePage(),
                        const Offset(-1.0, 0.0)));
              },
            ),
            const SizedBox(width: 12,)
          ],
        ),
      ),
    );
  }
}
