library definition;
import "results.dart";
import "dart:json";

class Definition extends Results{
  String extendedText;
  String text;
  String sourceDictionary;
  List<Citation> citations;
  List<Label> labels;
  double score=0.0;
  List<ExampleUsage> exampleUses;
  String attributionUrl;
  String seqString;
  String attributionText;
  List<Related> relatedWords;
  String sequence;
  String word;
  List<Note> notes;
  List<TextPron> textProns;
  String partOfSpeech;
  
  Definition();
  Definition.fromJson(dynamic json,[bool isParsed=false]){
    dynamic data;
    if (isParsed) data = json;
    else data = parse(json);
    this.extendedText = getValueFor(data,"extendedText");
    this.text = getValueFor(data,"text");
    this.sourceDictionary = getValueFor(data,"sourceDictionary");
    this.score = getValueFor(data,"score");
    this.seqString = getValueFor(data,"seqString");
    this.attributionUrl = getValueFor(data,"attributionUrl");
    this.attributionText = getValueFor(data,"attributionText");
    this.sequence = getValueFor(data,"sequence");
    this.word = getValueFor(data,"word");
    this.partOfSpeech = getValueFor(data,"partOfSpeech");
    
    List<dynamic> list = getValueFor(data,"citations");
    if (list!=null) this.citations = list.map((val){return new Citation.fromJson(val,true);}).toList();
    else this.citations= null;
    
    list = getValueFor(data,"labels");
    if (list!=null) this.labels = list.map((val){return new Label.fromJson(val,true);}).toList();
    else this.labels = null;
    
    list = getValueFor(data,"exampleUses");
    if (list!=null) this.exampleUses = list.map((val){return new ExampleUsage.fromJson(val,true);}).toList();
    else this.exampleUses = null;
    
    list = getValueFor(data,"relatedWords");
    if (list!=null) this.relatedWords = list.map((val){return new Related.fromJson(val,true);}).toList();
    else this.related = null;
    
    list = getValueFor(data,"notes");
    if (list!=null) this.notes = list.map((val){return new Note.fromJson(val,true);}).toList();
    else this.notes = null;
    
    list = getValueFor(data,"textProns");
    if (list!=null) this.textProns = list.map((val){return new TextPron.fromJson(val,true);}).toList();
    else this.textProns = null;
  }
  
  List<dynamic> toValueList(){
    List<dynamic> list = [extendedText,text,sourceDictionary,score,seqString,attributionUrl,attributionText,sequence,word,partOfSpeech];
    List<dynamic> list1 = this.labels==null ? null : this.labels.map((data){return data.toValueList();}).toList();
    List<dynamic> list2 = this.exampleUses==null ? null : this.exampleUses.map((data){return data.toValueList();}).toList();
    List<dynamic> list3 = this.relatedWords==null ? null : this.relatedWords.map((data){return data.toValueList();}).toList();
    List<dynamic> list4 = this.citations==null ? null : this.citations.map((data){return data.toValueList();}).toList();
    List<dynamic> list5 = this.notes==null ? null : this.notes.map((data){return data.toValueList();}).toList();
    List<dynamic> list6 = this.textProns==null ? null : this.textProns.map((data){return data.toValueList();}).toList();
    
    list.add(list1);
    list.add(list2);
    list.add(list3);
    list.add(list4);
    list.add(list5);
    list.add(list6);
    
    return list;
  }
}

class TextPron extends Results{
  String raw;
  int seq;
  String rawType;
  TextPron();
  TextPron.fromJson(dynamic json,[bool parsed=false]){
    dynamic data;
    if (isParsed) data = json;
    else data = parse(json);
    this.raw = getValueFor(data,"raw");
    this.seq = getValueFor(data,"seq");
    this.rawType = getValueFor(data,"rawType");
  }
  
  List<dynamic> toValueList(){
    return [raw,seq,rawType];
  }
}

class Note extends Results{
  String noteType;
  List<String> appliesTo;
  String value;
  int pos;
  Note();
  Note.fromJson(dynamic json,[bool parsed=false]){
    dynamic data;
    if (isParsed) data = json;
    else data = parse(json);
    this.noteType = getValueFor(data,"noteType");
    this.value = getValueFor(data,"value");
    this.pos = getValueFor(data,"pos");
    this.appliesTo = getValueFor(data,"appliesTo"); 
  }
  
  List<dynamic> toValueList(){
    return [noteType,value,pos,appliesTo];
  }
}

class Related extends Results{
  String label1;
  String relationshipType;
  String label2;
  String label3;
  List<String> words;
  String gram;
  String label4;
  Related();
  Related.fromJson(dynamic json,[bool parsed=false]){
    dynamic data;
    if (isParsed) data = json;
    else data = parse(json);
    this.label1 = getValueFor(data,"label1");
    this.label2 = getValueFor(data,"label2");
    this.label3 = getValueFor(data,"label3");
    this.label4 = getValueFor(data,"label4");
    this.gram = getValueFor(data,"gram");
    this.relationshipType = getValueFor(data,"relationshipType");
    this.words = getValueFor(data,"words");
  }
  
  List<dynamic> toValueList(){
    return [label1,label2,label3,label4,gram,relationshipType,words];
  }
}

class ExampleUsage extends Results{
  String text;
  ExampleUsage();
  ExampleUsage.fromJson(dynamic json,[bool parsed=false]){
    dynamic data;
    if (isParsed) data = json;
    else data = parse(json);
    this.text = getValueFor(data,"text");
  }
  
  List<dynamic> toValueList(){
    return [text];
  }
  
}

class Label extends Results{
  String type;
  String label;
  Label();
  Label.fromJson(dynamic json,[bool parsed=false]){
    dynamic data;
    if (isParsed) data = json;
    else data = parse(json);
    this.label = getValueFor(data,"label");
    this.type = getValueFor(data,"type");
  }
  
  List<dynamic> toValueList(){
    return [type,label];
  }
}

class Citation extends Results{
  String cite;
  String source;
  Citation();
  Citation.fromJson(dynamic json,[bool parsed=false]){
    dynamic data;
    if (isParsed) data = json;
    else data = parse(json);
    this.cite = getValueFor(data,"cite");
    this.source = getValueFor(data,"source");
  }
  
  List<dynamic> toValueList(){
    return [cite,source];
  }
}
