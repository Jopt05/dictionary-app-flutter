class ApiResponse {
    final String word;
    final List<Phonetic> phonetics;
    final List<Meaning> meanings;
    final License license;
    final List<String> sourceUrls;

    ApiResponse({
        required this.word,
        required this.phonetics,
        required this.meanings,
        required this.license,
        required this.sourceUrls,
    });

    factory ApiResponse.fromJson(Map<String, dynamic> json) => ApiResponse(
        word: json["word"],
        phonetics: List<Phonetic>.from(json["phonetics"].map((x) => Phonetic.fromJson(x))),
        meanings: List<Meaning>.from(json["meanings"].map((x) => Meaning.fromJson(x))),
        license: License.fromJson(json["license"]),
        sourceUrls: List<String>.from(json["sourceUrls"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "word": word,
        "phonetics": List<dynamic>.from(phonetics.map((x) => x.toJson())),
        "meanings": List<dynamic>.from(meanings.map((x) => x.toJson())),
        "license": license.toJson(),
        "sourceUrls": List<dynamic>.from(sourceUrls.map((x) => x)),
    };
}

class License {
    final String name;
    final String url;

    License({
        required this.name,
        required this.url,
    });

    factory License.fromJson(Map<String, dynamic> json) => License(
        name: json["name"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
    };
}

class Meaning {
    final String partOfSpeech;
    final List<Definition> definitions;
    final List<String> synonyms;
    final List<String> antonyms;

    Meaning({
        required this.partOfSpeech,
        required this.definitions,
        required this.synonyms,
        required this.antonyms,
    });

    factory Meaning.fromJson(Map<String, dynamic> json) => Meaning(
        partOfSpeech: json["partOfSpeech"],
        definitions: List<Definition>.from(json["definitions"].map((x) => Definition.fromJson(x))),
        synonyms: List<String>.from(json["synonyms"].map((x) => x)),
        antonyms: List<String>.from(json["antonyms"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "partOfSpeech": partOfSpeech,
        "definitions": List<dynamic>.from(definitions.map((x) => x.toJson())),
        "synonyms": List<dynamic>.from(synonyms.map((x) => x)),
        "antonyms": List<dynamic>.from(antonyms.map((x) => x)),
    };
}

class Definition {
    final String definition;
    final List<dynamic> synonyms;
    final List<dynamic> antonyms;
    final String? example;

    Definition({
        required this.definition,
        required this.synonyms,
        required this.antonyms,
        this.example,
    });

    factory Definition.fromJson(Map<String, dynamic> json) => Definition(
        definition: json["definition"],
        synonyms: List<dynamic>.from(json["synonyms"].map((x) => x)),
        antonyms: List<dynamic>.from(json["antonyms"].map((x) => x)),
        example: json["example"],
    );

    Map<String, dynamic> toJson() => {
        "definition": definition,
        "synonyms": List<dynamic>.from(synonyms.map((x) => x)),
        "antonyms": List<dynamic>.from(antonyms.map((x) => x)),
        "example": example,
    };
}

class Phonetic {
    final String audio;
    final String? sourceUrl;
    final License? license;
    final String? text;

    Phonetic({
        required this.audio,
        this.sourceUrl,
        this.license,
        this.text,
    });

    factory Phonetic.fromJson(Map<String, dynamic> json) => Phonetic(
        audio: json["audio"],
        sourceUrl: json["sourceUrl"],
        license: json["license"] == null ? null : License.fromJson(json["license"]),
        text: json["text"],
    );

    Map<String, dynamic> toJson() => {
        "audio": audio,
        "sourceUrl": sourceUrl,
        "license": license?.toJson(),
        "text": text,
    };
}
