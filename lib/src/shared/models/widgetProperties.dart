class WidgetProperties{
  String key,value;
  WidgetProperties(this.key,this.value);
  factory WidgetProperties.fromMap(Map<String,dynamic>? json){
    if(json==null){
      return WidgetProperties("", "");
    }
    else{
      return WidgetProperties(json["key"], json["value"]);
    }
  }
  toJson() {
    return {
      "key": key,
      "value": value
    };
  }
}