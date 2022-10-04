import 'dart:core';

void printing_to_the_console() {
  String name = "Bob";
  print(name);
  print('I drink $name.');
}

void numbers() {
  assert(int.parse('42') == 42);
  assert(int.parse('0x42') == 66);
  assert(double.parse('0.50') == 0.5);

  assert(num.parse('42') is int);
  assert(num.parse('0x42') is int);
  assert(num.parse('0.50') is double);

  assert(int.parse('42', radix: 16) == 66);

  // Convert an int to a string.
  assert(42.toString() == '42');

  // Convert a double to a string.
  assert(123.456.toString() == '123.456');

  // Specify the number of digits after the decimal.
  assert(123.456.toStringAsFixed(2) == '123.46');

  // Specify the number of significant figures.
  assert(123.456.toStringAsPrecision(2) == '1.2e+2');
  assert(double.parse('1.2e+2') == 120.0);
}

void strings_and_regular_expressions() {
  // Check whether a string contains another string.
  assert('Never odd or even'.contains('odd'));

  // Does a string start with another string?
  assert('Never odd or even'.startsWith('Never'));

  // Does a string end with another string?
  assert('Never odd or even'.endsWith('even'));

  // Find the location of a string inside a string.
  assert('Never odd or even'.indexOf('odd') == 6);

  // Grab a substring.
  assert('Never odd or even'.substring(6, 9) == 'odd');

  // Split a string using a string pattern.
  var parts = 'progressive web apps'.split(' ');
  assert(parts.length == 3);
  assert(parts[0] == 'progressive');

  // Get a UTF-16 code unit (as a string) by index.
  assert('Never odd or even'[0] == 'N');

  // Use split() with an empty string parameter to get
  // a list of all characters (as Strings); good for
  // iterating.
  for (final char in 'hello'.split('')) {
    print(char);
  }

  // Get all the UTF-16 code units in the string.
  var codeUnitList = 'Never odd or even'.codeUnits.toList();
  assert(codeUnitList[0] == 78);

  // Convert to uppercase.
  assert('web apps'.toUpperCase() == 'WEB APPS');

  // Convert to lowercase.
  assert('WEB APPS'.toLowerCase() == 'web apps');

  // Trim a string.
  assert('  hello  '.trim() == 'hello');

  // Check whether a string is empty.
  assert(''.isEmpty);

  // Strings with only white space are not empty.
  assert('  '.isNotEmpty);

  var greetingTemplate = 'Hello, NAME!';
  var greeting = greetingTemplate.replaceAll(RegExp('NAME'), 'Bob');

  // greetingTemplate didn't change.
  assert(greeting != greetingTemplate);

  var sb = StringBuffer();
  sb
    ..write('Use a StringBuffer for ')
    ..writeAll(['efficient', 'string', 'creation'], ' ')
    ..write('.');

  var fullString = sb.toString();

  assert(fullString == 'Use a StringBuffer for efficient string creation.');

  // Here's a regular expression for one or more digits.
  var numbers = RegExp(r'\d+');

  var allCharacters = 'llamas live fifteen to twenty years';
  var someDigits = 'llamas live 15 to 20 years';

  // contains() can use a regular expression.
  assert(!allCharacters.contains(numbers));
  assert(someDigits.contains(numbers));

  // Replace every match with another string.
  var exedOut = someDigits.replaceAll(numbers, 'XX');
  assert(exedOut == 'llamas live XX to XX years');

  // Check whether the reg exp has a match in a string.
  assert(numbers.hasMatch(someDigits));

  // Loop through all matches.
  for (final match in numbers.allMatches(someDigits)) {
    print(match.group(0)); // 15, then 20
  }
}

