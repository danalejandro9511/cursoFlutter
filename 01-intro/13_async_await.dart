void main() async {
  print('Inicio del programa');

  try {
    final value = await httpGet('https://dadasdasd.com/cursos');
    print(value);
  } catch (err) {
    print('Tenemos un error');
  }

  print('Fin del programa');
}

Future<String> httpGet(String url) async {
  await Future.delayed(const Duration(seconds: 1));

  throw 'Error';

  //return 'Tenemos un valor de la peticion';
}
