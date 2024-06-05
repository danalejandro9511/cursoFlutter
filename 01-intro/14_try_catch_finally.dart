void main() async {
  print('Inicio del programa');

  try {
    
    final value = await httpGet('https://dadasdasd.com/cursos');
    print('Exito $value');
    
  } on Exception catch(err){
    
    print('Tenemos un exception: $err');
    
  } catch (err) {
    
    print('Tenemos un error');
    
  } finally{
    
    print('fin del try y catch');
  }

  print('Fin del programa');
}

Future<String> httpGet(String url) async {
  await Future.delayed(const Duration(seconds: 1));

  throw 'Error';

  //return 'Tenemos un valor de la peticion';
}
