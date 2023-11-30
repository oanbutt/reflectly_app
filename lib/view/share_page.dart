import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:reflectly/widgets/sharepage_container.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

import 'constants.dart';

class SharePage extends StatefulWidget {
  SharePage({required this.content, required this.author, required this.image});

  late String content;
  late String author;
  late String image;

  @override
  State<SharePage> createState() => _SharePageState();
}

class _SharePageState extends State<SharePage> {
  ScreenshotController screenshotController = ScreenshotController();

  Future<void> _saveImage(Uint8List imageBytes) async {
    // Use the image_gallery_saver package to save the image to the gallery

    final response = await [Permission.storage].request();
    print(response);
    final time = DateTime.now()
        .toIso8601String()
        .replaceAll('.', '_')
        .replaceAll(':', '_');
    final name = 'screenshot_$time';
    final result = await ImageGallerySaver.saveImage(imageBytes, name: name);
    print(result);
  }

  Future<void> shareImage() async {
    screenshotController.capture().then((Uint8List? imageBytes) async {
      if (imageBytes != null) {
        final directory = await getApplicationDocumentsDirectory();
        final imagePath = await File('${directory.path}/image.png').create();
        await imagePath.writeAsBytes(imageBytes);

        /// Share Plugin
        await Share.shareXFiles([XFile(imagePath.path)]);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          context.isDarkMode ? Color(0xff121212) : kbackGroundcolor,
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Hero(
                tag: 'image',
                child: Screenshot(
                  controller: screenshotController,
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 24),
                    height: 320,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                          image: NetworkImage(widget.image), fit: BoxFit.fill),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 12, right: 12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          DefaultTextStyle(
                            style: GoogleFonts.aBeeZee(
                                color: Colors.white,
                                fontSize: 20,
                                fontStyle: FontStyle.italic),
                            child: Text(
                              widget.content,
                              textAlign: TextAlign.center,
                              softWrap: true,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              DefaultTextStyle(
                                style: GoogleFonts.aBeeZee(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontStyle: FontStyle.italic),
                                child: Text(
                                  widget.author,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Share to',
                  style: TextStyle(
                      fontSize: 44,
                      color: Colors.grey.withOpacity(0.2),
                      fontWeight: FontWeight.w800),
                ),
                Row(
                  children: [
                    SharePageContainer(
                        icon: FaIcon(
                          FontAwesomeIcons.instagram,
                          color: Colors.white,
                        ),
                        text: 'IG STORY',
                        takeShot: () {
                          shareImage();
                        }),
                    SizedBox(
                      width: 13,
                    ),
                    SharePageContainer(
                      icon: FaIcon(
                        FontAwesomeIcons.floppyDisk,
                        color: Colors.white,
                      ),
                      text: 'SAVE',
                      takeShot: () async {
                        final image = await screenshotController.capture();
                        _saveImage(image!);
                      },
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            CupertinoButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'CANCEL',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey.withOpacity(0.6)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
