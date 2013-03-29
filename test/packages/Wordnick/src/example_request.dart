library example_request;

class ExampleRequest{
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

