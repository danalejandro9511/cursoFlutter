void main() {
  
  final mySquare = Square( side: -10 );
  
  //mySquare.side = 5;
  
  print( 'area: ${ mySquare.area }' );
  
}


class Square {
  
  double _side; //el "_" quiere decir que es privada
  
  Square({ required double side })
      : assert(side >= 0, 'errror de la asercion'),
        _side = side;
  
  double get area {
    return _side * _side;
  }
  
  set side (double value){
    print('setting new value $value');
    if( value < 0 ) throw 'Error tiene que ser mayor a 5';
    
    _side = value;
  }
  
  double calculateArea(){
    return _side * _side;
  }
  
}