void collections() {
  // Create an empty list of strings.
  var grains = <String>[];
  assert(grains.isEmpty);

  // Create a list using a list literal.
  var fruits = ['apples', 'oranges'];

  // Add to a list.
  fruits.add('kiwis');

  // Add multiple items to a list.
  fruits.addAll(['grapes', 'bananas']);

  // Get the list length.
  assert(fruits.length == 5);

  // Remove a single item.
  var appleIndex = fruits.indexOf('apples');
  fruits.removeAt(appleIndex);
  assert(fruits.length == 4);

  // Remove all elements from a list.
  fruits.clear();
  assert(fruits.isEmpty);

  // You can also create a List using one of the constructors.
  var vegetables = List.filled(99, 'broccoli');
  assert(vegetables.every((v) => v == 'broccoli'));

  var fruits2 = ['apples', 'oranges'];

  // Access a list item by index.
  assert(fruits2[0] == 'apples');

  // Find an item in a list.
  assert(fruits2.indexOf('apples') == 0);

  var fruits3 = ['bananas', 'apples', 'oranges'];

  // Sort a list.
  fruits3.sort((a, b) => a.compareTo(b));
  assert(fruits3[0] == 'apples');

  // This list should contain only strings.
  var fruits4 = <String>[];

  fruits4.add('apples');
  var fruit = fruits4[0];
  assert(fruit is String);

  // Create an empty set of strings.
  var ingredients = <String>{};

  // Add new items to it.
  ingredients.addAll(['gold', 'titanium', 'xenon']);
  assert(ingredients.length == 3);

  // Adding a duplicate item has no effect.
  ingredients.add('gold');
  assert(ingredients.length == 3);

  // Remove an item from a set.
  ingredients.remove('gold');
  assert(ingredients.length == 2);

  // You can also create sets using
  // one of the constructors.
  var atomicNumbers = Set.from([79, 22, 54]);

  var ingredients2 = Set<String>();
  ingredients2.addAll(['gold', 'titanium', 'xenon']);

  // Check whether an item is in the set.
  assert(ingredients2.contains('titanium'));

  // Check whether all the items are in the set.
  assert(ingredients2.containsAll(['titanium', 'xenon']));

  var ingredients3 = Set<String>();
  ingredients3.addAll(['gold', 'titanium', 'xenon']);

  // Create the intersection of two sets.
  var nobleGases4 = Set.from(['xenon', 'argon']);
  var intersection = ingredients.intersection(nobleGases4);
  assert(intersection.length == 1);
  assert(intersection.contains('xenon'));

  // Maps often use strings as keys.
  var hawaiianBeaches = {
    'Oahu': ['Waikiki', 'Kailua', 'Waimanalo'],
    'Big Island': ['Wailea Bay', 'Pololu Beach'],
    'Kauai': ['Hanalei', 'Poipu']
  };

  // Maps can be built from a constructor.
  var searchTerms = Map();

  // Maps are parameterized types; you can specify what
  // types the key and value should be.
  var nobleGases = Map<int, String>();

  var nobleGases1 = {54: 'xenon'};

  // Retrieve a value with a key.
  assert(nobleGases1[54] == 'xenon');

  // Check whether a map contains a key.
  assert(nobleGases1.containsKey(54));

  // Remove a key and its value.
  nobleGases1.remove(54);
  assert(!nobleGases1.containsKey(54));

  var hawaiianBeaches2 = {
    'Oahu': ['Waikiki', 'Kailua', 'Waimanalo'],
    'Big Island': ['Wailea Bay', 'Pololu Beach'],
    'Kauai': ['Hanalei', 'Poipu']
  };

  // Get all the keys as an unordered collection
  // (an Iterable).
  var keys = hawaiianBeaches2.keys;

  assert(keys.length == 3);
  assert(Set.from(keys).contains('Oahu'));

  // Get all the values as an unordered collection
  // (an Iterable of Lists).
  var values = hawaiianBeaches2.values;
  assert(values.length == 3);
  assert(values.any((v) => v.contains('Waikiki')));

  var hawaiianBeaches4 = {
    'Oahu': ['Waikiki', 'Kailua', 'Waimanalo'],
    'Big Island': ['Wailea Bay', 'Pololu Beach'],
    'Kauai': ['Hanalei', 'Poipu']
  };

  assert(hawaiianBeaches4.containsKey('Oahu'));
  assert(!hawaiianBeaches4.containsKey('Florida'));

  var teamAssignments = <String, String>{};
  teamAssignments.putIfAbsent('Catcher', () => "qqqq");
  assert(teamAssignments['Catcher'] != null);

  var coffees = <String>[];
  var teas = ['green', 'black', 'chamomile', 'earl grey'];
  assert(coffees.isEmpty);
  assert(teas.isNotEmpty);

  var teas2 = ['green', 'black', 'chamomile', 'earl grey'];

  teas2.forEach((tea) => print('I drink $tea'));

  hawaiianBeaches.forEach((k, v) {
    print('I want to visit $k and swim at $v');
    // I want to visit Oahu and swim at
    // [Waikiki, Kailua, Waimanalo], etc.
  });

  var teas3 = ['green', 'black', 'chamomile', 'earl grey'];

  var loudTeas = teas3.map((tea) => tea.toUpperCase());
  loudTeas.forEach(print);

  var loudTeas2 = teas.map((tea) => tea.toUpperCase()).toList();

  var teas4 = ['green', 'black', 'chamomile', 'earl grey'];

  // Chamomile is not caffeinated.
  bool isDecaffeinated(String teaName) => teaName == 'chamomile';

  // Use where() to find only the items that return true
  // from the provided function.
  var decaffeinatedTeas = teas4.where((tea) => isDecaffeinated(tea));
  // or teas.where(isDecaffeinated)

  // Use any() to check whether at least one item in the
  // collection satisfies a condition.
  assert(teas4.any(isDecaffeinated));

  // Use every() to check whether all the items in a
  // collection satisfy a condition.
  assert(!teas4.every(isDecaffeinated));
}

