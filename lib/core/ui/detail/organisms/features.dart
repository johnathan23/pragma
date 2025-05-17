import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:pragma_exam/config/theme/app_dimensions.dart';
import 'package:pragma_exam/core/animations/slide_animation.dart';
import 'package:pragma_exam/core/domain/entities/data/cat_entity.dart';
import 'package:pragma_exam/core/ui/detail/widgets/custom_feature.dart';

class Features extends StatelessWidget {
  final CatEntity? catEntity;

  const Features({super.key, this.catEntity});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
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
              CustomFeature(feature: 'Temperament', valueFeature: catEntity?.temperament ?? '', icon: Symbols.self_improvement),
              const SizedBox(height: kSize10),
              CustomFeature(feature: 'Weight', valueFeature: catEntity?.weight.metric ?? '', icon: Symbols.monitor_weight),
            ],
          ),
        ),
      ),
    );
  }
}
