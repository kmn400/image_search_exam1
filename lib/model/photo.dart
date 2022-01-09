class Photo {
  final String previewURL;

  Photo({
    required this.previewURL,
  });

  Photo.fromMap(Map<String, dynamic> json) : previewURL = json['previewURL'];

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      previewURL: json['previewURL'],
    );
  }
}
