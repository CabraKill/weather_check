import 'package:equatable/equatable.dart';

abstract class HomePageState extends Equatable {
  final bool locationVisible;
  @override
  List<Object> get props => [
        locationVisible,
      ];
  const HomePageState({
    required this.locationVisible,
  });

  HomePageState copyWith({
    bool? locationVisible,
  });
}
