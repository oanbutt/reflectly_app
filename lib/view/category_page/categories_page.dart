import 'package:flutter/material.dart';
import '../../widgets/category_list_file.dart';
import 'category_page_designs.dart';


class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for(int index=0;index<categoryList.length;index++)...[
          CategoriesText(heading: categoryList[index]['section']),
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child:
              Container(
                padding: const EdgeInsets.only(left: 30,right: 30,top: 10,bottom: 40),
                width: MediaQuery.of(context).size.width*1.6,
                child: Wrap(
                  children: [
                    for(var value in categoryList[index]['items'])...[
                      value,
                    ]
                  ]
                ),
              ),
            ),
        ]
      ],
    );
  }
}


