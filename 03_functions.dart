var _nobleGases = {1: "bwq", 2: "wd", 3: "cyr"};
bool isNoble(int atomicNumber) {
  return _nobleGases[atomicNumber] != null;
}

isNoble2(atomicNumber) {
  return _nobleGases[atomicNumber] != null;
}

bool isNoble3(int atomicNumber) => _nobleGases[atomicNumber] != null;

void parameters() {
  void enableFlags({bool? bold, bool? hidden}) {
    ;
  }

  enableFlags(bold: true, hidden: false);

  String say(String from, String msg, [String? device]) {
    var result = '$from says $msg';
    if (device != null) {
      result = '$result with a $device';
    }
    return result;
  }

  assert(say('Bob', 'Howdy') == 'Bob says Howdy');

  assert(say('Bob', 'Howdy', 'smoke signal') ==
      'Bob says Howdy with a smoke signal');

  // bold will be true; hidden will be false.
  enableFlags(bold: true);

  String say2(String from, String msg, [String device = 'carrier pigeon']) {
    var result = '$from says $msg with a $device';
    return result;
  }

  assert(say2('Bob', 'Howdy') == 'Bob says Howdy with a carrier pigeon');

  void doStuff(
      {List<int> list = const [1, 2, 3],
      Map<String, String> gifts = const {
        'first': 'paper',
        'second': 'cotton',
        'third': 'leather'
      }}) {
    print('list:  $list');
    print('gifts: $gifts');
  }
}

void functions_as_first_class_objects() {
  void printElement(int element) {
    print(element);
  }

  var list = [1, 2, 3];

  // Pass printElement as a parameter.
  list.forEach(printElement);

  var loudify = (msg) => '!!! ${msg.toUpperCase()} !!!';
  assert(loudify('hello') == '!!! HELLO !!!');
}

void anonymous_functions() {
  const list = ['apples', 'bananas', 'oranges'];

  list.forEach((item) => print('${list.indexOf(item)}: $item'));
}

void lexical_scope() {
  bool topLevel = true;
  void myFunction() {
    var insideFunction = true;
    void nestedFunction() {
      var insideNestedFunction = true;
      assert(topLevel);
      assert(insideFunction);
      assert(insideNestedFunction);
    }
  }
}

void lexical_closures() {
  /// Returns a function that adds [addBy] to the
  /// function's argument.
  Function makeAdder(int addBy) {
    return (int i) => addBy + i;
  }

  void run() {
    // Create a function that adds 2.
    var add2 = makeAdder(2);

    // Create a function that adds 4.
    var add4 = makeAdder(4);

    assert(add2(3) == 5);
    assert(add4(3) == 7);
  }

  run();
}

void foo() {} // A top-level function

class A {
  static void bar() {} // A static method
  void baz() {} // An instance method
}

void testing_functions_for_equality() {
  Function x;

  // Comparing top-level functions.
  x = foo;
  assert(foo == x);

  // Comparing static methods.
  x = A.bar;
  assert(A.bar == x);

  // Comparing instance methods.
  var v = A(); // Instance #1 of A
  var w = A(); // Instance #2 of A
  var y = w;
  x = w.baz;

  // These closures refer to the same instance (#2),
  // so they're equal.
  assert(y.baz == x);

  // These closures refer to different instances,
  // so they're unequal.
  assert(v.baz != w.baz);
}

void return_values() {
  foo() {}
  assert(foo() == null);
}

void main(List<String> arguments) {
  print(isNoble(1));
  print(isNoble(4));
  parameters();

  print(arguments);

  assert(arguments.length == 2);
  assert(int.parse(arguments[0]) == 1);
  assert(arguments[1] == 'test');

  functions_as_first_class_objects();

  anonymous_functions();

  lexical_scope();

  lexical_closures();

  testing_functions_for_equality();
}
