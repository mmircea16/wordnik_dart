library word_object;

import "results.dart";
import "dart:json";


class WordObject extends Results{
  int id=0;
  String word;
  String originalWord;
  List<String> suggestions=[];
  String canonicalForm;
  String vulgar;
  
  WordObject(this.word);
  
  WordObject.fromJson(dynamic json,[bool isParsed=false]){
    dynamic data;
    if (isParsed) data = json;
    else data = parse(json);
    this.id =  getValueFor(data,"id",0);
    this.word =  getValueFor(data,"word");
    this.originalWord = getValueFor(data,"originalWord");
    this.canonicalForm = getValueFor(data,"canonicalForm");
    this.vulgar = getValueFor(data,"vulgar");
    this.suggestions = getValueFor(data,"suggestions",[]);
  }
 
  List<dynamic> toValueList(){
    return [id,word,canonicalForm,originalWord,vulgar,suggestions];
  }

}


