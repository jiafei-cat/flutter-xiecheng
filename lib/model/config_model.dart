/// 配置项model
class ConfigModel {
  final String searchUrl;

  ConfigModel({ required this.searchUrl });

  factory ConfigModel.formJson(Map<String, dynamic> json) {
    return ConfigModel(searchUrl: json['searchUrl']);
  }

  Map<String, dynamic> toJson() {
    return { searchUrl: searchUrl };
  }
}
