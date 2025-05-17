import 'package:flutter/material.dart';
import 'package:pragma_exam/config/theme/app_dimensions.dart';
import 'package:pragma_exam/core/animations/slide_animation.dart';
import 'package:pragma_exam/core/domain/entities/data/cat_entity.dart';
import 'package:pragma_exam/core/domain/enum/slide_direction_enum.dart';
import 'package:pragma_exam/core/ui/detail/widgets/custom_rating.dart';
import 'package:pragma_exam/share/widgets/listTitle/organisms/custom_list_title.dart';

class OtherFeatures extends StatelessWidget {
  final CatEntity? catEntity;

  const OtherFeatures({super.key, this.catEntity});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SlideAnimation(
        direction: SlideDirection.topToBottom,
        child: CustomListTitle(
          padding: EdgeInsets.zero,
          title: Text('Other Features', style: Theme.of(context).textTheme.bodyLarge),
          subtitle: Column(
            children: [
              const SizedBox(height: kSize10),
              CustomRating(
                name: 'Intelligence',
                value: catEntity?.intelligence ?? 0,
                maxValue: 5,
                width: MediaQuery.of(context).size.width * 0.8,
              ),
              const SizedBox(height: kSize10),
              CustomRating(
                name: 'Adaptability',
                value: catEntity?.adaptability ?? 0,
                maxValue: 5,
                width: MediaQuery.of(context).size.width * 0.8,
              ),
              const SizedBox(height: kSize10),
              CustomRating(
                name: 'Energy Level',
                value: catEntity?.energyLevel ?? 0,
                maxValue: 5,
                width: MediaQuery.of(context).size.width * 0.8,
              ),
              const SizedBox(height: kSize10),
              CustomRating(
                name: 'Affection Level',
                value: catEntity?.affectionLevel ?? 0,
                maxValue: 5,
                width: MediaQuery.of(context).size.width * 0.8,
              ),
              const SizedBox(height: kSize10),
              CustomRating(
                name: 'Child Friendly',
                value: catEntity?.childFriendly ?? 0,
                maxValue: 5,
                width: MediaQuery.of(context).size.width * 0.8,
              ),
              const SizedBox(height: kSize10),
              CustomRating(
                name: 'Dog Friendly',
                value: catEntity?.dogFriendly ?? 0,
                maxValue: 5,
                width: MediaQuery.of(context).size.width * 0.8,
              ),
              const SizedBox(height: kSize10),
              CustomRating(
                name: 'Health Issues',
                value: catEntity?.healthIssues ?? 0,
                maxValue: 5,
                width: MediaQuery.of(context).size.width * 0.8,
              ),
              const SizedBox(height: kSize10),
              CustomRating(
                name: 'Shedding Level',
                value: catEntity?.sheddingLevel ?? 0,
                maxValue: 5,
                width: MediaQuery.of(context).size.width * 0.8,
              ),
              const SizedBox(height: kSize10),
              CustomRating(
                name: 'Social Needs',
                value: catEntity?.socialNeeds ?? 0,
                maxValue: 5,
                width: MediaQuery.of(context).size.width * 0.8,
              ),
              const SizedBox(height: kSize10),
              CustomRating(
                name: 'Stranger Friendly',
                value: catEntity?.strangerFriendly ?? 0,
                maxValue: 5,
                width: MediaQuery.of(context).size.width * 0.8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
