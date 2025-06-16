// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Hello`
  String get hello {
    return Intl.message(
      'Hello',
      name: 'hello',
      desc: '',
      args: [],
    );
  }

  /// `Welcome customer!`
  String get welcomeCustomer {
    return Intl.message(
      'Welcome customer!',
      name: 'welcomeCustomer',
      desc: '',
      args: [],
    );
  }

  /// `Please provide your name and phone number so we can serve you better!`
  String get pleaseProvideNamePhone {
    return Intl.message(
      'Please provide your name and phone number so we can serve you better!',
      name: 'pleaseProvideNamePhone',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Your name`
  String get yourName {
    return Intl.message(
      'Your name',
      name: 'yourName',
      desc: '',
      args: [],
    );
  }

  /// `Phone number`
  String get phone {
    return Intl.message(
      'Phone number',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Your phone number`
  String get yourPhone {
    return Intl.message(
      'Your phone number',
      name: 'yourPhone',
      desc: '',
      args: [],
    );
  }

  /// `Start ordering`
  String get startOrder {
    return Intl.message(
      'Start ordering',
      name: 'startOrder',
      desc: '',
      args: [],
    );
  }

  /// `Powered by`
  String get poweredBy {
    return Intl.message(
      'Powered by',
      name: 'poweredBy',
      desc: '',
      args: [],
    );
  }

  /// `Tiếng Việt`
  String get vietnamese {
    return Intl.message(
      'Tiếng Việt',
      name: 'vietnamese',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Morning`
  String get morning {
    return Intl.message(
      'Morning',
      name: 'morning',
      desc: '',
      args: [],
    );
  }

  /// `Afternoon`
  String get afternoon {
    return Intl.message(
      'Afternoon',
      name: 'afternoon',
      desc: '',
      args: [],
    );
  }

  /// `Evening`
  String get evening {
    return Intl.message(
      'Evening',
      name: 'evening',
      desc: '',
      args: [],
    );
  }

  /// `Good morning`
  String get goodMorning {
    return Intl.message(
      'Good morning',
      name: 'goodMorning',
      desc: '',
      args: [],
    );
  }

  /// `Good afternoon`
  String get goodAfternoon {
    return Intl.message(
      'Good afternoon',
      name: 'goodAfternoon',
      desc: '',
      args: [],
    );
  }

  /// `Good evening`
  String get goodEvening {
    return Intl.message(
      'Good evening',
      name: 'goodEvening',
      desc: '',
      args: [],
    );
  }

  /// `You are sitting at`
  String get youAreSitAt {
    return Intl.message(
      'You are sitting at',
      name: 'youAreSitAt',
      desc: '',
      args: [],
    );
  }

  /// `Call payment`
  String get callPayment {
    return Intl.message(
      'Call payment',
      name: 'callPayment',
      desc: '',
      args: [],
    );
  }

  /// `Call employee`
  String get callEmployee {
    return Intl.message(
      'Call employee',
      name: 'callEmployee',
      desc: '',
      args: [],
    );
  }

  /// `Order food here`
  String get orderFoodHear {
    return Intl.message(
      'Order food here',
      name: 'orderFoodHear',
      desc: '',
      args: [],
    );
  }

  /// `All category`
  String get allCategory {
    return Intl.message(
      'All category',
      name: 'allCategory',
      desc: '',
      args: [],
    );
  }

  /// `View all`
  String get viewAll {
    return Intl.message(
      'View all',
      name: 'viewAll',
      desc: '',
      args: [],
    );
  }

  /// `From`
  String get priceFrom {
    return Intl.message(
      'From',
      name: 'priceFrom',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `View more product`
  String get viewMoreProduct {
    return Intl.message(
      'View more product',
      name: 'viewMoreProduct',
      desc: '',
      args: [],
    );
  }

  /// `Detail`
  String get detail {
    return Intl.message(
      'Detail',
      name: 'detail',
      desc: '',
      args: [],
    );
  }

  /// `Component`
  String get component {
    return Intl.message(
      'Component',
      name: 'component',
      desc: '',
      args: [],
    );
  }

  /// `Extra`
  String get extra {
    return Intl.message(
      'Extra',
      name: 'extra',
      desc: '',
      args: [],
    );
  }

  /// `Add to cart`
  String get addToCart {
    return Intl.message(
      'Add to cart',
      name: 'addToCart',
      desc: '',
      args: [],
    );
  }

  /// `My cart`
  String get myCart {
    return Intl.message(
      'My cart',
      name: 'myCart',
      desc: '',
      args: [],
    );
  }

  /// `Order list`
  String get orderList {
    return Intl.message(
      'Order list',
      name: 'orderList',
      desc: '',
      args: [],
    );
  }

  /// `Order history`
  String get orderHistory {
    return Intl.message(
      'Order history',
      name: 'orderHistory',
      desc: '',
      args: [],
    );
  }

  /// `Add note`
  String get addNote {
    return Intl.message(
      'Add note',
      name: 'addNote',
      desc: '',
      args: [],
    );
  }

  /// `Dish list`
  String get dishList {
    return Intl.message(
      'Dish list',
      name: 'dishList',
      desc: '',
      args: [],
    );
  }

  /// `Total amount`
  String get totalAmount {
    return Intl.message(
      'Total amount',
      name: 'totalAmount',
      desc: '',
      args: [],
    );
  }

  /// `Add dish`
  String get addDish {
    return Intl.message(
      'Add dish',
      name: 'addDish',
      desc: '',
      args: [],
    );
  }

  /// `Request order`
  String get requestOrder {
    return Intl.message(
      'Request order',
      name: 'requestOrder',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Input note`
  String get inputNote {
    return Intl.message(
      'Input note',
      name: 'inputNote',
      desc: '',
      args: [],
    );
  }

  /// `Note`
  String get note {
    return Intl.message(
      'Note',
      name: 'note',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get back {
    return Intl.message(
      'Back',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `Hi`
  String get hi {
    return Intl.message(
      'Hi',
      name: 'hi',
      desc: '',
      args: [],
    );
  }

  /// `You are sitting at`
  String get youAreSittingAt {
    return Intl.message(
      'You are sitting at',
      name: 'youAreSittingAt',
      desc: '',
      args: [],
    );
  }

  /// `Order more`
  String get orderMore {
    return Intl.message(
      'Order more',
      name: 'orderMore',
      desc: '',
      args: [],
    );
  }

  /// `Priority process`
  String get priorityProcess {
    return Intl.message(
      'Priority process',
      name: 'priorityProcess',
      desc: '',
      args: [],
    );
  }

  /// `Payment request`
  String get paymentRequest {
    return Intl.message(
      'Payment request',
      name: 'paymentRequest',
      desc: '',
      args: [],
    );
  }

  /// `Payment information`
  String get paymentInfo {
    return Intl.message(
      'Payment information',
      name: 'paymentInfo',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get total {
    return Intl.message(
      'Total',
      name: 'total',
      desc: '',
      args: [],
    );
  }

  /// `Tax`
  String get tax {
    return Intl.message(
      'Tax',
      name: 'tax',
      desc: '',
      args: [],
    );
  }

  /// `Please input`
  String get pleaseInput {
    return Intl.message(
      'Please input',
      name: 'pleaseInput',
      desc: '',
      args: [],
    );
  }

  /// `No extra available`
  String get noExtraAvailable {
    return Intl.message(
      'No extra available',
      name: 'noExtraAvailable',
      desc: '',
      args: [],
    );
  }

  /// `No component available`
  String get noComponentAvailable {
    return Intl.message(
      'No component available',
      name: 'noComponentAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Added to cart successfully`
  String get addToCartSuccess {
    return Intl.message(
      'Added to cart successfully',
      name: 'addToCartSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Table`
  String get table {
    return Intl.message(
      'Table',
      name: 'table',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get close {
    return Intl.message(
      'Close',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Remove item`
  String get removeItem {
    return Intl.message(
      'Remove item',
      name: 'removeItem',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to remove this item from the cart?`
  String get removeItemConfirm {
    return Intl.message(
      'Are you sure you want to remove this item from the cart?',
      name: 'removeItemConfirm',
      desc: '',
      args: [],
    );
  }

  /// `Item deleted successfully`
  String get itemDeletedSuccessfully {
    return Intl.message(
      'Item deleted successfully',
      name: 'itemDeletedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Request order successfully`
  String get requestOrderSuccess {
    return Intl.message(
      'Request order successfully',
      name: 'requestOrderSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Retail customers cannot view order history`
  String get retailCustomerCannotViewHistory {
    return Intl.message(
      'Retail customers cannot view order history',
      name: 'retailCustomerCannotViewHistory',
      desc: '',
      args: [],
    );
  }

  /// `No note`
  String get noNote {
    return Intl.message(
      'No note',
      name: 'noNote',
      desc: '',
      args: [],
    );
  }

  /// `Your request has been sent successfully and will be processed shortly.`
  String get sendRequestSuccess {
    return Intl.message(
      'Your request has been sent successfully and will be processed shortly.',
      name: 'sendRequestSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Continue ordering`
  String get continueOrder {
    return Intl.message(
      'Continue ordering',
      name: 'continueOrder',
      desc: '',
      args: [],
    );
  }

  /// `Dishes order`
  String get dishesOrder {
    return Intl.message(
      'Dishes order',
      name: 'dishesOrder',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'vi'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
