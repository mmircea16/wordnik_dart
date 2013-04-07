library frequency;
import "results.dart";
import "dart:json";

class Frequency extends Results{
  int count;
  int year;
  Frequency();
  Frequency.fromJson(dynamic json,[bool parsed=false]){
    dynamic data;
    if (parsed) data = json;
    else data = parse(json);
    this.count = getValueFor(data,"count");
    this.year = getValueFor(data,"year");
  }
  
  List<dynamic> toValueList(){
    return [count,year];
  }
}

class FrequencySummary extends Results{
  int unknownYearCount;
  int totalCount;
  String frequencyString;
  String word;
  List<Frequency> frequency;
  FrequencySummary();
  FrequencySummary.fromJson(dynamic json,[bool parsed=false]){
    dynamic data;
    if (parsed) data = json;
    else data = parse(json);
    this.unknownYearCount = getValueFor(data,"unknownYearCount");
    this.totalCount = getValueFor(data,"totalCount");
    this.frequencyString = getValueFor(data,"frequencyString");
    this.word = getValueFor(data,"word");
    List<dynamic> list = getValueFor(data,"frequency");
    if (list==null) this.frequency = null;
    else this.frequency = list.map((data)=>new Frequency.fromJson(data, true)).toList();
  }
  
  List<dynamic> toValueList(){
    List<dynamic> list = this.frequency==null ? null : this.frequency.map((data)=>data.toValueList()).toList();
    return [unknownYearCount,totalCount,frequencyString,word,list];
  }
  
}

