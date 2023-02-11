class TermsModel {
  TermsModel({
    this.code,
    this.data,
  });

  String? code;
  Data? data;

  factory TermsModel.fromJson(Map<String, dynamic> json) => TermsModel(
        code: json["code"],
        data: Data.fromJson(json["data"]),
      );
}

class Data {
  Data({
    this.terms,
  });

  String? terms;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        terms: json["Terms"],
      );
}
