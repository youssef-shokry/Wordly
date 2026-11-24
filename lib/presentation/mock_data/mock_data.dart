import '../models/translation_result_model.dart';

// Mock Data
class MockTranslationData {
  // EN Nuances
  static const List<NuanceItemData> mockNuancesEn = [
    NuanceItemData(
      term: 'Keynote',
      partOfSpeech: 'noun',
      translatedTerm: 'الكلمة الرئيسية',
      definition:
          'The opening speech or central address delivering the core thematic focus of a convention or formal gathering.',
      exampleSource:
          'She delivered an inspiring keynote to open the symposium.',
      exampleTarget: 'ألقت كلمة رئيسية ملهمة لافتتاح الندوة.',
    ),
    NuanceItemData(
      term: 'Conference',
      partOfSpeech: 'noun',
      translatedTerm: 'مؤتمر',
      definition:
          'A structured formal assembly of individuals meeting for consultation, academic discussion, or commercial exchange.',
      exampleSource: 'Annual international technology conference.',
      exampleTarget: 'المؤتمر السنوي الدولي للتكنولوجيا.',
    ),
  ];

  // AR Nuances
  static const List<NuanceItemData> mockNuancesAr = [
    NuanceItemData(
      term: 'الكلمة الرئيسية',
      partOfSpeech: 'noun',
      translatedTerm: 'Keynote',
      definition:
          'The central address delivering the core thematic focus of a gathering.',
      exampleSource: 'ألقت كلمة رئيسية ملهمة لافتتاح الندوة.',
      exampleTarget:
          'She delivered an inspiring keynote to open the symposium.',
    ),
    NuanceItemData(
      term: 'مؤتمر',
      partOfSpeech: 'noun',
      translatedTerm: 'Conference',
      definition:
          'A structured formal assembly of individuals meeting for consultation or discussion.',
      exampleSource: 'المؤتمر السنوي الدولي للتكنولوجيا.',
      exampleTarget: 'Annual international technology conference.',
    ),
  ];

  // Preset EN
  static const TranslationResultModel mockEnToArTranslation =
      TranslationResultModel(
    lang1Code: 'EN',
    lang1Title: 'English (US)',
    lang1Text:
        "The conference keynote begins tomorrow morning at nine o'clock.",
    lang2Code: 'AR',
    lang2Title: 'Arabic',
    lang2Subtitle: 'العربية',
    lang2Banner: 'Modern Standard',
    translatedText:
        'تبدأ الكلمة الرئيسية للمؤتمر صباح الغد في تمام الساعة التاسعة.',
    transliterationText:
        'Tabda\' al-kalimatu ar-ra\'īsiyyatu lil-mu\'tamari sabāha al-ghadi fī tamāmi as-sā\'ati at-tāsi\'ah.',
    isVerified: true,
    nuances: mockNuancesEn,
  );

  // Preset AR
  static const TranslationResultModel mockArToEnTranslation =
      TranslationResultModel(
    lang1Code: 'AR',
    lang1Title: 'العربية',
    lang1Text:
        'تبدأ الكلمة الرئيسية للمؤتمر صباح الغد في تمام الساعة التاسعة.',
    lang2Code: 'EN',
    lang2Title: 'English',
    lang2Subtitle: 'English (US)',
    lang2Banner: 'US Standard',
    translatedText:
        "The conference keynote begins tomorrow morning at nine o'clock.",
    transliterationText:
        'The kon-fer-uhns kee-noht bi-ginz tuh-mor-oh mor-ning at nahyn uh-klok.',
    isVerified: true,
    nuances: mockNuancesAr,
  );

  // Default Nuances
  static const List<NuanceItemData> defaultNuances = mockNuancesEn;
}
