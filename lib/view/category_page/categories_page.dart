import 'package:flutter/material.dart';
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
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Container(
            padding: EdgeInsets.only(left: 30,right: 30,top: 10,bottom: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CategoriesContainer(title: 'General', imagecode: 'images/123.jpeg',),
                CategoriesContainer(title: 'Favorites',  imagecode: 'images/123.jpeg'),
              ],
            ),
          ),
        ),
        CategoriesText(heading: 'Most Popular'),

        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Container(
              padding: EdgeInsets.only(left: 30,right: 30,top: 10,bottom: 40),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CategoriesContainer(title: 'Positive Thinking',  imagecode: 'images/123.jpeg'),
                      CategoriesContainer(title: 'Sadness', imagecode: 'images/123.jpeg'),

                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CategoriesContainer(title: 'Short Quotes',  imagecode: 'images/123.jpeg'),
                      CategoriesContainer(title: 'Love Yourself',  imagecode: 'images/123.jpeg'),
                    ],
                  ),
                ],
              )
          ),
        ),
        CategoriesText(heading: 'Personal Growth'),
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Container(
              padding: EdgeInsets.only(left: 30,right: 30,top: 10,bottom: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CategoriesContainer(title: 'Self Esteem',  imagecode: 'images/123.jpeg'),
                      CategoriesContainer(title: 'Wisdom', imagecode: 'images/123.jpeg'),
                      CategoriesContainer(title: 'Perseverance',  imagecode: 'images/123.jpeg'),
                      CategoriesContainer(title: 'Life',  imagecode: 'images/123.jpeg'),

                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CategoriesContainer(title: 'Positive Thinking',  imagecode: 'images/123.jpeg'),
                      CategoriesContainer(title: 'Self-Discipline',  imagecode: 'images/123.jpeg'),
                      CategoriesContainer(title: 'Love Yourself',  imagecode: 'images/123.jpeg'),
                    ],
                  ),
                ],
              )
          ),
        ),
        CategoriesText(heading: 'Calm Down'),
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Container(
              padding: EdgeInsets.only(left: 30,right: 30,top: 10,bottom: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CategoriesContainer(title: 'Appreciation', imagecode: 'images/123.jpeg'),
                      CategoriesContainer(title: 'Handling Stress', imagecode: 'images/123.jpeg'),
                      CategoriesContainer(title: 'Mindfulness',  imagecode: 'images/123.jpeg'),
                      CategoriesContainer(title: 'Dealing with Changes',  imagecode: 'images/123.jpeg'),
                      CategoriesContainer(title: 'Enjoy the moment',  imagecode: 'images/123.jpeg'),
                      CategoriesContainer(title: 'Inner Peace',  imagecode: 'images/123.jpeg'),
                      CategoriesContainer(title: 'Trust',  imagecode: 'images/123.jpeg'),
                      CategoriesContainer(title: 'Patience',  imagecode: 'images/123.jpeg'),

                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CategoriesContainer(title: 'Faith',  imagecode: 'images/123.jpeg'),
                      CategoriesContainer(title: 'Dealing with Anxiety', imagecode: 'images/123.jpeg'),
                      CategoriesContainer(title: 'Affirmations', imagecode: 'images/123.jpeg'),
                      CategoriesContainer(title: 'Uncertainty', imagecode: 'images/123.jpeg'),
                      CategoriesContainer(title: 'Social Anxiety', imagecode: 'images/123.jpeg'),
                      CategoriesContainer(title: 'Hope',  imagecode: 'images/123.jpeg'),
                      CategoriesContainer(title: 'Calm Down', imagecode: 'images/123.jpeg'),
                      CategoriesContainer(title: 'Forgiveness',  imagecode: 'images/123.jpeg',),
                    ],
                  ),
                ],
              )
          ),
        ),
        CategoriesText(heading: 'Hard Times'),
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Container(
              padding: EdgeInsets.only(left: 30,right: 30,top: 10,bottom: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CategoriesContainer(title: 'Sadness', imagecode: 'images/123.jpeg'),
                      CategoriesContainer(title: 'Heart Broken', imagecode: 'images/123.jpeg'),
                      CategoriesContainer(title: 'Letting Go',  imagecode: 'images/123.jpeg'),
                      CategoriesContainer(title: 'Handling Stress',  imagecode: 'images/123.jpeg'),
                      CategoriesContainer(title: 'Uncertainty', imagecode: 'images/123.jpeg'),
                      CategoriesContainer(title: 'Dealing with Changes',  imagecode: 'images/123.jpeg'),

                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CategoriesContainer(title: 'Loneliness',  imagecode: 'images/123.jpeg'),
                      CategoriesContainer(title: 'Breakup', imagecode: 'images/123.jpeg'),
                      CategoriesContainer(title: 'Toxic Relationships',  imagecode: 'images/123.jpeg'),
                      CategoriesContainer(title: 'Dealing with Anxiety',  imagecode: 'images/123.jpeg'),
                      CategoriesContainer(title: 'Social Anxiety',  imagecode: 'images/123.jpeg'),
                    ],
                  ),
                ],
              )
          ),
        ),
        CategoriesText(heading: 'Inspiration'),
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Container(
              padding: EdgeInsets.only(left: 30,right: 30,top: 10,bottom: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CategoriesContainer(title: 'Life',  imagecode: 'images/123.jpeg'),
                      CategoriesContainer(title: 'Funny',  imagecode: 'images/123.jpeg'),
                      CategoriesContainer(title: 'LGBT +',  imagecode: 'images/123.jpeg'),
                      CategoriesContainer(title: 'Wisdom', imagecode: 'images/123.jpeg'),


                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CategoriesContainer(title: 'Morning',  imagecode: 'images/123.jpeg'),
                      CategoriesContainer(title: 'Short Quotes', imagecode: 'images/123.jpeg'),
                      CategoriesContainer(title: 'Enjoy the Moment',  imagecode: 'images/123.jpeg'),
                    ],
                  ),
                ],
              )
          ),
        ),
        CategoriesText(heading: 'Mental Health'),
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Container(
              padding: EdgeInsets.only(left: 30,right: 30,top: 10,bottom: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CategoriesContainer(title: 'Depression', imagecode: 'images/123.jpeg'),
                      CategoriesContainer(title: 'Mood Disorder', imagecode: 'images/123.jpeg'),
                      CategoriesContainer(title: 'Addiction Disorder',  imagecode: 'images/123.jpeg'),
                      CategoriesContainer(title: 'Psychotic Disorder', imagecode: 'images/123.jpeg'),


                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CategoriesContainer(title: 'Dealing with Anxiety',  imagecode: 'images/123.jpeg'),
                      CategoriesContainer(title: 'Eating Disorder',  imagecode: 'images/123.jpeg'),
                      CategoriesContainer(title: 'PTSD',  imagecode: 'images/123.jpeg'),
                      CategoriesContainer(title: 'Autism Spectrum Disorder',  imagecode: 'images/123.jpeg'),
                    ],
                  ),
                ],
              )
          ),
        ),
        CategoriesText(heading: 'Work & Productivity'),
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Container(
              padding: EdgeInsets.only(left: 30,right: 30,top: 10,bottom: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CategoriesContainer(title: 'Success',  imagecode: 'images/123.jpeg'),
                      CategoriesContainer(title: 'Focus',  imagecode: 'images/123.jpeg'),
                      CategoriesContainer(title: 'Self-Discipline',  imagecode: 'images/123.jpeg'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CategoriesContainer(title: 'Perseverance',  imagecode: 'images/123.jpeg'),
                      CategoriesContainer(title: 'Study', imagecode: 'images/123.jpeg'),
                      CategoriesContainer(title: 'Before a Test',  imagecode: 'images/123.jpeg'),
                    ],
                  ),
                ],
              )
          ),
        ),

      ],
    );
  }
}
