import 'package:flutter/widgets.dart';

import '../controller/auth_controller.dart';
import '../data/models/api_response.dart';
import '../data/models/user_model.dart';
import '../data/service/api_caller.dart';
import '../utils/urls.dart';

class AuthProvider extends ChangeNotifier{
  bool isLoading = false;
  String ? errorMessage;


  void setLoading(bool value){
    isLoading = value;
    notifyListeners();
  }


  Future<bool>login(String email, String password) async {
    setLoading(true);
    final ApiResponse response =await ApiCaller.postRequest(URL: TMUrls.LoginURL,
        body: {
          "email":email,
          "password":password
        }
    );

    setLoading(false);

    if(response.isSuccess){
      UserModel model = UserModel.fromJson(response.responseData['data']);
      String token = response.responseData['token'];

      AuthController.saveUserData(model, token);
      return true;

    }else{
    return false;

    }
  }

}