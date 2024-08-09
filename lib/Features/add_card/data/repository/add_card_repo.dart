import 'package:store/Features/add_card/data/model/add_card_model.dart';
import 'package:store/Features/add_card/data/web_services/add_card_web_services.dart';

class AddCardRepository {
  final AddCardWebServices addCardWebServices;

  AddCardRepository(this.addCardWebServices);

  Future<AddCard?> addCard(AddCard card) async {
    try {
      final response = await addCardWebServices.addCard(card);
      if (response.isNotEmpty) {
        return AddCard.fromJson(response);
      }
    } catch (e) {
      print('Error: $e');
    }
    return null;
  }

  Future<AddCard?> getCard(int id) async {
    try {
      final response = await addCardWebServices.getCard(id);
      if (response.isNotEmpty) {
        return AddCard.fromJson(response);
      }
    } catch (e) {
      print('Error: $e');
    }
    return null;
  }
}
