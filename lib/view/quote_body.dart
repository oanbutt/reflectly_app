import 'dart:async';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:reflectly/controllers/fetchdata.dart';
import 'package:reflectly/controllers/user_controller.dart';
import 'package:reflectly/model/navigation_animation.dart';
import 'package:reflectly/model/quotelist_model.dart';
import 'package:reflectly/view/general_page.dart';
import 'package:reflectly/view/share_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/userModel.dart';

String? currentDevice;
final CollectionReference<Map<String, dynamic>> userCollection =
    FirebaseFirestore.instance.collection('users');

class QuoteBody extends StatefulWidget {
  @override
  State<QuoteBody> createState() => _QuoteBodyState();
}

class _QuoteBodyState extends State<QuoteBody> with TickerProviderStateMixin {
  late AnimationController controller = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 300));
  late Animation<double> animation =
      CurvedAnimation(parent: controller, curve: Curves.easeIn);

  IconData icon = FontAwesomeIcons.heart;
  IconData icon2 = FontAwesomeIcons.solidHeart;

  bool check = false;
  bool isTapped = false;
  int currentIndex = 0;
  String? deviceId;

  UserController userController = Get.put(UserController());

  void checkLikedQuote() async {
    if (isTapped == false) {
      removeQuotetoFav();
    } else {
      addQuotetoFav();
    }
    setState(() {});
  }

  Future<void> addQuotetoFav() async {
    final quoteId = datacontroller.quotes[currentIndex].docId;
    if (quoteId != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(deviceId)
          .update({
        'favList': FieldValue.arrayUnion([quoteId])
      });
    }
  }

  Future<void> removeQuotetoFav() async {
    final quoteId = datacontroller.quotes[currentIndex].docId;
    if (quoteId != null) {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(deviceId)
          .update({
        'favList': FieldValue.arrayRemove([quoteId])
      }).then((value) {
        if (datacontroller.quotes[currentIndex].title == 'Favorites') {
          datacontroller.quotes.removeAt(currentIndex);
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();

    initializeDevice();
    _getId().then((value) {
      currentDevice = value;
      gettingData(value);
    });
  }

  Future<String?> _getId() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      // import 'dart:io'
      var iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor; // unique ID on iOS
    } else if (Platform.isAndroid) {
      var androidInfo = await deviceInfo.androidInfo;
      deviceId = androidInfo.id;
      if (kDebugMode) {
        print(deviceId);
      }
      return deviceId;
    } else {
      return null;
    }
  }

  Future<void> initializeDevice() async {
    final deviceId = await _getId();
    if (deviceId != null) {
      await FirebaseFirestore.instance.runTransaction((transaction) async {
        final deviceSnapshot =
            await transaction.get(userCollection.doc(deviceId));
        if (deviceSnapshot.exists) {
          return '';
        } else {
          await createUser(
            transaction,
            UserModel(
                name: 'Default', deviceId: deviceId, image: '', favList: []),
          );
        }
      });
    }
  }

  Future<dynamic> checkingFavList(String docId) async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(deviceId)
        .get();
    if (querySnapshot.exists) {
      final favList = querySnapshot.data()?['favList'];
      if (favList.contains(docId)) {
        setState(() {
          isTapped = true;
        });
      } else {
        setState(() {
          isTapped = false;
        });
      }
      return isTapped;
    } else {
      return 'empty';
    }
  }

  Future<void> createUser(Transaction transaction, UserModel user) async {
    // You need to define the structure of your UserModel and add appropriate fields
    transaction.set(
      userCollection.doc(user.deviceId),
      UserModel(
          name: 'Default',
          deviceId: user.deviceId,
          image: '',
          favList: []).toMap(),
    );
  }

  Future<String> getTitle() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('category_name')!;
  }

  Future<void> gettingData(var deviceId) async {
    final name = await getTitle();
    name == 'Favorites'
        ? await datacontroller.fetchingFavList(deviceId)
        : await datacontroller.fetchListFromFirestore(name).then((value) {
            datacontroller.quotes.addAll(value);
          });
  }

  FetchData datacontroller = Get.put(FetchData());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Hero(
            tag: 'image',
            child: Stack(
              fit: StackFit.expand,
              children: [
                CachedNetworkImage(
                  imageUrl: imagesList.isNotEmpty
                      ? imagesList[currentIndex % imagesList.length]
                      : '',
                  fit: BoxFit.cover,
                  placeholder: (context, url) {
                    return const BlurHash(
                      hash: 'L=IzkvodWCf6}?jYWCay#ljZa|f7',
                      duration: Duration(seconds: 3),
                    );
                  },
                  fadeInCurve: Curves.easeOutExpo,
                  fadeInDuration: const Duration(milliseconds: 550),
                  fadeOutCurve: Curves.easeOut,
                  fadeOutDuration: const Duration(milliseconds: 550),
                  useOldImageOnUrlChange: true,
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 35, right: 35),
                    child: Obx(() {
                      if (datacontroller.gettingdata.value ||
                          datacontroller.quotes.isEmpty) {
                        return Center(
                            child: Text(
                          'Loading...',
                          style: GoogleFonts.aBeeZee(
                              fontSize: 18, color: Colors.white),
                        ));
                      }
                      return CarouselSlider.builder(
                        options: CarouselOptions(
                          onPageChanged: (index, reason) {
                            setState(() {
                              currentIndex = index;
                            });
                          },
                          height: double.infinity,
                          scrollDirection: Axis.vertical,
                        ),
                        itemCount: datacontroller.quotes.length,
                        itemBuilder: (context, index, realIndex) {
                          checkingFavList(
                              datacontroller.quotes[currentIndex].docId);
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              DefaultTextStyle(
                                style: GoogleFonts.aBeeZee(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontStyle: FontStyle.italic),
                                child: Text(
                                  datacontroller.quotes[index].quote,
                                  textAlign: TextAlign.center,
                                  softWrap: true,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 25),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment:
                                      CrossAxisAlignment.baseline,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: [
                                    DefaultTextStyle(
                                      style: GoogleFonts.aBeeZee(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontStyle: FontStyle.italic),
                                      child: Text(
                                        datacontroller.quotes[index].authorName,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    })),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 110, left: 30, right: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 60),
                      child: GestureDetector(onTap: () {
                        Navigator.push(
                            context,
                            NavigationAnimate().createRoute(
                                GeneralPage(), const Offset(0.0, 1.0)));
                      }, child: Obx(() {
                        if (datacontroller.gettingdata.value ||
                            datacontroller.quotes.isEmpty) {
                          return const SizedBox();
                        }
                        return Container(
                          width: 130,
                          height: 45,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(8)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SvgPicture.asset(
                                'images/dashboard.svg',
                                width: 26,
                                height: 26,
                                colorFilter: const ColorFilter.mode(
                                    Colors.white, BlendMode.srcIn),
                              ),
                              Text(
                                datacontroller.quotes[currentIndex].title,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ],
                          ),
                        );
                      })),
                    ),
                    GestureDetector(onTap: () {
                      setState(() {
                        isTapped = !isTapped;
                        checkLikedQuote();
                      });
                    }, child: Obx(() {
                      if (datacontroller.gettingdata.value ||
                          datacontroller.quotes.isEmpty) {
                        return const SizedBox();
                      }
                      return Container(
                        height: 45,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                          child: isTapped
                              ? const FaIcon(
                                  FontAwesomeIcons.solidHeart,
                                  color: Colors.red,
                                )
                              : FaIcon(
                                  FontAwesomeIcons.heart,
                                  color: Colors.white.withOpacity(0.5),
                                ),
                        ),
                      );
                    })),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SharePage(
                                    content: datacontroller
                                            .quotes[currentIndex].quote ??
                                        '',
                                    author: datacontroller
                                            .quotes[currentIndex].authorName ??
                                        '',
                                    image: imagesList[currentIndex] ?? '')));
                      },
                      child: Container(
                        height: 45,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(12)),
                        child: Center(
                            child: FaIcon(
                          FontAwesomeIcons.shareFromSquare,
                          color: Colors.white.withOpacity(0.7),
                        )),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
