import "dart:async";
import "package:Wordnick/wordnik.dart";
import "package:unittest/unittest.dart";


WordnikAPI api;

void main(){
  setup();

  testRandomWord();
  testWordOfTheDay();
  testRandomWords();
  testGetWordObject();
  testGetExamples();
  testGetDefinitions(); 
  testGetTopExample();
  testGetRelatedWords();
  testGetPronunciations();
  testGetHyphenation();
  testGetFrequency();
  testGetPhrases();
  testSearch();
}

void setup(){
  print("Hello Wordnik Test: Setup stage");
  api = new WordnikAPI("187b7605269b0c53bf65714c9a901203abe8587b53a397a0a");
}

void testSearch(){
  group("Search API call",(){
    WordSearchRequest req = new WordSearchRequest("cas");
    Future<WordSearchResults> response = api.search(req);
    test("check error",(){
      throwsA(response);
    });
    test("search for 'cas'",(){
      WordSearchResults wsr = new WordSearchResults.fromJson("{\"totalResults\":262,\"searchResults\":[{\"lexicality\":0.0,\"count\":2773,\"word\":\"cas\"},{\"lexicality\":0.0,\"count\":3355426,\"word\":\"case\"},{\"lexicality\":0.0,\"count\":1071847,\"word\":\"cases\"},{\"lexicality\":0.0,\"count\":1004816,\"word\":\"cash\"},{\"lexicality\":0.0,\"count\":615377,\"word\":\"cast\"},{\"lexicality\":0.0,\"count\":159363,\"word\":\"casino\"},{\"lexicality\":0.0,\"count\":124420,\"word\":\"casual\"},{\"lexicality\":0.0,\"count\":124143,\"word\":\"casting\"},{\"lexicality\":0.0,\"count\":117036,\"word\":\"castle\"},{\"lexicality\":0.0,\"count\":106348,\"word\":\"casualties\"},{\"lexicality\":0.0,\"count\":62052,\"word\":\"casinos\"}]}");
      expect(response,completion(equals(wsr)));
    }); 
  });
}

void testGetFrequency(){
  group("Get frequency API call",(){
    FrequencyRequest req = new FrequencyRequest("cat",false,1990,2013);
    Future<FrequencySummary> response = api.getFrequency(req);
    test("check error",(){
      throwsA(response);
    });
    test("check frequency for 'cat'",(){
      FrequencySummary fs = new FrequencySummary.fromJson("{\"word\":\"cat\",\"frequency\":[{\"year\":1990,\"count\":28},{\"year\":1991,\"count\":18},{\"year\":1992,\"count\":24},{\"year\":1993,\"count\":20},{\"year\":1994,\"count\":20},{\"year\":1995,\"count\":18},{\"year\":1996,\"count\":20},{\"year\":1997,\"count\":19},{\"year\":1998,\"count\":32},{\"year\":1999,\"count\":26},{\"year\":2000,\"count\":17},{\"year\":2001,\"count\":21},{\"year\":2002,\"count\":25},{\"year\":2003,\"count\":33},{\"year\":2004,\"count\":27},{\"year\":2005,\"count\":27},{\"year\":2006,\"count\":27},{\"year\":2007,\"count\":40},{\"year\":2008,\"count\":35},{\"year\":2009,\"count\":24},{\"year\":2010,\"count\":17},{\"year\":2011,\"count\":9},{\"year\":2012,\"count\":8}],\"unknownYearCount\":0,\"totalCount\":535}");
      expect(response,completion(equals(fs)));
    }); 
  });
}

void testGetPhrases(){
  group("Get phrases API call",(){
    PhrasesRequest req = new PhrasesRequest("cautious",false);
    req.limit = 3;
    Future<List<Bigram>> response = api.getPhrases(req);
    test("check error",(){
      throwsA(response);
    });
    test("check phrases for 'cautious'",(){
      Bigram b1 = new Bigram.fromJson("{\"mi\":11.746829478952076,\"gram1\":\"cautious\",\"gram2\":\"optimism\",\"wlmi\":16.91675448039439}");
      Bigram b2 = new Bigram.fromJson("{\"mi\":6.5066837159079505,\"gram1\":\"very\",\"gram2\":\"cautious\",\"wlmi\":14.529051528936405}");
      Bigram b3 = new Bigram.fromJson("{\"mi\":12.628566597332256,\"gram1\":\"cautious\",\"gram2\":\"risk-averse\",\"wlmi\":12.628566597332256}");
      List<Bigram> list = new List<Bigram>();
      list.add(b1);
      list.add(b2);
      list.add(b3);
      expect(response,completion(equals(list)));
    });
  });  
}

