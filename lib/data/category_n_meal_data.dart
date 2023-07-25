import 'package:ranna_banna/model/category.dart';
import 'package:flutter/material.dart';
import 'package:ranna_banna/model/meal.dart';

const List<Category> categorylist = [
  Category(
    id: 'bd',
    title: 'বাংলাদেশি',
    color: Colors.lightGreen,
  ),
  Category(
    id: 'in',
    title: 'ভারতীয়',
    color: Colors.redAccent,
  ),
  Category(
    id: 'pk',
    title: 'পাকিস্তানি',
    color: Colors.lime,
  ),
  Category(
    id: 'ar',
    title: 'আরবীয়',
    color: Colors.cyan,
  ),
  Category(
    id: 'ch',
    title: 'চাইনিজ',
    color: Colors.deepPurple,
  ),
  Category(
    id: 'th',
    title: 'থাই',
    color: Colors.deepOrange,
  ),
  Category(
    id: 'it',
    title: 'ইতালিয়ান',
    color: Colors.red,
  ),
  Category(
    id: 'af',
    title: 'আফ্রিকান',
    color: Colors.green,
  ),
];

const List<Meal> mealList = [
  Meal(
    id: 'm1',
    affordability: Affordability.cheap,
    complexity: Complexity.hard,
    duration: 90,
    category: 'bd',
    title: 'গরুর মাংস ভুনা',
    imageUrl:
        'https://i0.wp.com/www.pepperdelight.com/wp-content/uploads/2016/05/pepper-delight-beef-curry-3.jpg',
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
    isHalal: true,
    isGlutenFree: true,
    isVegan: false,
    isVegetarian: false,
  ),
  Meal(
      id: 'm2',
      affordability: Affordability.affordable,
      complexity: Complexity.hard,
      duration: 50,
      category: 'bd',
      title: 'সর্ষে ইলিশ',
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/A_photo_of_popular_Bengali_dish_Sorshe_Ilish_served_traditionally.jpg/800px-A_photo_of_popular_Bengali_dish_Sorshe_Ilish_served_traditionally.jpg',
      ingradiants: [
        '৮ পিস ইলিশ। ডিম সহ দিতে পারেন আবার না ও দিতে পারেন।',
        '৪ টে চামচ পিয়াজ বাটা',
        '১ টে চামচ রসুন বাটা',
        '1/2 চা চামচ হলুদ গুড়া',
        '1/2 চা চামচ মরিচ গুড়া',
        '1/2 চা চামচ ধনিয়া গুড়া',
        '৬-৭ টা কাচামরিচ',
        '২ টে চামচ সরিষা বাটা',
        'পরিমান মত লবন',
        '২ টে চামচ সরিষার তেল।',
        'পরিমান মত পানি',
      ],
      steps: [
        'মাছ কেটে ধুয়ে পরিস্কার করে নিব।এবার চুলায় প্যান বসিয়ে তেল দিয়ে গরম করে নিব',
        'তারপর রসুন বাটা দিয়ে লালচে করে ভেজে নিয়ে তাতে পিয়াজ বাটা দিয়ে কসিয়ে নিব।দ্যান ১ কাপ গরম পানি দিয়ে এতে হলুদ মরিচ আর ধনিয়া গুড়া দিয়ে দিব।',
        'কম আচে ৪-৫ মিনিট রান্না করে নিয়ে এতে সরিষা বাটা আর কাচা মরিচ দিয়ে নেড়েছেড়ে ডেকে আরো ২ মিনিট রান্না করে নিব।',
        'এবার মাছ দিয়ে এক পাশ ২ মিনিট রান্না করে অপর পাশ ও ২ মিনিট রান্না করে পরিমান মত পানি দিয়ে দিব।',
        'ডেকে আরো ৫-৬ মিনিট রান্না করে নিব। হয়ে গেলে দারুন মজাদার সর্ষে ইলিশ।এবার পরিবেশন করুন পছন্দ মত।',
      ],
      isHalal: true,
      isGlutenFree: true,
      isVegan: false,
      isVegetarian: false),
];
