import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailScreen extends ConsumerStatefulWidget {
  static const String screenName = 'detail';
  static const String path = '/$screenName';

  final String? breedId;

  const DetailScreen({super.key, required this.breedId});

  @override
  ConsumerState createState() => _DetailScreenState();
}

class _DetailScreenState extends ConsumerState<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