void testGetHyphenation(){
  group("Get hyphenation API call",(){
    HyphenationRequest req = new HyphenationRequest("cautious",false,"",10);
    Future<List<Syllabe>> response = api.getHyphenation(req);
    test("check error",(){
      throwsA(response);
    });
    test("check top example for 'cautious'",(){
      Syllabe s1 = new Syllabe.fromJson("{\"type\":\"stress\",\"seq\":0,\"text\":\"cau\"}");
      Syllabe s2 = new Syllabe.fromJson("{\"seq\":1,\"text\":\"tious\"}");
      List<Syllabe> list = new List<Syllabe>();
      list.add(s1);
      list.add(s2);
      expect(response,completion(equals(list)));
    });
  });  
}

void testGetPronunciations(){
  group("Get pronunciations API call",(){
    PronunciationRequest req = new PronunciationRequest("cautious",false,"","",2);
    Future<List<TextPron>> response = api.getPronunciations(req);
    test("check error",(){
      throwsA(response);
    });
    test("check top example for 'cautious'",(){
      
      TextPron tp1 = new TextPron.fromJson("{\"seq\":0,\"raw\":\"(kôˈshəs)\",\"rawType\":\"ahd-legacy\"}");
      TextPron tp2 = new TextPron.fromJson("{\"seq\":0,\"raw\":\"K AO1 SH AH0 S\",\"rawType\":\"arpabet\"}");
      List<TextPron> list = new List<TextPron>();
      list.add(tp1);
      list.add(tp2);
      expect(response,completion(equals(list)));
    });
  });  
}

void testGetRelatedWords(){
  group("Get related words API call",(){
    RelatedWordsRequest req = new RelatedWordsRequest("cautious",false,"antonym",2);
    Future<List<Related>> response = api.getRelatedWords(req);
    test("check error",(){
      throwsA(response);
    });
    test("check top example for 'cautious'",(){
      
      Related r1 = new Related.fromJson("{\"words\":[\"careless\",\"neglecting\"],\"relationshipType\":\"antonym\"}");
      List<Related> list = new List<Related>();
      list.add(r1);
      expect(response,completion(equals(list)));
    });
  });
}

void testGetTopExample(){
  group("Get top example API call",(){
    ExampleRequest req = new ExampleRequest("cat");
    Future<Example> response = api.getTopExample(req);
    test("check error",(){
      throwsA(response);
    });
    test("check top example for 'cat'",(){
      
      Example example = new Example.fromJson("{\"year\":1899,\"provider\":{\"name\":\"wordnik\",\"id\":711},\"url\":\"http://www.gutenberg.org/dirs/1/1/2/5/11251/11251-8.txt\",\"word\":\"cat\",\"text\":\"In a subsequent passage, \\\"I am as melancholy as a gibb'd cat\\\" -- we are told that _cat_ is not the domestic animal of that name, but a contraction of _catin_, a woman of the town.\",\"title\":\"Famous Reviews\",\"documentId\":18094183,\"exampleId\":1185868246,\"rating\":8939.131} ");
      expect(response,completion(equals(example)));
    });
  });
}

void testGetDefinitions(){
  group("Get definitions API call",(){
    DefinitionRequest req = new DefinitionRequest("cat");
    Future<List<Definition>> response = api.getDefinitions(req);
    test("check error",(){
      throwsA(response);
    });
    test("check response for 'cat'",(){
      
      Definition def = new Definition.fromJson("{\"textProns\":[],\"sourceDictionary\":\"ahd-legacy\",\"exampleUses\":[],\"relatedWords\":[],\"labels\":[],\"citations\":[],\"word\":\"cat\",\"text\":\"A small carnivorous mammal (Felis catus or F. domesticus) domesticated since early times as a catcher of rats and mice and as a pet and existing in several distinctive breeds and varieties.\",\"sequence\":\"0\",\"score\":0.0,\"partOfSpeech\":\"noun\",\"attributionText\":\"from The American Heritage® Dictionary of the English Language, 4th Edition\"}");
      expect(response,completion(someElement(equals(def))));
    });
  });
}

