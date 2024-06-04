void main() {
  print(greetEveryone2());

  print('Suma: ${addTwoNumbersOptional(10)}');
  
  print(greetPerson( name: 'Daniel', message: 'Qloqq' ));
}

String greetEveryone() {
  return 'Hola a todo el mundo!!';
}

String greetEveryone2() =>
    'Qloqq'; //las funciones de flechas solo el valor que retornara

int addTwoNumbers(int a, int b) {
  return a + b;
}

int addTwoNumbers2(int a, int b) => a+b;

int addTwoNumbersOptional( int a, [ int b = 0 ] ){
  
  //b = b ?? 0; primera opcion
  //b ??= 0; //segunda opcion
  
  return a + b;
  
}

String greetPerson({ required String name, String message = 'hola, ' }) {
  return '$message $name';
}
