import 'package:desafio_snapfi/src/pokedex/domain/models/sprites_model.dart';
import 'package:desafio_snapfi/src/pokedex/presentation/components/list_item.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:desafio_snapfi/src/pokedex/domain/models/pokedex_model.dart';
import 'package:http/http.dart' as http;

void main() {
  testWidgets('Teste para ListItem widget', (WidgetTester tester) async {
    final PokemonModel pokemon = PokemonModel(
      height: 10,
      id: 1,
      name: "bulbasaur",
      sprite: SpritesModel(
        frontDefault:
            "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png",
      ),
      stats: [],
      types: [],
      weight: 10,
      moves: [],
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ListItem(pokemon: pokemon),
        ),
      ),
    );

    // Verifique se o CustomText contém a ID do Pokémon
    expect(find.text(pokemon.getId), findsOneWidget);

    // Verifique se a imagem do Pokémon é carregada
    final imageFinder = find.byType(Image);
    expect(imageFinder, findsOneWidget);

    final image = tester.widget<Image>(imageFinder);
    expect(image.image, isA<NetworkImage>());
    expect(
        (image.image as NetworkImage).url, pokemon.sprite?.frontDefault ?? "");

    // Verifique se o CustomText contém o nome do Pokémon com a primeira letra maiúscula
    expect(find.text(pokemon.capitalizeFirstLetter), findsOneWidget);
  });
}
