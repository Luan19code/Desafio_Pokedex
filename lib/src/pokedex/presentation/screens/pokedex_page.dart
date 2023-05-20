import 'package:desafio_snapfi/core/components/custom_icon.dart';
import 'package:desafio_snapfi/core/components/custom_svg_picture.dart';
import 'package:desafio_snapfi/core/components/custom_text.dart';
import 'package:desafio_snapfi/core/routes/app_routes.dart';
import 'package:desafio_snapfi/core/routes/navigation_service.dart';
import 'package:desafio_snapfi/core/utils/custom_colors.dart';
import 'package:desafio_snapfi/core/utils/get_it_menager.dart';
import 'package:desafio_snapfi/core/utils/url_images.dart';
import 'package:desafio_snapfi/src/pokedex/presentation/components/list_item.dart';
import 'package:desafio_snapfi/src/pokedex/presentation/provider/pokedex_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:shimmer/shimmer.dart';

class PokedexPage extends StatefulWidget {
  const PokedexPage({super.key});

  @override
  State<PokedexPage> createState() => _PokedexPageState();
}

class _PokedexPageState extends State<PokedexPage> {
  final ScrollController _scrollController = ScrollController();
  final pokedexState = GetIt.I.get<PokedexState>();

  @override
  void initState() {
    pokedexState.getPokedexList();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >
          MediaQuery.of(context).size.height) {
        pokedexState.setEndOfTheList(true);
      } else if (_scrollController.position.pixels <
          MediaQuery.of(context).size.height) {
        pokedexState.setEndOfTheList(false);
      }
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent -
              MediaQuery.of(context).size.height * 0.5) {
        pokedexState.getPokedexList();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: CustomColors.primary,
        floatingActionButton: Observer(
          builder: (context) {
            return pokedexState.endOfTheList
                ? FloatingActionButton(
                    onPressed: () {
                      _scrollController.animateTo(
                        0,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    },
                    backgroundColor: CustomColors.white,
                    child: const CustomIcon(
                      ulr: Icons.arrow_upward_outlined,
                      size: 30,
                      color: CustomColors.primary,
                    ),
                  )
                : const SizedBox();
          },
        ),
        body: Column(
          children: [
            Row(
              children: const [
                CustomSVGPicture(
                  margin: EdgeInsets.only(left: 16, right: 16),
                  ulr: UrlImages.pokeball,
                  size: 24,
                ),
                CustomText(
                  margin: EdgeInsets.only(top: 16, bottom: 20),
                  description: "Pokédex",
                  variant: CustomTextVariant.variant1,
                )
              ],
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: CustomColors.white,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Observer(builder: (context) {
                  return SingleChildScrollView(
                    controller: _scrollController,
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 24),
                          child: pokedexState.pokemonList.isEmpty
                              ? const SizedBox()
                              : GridView.count(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  crossAxisCount: 3,
                                  children: [
                                      ...List.generate(
                                        pokedexState.pokemonList.length,
                                        (index) => GestureDetector(
                                            onTap: () {
                                              pokedexState.setPokemonSelected(
                                                  pokedexState
                                                      .pokemonList[index]);
                                              locator<NavigationService>()
                                                  .pushNamed(
                                                AppRoutes.details,
                                              );
                                            },
                                            child: ListItem(
                                                pokemon: pokedexState
                                                    .pokemonList[index])),
                                      ),
                                    ]),
                        ),
                        pokedexState.maxList ? const SizedBox() : loadingGrid()
                      ],
                    ),
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget loadingGrid() {
    return Observer(builder: (context) {
      return GridView.builder(
        shrinkWrap: true,
        itemCount: pokedexState.pokemonList.isEmpty ? 18 : 3,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemBuilder: (_, __) => Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.grey[100]!,
          child: Container(
            margin: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Colors.grey,
            ),
          ),
        ),
      );
    });
  }
}
