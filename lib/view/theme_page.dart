import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../model/quotelist_model.dart';

class ThemePage extends StatefulWidget {
  const ThemePage({super.key});

  @override
  State<ThemePage> createState() => _ThemePageState();
}

class _ThemePageState extends State<ThemePage> {
  int number = 1;
  int currentImageindex = 0;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 2), (timer) {
      setState(() {
        currentImageindex = (currentImageindex + 1) % imagesList.length;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 33),
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 40),
                child: Material(
                  elevation: 3,
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    width: double.infinity,
                    height: 115,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: CachedNetworkImage(
                              fadeInCurve: Curves.easeInQuad,
                              fadeInDuration: const Duration(milliseconds: 650),
                              fadeOutCurve: Curves.easeOut,
                              fadeOutDuration:
                                  const Duration(milliseconds: 650),
                              useOldImageOnUrlChange: true,
                              imageUrl: imagesList[currentImageindex],
                              fit: BoxFit.cover,
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            )),
                        const Padding(
                          padding: EdgeInsets.only(left: 25, top: 73),
                          child: Text(
                            'Random Images',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Stack(
                children: [
                  Text(
                    'Still Images',
                    style: TextStyle(
                        fontSize: 50,
                        color: Colors.grey.withOpacity(0.2),
                        fontWeight: FontWeight.w600),
                  ),
                  GridView.builder(
                      padding: const EdgeInsets.only(top: 45),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: imagesList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 20 / 23,
                        crossAxisCount: 3,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) {
                        int currentNumber = number + index;
                        return Container(
                            padding: const EdgeInsets.only(left: 13, top: 75),
                            height: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                    image: NetworkImage(
                                      imagesList[index],
                                    ),
                                    fit: BoxFit.cover)),
                            child: Text(
                              '#$currentNumber',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 14),
                            ));
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
