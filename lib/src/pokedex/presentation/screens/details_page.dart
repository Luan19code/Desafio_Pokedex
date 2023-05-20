import 'package:cached_network_image/cached_network_image.dart';
import 'package:desafio_snapfi/core/components/custom_icon.dart';
import 'package:desafio_snapfi/core/components/custom_svg_picture.dart';
import 'package:desafio_snapfi/core/components/custom_text.dart';
import 'package:desafio_snapfi/core/routes/navigation_service.dart';
import 'package:desafio_snapfi/core/utils/custom_colors.dart';
import 'package:desafio_snapfi/core/utils/get_it_menager.dart';
import 'package:desafio_snapfi/core/utils/url_images.dart';
import 'package:desafio_snapfi/src/pokedex/presentation/provider/pokedex_state.dart';
import 'package:desafio_snapfi/src/pokedex/presentation/utils/abbreviation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage>
    with TickerProviderStateMixin {
  late Color colorPrimaryPokemon;
  late AnimationController _animationController;
  final pokedexState = GetIt.I.get<PokedexState>();
  @override
  void initState() {
    initController();
    super.initState();
  }

  initController() {
    _animationController = AnimationController(
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Observer(
          builder: (context) {
            colorPrimaryPokemon = CustomColors.getPokemonColor(
                pokedexState.pokemonSelected?.types?.first.nameType ?? "");
            return Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: colorPrimaryPokemon,
              child: Stack(
                children: [
                  const Align(
                    alignment: Alignment.topRight,
                    child: CustomSVGPicture(
                      margin: EdgeInsets.only(top: 8, right: 8),
                      ulr: UrlImages.pokeballBig,
                      size: 208,
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 24),
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  locator<NavigationService>().pop();
                                },
                                child: const CustomIcon(
                                  margin: EdgeInsets.only(left: 24),
                                  ulr: Icons.arrow_back,
                                  size: 32,
                                  color: CustomColors.white,
                                ),
                              ),
                              CustomText(
                                margin: const EdgeInsets.only(left: 8),
                                description: pokedexState
                                    .pokemonSelected?.capitalizeFirstLetter,
                                variant: CustomTextVariant.variant1,
                              ),
                              const Spacer(),
                              CustomText(
                                description:
                                    pokedexState.pokemonSelected?.getId,
                                margin: const EdgeInsets.only(right: 24),
                                variant: CustomTextVariant.variant1,
                                fontSize: 12,
                                fontColor: CustomColors.white,
                              ),
                            ]),
                      ),
                      Expanded(
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: CustomColors.white,
                                ),
                                margin: const EdgeInsets.all(4),
                                padding: const EdgeInsets.all(20),
                                height:
                                    MediaQuery.of(context).size.height * 0.65,
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 56,
                                    ),
                                    Wrap(
                                      runSpacing: 8,
                                      spacing: 8,
                                      children: pokedexState
                                              .pokemonSelected?.types
                                              ?.map((e) => typeContainer(
                                                  typeName: e.nameType ?? "",
                                                  color: CustomColors
                                                      .getPokemonColor(
                                                          e.nameType ?? "")))
                                              .toList() ??
                                          [],
                                    ),
                                    CustomText(
                                      margin: const EdgeInsets.only(
                                          top: 16, bottom: 16),
                                      description: "About",
                                      variant: CustomTextVariant.variant1,
                                      fontSize: 14,
                                      fontColor: colorPrimaryPokemon,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                const CustomSVGPicture(
                                                  ulr: UrlImages.weight,
                                                  size: 16,
                                                  margin:
                                                      EdgeInsets.only(right: 8),
                                                ),
                                                CustomText(
                                                  description:
                                                      "${pokedexState.pokemonSelected?.getWeight} kg",
                                                  variant: CustomTextVariant
                                                      .variant1,
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w400,
                                                  fontColor: CustomColors.black,
                                                ),
                                              ],
                                            ),
                                            const CustomText(
                                              description: "Weight",
                                              margin: EdgeInsets.only(top: 12),
                                              variant:
                                                  CustomTextVariant.variant1,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400,
                                              fontColor: CustomColors.grey,
                                            ),
                                          ],
                                        ),
                                        Container(
                                          height: 48,
                                          width: 1,
                                          color: CustomColors.greyLight,
                                        ),
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                const CustomSVGPicture(
                                                  ulr: UrlImages.straighten,
                                                  size: 16,
                                                  margin:
                                                      EdgeInsets.only(right: 8),
                                                ),
                                                CustomText(
                                                  description:
                                                      "${pokedexState.pokemonSelected?.getHeight} m",
                                                  variant: CustomTextVariant
                                                      .variant1,
                                                  fontSize: 10,
                                                  fontWeight: FontWeight.w400,
                                                  fontColor: CustomColors.black,
                                                ),
                                              ],
                                            ),
                                            const CustomText(
                                              description: "Height",
                                              margin: EdgeInsets.only(top: 12),
                                              variant:
                                                  CustomTextVariant.variant1,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400,
                                              fontColor: CustomColors.grey,
                                            ),
                                          ],
                                        ),
                                        Container(
                                          height: 48,
                                          width: 1,
                                          color: CustomColors.greyLight,
                                        ),
                                        Column(
                                          children: [
                                            CustomText(
                                              description:
                                                  "${pokedexState.pokemonSelected?.moves?.first.moveName}\n${pokedexState.pokemonSelected?.moves?.last.moveName}",
                                              variant:
                                                  CustomTextVariant.variant1,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400,
                                              fontColor: CustomColors.black,
                                            ),
                                            const CustomText(
                                              description: "Moves",
                                              margin: EdgeInsets.only(top: 12),
                                              variant:
                                                  CustomTextVariant.variant1,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400,
                                              fontColor: CustomColors.grey,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                    CustomText(
                                      margin: const EdgeInsets.only(
                                          top: 16, bottom: 16),
                                      description: "Base Stats",
                                      variant: CustomTextVariant.variant1,
                                      fontSize: 14,
                                      fontColor: colorPrimaryPokemon,
                                    ),
                                    ...pokedexState.pokemonSelected?.stats
                                            ?.map(
                                              (e) => baseStatsContainer(
                                                  name: e.nameStat,
                                                  value: e.baseStat),
                                            )
                                            .toList() ??
                                        [],
                                  ],
                                ),
                              ),
                            ),
                            viewPokemonContainer(context),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget viewPokemonContainer(BuildContext context) {
    return Observer(builder: (context) {
      return Positioned(
        bottom: MediaQuery.of(context).size.height * 0.59,
        right: 0,
        left: 0,
        child: Stack(
          alignment: Alignment.center,
          children: [
            if (!pokedexState.elementFirst())
              Align(
                alignment: Alignment.centerLeft,
                child: CustomIcon(
                  onTap: () {
                    pokedexState.halfOfTheList();
                    _animationController.dispose();
                    pokedexState.previousPokemon();
                    initController();
                  },
                  margin: const EdgeInsets.only(left: 24),
                  ulr: Icons.arrow_back_ios_rounded,
                  size: 24,
                  color: CustomColors.white,
                ),
              ),
            Align(
              alignment: Alignment.center,
              child: CachedNetworkImage(
                imageUrl:
                    pokedexState.pokemonSelected?.sprite?.frontDefault ?? "",
                height: 200,
                width: 200,
                fit: BoxFit.cover,
              )
                  .animate(
                    controller: _animationController,
                  )
                  .scaleXY(
                      begin: .1,
                      end: 1,
                      curve: Curves.easeInCubic,
                      duration: 600.ms)
                  .shake(),
            ),
            if (pokedexState.elementLast() && pokedexState.isLoadedList)
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                    alignment: Alignment.centerRight,
                    height: 24,
                    width: 24,
                    margin: const EdgeInsets.only(right: 24),
                    child: const CircularProgressIndicator(
                      color: CustomColors.white,
                    )),
              ),
            if (!pokedexState.elementLast())
              Align(
                alignment: Alignment.centerRight,
                child: CustomIcon(
                  onTap: () {
                    pokedexState.halfOfTheList();
                    _animationController.dispose();
                    pokedexState.nextPokemon();
                    initController();
                  },
                  margin: const EdgeInsets.only(right: 24),
                  ulr: Icons.arrow_forward_ios_rounded,
                  size: 24,
                  color: CustomColors.white,
                ),
              ),
          ],
        ),
      );
    });
  }

  Widget baseStatsContainer({required String name, required int value}) {
    return Row(
      children: [
        CustomText(
          width: 31,
          margin: const EdgeInsets.only(
            right: 8,
          ),
          description: Abbreviation.abbreviatedValue(name),
          variant: CustomTextVariant.variant1,
          fontSize: 10,
          fontColor: colorPrimaryPokemon,
        ),
        Container(
          height: 16,
          width: 1,
          color: colorPrimaryPokemon.withOpacity(0.2),
        ),
        CustomText(
          width: 31,
          margin: const EdgeInsets.only(right: 8, left: 12),
          description: value.toString().padLeft(3, '0'),
          variant: CustomTextVariant.variant1,
          fontSize: 10,
          fontColor: colorPrimaryPokemon,
        ),
        Expanded(
          child: LayoutBuilder(
            builder: (p0, p1) {
              return Stack(
                children: [
                  Container(
                    height: 4,
                    width: p1.maxWidth,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: colorPrimaryPokemon.withOpacity(.2),
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    height: 4,
                    width: (p1.maxWidth * value) / 233,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: colorPrimaryPokemon,
                    ),
                  )
                ],
              );
            },
          ),
        )
      ],
    );
  }

  Widget typeContainer({required String typeName, required Color color}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
      ),
      child: CustomText(
        margin: const EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 2),
        description: typeName,
        variant: CustomTextVariant.variant1,
        fontSize: 10,
        fontColor: CustomColors.white,
      ),
    )
        .animate(controller: AnimationController(vsync: this))
        .fade(duration: 700.ms)
        .slideX(duration: 700.ms, begin: .8, end: 0);
  }
}