void uris() {
  var uri = 'https://example.org/api?foo=some message';
  var encoded = Uri.encodeFull(uri);
  assert(encoded == 'https://example.org/api?foo=some%20message');
  var decoded = Uri.decodeFull(encoded);
  assert(uri == decoded);

  var uri2 = 'https://example.org/api?foo=some message';
  var encoded2 = Uri.encodeComponent(uri2);
  assert(encoded2 == 'https%3A%2F%2Fexample.org%2Fapi%3Ffoo%3Dsome%20message');
  var decoded2 = Uri.decodeComponent(encoded2);
  assert(uri2 == decoded2);

  var uri3 = Uri.parse('https://example.org:8080/foo/bar#frag');
  assert(uri3.scheme == 'https');
  assert(uri3.host == 'example.org');
  assert(uri3.path == '/foo/bar');
  assert(uri3.fragment == 'frag');
  assert(uri3.origin == 'https://example.org:8080');

  var uri4 = Uri(
      scheme: 'https', host: 'example.org', path: '/foo/bar', fragment: 'frag');
  assert(uri4.toString() == 'https://example.org/foo/bar#frag');
}

void dates_and_times() {
  // Get the current date and time.
  var now = DateTime.now();

// Create a new DateTime with the local time zone.
  var y2k = DateTime(2000); // January 1, 2000

// Specify the month and day.
  y2k = DateTime(2000, 1, 2); // January 2, 2000

// Specify the date as a UTC time.
  y2k = DateTime.utc(2000); // 1/1/2000, UTC

// Specify a date and time in ms since the Unix epoch.
  y2k = DateTime.fromMillisecondsSinceEpoch(946684800000, isUtc: true);

// Parse an ISO 8601 date.
  y2k = DateTime.parse('2000-01-01T00:00:00Z');

// 1/1/2000, UTC
  var y2k2 = DateTime.utc(2000);
  assert(y2k2.millisecondsSinceEpoch == 946684800000);

// 1/1/1970, UTC
  var unixEpoch = DateTime.utc(1970);
  assert(unixEpoch.millisecondsSinceEpoch == 0);

  var y2k3 = DateTime.utc(2000);
  // Add one year.
  var y2001 = y2k3.add(const Duration(days: 366));
  assert(y2001.year == 2001);

  // Subtract 30 days.
  var december2000 = y2001.subtract(const Duration(days: 30));
  assert(december2000.year == 2000);
  assert(december2000.month == 12);
  // Calculate the difference between two dates.
  // Returns a Duration object.
  var duration = y2001.difference(y2k3);
  assert(duration.inDays == 366); // y2k was a leap year.
}

class Line implements Comparable<Line> {
  final int length;
  const Line(this.length);

  @override
  int compareTo(Line other) => length - other.length;
}

class Person {
  final String firstName, lastName;

  Person(this.firstName, this.lastName);

  // Override hashCode using the static hashing methods
  // provided by the `Object` class.
  @override
  int get hashCode => Object.hash(firstName, lastName);

  // You should generally implement operator `==` if you
  // override `hashCode`.
  @override
  bool operator ==(dynamic other) {
    return other is Person &&
        other.firstName == firstName &&
        other.lastName == lastName;
  }
}

void utility_classes() {
  void run() {
    var short = const Line(1);
    var long = const Line(100);
    assert(short.compareTo(long) < 0);

    var p1 = Person('Bob', 'Smith');
    var p2 = Person('Bob', 'Smith');
    var p3 = 'not a person';
    assert(p1.hashCode == p2.hashCode);
    assert(p1 == p2);
    assert(p1 != p3);
  }

  run();
}

class FooException implements Exception {
  final String? msg;

  const FooException([this.msg]);

  @override
  String toString() => msg ?? 'FooException';
}

void main() {
  numbers();
  strings_and_regular_expressions();
  collections();

  uris();
  dates_and_times();
  utility_classes();
}
