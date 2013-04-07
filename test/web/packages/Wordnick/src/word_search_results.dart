library wordsearchresults;

import "results.dart";
import "dart:json";

class WordSearchResult extends Results{
  int count;
  double lexicality;
  String word;
  WordSearchResult();
  WordSearchResult.fromJson(dynamic json,[bool parsed=false]){
    dynamic data;
    if (parsed) data = json;
    else data = parse(json);
    this.count = getValueFor(data,"count");
    this.lexicality = getValueFor(data,"lexicality");
    this.word = getValueFor(data,"word");
  }
  
  List<dynamic> toValueList(){
    return [count,lexicality,word];
  }
}

class WordSearchResults extends Results{
  int totalResults;
  List<WordSearchResult> searchResults;
  WordSearchResults();
  WordSearchResults.fromJson(dynamic json,[bool parsed=false]){
    dynamic data;
    if (parsed) data = json;
    else data = parse(json);
    this.totalResults = getValueFor(data,"totalResults");
    List<dynamic> list = getValueFor(data,"searchResults");
    if (list==null) this.searchResults = null;
    else this.searchResults = list.map((data)=>new WordSearchResult.fromJson(data,true)).toList();
  }
  List<dynamic> toValueList(){
    List<dynamic> list = this.searchResults == null ? null : this.searchResults.map((data)=> data.toValueList()).toList();
    return [totalResults,list];
  }
}
