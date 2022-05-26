class FieldModel {
  String type;
  String value;
  String name;
  bool optional;
  FieldModel(this.name,this.type,{this.value="",this.optional=true});
  factory FieldModel.fromJson(Map<String,dynamic>? field){
    if(field==null){
      return FieldModel("test", "text");
    }
    return FieldModel(field["name"], field["type"],value:field["value"],optional: field["optional"] );
  }

  toJson(){
    return{
      "name":name,
      "type":type,
      "value":value,
      "optional":optional
    };
  }
}