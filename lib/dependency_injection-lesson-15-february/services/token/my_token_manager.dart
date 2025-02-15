class MyTokenManager extends TokenService {
  MyTokenManager() {
    print('Token manager created');
  }

  @override
  String getToken() => 'token';
}

abstract class TokenService {
  String getToken();
}
