import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Api extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = 'https://stacked.com.ng/api';
  }

  Future<Response> getUser() async {
    GetStorage box = GetStorage();

    String token = box.read('user_token');

    return get('/profile', headers: {"Authorization": "Bearer ${token}"});
  }

  // Post request
  Future<Response> registerUser(Map data, MultipartFile image) {
    return post(
        '/register',
        FormData({
          'image': image,
          'data': data,
        }));
  }

  Future<Response> loginUser(Map data) => post('/login', data);
}
