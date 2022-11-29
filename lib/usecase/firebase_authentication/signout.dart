
import 'package:market/utility/firebase_authentication.dart';

Future SignOut() async{  
  await Firebase_AuthenticationApp().getAuthentication().signOut();
}