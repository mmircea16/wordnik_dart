library example_search_results;

import "results.dart";
import "dart:json";


class ExampleSearchResults extends Results{
  List<Facet> facets;
  List<Example> examples;
  ExampleSearchResults();
  ExampleSearchResults.fromJson(dynamic json,[bool isParsed=false]){
    dynamic data;
    if (isParsed) data = json;
    else data = parse(json);
    
    List<dynamic> list1 = getValueFor(data,"facets");
    if(list1!=null) this.facets = list1.map((data){return new Facet.fromJson(data, true);}).toList();
    
    List<dynamic> list2 = getValueFor(data,"examples");
    if(list2!=null) this.examples = list2.map((data){return new Example.fromJson(data, true);}).toList();
  }
  
  List<dynamic> toValueList(){
    List<dynamic> list1 = this.facets==null ? null : this.facets.map((data){return data.toValueList();}).toList();
    List<dynamic> list2 = this.examples==null ? null : this.examples.map((data){return data.toValueList();}).toList();
    return [list1,list2];
  }
}

class Facet extends Results{
  List<FacetValue> facetValues;
  String name;
  Facet();
  Facet.fromJson(dynamic json,[bool isParsed=false]){
    dynamic data;
    if (isParsed) data = json;
    else data = parse(json);
    this.name = getValueFor(data,"name");
    List<dynamic> list = getValueFor(data,"facetValues");
    this.facetValues = list.map((data){return new FacetValue.fromJson(data, true);}).toList();
  }
  
  List<dynamic> toValueList(){
    List<dynamic> list = this.facetValues==null ? null : this.facetValues.map((data){return data.toValueList();}).toList();
    return [name,list];
  }
  
}

class FacetValue extends Results{
  int count;
  String value;
  FacetValue();
  FacetValue.fromJson(dynamic json,[bool isParsed=false]){
    dynamic data;
    if (isParsed) data = json;
    else data = parse(json);
    this.value = getValueFor(data,"value");
    this.count = getValueFor(data,"count");
  }
  
  List<dynamic> toValueList(){
    return [count,value];
  }
}

class Example extends Results{
  int id=0;
  int exampleId=0;
  String title;
  String text;
  ScoreWord score;
  String word;
  ContentProvider provider;
  int year=0;
  double rating=0.0;
  int documentId=0;
  String url;
  Sentence sentence;
  Example();
  Example.fromJson(dynamic json,[bool isParsed=false]){
    dynamic data;
    if (isParsed) data = json;
    else data = parse(json);
    this.id = getValueFor(data,"id",0);
    this.exampleId = getValueFor(data,"exampleId",0);
    this.title = getValueFor(data,"title");
    this.text = getValueFor(data,"text");
    this.word = getValueFor(data,"word");
    this.year = getValueFor(data,"year",0);
    this.rating = getValueFor(data,"rating",0.0);
    this.documentId = getValueFor(data,"documentId",0);
    this.url = getValueFor(data,"url");
    
    this.sentence = getValueFor(data,"sentence")!=null?new Sentence.fromJson(getValueFor(data,"sentence"),true):null;
    this.provider = getValueFor(data,"provider")!=null?new ContentProvider.fromJson(getValueFor(data,"provider"),true):null;
    this.score = getValueFor(data,"score")!=null?new ScoreWord.fromJson(getValueFor(data,"score"),true):null;
    
    
  }
  
  List<dynamic> toValueList(){
    List<dynamic> list = [id,word,exampleId,title,text,year,rating,documentId,url];
    if (this.sentence!=null) list.add(this.sentence.toValueList());
    else list.add(null);
    if (this.provider!=null) list.add(this.provider.toValueList());
    else list.add(null);
    if (this.score!=null) list.add(this.score.toValueList());
    else list.add(null);
    return list;
  }
  
}

class ScoreWord extends Results{
  int position=0;
  int id=0;
  int docTermCount=0;
  String lemma;
  String wordType;
  double score=0.0;
  int sentenceId=0;
  String word;
  bool stopword;
  double baseWordScore=0.0;
  String partOfSpeech;
  ScoreWord();
  ScoreWord.fromJson(dynamic json,[bool isParsed=false]){
    
    var data ;
    if (isParsed) data = json;
    else data = parse(json);
    this.position = getValueFor(data,"position",0);
    this.id = getValueFor(data,"id",0);
    this.docTermCount = getValueFor(data,"docTermCount",0);
    this.lemma = getValueFor(data,"lemma");
    this.wordType = getValueFor(data,"wordType");
    this.score = getValueFor(data,"score",0.0);
    this.sentenceId = getValueFor(data,"sentenceId",0);
    this.word = getValueFor(data,"word");
    this.stopword = getValueFor(data,"stopword");
    this.baseWordScore = getValueFor(data,"baseWordScore",0.0);
    this.partOfSpeech = getValueFor(data,"partOfSpeech");
    
  }
  
  List<dynamic> toValueList(){
    return [position,id,docTermCount,lemma,wordType,score,sentenceId,word,stopword,baseWordScore,partOfSpeech];
  }
}

class ContentProvider extends Results{
  int id;
  String name;
  ContentProvider();
  ContentProvider.fromJson(dynamic json,[bool isParsed=false]){
    
    var data ;
    if (isParsed) data = json;
    else data = parse(json);
    this.id = getValueFor(data,"id");
    this.name = getValueFor(data,"name");
  }
  
  List<dynamic> toValueList(){
    return [id,name];
  }
}

class Sentence extends Results{
  bool hasScoredWords;
  int id=0;
  List<ScoreWord> scoredWords;
  String display;
  int rating=0;
  int documentMetadataId=0;
  Sentence();
  Sentence.fromJson(dynamic json,[bool isParsed=false]){
    
    var data ;
    if (isParsed) data = json;
    else data = parse(json);
    this.hasScoredWords = getValueFor(data,"hasScoredWords");
    this.id = getValueFor(data,"id",0);
    this.display = getValueFor(data,"display");
    this.rating = getValueFor(data,"rating",0);
    this.documentMetadataId = getValueFor(data,"documentMetadataId",0);
    List<dynamic> list = getValueFor(data,"scoredWords");
    this.scoredWords = list.map((data){return new ScoreWord.fromJson(data, true);}).toList();
  }
  
  List<dynamic> toValueList(){
    List<dynamic> list = this.scoredWords==null ? null : this.scoredWords.map((data){return data.toValueList();}).toList();
    return [hasScoredWords,id,display,rating,documentMetadataId,list];
  }
  
}