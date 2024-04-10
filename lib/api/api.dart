import 'package:get/get.dart';

class Api extends GetConnect {
  @override
  void onInit() {
    
    httpClient.baseUrl = 'https://stacked.com.ng/api';
  }
  // Get request
  Future<Response> getUser() {

    GetStorage box = GetStorage();

    String token = box.getData()

    return get('/profile', headers: {"Authorization": "Bearer ${token}"});
  }
  // Post request
  Future<Response> registerUser(Map data) => post('/register', body: data);

  Future<Response> loginUser(Map data) => post('/login', body: data);
}