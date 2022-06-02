// app wide constants
const String autosuggestUrl =
    'https://www.lufthansa.com/service/autosuggest/airport';
Map<String, dynamic> autosuggestFilter({required String query}) =>
    <String, dynamic>{
      'rep': 'airportsReq',
      'start': 0,
      'rd': 'y',
      'site': 'KE',
      'lang': 'en',
      'portal': 'LH',
      'query': query,
      'apptype': 'ibebo',
    };
