import "dart:async";
import "package:Wordnick/wordnik.dart";
import "package:unittest/unittest.dart";

void main(){
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
}

