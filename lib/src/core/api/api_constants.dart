class ApiConstants {
  static const String baseUrl = "api.unsplash.com";

  /// Base API
  static String apiUnSplash = "/search/photos";

  // Headers
  static Map<String, String> headers = <String, String>{"Content-Type": "application/json"};
  static Map<String, String> defaultHeaders = <String, String>{
    "Authorization": "Client-ID q30wMHa3RlcdirvpxsuRJhPTaTkKUtiGrijhpARaHYU",
    "Content-Type": "application/json"
  };

  /// Params
  static Map<String, String> emptyParams() => <String, String>{};

  static Map<String, String> defaultParam() => <String, String>{
    "client_id": "q30wMHa3RlcdirvpxsuRJhPTaTkKUtiGrijhpARaHYU",
    "page": "1",
    "per_page": "10",
    "query": "nature",
  };

  /// body
  static Map<String, dynamic> bodyEmpty() => <String, dynamic>{};

  static Map<String, dynamic> bodyLoginUser({required String email, required String password}) =>
      <String, String>{"email": email, "password": password};
}
