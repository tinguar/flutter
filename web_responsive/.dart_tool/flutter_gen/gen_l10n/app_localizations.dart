import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen_l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es')
  ];

  /// No description provided for @hello.
  ///
  /// In en, this message translates to:
  /// **'Hello'**
  String get hello;

  /// No description provided for @country.
  ///
  /// In en, this message translates to:
  /// **'Country'**
  String get country;

  /// No description provided for @city.
  ///
  /// In en, this message translates to:
  /// **'City'**
  String get city;

  /// No description provided for @age.
  ///
  /// In en, this message translates to:
  /// **'Age'**
  String get age;

  /// No description provided for @skills.
  ///
  /// In en, this message translates to:
  /// **'Skills'**
  String get skills;

  /// No description provided for @coding.
  ///
  /// In en, this message translates to:
  /// **'Languages'**
  String get coding;

  /// No description provided for @knowledge.
  ///
  /// In en, this message translates to:
  /// **'Knowledge'**
  String get knowledge;

  /// No description provided for @presents.
  ///
  /// In en, this message translates to:
  /// **'Hi, I\'m Alberto Guaman.'**
  String get presents;

  /// No description provided for @customers.
  ///
  /// In en, this message translates to:
  /// **'Client  '**
  String get customers;

  /// No description provided for @designs.
  ///
  /// In en, this message translates to:
  /// **'Designs  '**
  String get designs;

  /// No description provided for @myProjects.
  ///
  /// In en, this message translates to:
  /// **'My jobs'**
  String get myProjects;

  /// No description provided for @recommendations.
  ///
  /// In en, this message translates to:
  /// **'Recommendations'**
  String get recommendations;

  /// No description provided for @privacys.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacys;

  /// No description provided for @wordPresEcommerce.
  ///
  /// In en, this message translates to:
  /// **'WordPress in Commerce'**
  String get wordPresEcommerce;

  /// No description provided for @quoteNow.
  ///
  /// In en, this message translates to:
  /// **'quote now'**
  String get quoteNow;

  /// No description provided for @linux.
  ///
  /// In en, this message translates to:
  /// **'Linux on Console'**
  String get linux;

  /// No description provided for @performed.
  ///
  /// In en, this message translates to:
  /// **'Performed '**
  String get performed;

  /// No description provided for @seeMore.
  ///
  /// In en, this message translates to:
  /// **'See more >>'**
  String get seeMore;

  /// No description provided for @madeWith.
  ///
  /// In en, this message translates to:
  /// **'Made with'**
  String get madeWith;

  /// No description provided for @recommendationAdrian.
  ///
  /// In en, this message translates to:
  /// **'Excellent service, an incredible experience when browsing due to its incredible modern design that adapts to the user and any device, I am totally satisfied and the experience and loading speed is fantastic, 100% commendable'**
  String get recommendationAdrian;

  /// No description provided for @recommendationAdrianSource.
  ///
  /// In en, this message translates to:
  /// **'Streaming Ec client.'**
  String get recommendationAdrianSource;

  /// No description provided for @recommendationAnthony.
  ///
  /// In en, this message translates to:
  /// **'I liked the work done because it met the specifications.'**
  String get recommendationAnthony;

  /// No description provided for @recommendationAnthonySource.
  ///
  /// In en, this message translates to:
  /// **'Network News Client (Ui/Ux)'**
  String get recommendationAnthonySource;

  /// No description provided for @recommendationDario.
  ///
  /// In en, this message translates to:
  /// **'The console application is well done, I recommend it.'**
  String get recommendationDario;

  /// No description provided for @recommendationDarioSource.
  ///
  /// In en, this message translates to:
  /// **'Console invoice client made with C++.'**
  String get recommendationDarioSource;

  /// No description provided for @projectStoreEc.
  ///
  /// In en, this message translates to:
  /// **'Web page made for a client, made with the purpose of showing the multiple streaming services offered.'**
  String get projectStoreEc;

  /// No description provided for @projectProjection.
  ///
  /// In en, this message translates to:
  /// **'Online store, with payment gateway... the store offers technological products from the USA.'**
  String get projectProjection;

  /// No description provided for @projectInoxHierro.
  ///
  /// In en, this message translates to:
  /// **'Web page made for a client, with an elegant design and with a global position, you look for it and you find it, works in steel, steel handrails, the result is the first.'**
  String get projectInoxHierro;

  /// No description provided for @projectAllCleanWays.
  ///
  /// In en, this message translates to:
  /// **'All Clean Ways, it is a company that offers home and office cleaning services in California. Its website provides detailed information about its services and features testimonials from satisfied customers. The company focuses on providing a reliable and high-quality cleaning service.'**
  String get projectAllCleanWays;

  /// No description provided for @projectLinterna.
  ///
  /// In en, this message translates to:
  /// **'Application for Ios and Android made with flutter, it is a flashlight tool with some features, blinking effect and timer.'**
  String get projectLinterna;

  /// No description provided for @footerText.
  ///
  /// In en, this message translates to:
  /// **' Make each day your masterpiece, tomorrow is uncertain. '**
  String get footerText;

  /// No description provided for @webSites.
  ///
  /// In en, this message translates to:
  /// **'websites'**
  String get webSites;

  /// No description provided for @movileApp.
  ///
  /// In en, this message translates to:
  /// **'mobile apps'**
  String get movileApp;

  /// No description provided for @flutterDart.
  ///
  /// In en, this message translates to:
  /// **'Flutter & Dart'**
  String get flutterDart;

  /// No description provided for @htmlCssJavaScript.
  ///
  /// In en, this message translates to:
  /// **'Html, Css & JavaScript'**
  String get htmlCssJavaScript;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'es': return AppLocalizationsEs();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
