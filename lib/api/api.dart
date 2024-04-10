import 'package:get/get.dart';

class Api extends GetConnect {
  @override
  void onInit() {
    
    httpClient.baseUrl = 'https://stacked.com.ng/api';
  }
  
  Future<Response> getUser() {

    GetStorage box = GetStorage();

    String token = box.getData()

    return get('/profile', headers: {

      "Authorization": "Bearer ${token}"
    });
  }
  // Post request
  Future<Response> registerUser(Map data, MultipartFile image) {

    return post('/register', FormData({
      
      'file': image, 'data': data,
    }));
  }

  Future<Response> loginUser(Map data) => post('/login', body: data);
}