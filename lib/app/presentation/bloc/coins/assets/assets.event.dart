import 'package:equatable/equatable.dart';

abstract class AssetsEvent extends Equatable {
  const AssetsEvent();
  @override
  List<Object?> get props => [];
}

class AssestEventInit extends AssetsEvent {
  const AssestEventInit({required this.currency, required this.showLoading});
  final String currency;
  final bool showLoading;
}

class AssestEventAddToFav extends AssetsEvent {
  const AssestEventAddToFav({required this.id, required this.index});
  final String id;
  final int index;
}

class AssestEventRemoveFromFav extends AssetsEvent {
  const AssestEventRemoveFromFav({required this.id, required this.index});
  final String id;
  final int index;
}
