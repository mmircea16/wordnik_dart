import "dart:async";
import "package:Wordnick/wordnik.dart";
import "package:unittest/unittest.dart";

void main(){
  
  testDefinitionRequest();
  testWordRequest();
  testPronunciationRequest();
  /** TODO : add test hyphenation request **/
}

void testPronunciationRequest(){
  group("test pronunciation request",(){
  test("== operator",(){
    PronunciationRequest r1 = new PronunciationRequest("state");
    PronunciationRequest r2 = new PronunciationRequest("different");
    expect(r1,equals(r1));
    expect(r1,isNot(equals(r2)));
  });
  
  test("constructor",(){
    PronunciationRequest r1 = new PronunciationRequest("test",false,"abc","def",30);
    PronunciationRequest r2 = new PronunciationRequest("");
    r2.word = "test";
    r2.useCanonical = false;
    r2.limit = 30;
    r2.sourceDictionary = "abc";
    r2.typeFormat = "def";
    expect(r1,equals(r2));
  });
  
  test("http params",(){
    PronunciationRequest r1 = new PronunciationRequest("test",false,"abc","def",30);
    String response = "useCanonical=false&sourceDictionary=abc&typeFormat=def&limit=30";
    expect(r1.toParams(),equals(response));
  });
  });
}

void testRelatedWordsRequest(){
  group("test related words request",(){
  test("== operator",(){
    RelatedWordsRequest r1 = new RelatedWordsRequest("state");
    RelatedWordsRequest r2 = new RelatedWordsRequest("different");
    expect(r1,equals(r1));
    expect(r1,isNot(equals(r2)));
  });
  
  test("constructor",(){
    RelatedWordsRequest r1 = new RelatedWordsRequest("test",false,"synonym",12);
    RelatedWordsRequest r2 = new RelatedWordsRequest("");
    r2.word = "test";
    r2.useCanonical = false;
    r2.limitPerRelationshipType = 12;
    r2.relationshipType = "synonym";
    expect(r1,equals(r2));
  });
  
  test("http params",(){
    RelatedWordsRequest r1 = new RelatedWordsRequest("test",false,"synonym",12);
    String response = "useCanonical=false&relationshipTypes=synonym&limitPerRelationshipType=12";
    expect(r1.toParams(),equals(response));
  });
  });
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
