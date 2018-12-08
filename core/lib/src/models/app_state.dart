// Khởi tạo dữ liệu mẫu cho AppState
import 'package:meta/meta.dart';

class AppState {
  final bool isLoading;

  AppState({@required this.isLoading });

  factory AppState.initial(){
    return AppState(
      isLoading: false,
    );
  }

  AppState copyWith({
    bool isLoading
  }){
    return AppState(
      isLoading: isLoading ?? this.isLoading
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || 
      other is AppState &&
        runtimeType == other.runtimeType &&
        isLoading == other.isLoading;

  @override
  int get hashCode =>
    isLoading.hashCode;
}