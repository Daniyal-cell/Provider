import 'package:flutter/foundation.dart';
class CountProvider with ChangeNotifier{
int _count = 50 ;
// we create a getter here
int get count =>_count;
void setCount(){
  _count++;
  notifyListeners();
}
}
//Change Notifier is Used For Globally Context