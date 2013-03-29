library results;

import "dart:json";

class Results{
  
  dynamic getValueFor(dynamic json, String key,[dynamic defaultValue=null]){
    if (json!=null){
    if (json.containsKey(key)){
      return json[key];
    }else{
      return defaultValue;
    }
    }else
      return null;
  }
  
  Results();
  
  
  List<dynamic> toValueList(){
    return [];
  }
  
  operator ==(Results res){
    return stringify(this.toValueList())==stringify(res.toValueList());
  }
}

