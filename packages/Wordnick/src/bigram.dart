library bigram;
import "results.dart";
import "dart:json";

class Bigram extends Results{
  int count;
  String gram1;
  String gram2;
  double wlmi;
  double mi;
  Bigram();
  Bigram.fromJson(dynamic json,[bool parsed=false]){
    dynamic data;
    if (parsed) data = json;
    else data = parse(json);
    this.count = getValueFor(data,"count");
    this.gram1 = getValueFor(data,"gram1");
    this.gram2 = getValueFor(data,"gram2");
    this.wlmi = getValueFor(data,"wlmi");
    this.mi = getValueFor(data,"mi");
  }
  
  List<dynamic> toValueList(){
    return [count,gram1,gram2,wlmi,mi];
  }
}

