import "dart:async";
import "package:Wordnick/wordnik.dart";
import "package:unittest/unittest.dart";

void main(){
  
  testDefinitionRequest();
  testWordRequest();
  
}

void testDefinitionRequest(){
  group("test definition request",(){
  test("== operator",(){
    DefinitionRequest d1 = new DefinitionRequest("state");
    DefinitionRequest d2 = new DefinitionRequest("different");
    expect(d1,equals(d1));
    expect(d1,isNot(equals(d2)));
  });
  
  test("constructor",(){
    DefinitionRequest r1 = new DefinitionRequest("test",150,"noun",true,null,true,false);
    DefinitionRequest r2 = new DefinitionRequest("");
    r2.word = "test";
    r2.useCanonical = true;
    r2.limit = 150;
    r2.sourceDictionaries = new List<String>();
    r2.partOfSpeech = "noun";
    r2.includeRelated = true;
    r2.includeTags = false;
    expect(r1,equals(r2));
  });
  
  test("http params",(){
    DefinitionRequest r1 = new DefinitionRequest("test",150,"noun",true,null,true,false);
    String response = "limit=150&partOfSpeech=noun&includeRelated=true&useCanonical=true&includeTags=false";
    expect(r1.toParams(),equals(response));
  });
  });
}

void testWordRequest(){
  group("test word request",(){
  test("== operator",(){
    WordRequest w1 = new WordRequest("state");
    WordRequest w2 = new WordRequest("different");
    expect(w1,equals(w1));
    expect(w1,isNot(equals(w2)));
  });
  
  test("constructor",(){
    WordRequest r1 = new WordRequest("test",true,true);
    WordRequest r2 = new WordRequest("");
    r2.word = "test";
    r2.useCanonical = true;
    r2.includeSuggestions = true;
    expect(r1,equals(r2));
  });
  
  test("http params",(){
    WordRequest r1 = new WordRequest("test",true,false);
    String response = "useCanonical=true&includeSuggestions=false";
    expect(r1.toParams(),equals(response));
  });
  });
}
