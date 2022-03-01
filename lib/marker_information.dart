class ClueLocation {
  ClueLocation(
      {required this.lat,
      required this.long,
      required this.title,
      required this.body});
  double lat;
  double long;
  var title;
  var body;
  bool compl = false;
}

var newHamCollege = ClueLocation(
    lat: 52.200352,
    long: 0.108999,
    title: 'Newham College',
    body:
        '''This Cambridge college created for women in the Victorian era has its dark pages. In 1913-1914 the society was shaken by a series of tragic incidents that caused deaths of three students. The management of the college was trying for cover for these cases in an attempt to observe the vulnerable reputation of this unique institution. Although one of the students, a bright young Polish girl Anastazia P., who was supposed to become the fourth victim in this chain of deaths, managed to survive and told the truth to the police. The investigation started, and awful facts were revealed. Police figured out that behind at least one suicide and two tragic accidents that happened on the college territory stood a 45yo guest professor of Archaeology. The killer was cornered, although committed suicide to avoid punishment.
''');

var coeFen = ClueLocation(
    lat: 52.200103,
    long: 0.115705,
    title: 'Coe Fen',
    body:
        '''This semi-rural part of Cambridge became a landscape for a brutal murder that took place in August 1913. A body of a 25 yo Amalia C., a student of Newham College located nearby, was found lying on the grass. The girl was strangled. Surprisingly, this case wasn’t recognised as murder at the first place, and the police report named it suicide. Later on it was revealed that the management of Newham college was keeping silent trying to cover for the series of tragic incidents happening in the college. In a year time the truth was revealed and the death of Amalia C. was recognised as the first crime of a so-called Newham murderer.''');

var mathematicalBridge = ClueLocation(
    lat: 52.202205,
    long: 0.115078,
    title: 'Mathematical Bridge',
    body:
        '''This peaceful and picturesque place in Cambridge witnessed an awful event. In the death of the night, on April 15, 1914, Dr James Dean, professor of Archaeology and a guest lecturer at Newham College, jumped from this bridge to the river Cam and committed suicide. Mr Dean, a single man and a bright archaeologist, was cornered by the police investigation as a murderer who took lives of three students during the years 1913-1914 and was attempting to kill the fourth one. The girl managed to escape and talked to police. In order to avoid disgrace and prison Mr Dean killed himself.
''');
