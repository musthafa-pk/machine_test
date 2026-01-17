class BannerModel {
  final int id;
  final int linkType;
  final String linkValue;
  final String image;
  final String? video;
  final String title;
  final String subTitle;
  final String buttonText;
  final String? logo;

  BannerModel({
    required this.id,
    required this.linkType,
    required this.linkValue,
    required this.image,
    this.video,
    required this.title,
    required this.subTitle,
    required this.buttonText,
    this.logo,
  });

  factory BannerModel.fromJson(Map<String, dynamic> json) {
    return BannerModel(
      id: json['id'] ?? 0,
      linkType: json['link_type'] ?? 0,
      linkValue: json['link_value'] ?? '',
      image: json['image'] ?? '',
      video: json['video'],
      title: json['title'] ?? '',
      subTitle: json['sub_title'] ?? '',
      buttonText: json['button_text'] ?? '',
      logo: json['logo'],
    );
  }
}
