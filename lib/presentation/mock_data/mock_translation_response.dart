/// One request/response pair copied from Google's documented Cloud Translation
/// v3 example. The demo displays it only for this exact source text.
const mockSourceText = 'Dr. Watson, come here!';

const mockTranslationResponse = <String, dynamic>{
  'translations': [
    {
      'translatedText':
          '\u0414\u043E\u043A\u0442\u043E\u0440 \u0412\u0430\u0442\u0441\u043E\u043D, \u0438\u0434\u0438 \u0441\u044E\u0434\u0430!',
    },
  ],
};
