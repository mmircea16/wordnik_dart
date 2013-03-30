library request;

class Request{
  Request();
  String toParams(){
    return "";
  }
}

class RelatedWordsRequest{
  /** TODO : transform relationshipType to List<String> **/
  String word;
  bool useCanonical;
  String relationshipType;
  int limitPerRelationshipType;
  RelatedWordsRequest(this.word,[this.useCanonical=false,this.relationshipType="",this.limitPerRelationshipType=10]);
  
  String toParams(){
    return "useCanonical=${useCanonical}&relationshipTypes=${relationshipType}&limitPerRelationshipType=${limitPerRelationshipType}";
  }
  
  operator ==(RelatedWordsRequest req){
    return this.word==req.word&&this.useCanonical==req.useCanonical&&this.relationshipType==req.relationshipType&&this.limitPerRelationshipType==req.limitPerRelationshipType;
  }
}

class DefinitionRequest extends Request{
  String word;
  int limit;
  String partOfSpeech;
  bool includeRelated;
  List<String> sourceDictionaries;
  bool useCanonical;
  bool includeTags;
  
  DefinitionRequest(this.word,[this.limit=200, this.partOfSpeech="", this.includeRelated=false, this.sourceDictionaries=null,this.useCanonical=false,this.includeTags=false]){
    if (this.sourceDictionaries==null) this.sourceDictionaries=new List<String>();
  }
  
  String toParams(){
    String dicts = sourceDictionaries.join(",");
    String a = sourceDictionaries.length==0? "" : "sourceDictionaries=${dicts}&";
    return "${a}limit=${limit}&partOfSpeech=${partOfSpeech}&includeRelated=${includeRelated}&useCanonical=${useCanonical}&includeTags=${includeTags}";
  }
  
  operator ==(DefinitionRequest req){
    return word==req.word&&toParams()==req.toParams();
  }
  
}

class WordRequest extends Request{
  String word;
  bool useCanonical;
  bool includeSuggestions;
  
  WordRequest(this.word,[bool this.useCanonical=false, bool this.includeSuggestions=true]);
  
  operator ==(WordRequest req){
    return (this.word == req.word)&&(this.useCanonical==req.useCanonical)&&(this.includeSuggestions==req.includeSuggestions);
  }
  
  String toParams(){
    return "useCanonical=${this.useCanonical}&includeSuggestions=${this.includeSuggestions}";
  }
}

class ExampleRequest extends Request{
  String word;
  bool includeDuplicates=false;
  bool useCanonical=false;
  int skip=0;
  int limit=5;
  ExampleRequest(this.word,[this.includeDuplicates=false, this.useCanonical=false, this.skip=0, this.limit=5]);
  
  operator ==(ExampleRequest req){
    return this.word==req.word&&this.includeDuplicates==req.includeDuplicates&&this.useCanonical==req.useCanonical&&this.skip==req.skip&&this.limit==req.limit;
  }
  
  String toParams(){
    return "includeDuplicates=${this.includeDuplicates}&useCanonical=${this.useCanonical}&skip=${this.skip}&limit=${this.limit}";
  }
}