void testGetExamples(){
  group("Get examples API call",(){
    ExampleRequest req = new ExampleRequest("osteosarcoma");
    Future<ExampleSearchResults> response = api.getExamples(req);
    test("check error",(){
      throwsA(response);
    });
    test("check response for 'osteosarcoma'",(){
      
      ExampleSearchResults comp = new ExampleSearchResults.fromJson("{\"examples\":[{\"year\":2009,\"provider\":{\"name\":\"wordnik\",\"id\":711},\"url\":\"http://www.chop.edu/service/oncology/cancers-explained/bone-cancer-in-children.html\",\"word\":\"osteosarcoma\",\"text\":\"If osteosarcoma is suspected based on X-rays or other imaging tests, a sample of the tumor (a biopsy) will be examined under the microscope to confirm the diagnosis.\",\"title\":\"Bone Cancer in Children\",\"documentId\":30105801,\"exampleId\":792037061,\"rating\":444.0},{\"year\":2008,\"provider\":{\"name\":\"simonschuster\",\"id\":722},\"url\":\"http://books.simonandschuster.com/9781416996071\",\"word\":\"osteosarcoma\",\"text\":\"“It’s called osteosarcoma, which is a type of bone cancer that kids get.”\",\"title\":\"The Comeback Season\",\"documentId\":32496597,\"exampleId\":608956103,\"rating\":290.0},{\"year\":2009,\"provider\":{\"name\":\"wordnik\",\"id\":711},\"url\":\"http://transcripts.cnn.com/TRANSCRIPTS/0908/26/ltm.03.html\",\"word\":\"osteosarcoma\",\"text\":\"(END VIDEO CLIP) GUPTA: You may not know but Teddy Junior had osteosarcoma, which is another type of cancer.\",\"title\":\"CNN Transcript Aug 26, 2009\",\"documentId\":23071981,\"exampleId\":862849518,\"rating\":280.83008},{\"year\":2011,\"provider\":{\"name\":\"spinner\",\"id\":712},\"url\":\"http://us.rd.yahoo.com/finance/news/rss/story/*http://biz.yahoo.com/prnews/110919/de70202.html?.v=1\",\"word\":\"osteosarcoma\",\"text\":\"During the drug testing process, the medicine in FORTEO caused some rats to develop a bone cancer called osteosarcoma.\",\"title\":\"\",\"documentId\":32944241,\"exampleId\":653807754,\"rating\":269.0},{\"year\":2011,\"provider\":{\"name\":\"spinner\",\"id\":712},\"url\":\"http://www.npr.org/2011/11/26/142795959/after-nba-and-jazz-wayman-tisdales-story-cut-short?ft=1&f=7\",\"word\":\"osteosarcoma\",\"text\":\"It ended up being a disease called osteosarcoma bone cancer, which is a rare form of mainly childhood bone cancer.\",\"title\":\"News\",\"documentId\":33126327,\"exampleId\":662172440,\"rating\":269.0}]}");  
      expect(response,completion(equals(comp)));
    });
  });
}

void testGetWordObject(){
  group("Get Word API Call",(){
    WordRequest req = new WordRequest("test");
    Future<WordObject> response = api.getWordObject(req);
    test("check error",(){
      throwsA(response);
    });
    test("simple retrive for 'test'",(){
      WordObject w = new WordObject("test");
      w.id = 0;
      expect(response,completion(equals(w)));
    });
    
    test("simple retrive for 'cats'",(){
      WordRequest req = new WordRequest("cats");
      Future<WordObject> response = api.getWordObject(req);
      WordObject w = new WordObject("cats");
      w.id = 0;
      w.canonicalForm = "cat";
      w.suggestions = ["cat"];
      expect(response,completion(equals(w)));
    });
    
  });
}

void testRandomWords(){
  group("Random Word",(){
    Future<List<String>> random = api.getRandomWords();
    test("has default length",(){
      expect(random,completion(hasLength(equals(10)),"len is default"));
    });
    test("check error",(){
      throwsA(random);
    });
    test("has length = 15",(){
      random = api.getRandomWords(15);
      expect(random,completion(hasLength(equals(15))));
    });
  });
}

void testRandomWord(){
  group("Random Word",(){
    Future<String> random = api.getRandomString();
    test("has length > 0",(){
      expect(random,completion(hasLength(greaterThan(0)),"len > 0"));
    });
    test("check error",(){
      throwsA(random);
    });
  });
}

void testWordOfTheDay(){
  group("Word of the Day",(){
    Future<String> random = api.getWordOfTheDay();
    test("has length > 0",(){
      expect(random,completion(hasLength(greaterThan(0)),"len > 0"));
    });
    test("check error",(){
      throwsA(random);
    });
   
    test("24 march 2013",(){
      DateTime dt = new DateTime.utc(2013,3,24);
      random = api.getWordOfTheDay(dt);
      expect(random,completion(equals("soca"),"24 march"));
    });
    
    test("1st jan 2013",(){
      DateTime dt = new DateTime.utc(2013,1,1);
      random = api.getWordOfTheDay(dt);
      expect(random,completion(equals("manzai"),"1 jan"));
    });
  });
}

