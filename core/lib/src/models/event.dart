import 'package:meta/meta.dart';

class EventImageData {
  final String portraitSmall;
  final String portraitMedium;
  final String portraitLarge;
  final String landscapeSmall;
  final String landscapeBig;
  final String landscapeHd;
  final String landscapeHd2;

  EventImageData(
      {@required this.portraitSmall,
      @required this.portraitMedium,
      @required this.portraitLarge,
      @required this.landscapeSmall,
      @required this.landscapeBig,
      @required this.landscapeHd,
      @required this.landscapeHd2
    });

  String get anyAvailableImage => 
    portraitSmall ?? 
    portraitMedium ?? 
    portraitLarge ??
    landscapeSmall ??
    landscapeBig ?? 
    landscapeHd;

  EventImageData.empty() 
    : portraitSmall = null,
      portraitMedium = null,
        portraitLarge = null,
        landscapeSmall = null,
        landscapeBig = null,
        landscapeHd = null,
        landscapeHd2 = null;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EventImageData &&
          runtimeType == other.runtimeType &&
          portraitSmall == other.portraitSmall &&
          portraitMedium == other.portraitMedium &&
          portraitLarge == other.portraitLarge &&
          landscapeSmall == other.landscapeSmall &&
          landscapeBig == other.landscapeBig &&
          landscapeHd == other.landscapeHd &&
          landscapeHd2 == other.landscapeHd2;

  @override
  int get hashCode =>
      portraitSmall.hashCode ^
      portraitMedium.hashCode ^
      portraitLarge.hashCode ^
      landscapeSmall.hashCode ^
      landscapeBig.hashCode ^
      landscapeHd.hashCode ^
      landscapeHd2.hashCode;
}
