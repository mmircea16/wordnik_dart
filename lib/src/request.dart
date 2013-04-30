library request;

/** TODO : modify toParams method in order not to send empty get values **/
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

class PronunciationRequest extends Request{
  String word;
  bool useCanonical;
  String sourceDictionary;
  String typeFormat;
  int limit;
  PronunciationRequest(this.word,[this.useCanonical=false, this.sourceDictionary="", this.typeFormat="", this.limit=50]);
  
  operator ==(PronunciationRequest req){
    return this.word==req.word&&this.useCanonical==req.useCanonical&&this.sourceDictionary==req.sourceDictionary&&this.typeFormat==req.typeFormat&&this.limit==req.limit;
  }
  
  String toParams(){
    return "useCanonical=${useCanonical}&sourceDictionary=${sourceDictionary}&typeFormat=${typeFormat}&limit=${limit}"; 
  }
}

class HyphenationRequest extends Request{
  String word;
  bool useCanonical;
  String sourceDictionary;
  int limit;
  HyphenationRequest(this.word,[this.useCanonical=false, this.sourceDictionary="",this.limit=50]);
  
  operator ==(HyphenationRequest req){
    return this.word==req.word&&this.useCanonical==req.useCanonical&&this.sourceDictionary==req.sourceDictionary&&this.limit==req.limit;
  }
  
  String toParams(){
    return "useCanonical=${useCanonical}&sourceDictionary=${sourceDictionary}&limit=${limit}"; 
  }
}

class FrequencyRequest extends Request{
  String word;
  bool useCanonical;
  int startYear;
  int endYear;
  FrequencyRequest(this.word,[this.useCanonical=false,this.startYear=1800, this.endYear=2012]);
  operator ==(FrequencyRequest req){
    return this.word==req.word&&this.useCanonical==req.useCanonical&&this.startYear==req.startYear&&this.endYear==req.endYear;
  }
  String toParams(){
    return "useCanonical=${useCanonical}&startYear=${startYear}&endYear=${endYear}";
  }
}

class PhrasesRequest extends Request{
  String word;
  bool useCanonical;
  int limit;
  int wlmi;
  PhrasesRequest(this.word,[this.useCanonical=false,this.limit=5,this.wlmi=0]);
  operator ==(PhrasesRequest req){
    return this.word==req.word&&this.limit==req.limit&&this.useCanonical==req.useCanonical&&this.wlmi==req.wlmi;
  }
  String toParams(){
    return "useCanonical=${useCanonical}&limit=${limit}&wlmi=${wlmi}";
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

class WordSearchRequest extends Request{
  String query;
  bool caseSensitive=true;
  String includePartOfSpeech="";
  String excludePartOfSpeech="";
  int minCorpusCount=5;
  int maxCorpusCount=-1;
  int minDictionaryCount=1;
  int maxDictionaryCount=-1;
  int minLength=1;
  int maxLength=-1;
  int skip=0;
  int limit=10;
  
  WordSearchRequest(this.query);
  
  String toParams(){
    String a = "caseSensitive=${caseSensitive}&includePartOfSpeech=${includePartOfSpeech}&excludePartOfSpeech=${excludePartOfSpeech}";
    String b = "minCorpusCount=${minCorpusCount}&maxCorpusCount=${maxCorpusCount}";
    String c = "minDictionaryCount=${minDictionaryCount}&maxDictionaryCount=${maxDictionaryCount}";
    String d = "minLength=${minLength}&maxLength=${maxLength}";
    return "${a}&${b}&${c}&${d}&skip=${skip}&limit=${limit}";
  }
}

class ReverseDictionaryRequest extends Request {
  String query;
  int limit = 10;
  ReverseDictionaryRequest(this.query,[this.limit=10]);
  String toParams(){
    return "query=${query}&limit=${limit}";
  }
}
