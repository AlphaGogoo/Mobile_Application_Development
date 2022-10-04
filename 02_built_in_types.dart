import 'dart:core';
import 'package:characters/characters.dart';

void numbers() {
  var x = 1;
  var hex = 0xDEADBEEF;

  var y = 1.1;
  var exponents = 1.42e5;

  num x1 = 1; // x can have both int and double values
  x1 += 2.5;
  num x2 = 1; // x can have both int and double values
  x2 += 2.5;

  double z = 1; // Equivalent to double z = 1.0.

  // String -> int
  var one = int.parse('1');
  assert(one == 1);

  // String -> double
  var onePointOne = double.parse('1.1');
  assert(onePointOne == 1.1);

  // int -> String
  String oneAsString = 1.toString();
  assert(oneAsString == '1');

  // double -> String
  String piAsString = 3.14159.toStringAsFixed(2);
  assert(piAsString == '3.14');

  assert((3 << 1) == 6); // 0011 << 1 == 0110
  assert((3 | 4) == 7); // 0011 | 0100 == 0111
  assert((3 & 4) == 0); // 0011 & 0100 == 0000

  const msPerSecond = 1000;
  const secondsUntilRetry = 5;
  const msUntilRetry = secondsUntilRetry * msPerSecond;
}

void strings() {
  var s1 = 'Single quotes work well for string literals.';
  var s2 = "Double quotes work just as well.";
  var s3 = 'It\'s easy to escape the string delimiter.';
  var s4 = "It's even easier to use the other delimiter.";

  var s = 'string interpolation';

  assert('Dart has $s, which is very handy.' ==
      'Dart has string interpolation, '
          'which is very handy.');
  assert('That deserves all caps. '
          '${s.toUpperCase()} is very handy!' ==
      'That deserves all caps. '
          'STRING INTERPOLATION is very handy!');

  var s5 = 'String '
      'concatenation'
      " works even over line breaks.";
  assert(s5 ==
      'String concatenation works even over '
          'line breaks.');

  var s6 = 'The + operator ' + 'works, as well.';
  assert(s6 == 'The + operator works, as well.');

  var s7 = '''
You can create
multi-line strings like this one.
  ''';

  var s8 = """
This is also a
multi-line string.""";

  var s9 = r'In a raw string, not even \n gets special treatment.';

  // These work in a const string.
  const aConstNum = 0;
  const aConstBool = true;
  const aConstString = 'a constant string';

  // These do NOT work in a const string.
  var aNum = 0;
  var aBool = true;
  var aString = 'a string';
  const aConstList = [1, 2, 3];

  const validConstString = '$aConstNum $aConstBool $aConstString';
  // const invalidConstString = '$aNum $aBool $aString $aConstList';
}

void booleans() {
  // These work in a const string.
  const aConstNum = 0;
  const aConstBool = true;
  const aConstString = 'a constant string';

  // These do NOT work in a const string.
  var aNum = 0;
  var aBool = true;
  var aString = 'a string';
  const aConstList = [1, 2, 3];

  const validConstString = '$aConstNum $aConstBool $aConstString';
  // const invalidConstString = '$aNum $aBool $aString $aConstList';
}

void lists() {
  var list = [1, 2, 3];
  var list2 = [
    'Car',
    'Boat',
    'Plane',
  ];
  var list3 = [1, 2, 3];
  assert(list3.length == 3);
  assert(list3[1] == 2);

  list3[1] = 1;
  assert(list3[1] == 1);

  var constantList = const [1, 2, 3];
  // constantList[1] = 1; // This line will cause an error.

  var list4 = [1, 2, 3];
  var list5 = [0, ...list];
  assert(list5.length == 4);

  var list6 = [0, ...list4];
  assert(list6.length == 1);
  var promoActive = true;

  var nav = ['Home', 'Furniture', 'Plants', if (promoActive) 'Outlet'];

  var listOfInts = [1, 2, 3];
  var listOfStrings = ['#0', for (var i in listOfInts) '#$i'];
  assert(listOfStrings[1] == '#1');
}

void sets() {
  var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
  var names = <String>{};
  // Set<String> names = {}; // This works, too.
  // var names = {}; // Creates a map, not a set.
  var elements = <String>{};
  elements.add('fluorine');
  elements.addAll(halogens);

  var elements2 = <String>{};
  elements2.add('fluorine');
  elements2.addAll(halogens);

  final constantSet = const {
    'fluorine',
    'chlorine',
    'bromine',
    'iodine',
    'astatine',
  };
  // constantSet.add('helium'); // This line will cause an error.
}

void maps() {
  var gifts = {
    // Key:    Value
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 'golden rings'
  };

  var nobleGases = {
    2: 'helium',
    10: 'neon',
    18: 'argon',
  };

  var gifts2 = Map<String, String>();
  gifts2['first'] = 'partridge';
  gifts2['second'] = 'turtledoves';
  gifts2['fifth'] = 'golden rings';

  var nobleGases2 = Map<int, String>();
  nobleGases[2] = 'helium';
  nobleGases[10] = 'neon';
  nobleGases[18] = 'argon';

  var gifts3 = {'first': 'partridge'};
  gifts3['fourth'] = 'calling birds'; // Add a key-value pair

  var gifts4 = {'first': 'partridge'};
  assert(gifts4['first'] == 'partridge');

  var gifts5 = {'first': 'partridge'};
  assert(gifts5['fifth'] == null);

  var gifts6 = {'first': 'partridge'};
  gifts6['fourth'] = 'calling birds';
  assert(gifts6.length == 2);

  final constantMap = const {
    2: 'helium',
    10: 'neon',
    18: 'argon',
  };

  // constantMap[2] = 'Helium'; // This line will cause an error.
}

void runes_and_grapheme_clusters() {
  var hi = 'Hi 🇩🇰';
  print(hi);
  print('The end of the string: ${hi.substring(hi.length - 1)}');
  print('The last character: ${hi.characters.last}\n');
}

void symbols() {
  var a = 10;
  print(#a);
}

void main() {
  numbers();
  strings();
  booleans();
  lists();
  sets();
  maps();
  runes_and_grapheme_clusters();
  symbols();
}
