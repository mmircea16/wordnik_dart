library definition_request;

class DefinitionRequest{
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

