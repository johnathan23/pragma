import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:pragma_exam/config/theme/app_colors.dart';
import 'package:pragma_exam/config/theme/app_decorations.dart';
import 'package:pragma_exam/config/theme/app_dimensions.dart';
import 'package:pragma_exam/core/domain/entities/data/cat_entity.dart';
import 'package:pragma_exam/core/domain/extension/color_extension.dart';
import 'package:pragma_exam/core/ui/detail/detail_screen.dart';
import 'package:pragma_exam/share/helpers/image_helper.dart';
import 'package:pragma_exam/share/widgets/images/custom_cache_network_image.dart';

class CustomCard extends StatelessWidget {
  final CatEntity? catEntity;
  final int? index;
  final bool? isFavorite;

  const CustomCard({super.key, this.catEntity, this.index, this.isFavorite});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: AppDecorations.cardRounded,
      child: InkWell(
        borderRadius: AppDecorations.radiusVertical(top: kSize20, bottom: kSize20),
        onTap: () => context.pushNamed(DetailScreen.screenName, extra: catEntity),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: AppDecorations.radiusVertical(top: kSize20),
                  child: Hero(
                    tag: '__${catEntity?.name}__',
                    child: CustomCacheNetworkImage(
                      imageUrl: ImageHelper.getImageUrl(catEntity?.referenceImageId ?? ''),
                      fit: BoxFit.fill,
                      width: kIsWeb || Platform.isWindows || Platform.isMacOS || Platform.isLinux ? 400 : 180,
                      height: kIsWeb || Platform.isWindows || Platform.isMacOS || Platform.isLinux ? 400 : 180,
                    ),
                  ),
                ),
                Positioned(
                  right: kSize10,
                  top: kSize10,
                  child: Hero(
                    tag: '**${catEntity?.name}**',
                    child: CircleAvatar(
                      backgroundColor: kBlack.withOpacityValue(0.5),
                      child: IconButton(
                        icon:
                            !(isFavorite ?? false)
                                ? Icon(Symbols.favorite_rounded, color: kWhite, size: kSize20)
                                : Icon(Symbols.favorite_sharp, color: kRed, size: kSize20, fill: 1),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    catEntity?.name ?? '',
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(color: kBlack),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      Flexible(
                        flex: 2,
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          horizontalTitleGap: kSize1,
                          leading: const Icon(Symbols.public, color: kGrey),
                          title: Text(
                            catEntity?.origin ?? '',
                            style: Theme.of(context).textTheme.labelSmall!.copyWith(color: kBlack),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      Spacer(flex: 1),
                      Flexible(
                        flex: 1,
                        child: ListTile(
                          horizontalTitleGap: kNone,
                          contentPadding: EdgeInsets.zero,
                          leading: Icon(Symbols.network_intelligence),
                          title: Text(catEntity?.intelligence.toString() ?? ''),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
