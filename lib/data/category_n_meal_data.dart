import 'package:ranna_banna/model/category.dart';
import 'package:flutter/material.dart';
import 'package:ranna_banna/model/meal.dart';

const List<Category> categorylist = [
  Category(
    id: 'c1',
    title: 'বাংলাদেশি',
    color: Colors.lightGreen,
  ),
  Category(
    id: 'c2',
    title: 'ভারতীয়',
    color: Colors.redAccent,
  ),
  Category(
    id: 'c3',
    title: 'পাকিস্তানি',
    color: Colors.lime,
  ),
  Category(
    id: 'c4',
    title: 'আরবীয়',
    color: Colors.cyan,
  ),
  Category(
    id: 'c5',
    title: 'চাইনিজ',
    color: Colors.deepPurple,
  ),
  Category(
    id: 'c6',
    title: 'থাই',
    color: Colors.deepOrange,
  ),
  Category(
    id: 'c7',
    title: 'ইতালিয়ান',
    color: Colors.red,
  ),
  Category(
    id: 'c8',
    title: 'আফ্রিকান',
    color: Colors.green,
  ),
];

const List<Meal> mealList = [
  Meal(
    id: 'm1',
    affordability: Affordability.cheap,
    filter: Filter.halal,
    category: 'c1',
    title: 'গরুর মাংস ভুনা',
    imageUrl:
        'https://www.dailyjanakantha.com/media/imgAll/2023May/%E0%A6%95%E0%A6%BE%E0%A6%B2%E0%A6%BE-%E0%A6%AD%E0%A7%81%E0%A6%A8%E0%A6%BE-2306281142.jpg',
    ingradiants: [
      '2 কেজি রান্না করা গরুর মাংস',
      '3 টি পেয়াজ রিং করে কাটা',
      '2 টে চামচ আদা কুচি',
      '2 টে চামচ রসুন কোয়া',
      '10 টি শুকনা মরিচ ভাজা',
      '1/2 কাপ সরিষার তেল',
      'গরুর কালা ভুনা মসলা পেকেট এর অর্ধেক পেকেট',
      '1/2 কাপ পেয়াজ বেরেস্তা',
    ],
    steps: [
      'মাংস সিদ্ধ হয়ে পানি শুকিয়ে গেলে,,,একটি পেন এ সরিষার তেল,আদা,রসুন কোয়া লাল করে ভেজে নিব',
      'তারপর রান্না করা মাংস ও শুকনা মরিচ,কালা ভুনা মসলা ও পেয়াজ রিং দিয়ে নেরেচেরে দিব ঢেকে দিব কিছুক্ষন',
      'ঢাকনা সরিয়ে নেরেচেেরে দিব যতক্ষন না মাংসের গায়ের পানি না শুকাবে ততক্ষন নেরেচেরে ভাজা ভাজা করে নিব সবশেষে পেয়াজ বেরেস্তা দিয়ে মিশিয়ে নামাব',
    ],
  ),
];
