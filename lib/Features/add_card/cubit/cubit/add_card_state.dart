import 'package:meta/meta.dart';
import 'package:store/Features/add_card/data/model/add_card_model.dart';

@immutable
sealed class AddCardState {}

final class AddCardInitial extends AddCardState {}

final class AddCardLoading extends AddCardState {}

final class AddCardLoaded extends AddCardState {
  final AddCard card;
  AddCardLoaded(this.card);
}

final class AddCardError extends AddCardState {
  final String errorMessage;
  AddCardError(this.errorMessage);
}
