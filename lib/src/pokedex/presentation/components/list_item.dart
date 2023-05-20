import 'package:cached_network_image/cached_network_image.dart';
import 'package:desafio_snapfi/core/components/custom_text.dart';
import 'package:desafio_snapfi/core/utils/custom_colors.dart';
import 'package:desafio_snapfi/src/pokedex/domain/models/pokedex_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ListItem extends StatefulWidget {
  final PokemonModel pokemon;
  const ListItem({super.key, required this.pokemon});

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: SingleChildScrollView(
        child: Column(
          children: [
            CustomText(
              description: widget.pokemon.getId,
              width: double.infinity,
              textAlign: TextAlign.end,
              margin: const EdgeInsets.only(right: 8, top: 4),
              variant: CustomTextVariant.variant1,
              fontSize: 8,
              fontWeight: FontWeight.w400,
              fontColor: CustomColors.grey,
            ),
            CachedNetworkImage(
              imageUrl: widget.pokemon.sprite?.frontDefault ?? "",
              height: 72,
              width: 72,
              fit: BoxFit.cover,
            ).animate().shimmer(
                delay: const Duration(milliseconds: 1000),
                duration: const Duration(milliseconds: 1000)),
            CustomText(
              description: widget.pokemon.capitalizeFirstLetter,
              width: double.infinity,
              textAlign: TextAlign.center,
              margin: const EdgeInsets.only(bottom: 4),
              variant: CustomTextVariant.variant1,
              fontSize: 10,
              fontWeight: FontWeight.w400,
              fontColor: CustomColors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
