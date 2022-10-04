void varibales(){
    var name = 'Bob';
    Object name1 = 'Bob';
    String name2 = 'Bob';
}

void default_variables(){
    int? lineCount;
    assert(lineCount == null);
    print(lineCount);

    int lineCount1 = 0;
    print(lineCount1);
}

late String description;

void final_and_const(){
    final name = 'Bob'; // Without a type annotation
    final String nickname = 'Bobby';

    const bar = 1000000; // Unit of pressure (dynes/cm2)
    const double atm = 1.01325 * bar; // Standard atmosphere

    var foo = const [];
    // final bar = const [];
    const baz = []; // Equivalent to `const []`

    foo = [1, 2, 3]; // Was const []
}

void main(){
    varibales();
    default_variables();
    description = 'Feijoada!';
    print(description);
}


