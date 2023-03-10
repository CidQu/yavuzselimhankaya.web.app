import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['tr', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? trText = '',
    String? enText = '',
  }) =>
      [trText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // HomePage
  {
    'bg92o6zt': {
      'tr': 'Merhabalar ben',
      'en': 'Hi! My name is',
    },
    'ttx8f010': {
      'tr': 'Yavuz.',
      'en': 'Yavuz.',
    },
    '5cgdjxcq': {
      'tr': 'Projelerim',
      'en': 'My Projects',
    },
    'hycapxu8': {
      'tr': 'Bana Ula????n',
      'en': 'Contact Me',
    },
    'wo5c0tg5': {
      'tr': 'Hakk??mda',
      'en': 'About Me',
    },
    'cjtv0znp': {
      'tr': 'CV',
      'en': 'CV',
    },
    'uw17kshp': {
      'tr': '??evirilerim',
      'en': 'My Translations',
    },
    '1yt7wnc6': {
      'tr': 'Translate To English',
      'en': 'Translate To English',
    },
    's3hev5mf': {
      'tr': 'EN',
      'en': 'EN',
    },
    'skw8dv8v': {
      'tr': 'T??rk??eye  ??evir',
      'en': 'T??rk??eye  ??evir',
    },
    'aartz4p3': {
      'tr': 'TR',
      'en': 'TR',
    },
    'g06i7tjj': {
      'tr': 'Merhabalar ben',
      'en': 'Hi! My name is',
    },
    'cbh60458': {
      'tr': 'Yavuz.',
      'en': 'Yavuz.',
    },
    '4lisv3q4': {
      'tr': 'Projelerim',
      'en': 'My Projects',
    },
    'det7ffep': {
      'tr': 'Bana Ula????n',
      'en': 'Contact Me',
    },
    'z21zqwfj': {
      'tr': 'Hakk??mda',
      'en': 'About Me',
    },
    '58pqj9z5': {
      'tr': 'CV',
      'en': 'CV',
    },
    '0gpontm1': {
      'tr': '??evirilerim',
      'en': 'My Translations',
    },
    'j38ian55': {
      'tr': 'Translate To English',
      'en': 'Translate To English',
    },
    'nzmyv52m': {
      'tr': 'EN',
      'en': 'EN',
    },
    'yqujenjy': {
      'tr': 'T??rk??eye  ??evir',
      'en': 'T??rk??eye  ??evir',
    },
    'vonf5axr': {
      'tr': 'TR',
      'en': 'TR',
    },
    '2md6j0g0': {
      'tr': 'Home',
      'en': 'Home',
    },
  },
  // hakkimda
  {
    'mt2hlzom': {
      'tr': 'Hakk??mda',
      'en': 'About Me',
    },
    'setyazit': {
      'tr': 'Yavuz Selimhan Kaya',
      'en': 'Yavuz Selimhan Kaya',
    },
    'cd1xhwkf': {
      'tr': 'Hakk??mda',
      'en': 'About Me',
    },
    'jgps29lv': {
      'tr':
          'Ben Yavuz, e??er siteyi g??ncellemeyi unutmad??ysam ??u an 11.s??n??fa gidiyorum. Bilgisayarlarla a??inal??????m k??????kl??????mden geliyor. Yaz??l??m konusunda kendimi geli??tirmeye Lise Haz??rl??kta ba??lad??m. ??nce k??????k projeler ile daha sonras??nda ise kendi geli??tirdi??im oyun ile at??ld??????m maceram ??u anda ??ok ayr?? bir boyut ald??. ??lgilerimin farkl?? y??nlerde oldu??unu anlad??m.\n\n',
      'en':
          'I\'m Yavuz, if I haven\'t forgotten to update the site, I\'m currently going to the 11th grade. My familiarity with computers comes from my childhood. I started to develop myself in software in High School Preparatory. First with small projects, and then with the game I developed myself, my adventure has now taken a very different dimension. I realised that my interests are in different directions.\n\n',
    },
    'dfs6xie4': {
      'tr': 'Flutter',
      'en': 'Flutter',
    },
    'ytgauwc5': {
      'tr':
          '9.s??n??fta T??bitak projesi olarak uygulama tasarlamak i??in Flutter ile tan????t??m. ??ncelikle internetteki haz??r templateler ile bir uygulama geli??tirdim. Daha sonras??nda T??bitak ile i??im bitince uygulamay?? en ba??tan Firestore ile olu??turmaya ba??lad??m. Daha sonras??nda kendimi geli??tirip birden fazla Flutter uygulamas??n?? App Store ve Google Play\'de yay??nlad??m. ??u anda bu g??r??nt??ledi??iniz websitesi Flutter ??zerinden olu??turuldu! Ayn?? zamanda t??m oyun yama setuplar??m??n tamam?? da Flutter ??zerinden olu??turuldu! Her ge??en g??n kendimi bu mavi ekibe daha da ait hissediyorum. ????\n\n',
      'en':
          'In 9th grade, I met Flutter to design an application as a T??bitak project. First of all, I developed an application with ready-made templates on the internet. Later, when I was done with T??bitak, I started to create the application from the beginning with Firestore. Later, I improved myself and published more than one Flutter application on the App Store and Google Play. The website you are viewing right now was created on Flutter! At the same time, all of my game patch setups were created on Flutter! Every day I feel more and more belonging to this blue team ????\n\n',
    },
    'cvf0cnw0': {
      'tr': '??evirmenlik',
      'en': 'Translation',
    },
    'lgyonbfu': {
      'tr':
          '2021 y??l??nda yeni sat??n alm???? oldu??um video oyununda T??rk??e dil deste??i olmamas?? sebebi ile kendimi oyun yama platforlar??nda buldum. Daha sonras??nda ilk bana verilen g??rev olarak Dishonored: Death Of The Outsider projesinde ??evirmen olarak yer ald??m. Bu s??re??te ??ok zevk ald??????mdan dolay?? ayn?? ??irketin yeni ????kartm???? oldu??u \"DEATHLOOP\" oyunun ??evirisini kendim ??stlendim ve bir ekip olu??turarak s??f??rdan ??eviri yapmaya ba??lad??k. Sonras??nda Sunset Overdrive, Demon Slayer gibi daha b??y??k i??lere giri??tim. ??u anda kendi forumum ve Discordum ??zerinden ??al????malara devam ediyoruz! ceviri.cidqu.net\n\n',
      'en':
          'In 2021, I found myself on game patch platforms due to the lack of Turkish language support in the video game I had just purchased. Afterwards, I took part as a Translator in the Dishonored: Death Of The Outsider project as the first task given to me. Since I enjoyed this process very much, I undertook the translation of the \"DEATHLOOP\" game, which was recently released by the same company, and we started translating from scratch by creating a team. Afterwards, I embarked on bigger works such as Sunset Overdrive, Demon Slayer. We are currently continuing to work on my own forum and Discord! ceviri.cidqu.net\n\n',
    },
    'qqj12m2q': {
      'tr': 'Reverse Engineering',
      'en': 'Reverse Engineering',
    },
    't5rpvvi1': {
      'tr':
          '??eviri heyecan??m??n ilerlemesi ile beraber kendimi b??y??k bir problemin i??erisinde buldum. Oyunlar??n dil dosyalar??n?? a??mak, d??zenlemek ve sonras??nda oyun geri aktarmak ??ok b??y??k bir problemdi. Bunun i??in ??st d??zey yaz??l??m bilgisi gerekiyordu. Zenhax ve Xentax forumlar??nda ??o??u ki??i yard??m etse de art??k kendimin bir yolunu bulmam gerekti??ini hissetmi??im. ??nternetteki bit ??ok kaynaktan ara??t??rmalar yaparak, Table Offset Pointer gibi temel bilgileri edindim. Daha sonras??nda Lucy, h3x3r gibi anonim kullan??c??lar sayesinde kendimi e??itim alan??n??n ortas??nda bulmu??tum. 2 Y??l?? a??k??nd??r devam eden bu denemeler sayesinde art??k dosyalar?? ??zellikle oyunlar?? Reverse Engineering methodlar?? ile a??may?? d??zenlemeyi ????rendim. Kendi geli??tirdi??im ilk ara?? Plague Tale Requiem Font Arac?? oldu. Daha sonras??nda hem GitHub ??zerinde hem de ??zel bir ??ekilde ??ok??a ara?? geli??tirerek ????renimime devam ettim ve hala etmekteyim.\n\n',
      'en':
          'As my translation excitement progressed, I found myself in a big problem. Opening, editing and then transferring the language files of the games back to the game was a huge problem. High level software knowledge was required for this. Although many people helped me in Zenhax and Xentax forums, I felt that I had to find a way myself. By doing research from many sources on the internet, I acquired basic knowledge such as Table Offset Pointer. Later, thanks to anonymous users such as Lucy, h3x3r, I found myself in the middle of the education field. After more than 2 years of these experiments, I have learnt to open and edit files, especially games, with Reverse Engineering methods. The first tool I developed myself was the Plague Tale Requiem Font Tool. Afterwards, I continued my learning by developing a lot of tools both on GitHub and privately, and I am still continuing.\n\n',
    },
    'nbyw1ysk': {
      'tr': 'FRC, VRC ve TEKNOFEST',
      'en': 'FRC, VRC ve TEKNOFEST',
    },
    'ci17rimo': {
      'tr':
          '2022 Y??l??n??n Mart ay??nda FRC ??stanbul Regional Turnuvas??nda kat??ld??k, yaz??l??m kaptanl??????n?? ??stendi??im turnuvada ??ampiyon olup Houston\'daki b??y??k finale girmeye hak kazand??k! Hemen onun pe??ine girmi?? oldu??umuz VRC ??stanbul turnuvas??nda ise Finalist olup d??rt farkl?? ??zel ??d??l ile evimize geri d??nd??k. Ayn?? senenin Temmuz ay??nda T??B??TAK 2204-C Kutup Ara??t??rma Projelerinde Finale kald??k. Final Turnuvas?? i??in Giresun\'a gittik ve 3.l??k alarak evimize geri d??nd??k! Sonras??nda A??ustos ay??nda Rize\'de TEKNOFEST ??nsanl??k Yarar??na Teknoloji Finalinde en iyi 10 projeden biri se??ildik ve ayn?? ay i??erisinde ger??ekle??en T??rk??e Do??al Dil ????leme yar????mas??nda tak??m??mla birlikte T??rkiye 9.su olduk. Bu ba??ar??lar??n hepsini 2022 Eyl??l\'de TEKNOFEST KARADEN??Z\'de kutlad??k!\n\n',
      'en':
          'In March 2022, we participated in the FRC Istanbul Regional Tournament, where I was the software captain, we became the champion and qualified for the grand final in Houston! In the VRC Istanbul tournament, which we entered right after that, we became Finalists and returned home with four different special awards. In July of the same year, we made it to the Final in T??B??TAK 2204-C Polar Research Projects. We went to Giresun for the Final Tournament and returned home with 3rd place! Afterwards, we were selected as one of the top 10 projects in the TEKNOFEST Technology for the Benefit of Humanity Final in Rize in August, and we became the 9th in Turkey with my team in the Turkish Natural Language Processing competition held in the same month. We celebrated all of these achievements at TEKNOFEST KARADENIZ in September 2022!\n\n',
    },
    'f7tj702i': {
      'tr': 'Foto??raflar',
      'en': 'Photos',
    },
    '3osfjnqt': {
      'tr': 'Yavuz Selimhan Kaya',
      'en': 'Yavuz Selimhan Kaya',
    },
    'hkqn9hhs': {
      'tr': 'Hakk??mda',
      'en': 'About Me',
    },
    'nkoz6oa0': {
      'tr':
          'Ben Yavuz, e??er siteyi g??ncellemeyi unutmad??ysam ??u an 11.s??n??fa gidiyorum. Bilgisayarlarla a??inal??????m k??????kl??????mden geliyor. Yaz??l??m konusunda kendimi geli??tirmeye Lise Haz??rl??kta ba??lad??m. ??nce k??????k projeler ile daha sonras??nda ise kendi geli??tirdi??im oyun ile at??ld??????m maceram ??u anda ??ok ayr?? bir boyut ald??. ??lgilerimin farkl?? y??nlerde oldu??unu anlad??m.\n\n',
      'en':
          'I\'m Yavuz, if I haven\'t forgotten to update the site, I\'m currently going to the 11th grade. My familiarity with computers comes from my childhood. I started to develop myself in software in High School Preparatory. First with small projects, and then with the game I developed myself, my adventure has now taken a very different dimension. I realised that my interests are in different directions.\n\n',
    },
    'jq0wg5ka': {
      'tr': 'Flutter',
      'en': 'Flutter',
    },
    '8jmupesb': {
      'tr':
          '9.s??n??fta T??bitak projesi olarak uygulama tasarlamak i??in Flutter ile tan????t??m. ??ncelikle internetteki haz??r templateler ile bir uygulama geli??tirdim. Daha sonras??nda T??bitak ile i??im bitince uygulamay?? en ba??tan Firestore ile olu??turmaya ba??lad??m. Daha sonras??nda kendimi geli??tirip birden fazla Flutter uygulamas??n?? App Store ve Google Play\'de yay??nlad??m. ??u anda bu g??r??nt??ledi??iniz websitesi Flutter ??zerinden olu??turuldu! Ayn?? zamanda t??m oyun yama setuplar??m??n tamam?? da Flutter ??zerinden olu??turuldu! Her ge??en g??n kendimi bu mavi ekibe daha da ait hissediyorum. ????\n\n',
      'en':
          'In 9th grade, I met Flutter to design an application as a T??bitak project. First of all, I developed an application with ready-made templates on the internet. Later, when I was done with T??bitak, I started to create the application from the beginning with Firestore. Later, I improved myself and published more than one Flutter application on the App Store and Google Play. The website you are viewing right now was created on Flutter! At the same time, all of my game patch setups were created on Flutter! Every day I feel more and more belonging to this blue team ????\n\n',
    },
    '6d5c1rgf': {
      'tr': '??evirmenlik',
      'en': 'Translation',
    },
    'sdawsa6p': {
      'tr':
          '2021 y??l??nda yeni sat??n alm???? oldu??um video oyununda T??rk??e dil deste??i olmamas?? sebebi ile kendimi oyun yama platforlar??nda buldum. Daha sonras??nda ilk bana verilen g??rev olarak Dishonored: Death Of The Outsider projesinde ??evirmen olarak yer ald??m. Bu s??re??te ??ok zevk ald??????mdan dolay?? ayn?? ??irketin yeni ????kartm???? oldu??u \"DEATHLOOP\" oyunun ??evirisini kendim ??stlendim ve bir ekip olu??turarak s??f??rdan ??eviri yapmaya ba??lad??k. Sonras??nda Sunset Overdrive, Demon Slayer gibi daha b??y??k i??lere giri??tim. ??u anda kendi forumum ve Discordum ??zerinden ??al????malara devam ediyoruz! ceviri.cidqu.net\n\n',
      'en':
          'In 2021, I found myself on game patch platforms due to the lack of Turkish language support in the video game I had just purchased. Afterwards, I took part as a Translator in the Dishonored: Death Of The Outsider project as the first task given to me. Since I enjoyed this process very much, I undertook the translation of the \"DEATHLOOP\" game, which was recently released by the same company, and we started translating from scratch by creating a team. Afterwards, I embarked on bigger works such as Sunset Overdrive, Demon Slayer. We are currently continuing to work on my own forum and Discord! ceviri.cidqu.net\n\n',
    },
    'f3bq3tkq': {
      'tr': 'Reverse Engineering',
      'en': 'Reverse Engineering',
    },
    'gtk9npf8': {
      'tr':
          '??eviri heyecan??m??n ilerlemesi ile beraber kendimi b??y??k bir problemin i??erisinde buldum. Oyunlar??n dil dosyalar??n?? a??mak, d??zenlemek ve sonras??nda oyun geri aktarmak ??ok b??y??k bir problemdi. Bunun i??in ??st d??zey yaz??l??m bilgisi gerekiyordu. Zenhax ve Xentax forumlar??nda ??o??u ki??i yard??m etse de art??k kendimin bir yolunu bulmam gerekti??ini hissetmi??im. ??nternetteki bit ??ok kaynaktan ara??t??rmalar yaparak, Table Offset Pointer gibi temel bilgileri edindim. Daha sonras??nda Lucy, h3x3r gibi anonim kullan??c??lar sayesinde kendimi e??itim alan??n??n ortas??nda bulmu??tum. 2 Y??l?? a??k??nd??r devam eden bu denemeler sayesinde art??k dosyalar?? ??zellikle oyunlar?? Reverse Engineering methodlar?? ile a??may?? d??zenlemeyi ????rendim. Kendi geli??tirdi??im ilk ara?? Plague Tale Requiem Font Arac?? oldu. Daha sonras??nda hem GitHub ??zerinde hem de ??zel bir ??ekilde ??ok??a ara?? geli??tirerek ????renimime devam ettim ve hala etmekteyim.\n\n',
      'en':
          'As my translation excitement progressed, I found myself in a big problem. Opening, editing and then transferring the language files of the games back to the game was a huge problem. High level software knowledge was required for this. Although many people helped me in Zenhax and Xentax forums, I felt that I had to find a way myself. By doing research from many sources on the internet, I acquired basic knowledge such as Table Offset Pointer. Later, thanks to anonymous users such as Lucy, h3x3r, I found myself in the middle of the education field. After more than 2 years of these experiments, I have learnt to open and edit files, especially games, with Reverse Engineering methods. The first tool I developed myself was the Plague Tale Requiem Font Tool. Afterwards, I continued my learning by developing a lot of tools both on GitHub and privately, and I am still continuing.\n\n',
    },
    '2jcxiv35': {
      'tr': 'FRC, VRC ve TEKNOFEST',
      'en': 'FRC, VRC ve TEKNOFEST',
    },
    'ani3z53h': {
      'tr':
          '2022 Y??l??n??n Mart ay??nda FRC ??stanbul Regional Turnuvas??nda kat??ld??k, yaz??l??m kaptanl??????n?? ??stendi??im turnuvada ??ampiyon olup Houston\'daki b??y??k finale girmeye hak kazand??k! Hemen onun pe??ine girmi?? oldu??umuz VRC ??stanbul turnuvas??nda ise Finalist olup d??rt farkl?? ??zel ??d??l ile evimize geri d??nd??k. Ayn?? senenin Temmuz ay??nda T??B??TAK 2204-C Kutup Ara??t??rma Projelerinde Finale kald??k. Final Turnuvas?? i??in Giresun\'a gittik ve 3.l??k alarak evimize geri d??nd??k! Sonras??nda A??ustos ay??nda Rize\'de TEKNOFEST ??nsanl??k Yarar??na Teknoloji Finalinde en iyi 10 projeden biri se??ildik ve ayn?? ay i??erisinde ger??ekle??en T??rk??e Do??al Dil ????leme yar????mas??nda tak??m??mla birlikte T??rkiye 9.su olduk. Bu ba??ar??lar??n hepsini 2022 Eyl??l\'de TEKNOFEST KARADEN??Z\'de kutlad??k!\n\n',
      'en':
          'In March 2022, we participated in the FRC Istanbul Regional Tournament, where I was the software captain, we became the champion and qualified for the grand final in Houston! In the VRC Istanbul tournament, which we entered right after that, we became Finalists and returned home with four different special awards. In July of the same year, we made it to the Final in T??B??TAK 2204-C Polar Research Projects. We went to Giresun for the Final Tournament and returned home with 3rd place! Afterwards, we were selected as one of the top 10 projects in the TEKNOFEST Technology for the Benefit of Humanity Final in Rize in August, and we became the 9th in Turkey with my team in the Turkish Natural Language Processing competition held in the same month. We celebrated all of these achievements at TEKNOFEST KARADENIZ in September 2022!\n\n',
    },
    '3imr03js': {
      'tr': 'Foto??raflar',
      'en': 'Photos',
    },
    'ycmxdy2e': {
      'tr': 'Home',
      'en': 'Home',
    },
  },
  // bana_ulasin
  {
    'mjd9gzwp': {
      'tr': '??leti??im Formu!',
      'en': 'Contact Form!',
    },
    'cfcwav42': {
      'tr': '??sim',
      'en': 'Name',
    },
    '9lestbzd': {
      'tr': '??sim...',
      'en': 'Name...',
    },
    'jjusqpvz': {
      'tr': 'Konu',
      'en': 'Subject',
    },
    'jajvq1ng': {
      'tr': 'Konu...',
      'en': 'Subject...',
    },
    'zxwg38ot': {
      'tr': 'Mesaj',
      'en': 'Message',
    },
    'gd3t53b9': {
      'tr': '.',
      'en': '.',
    },
    'm5dq3bsw': {
      'tr': 'G??nder',
      'en': 'Sent',
    },
    't399n9yb': {
      'tr': 'Bana Ula????n',
      'en': 'Contact Me',
    },
    'svfbaxtv': {
      'tr': 'Home',
      'en': 'Home',
    },
  },
].reduce((a, b) => a..addAll(b));
