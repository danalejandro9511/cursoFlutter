void main() {
  final numbers = [1, 2, 3, 4, 5, 5, 5, 6, 7, 8, 9, 9];

  print('List original $numbers');
  print('Length ${numbers.length}');
  print('Index 0 ${numbers[0]}');
  print('First ${numbers.first}');
  print('Reversed ${numbers.reversed}');

  final reversedNumbers = numbers.reversed;
  print('Iterable: $reversedNumbers');
  print('List: ${reversedNumbers.toList()}');
  print('Iterable: ${reversedNumbers.toSet()}');

  final numbersGreatterThan5 = numbers.where((num) {
    return num > 5;
  });

  print('>5 iterable: $numbersGreatterThan5');
  print('5> Set: ${numbersGreatterThan5.toSet()}');
}
