import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:pragma_exam/config/theme/app_colors.dart';
import 'package:pragma_exam/config/theme/app_dimensions.dart';
import 'package:pragma_exam/core/animations/slide_animation.dart';
import 'package:pragma_exam/core/domain/entities/data/cat_entity.dart';
import 'package:pragma_exam/core/domain/enum/slide_direction_enum.dart';
import 'package:pragma_exam/core/domain/extension/color_extension.dart';
import 'package:pragma_exam/core/ui/detail/organisms/features.dart';
import 'package:pragma_exam/core/ui/detail/organisms/other_features.dart';
import 'package:pragma_exam/share/helpers/image_helper.dart';
import 'package:pragma_exam/share/widgets/appbars/custom_appbar.dart';
import 'package:pragma_exam/share/widgets/images/custom_cache_network_image.dart';
import 'package:pragma_exam/share/widgets/listTitle/organisms/custom_list_title.dart';
import 'package:pragma_exam/share/widgets/scaffold/custom_scaffold.dart';

class DetailScreen extends ConsumerStatefulWidget {
  static const String screenName = 'detail';
  static const String path = '/$screenName';

  final CatEntity? catEntity;

  const DetailScreen({super.key, required this.catEntity});

  @override
  ConsumerState createState() => _DetailScreenState();
}

class _DetailScreenState extends ConsumerState<DetailScreen> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _sizeAnimation;

  late final CatEntity? catEntity;

  @override
  void initState() {
    _controller = AnimationController(duration: const Duration(milliseconds: 400), vsync: this);

    _sizeAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.forward();
    catEntity = widget.catEntity;
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScaffold(
        appBar:
            kIsWeb || Platform.isWindows || Platform.isMacOS || Platform.isLinux
                ? null
                : CustomAppbar(
                  title: SizeTransition(
                    sizeFactor: _sizeAnimation,
                    axis: Axis.horizontal,
                    axisAlignment: -1,
                    child: Text(catEntity?.name ?? ''),
                  ),
                  bgColor: kGrey02,
                ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                Hero(
                  tag: '__${catEntity?.name}__',
                  child: CustomCacheNetworkImage(
                    imageUrl: ImageHelper.getImageUrl(catEntity?.referenceImageId ?? ''),
                    fit: BoxFit.fill,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.3,
                  ),
                ),
                Positioned(
                  right: kSize10,
                  bottom: kSize10,
                  child: Hero(
                    tag: '**${catEntity?.name}**',
                    child: CircleAvatar(
                      backgroundColor: kBlack.withOpacityValue(0.5),
                      child: IconButton(
                        icon:
                            !(catEntity?.isFavorite ?? false)
                                ? Icon(Symbols.favorite_rounded, color: kWhite, size: kSize20)
                                : Icon(Symbols.favorite_sharp, color: kRed, size: kSize20, fill: 1),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: CustomScrollView(
                  slivers: [
                    if (kIsWeb || Platform.isWindows || Platform.isMacOS || Platform.isLinux) ...[
                      SliverToBoxAdapter(
                        child: SlideAnimation(
                          direction: SlideDirection.bottomToTop,
                          child: CustomListTitle(
                            padding: EdgeInsets.zero,
                            title: Text('Breed', style: Theme.of(context).textTheme.bodyLarge),
                            subtitle: Text(catEntity?.name ?? '', style: Theme.of(context).textTheme.bodyMedium),
                          ),
                        ),
                      ),
                    ],
                    SliverToBoxAdapter(
                      child: SlideAnimation(
                        direction: SlideDirection.rightToLeft,
                        child: CustomListTitle(
                          padding: EdgeInsets.zero,
                          title: Text('Description', style: Theme.of(context).textTheme.bodyLarge),
                          subtitle: Text(catEntity?.description ?? '', style: Theme.of(context).textTheme.bodyMedium),
                        ),
                      ),
                    ),
                    Features(catEntity: catEntity),
                    OtherFeatures(catEntity: catEntity),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
