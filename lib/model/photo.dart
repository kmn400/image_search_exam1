class Photo {
  final String previewURL;

  Photo({
    required this.previewURL,
  });

  Photo.fromMap(Map<String, dynamic> json) : previewURL = json['previewUrl'];

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      previewURL: json['previewURL'],
    );
  }

  @override
  String toString() {
    return 'Photo: $previewURL';
  }
}
