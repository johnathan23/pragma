import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:pragma_exam/config/theme/app_colors.dart';
import 'package:pragma_exam/config/theme/app_dimensions.dart';
import 'package:pragma_exam/core/animations/slide_animation.dart';
import 'package:pragma_exam/core/domain/entities/data/cat_entity.dart';
import 'package:pragma_exam/core/domain/enum/slide_direction_enum.dart';
import 'package:pragma_exam/core/domain/extension/color_extension.dart';
import 'package:pragma_exam/core/ui/detail/widgets/custom_rating.dart';
import 'package:pragma_exam/share/helpers/image_helper.dart';
import 'package:pragma_exam/share/widgets/appbars/custom_appbar.dart';
import 'package:pragma_exam/share/widgets/images/custom_cache_network_image.dart';

import 'widgets/custom_feature.dart';

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
      child: Scaffold(
        appBar: CustomAppbar(
          title: SizeTransition(sizeFactor: _sizeAnimation, axis: Axis.horizontal, axisAlignment: -1, child: Text(catEntity?.name ?? ''),),
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
                    SliverToBoxAdapter(
                      child: SlideAnimation(
                        direction: SlideDirection.rightToLeft,
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text('Description', style: Theme.of(context).textTheme.bodyLarge),
                          subtitle: Text(catEntity?.description ?? '', style: Theme.of(context).textTheme.bodyMedium),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: SlideAnimation(
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          title: Text('Features', style: Theme.of(context).textTheme.bodyLarge),
                          subtitle: Column(
                            children: [
                              const SizedBox(height: kSize10),
                              CustomFeature(feature: 'Origin', valueFeature: catEntity?.origin ?? '', icon: Symbols.public),
                              const SizedBox(height: kSize10),
                              CustomFeature(feature: 'Life span', valueFeature: catEntity?.lifeSpan ?? '', icon: Symbols.monitor_heart),
                              const SizedBox(height: kSize10),
                              CustomFeature(feature: 'Temperament', valueFeature: catEntity?.temperament ?? '', icon: Symbols.pets),
                              const SizedBox(height: kSize10),
                              CustomFeature(feature: 'Weight', valueFeature: catEntity?.weight.metric ?? '', icon: Symbols.fitness_center),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child:  SlideAnimation(direction: SlideDirection.topToBottom, child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text('Other Features', style: Theme.of(context).textTheme.bodyLarge),
                        subtitle: Column(
                          children: [
                            const SizedBox(height: kSize10,),
                            CustomRating(
                              name: 'Intelligence',
                              value: catEntity?.intelligence ?? 0,
                              maxValue: 5,
                              width: MediaQuery.of(context).size.width * 0.8,
                            ),
                            const SizedBox(height: kSize10,),
                            CustomRating(
                              name: 'Adaptability',
                              value: catEntity?.adaptability ?? 0,
                              maxValue: 5,
                              width: MediaQuery.of(context).size.width * 0.8,
                            ),
                            const SizedBox(height: kSize10,),
                            CustomRating(
                              name: 'Energy Level',
                              value: catEntity?.energyLevel ?? 0,
                              maxValue: 5,
                              width: MediaQuery.of(context).size.width * 0.8,
                            ),
                            const SizedBox(height: kSize10,),
                            CustomRating(
                              name: 'Affection Level',
                              value: catEntity?.affectionLevel ?? 0,
                              maxValue: 5,
                              width: MediaQuery.of(context).size.width * 0.8,
                            ),
                            const SizedBox(height: kSize10,),
                            CustomRating(
                              name: 'Child Friendly',
                              value: catEntity?.childFriendly ?? 0,
                              maxValue: 5,
                              width: MediaQuery.of(context).size.width * 0.8,
                            ),
                            const SizedBox(height: kSize10,),
                            CustomRating(
                              name: 'Dog Friendly',
                              value: catEntity?.dogFriendly ?? 0,
                              maxValue: 5,
                              width: MediaQuery.of(context).size.width * 0.8,
                            ),
                            const SizedBox(height: kSize10,),
                            CustomRating(
                              name: 'Health Issues',
                              value: catEntity?.healthIssues ?? 0,
                              maxValue: 5,
                              width: MediaQuery.of(context).size.width * 0.8,
                            ),
                            const SizedBox(height: kSize10,),
                            CustomRating(
                              name: 'Shedding Level',
                              value: catEntity?.sheddingLevel ?? 0,
                              maxValue: 5,
                              width: MediaQuery.of(context).size.width * 0.8,
                            ),
                            const SizedBox(height: kSize10,),
                            CustomRating(
                              name: 'Social Needs',
                              value: catEntity?.socialNeeds ?? 0,
                              maxValue: 5,
                              width: MediaQuery.of(context).size.width * 0.8,
                            ),
                            const SizedBox(height: kSize10,),
                            CustomRating(
                              name: 'Stranger Friendly',
                              value: catEntity?.strangerFriendly ?? 0,
                              maxValue: 5,
                              width: MediaQuery.of(context).size.width * 0.8,
                            ),
                          ],
                        )
                      )),
                    ),
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
