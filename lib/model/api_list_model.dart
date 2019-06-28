class ApiList {
  final List<Api> apiList;

  ApiList({this.apiList});

  factory ApiList.fromJson(List<dynamic> json) {
    List<Api> list = new List<Api>();
    list = json.map((f) => Api.fromJson(f)).toList();
    return ApiList(
      apiList: list
    );
  }
}

class Api {
  final int index;
  final String title;
  final String url;

  Api({this.index, this.title, this.url});

  factory Api.fromJson(Map<String, dynamic> json) {
    return Api(
      index: json['index'],
      title: json['title'],
      url: json['url']
    );
  }

}