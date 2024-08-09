import 'package:bloc/bloc.dart';
import 'package:store/Features/add_card/cubit/cubit/add_card_state.dart';
import 'package:store/Features/add_card/data/model/add_card_model.dart';
import 'package:store/Features/add_card/data/repository/add_card_repo.dart';


class AddCardCubit extends Cubit<AddCardState> {
  final AddCardRepository addCardRepository;

  AddCardCubit({required this.addCardRepository}) : super(AddCardInitial());

  void addCard(AddCard card) async {
    try {
      emit(AddCardLoading());
      final response = await addCardRepository.addCard(card);
      if (response != null) {
        emit(AddCardLoaded(response));
      } else {
        emit(AddCardError('Failed to add card'));
      }
    } catch (e) {
      emit(AddCardError('An error occurred: $e'));
    }
  }

  void getCard(int id) async {
    try {
      emit(AddCardLoading());
      final response = await addCardRepository.getCard(id);
      if (response != null) {
        emit(AddCardLoaded(response));
      } else {
        emit(AddCardError('Failed to fetch card'));
      }
    } catch (e) {
      emit(AddCardError('An error occurred: $e'));
    }
  }
}
