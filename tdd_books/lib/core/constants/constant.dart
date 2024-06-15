class Constant {
  static const String base = "https://dapi.kakao.com/v3";
  static const Map<String, String> header = {
    "Authorization": "KakaoAK ceb72b2f0cb7b4614d30c220b76609bf",
  };
  static String bookSearchPath(String query) =>
      "$base/search/book?query=$query&size=1";
}
