void main () {
  
  final Map<String, dynamic> rawJson = {
    'name': 'Capitan America',
    'power': 'Super Fuerza',
    'isAlive': true
  };
  
  //final Hero capAmerica = Hero( name:'Cap America', power:'Fuerza', isAlive:true ); // primera forma
  final capAmerica = Hero.fromJson(rawJson);
  
  print( capAmerica.toString());
  
}

class Hero {
  
  String name;
  String power;
  bool isAlive;
  
  Hero({
    required this.name,
    required this.power,
    required this.isAlive,
  });
  
  Hero.fromJson( Map<String,dynamic> json )
      : name = json['name'] ?? 'No name found',
        power = json['power'] ?? 'no power found',
        isAlive = json['isAlive'] ?? 'no isAlive found';
  
  
  @override
  String toString(){
    return 'Mi heroe es $name y su poder es $power y esta ${ isAlive ? 'VIVO' : 'MUERTO' }';
  }
  
}