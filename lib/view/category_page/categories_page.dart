import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reflectly/controllers/fetchdata.dart';
import 'package:reflectly/view/quote_body.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controllers/user_controller.dart';
import '../../widgets/category_list_file.dart';
import 'category_page_designs.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  UserController userController = Get.put(UserController());
  @override
  void initState() {
    // TODO: implement initState
    loadImagePath();
  }

  FetchData datacontroller = Get.put(FetchData());
  int selectedIndex = 0;
  int categoryIndex = 0;
  String name = 'General';

  Future<void> savePath() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('selected_index', selectedIndex);
    prefs.setInt('category_index', categoryIndex);
    prefs.setString('category_name', name);
  }

  Future<void> loadImagePath() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedIndex = prefs.getInt('selected_index')!;
      categoryIndex = prefs.getInt('category_index')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (int index = 0; index < categoryList.length; index++) ...[
          CategoriesText(heading: categoryList[index]['section']),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            child: Container(
                padding: const EdgeInsets.only(
                    left: 30, right: 30, top: 10, bottom: 40),
                width: MediaQuery.of(context).size.width * 1.6,
                child: Wrap(children: [
                  for (var itemIndex = 0;
                      itemIndex < categoryList[index]['items'].length;
                      itemIndex++) ...[
                    CategoriesContainer(
                      itemName: categoryList[index]['items'][itemIndex]
                          ['title'],
                      title: categoryList[index]['items'][itemIndex]['title'],
                      imagecode: categoryList[index]['items'][itemIndex]
                          ['imagecode'],
                      isTapped:
                          itemIndex == selectedIndex && categoryIndex == index,
                      onClick: () async {
                        try {
                          if (categoryList[index]['items'][itemIndex]
                                  ['title'] ==
                              'Favorites') {
                            await datacontroller
                                .fetchingFavList(currentDevice!);
                          } else {
                            datacontroller.quotes.clear();
                            await datacontroller
                                .fetchListFromFirestore(categoryList[index]
                                    ['items'][itemIndex]['title'])
                                .then((value) {
                              datacontroller.quotes.addAll(value);
                            });
                          }
                          setState(() {
                            categoryIndex = index;
                            selectedIndex = itemIndex;
                            name = categoryList[index]['items'][itemIndex]
                                ['title'];
                            savePath();
                          });
                        } catch (e) {
                          print('error');
                        }
                      },
                    ),
                  ]
                ])),
          ),
        ]
      ],
    );
  }
}
