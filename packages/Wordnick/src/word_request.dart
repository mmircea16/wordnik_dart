library word_request;

class WordRequest{
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

