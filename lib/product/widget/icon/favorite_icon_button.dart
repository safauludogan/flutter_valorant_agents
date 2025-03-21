import 'package:flutter/material.dart';

class FavoriteIconButton extends StatelessWidget {
  const FavoriteIconButton({
    required this.onFavoriteTap,
    this.isFavorite = false,
    super.key,
  });

  /// On favorite tap
  final VoidCallback onFavoriteTap;

  /// Is favorite
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onFavoriteTap,
        child: InkWell(
            child: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border,
          color: Colors.red,
        )));
  }
}
