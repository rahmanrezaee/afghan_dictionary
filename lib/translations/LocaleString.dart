import 'package:get/get.dart';

class LocaleString extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        //ENGLISH LANGUAGE
        'en': {
          'SearchPlaceholder': 'Search English, Pashto or Dari Word..',
          "HomePage": "Home Page",
          "RecentPage": "Recent Page",
          "FavoritePage": "Favorite Page",
          "DetailPage": "Detail Page",
          "Empty": "Empty",
          "FavoriteList": "Favorite List",
          "RecentList": "Recent List",
          "Aboutus": "About Us",
          "SelectLanguage": "Select Language",
          "AppName": "Afghan Dictionary",
          "ResultSearch": "Result Search",
        },
        //FARI LANGUAGE
        'fa': {
          'SearchPlaceholder': 'کلمات انگلیسی، پشتو یا دری را جستجو کنید',
          "HomePage": "صفحه اصلی",
          "RecentPage": "صفحه لیست اخیرا",
          "FavoritePage": "صفحه علاقمندان",
          "Empty": "خالی",
          "DetailPage": "جزییات",
          "FavoriteList": "لیست علاقمندان",
          "RecentList": "لیست اخیرا",
          "ResultSearch": "نتبجه جستجو",
          "Aboutus": "درمورد ما",
          "SelectLanguage": "انتخاب زبان",
          "AppName": "افغان دیکشنری",
        },
        //Pashto LANGUAGE
        'ps': {
          'SearchPlaceholder': 'انګلیسي، پښتو یا دري کلمې ولټوئ',
          "HomePage": "اصلی پانه",
          "RecentPage": "وروستیو پانه",
          "FavoritePage": "د مینه والو پاڼه",
          "Empty": "خالي",
          "ResultSearch": "د لټون پایلې",
          "DetailPage": "تفصیلات",
          "FavoriteList": "د خوښې لیست",
          "RecentList": "وروستیو کې لیست ",
          "Aboutus": "زموږ په اړه",
          "SelectLanguage": "د ژبې انتخاب",
          "AppName": "افغان قاموس",
        }
      };
}
