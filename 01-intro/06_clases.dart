void main() {
  
  final Hero wolverine = Hero(name: 'Logan', power: 'Regeneración');
  
  print( wolverine.toString() );
  print( wolverine.name );
  print( wolverine.power );
  
}


class Hero {
  
  String name;
  String power;
  
  //Hero( this.name, this.power); //primera forma
  Hero({
    required this.name,
    this.power = 'Sin poder'
  });
  
  //otra forma
  //Hero ( String pName, String pPower )
  //    : name = pName,
  //      power = pPower;
  
  String toString(){
    return '$name - $power';
  }
}