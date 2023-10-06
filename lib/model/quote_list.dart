import 'package:flutter/material.dart';
import 'package:reflectly/model/task.dart';

class QuoteList extends ChangeNotifier {

  List<Task> quotes = [
    Task(quote: 'The only limit to our realization of tomorrow will be our doubts of today.', name: 'Franklin D. Roosevelt'),
    Task(quote: 'In the end, we will remember not the words of our enemies, but the silence of our friends.', name: 'Martin Luther King Jr'),
    Task(quote: 'To be yourself in a world that is constantly trying to make you something else is the greatest accomplishment.', name: 'Ralph Waldo Emerson'),
    Task(quote: 'The only way to achieve the impossible is to believe it is possible.', name: 'Charles Kingsleigh '),
    Task(quote: 'The greatest glory in living lies not in never falling, but in rising every time we fall.', name: 'Nelson Mandela'),
    Task(quote: 'Success is not final, failure is not fatal: It is the courage to continue that counts.', name: 'Winston S. Churchill'),

  ];




}