import 'package:delivery/data/repository/user_repo.dart';
import 'package:delivery/models/response_model.dart';
import 'package:delivery/models/user_model.dart';
import 'package:get/get.dart';

class UserController extends GetxController implements GetxService {
  final UserRepo userRepo;
  UserController({
    required this.userRepo,
  });
  bool _isLoading = false;
  late UserModel _userModel;

  bool get isLoading => _isLoading;
  UserModel get userModel => _userModel;

  Future<ResponseModel> getUserInfo() async {
    Response response = await userRepo.getUserInfo();
    late ResponseModel responseModel;
    print('test' + response.body.toString());
    // log('Response Status Code: ${response.statusCode}');
    // log('Response Body: ${response.body}');
    if (response.statusCode == 200) {
      _userModel = UserModel.fromJson(response.body);
      _isLoading = true;
      responseModel = ResponseModel(true, "Successfully");
    } else {
      print('did not get');
      responseModel = ResponseModel(false, response.statusText!);
    }

    update();
    return responseModel;
  }
}
