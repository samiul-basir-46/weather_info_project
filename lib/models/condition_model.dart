class ConditionModel{
  final String text;
  final String icon;

  ConditionModel({
   required this.icon,
   required this.text
});

  factory ConditionModel.fromJson(Map<String, dynamic> json){
    return ConditionModel(icon: json['icon'], text: json['text']);
  }

}