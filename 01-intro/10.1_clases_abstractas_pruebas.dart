void main() {
  final primerPokemon = Picachu(name: 'Picachu');

  print(primerPokemon.atacar('Trueno', 50.0));
}

enum PokemonType { fuego, agua, tierra, trueno }

abstract class Pokemon {
  final String pokemonName;
  final PokemonType type; //nuclear, wind, water

  Pokemon({required this.pokemonName, required this.type});

  String  atacar(String nombre, double amount);
}

class Picachu extends Pokemon {
  Picachu({required String name})
      : super(pokemonName: name, type: PokemonType.trueno);

  @override
  String atacar(String nombre, double amount) {
    return 'Ataco con $nombre y su cantidad es $amount';
  }
}
