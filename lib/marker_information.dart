class ClueLocation {
  ClueLocation(
      {required this.lat,
      required this.long,
      required this.title,
      this.videoLink,
      this.body});
  double lat;
  double long;
  var title;
  var body;
  var videoLink;
  bool compl = false;
}

var courtyardMuseum = ClueLocation(
    lat: 52.202686,
    long: 0.121779,
    title: 'Courtyard of Museum of Archaeology and Anthropology',
    videoLink:
        "https://storage.googleapis.com/video-files-ddo/VIDEO%201_%20BEGINNING.mp4");

var shrewHouse = ClueLocation(
    lat: 52.202547,
    long: 0.119237,
    title: 'Shrew House (in front of Chris Adams House)',
    videoLink:
        'https://storage.googleapis.com/video-files-ddo/VIDEO%202_GRACE%20INTERVIEW..mp4');

var hangedManShop = ClueLocation(
    lat: 52.202365,
    long: 0.118555,
    title: 'The Hanged Man shop',
    videoLink:
        'https://storage.googleapis.com/video-files-ddo/VIDEO%203_ALIX%20ARRIVAL.mp4');

var fitzBillies = ClueLocation(
    lat: 52.202011,
    long: 0.117926,
    title:
        'On the pavement in front of Fitzbillies (corner of Trumpington St and Mill Lane, on the pavement)',
    videoLink:
        'https://storage.googleapis.com/video-files-ddo/VIDEO%204_%20JEREMIAH%20INTERVIEW_P1.mp4');

var stephenHokingHouse = ClueLocation(
    lat: 52.201221,
    long: 0.117819,
    title: 'Stephen Hoking’s House',
    videoLink:
        'https://storage.googleapis.com/video-files-ddo/VIDEO%205_CALL%20TO%20POLICE..mp4');

var sittingBridge = ClueLocation(
    lat: 52.201430,
    long: 0.115847,
    title: 'Sitting bridge at Scudamore’s Mill Lane Punting Station',
    videoLink:
        'https://storage.googleapis.com/video-files-ddo/VIDEO%206_RIVER%20CAM.mp4');

var queensLane = ClueLocation(
    lat: 52.202452,
    long: 0.116415,
    title: 'Queen’s Lane',
    videoLink:
        'https://storage.googleapis.com/video-files-ddo/VIDEO%207_SHREW%20HOUSE.mp4');

var privateSide = ClueLocation(
    lat: 52.203450,
    long: 0.116385,
    title:
        'Private side of King’s, breakfast zone, between King’s Lane and Trumpington St',
    videoLink:
        'https://storage.googleapis.com/video-files-ddo/VIDEO%208_GERALD%20vs%20ALIX_PART1.mp4');

var eaglesBeerGarden = ClueLocation(
    lat: 52.203947,
    long: 0.118186,
    title: 'The Eagle’s beer garden',
    videoLink:
        'https://storage.googleapis.com/video-files-ddo/VIDEO%209_GERALD%20vs%20ALIX_PART%202.mp4');

var zizzi = ClueLocation(
    lat: 52.204208,
    long: 0.118909,
    title: 'Pavement in front of Zizzi, close to Aromi’s entrance',
    videoLink:
        'https://storage.googleapis.com/video-files-ddo/VIDEO%2010_NIGHT%20GHOST..mp4');

var michaelHouse = ClueLocation(
    lat: 52.205913,
    long: 0.118134,
    title:
        'Michaelhouse courtyard (NOT INSIDE, but at the St Michael’s converted church!)',
    videoLink:
        'https://storage.googleapis.com/video-files-ddo/VIDEO%2011_GRACE%20DIARY.mp4');

var trinityLane = ClueLocation(
    lat: 52.206338,
    long: 0.117624,
    title: 'Trinity Lane (middle of the street)',
    videoLink:
        'https://storage.googleapis.com/video-files-ddo/VIDEO%2012_JEREMIAH%20INTERVIEW_P2..mp4');

var endTour = ClueLocation(
    lat: 52.205634,
    long: 0.117047,
    title: 'Senate House Passage, mid street',
    videoLink:
        'https://storage.googleapis.com/video-files-ddo/VIDEO%2013_LAST%20EPISODE.mp4');

var baronBeegPub = ClueLocation(
    lat: 52.20909559159652,
    long: 0.11807052630732515,
    title: 'Baron Beef Pub',
    body:
        '''https://www.greeneking-pubs.co.uk/pubs/cambridgeshire/baron-of-beef/
    ''');

var eaglePub = ClueLocation(
    lat: 52.20410928337526,
    long: 0.11818312913184223,
    title: 'The Eagle',
    body: '''https://www.greeneking-pubs.co.uk/pubs/cambridgeshire/eagle/
    ''');

var bathHouse = ClueLocation(
    lat: 52.204205458267595,
    long: 0.11849198495367987,
    title: 'The Bath House',
    body: '''https://www.greeneking-pubs.co.uk/pubs/cambridgeshire/bath-house/
    ''');

var princeRegent = ClueLocation(
    lat: 52.200084643714376,
    long: 0.12698077146044784,
    title: 'The Prince Regent',
    body:
        '''https://www.greeneking-pubs.co.uk/pubs/cambridgeshire/prince-regent/

    ''');

var fortGeorge = ClueLocation(
    lat: 52.21259788432059,
    long: 0.12777795611823078,
    title: 'The Fort St George',
    body:
        '''https://www.greeneking-pubs.co.uk/pubs/cambridgeshire/fort-st-george/
    ''');
var grainHope = ClueLocation(
    lat: 52.20076584464141,
    long: 0.12624835426843833,
    title: 'The Grain and Hop',
    body:
        '''https://www.greeneking-pubs.co.uk/pubs/cambridgeshire/grain-hop-store/
    ''');

var pickerellIn = ClueLocation(
    lat: 52.21003271721985,
    long: 0.11615665426869803,
    title: 'The Pickerel Inn',
    body: '''
          https://www.greeneking-pubs.co.uk/pubs/cambridgeshire/grain-hop-store/
    ''');
