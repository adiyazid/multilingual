class Comic {
  String language;
  String url;


  Comic({ required this.language, required this.url});

  static Comic fromMap(Map<String, dynamic> data) {
    try {
      return Comic(
        language: data['language'] ?? '',
        url: data['url'] ?? '',

      );
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Map<String, Object?> toMap() {
    return {
      'language': language,
      'url': url,
    };
  }
}
