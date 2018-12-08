import 'package:intl/intl.dart';

class Messages {
  String get appName => Intl.message('inKino', name: 'appName');
  String get nowInTheaters => Intl.message(
        'Now in theaters',
        name: 'nowInTheaters',
      );
  String get showtimes => Intl.message(
        'Showtimes',
        name: 'showtimes',
      );
  String get comingSoon => Intl.message(
        'Coming soon',
        name: 'comingSoon',
      );
}
