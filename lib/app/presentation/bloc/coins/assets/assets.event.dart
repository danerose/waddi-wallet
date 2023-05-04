import 'package:equatable/equatable.dart';

abstract class AssetsEvent extends Equatable {
  const AssetsEvent();
  @override
  List<Object?> get props => [];
}

class AssestEventInit extends AssetsEvent {
  const AssestEventInit({required this.currency});
  final String currency;
}
