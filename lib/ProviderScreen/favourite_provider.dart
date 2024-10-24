import 'package:flutter/foundation.dart';
class FavouriteProvider with ChangeNotifier{
  List<int> _selectedItem = [];
  List<int> get selectedItem => _selectedItem;
  void addItem(int indexValue){
    selectedItem.add(indexValue);
    notifyListeners();
  }

  removeItem(int indexValue) {
    selectedItem.remove(indexValue);
    notifyListeners();
  }


}