
import 'package:chucker_flutter/chucker_flutter.dart';
import 'package:demo_flutter/core/injection.dart';
import 'package:demo_flutter/core/ui/bloc/article/article_bloc.dart';
import 'package:demo_flutter/core/ui/bloc/article/article_event.dart';
import 'package:demo_flutter/core/ui/pages/daily_news.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/ui/theme/app_theme.dart';

void main() async {
  await initializeDependencies();
  runApp(const DemoApp());
}

class DemoApp extends StatelessWidget {
  const DemoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ArticleBloc>(
      create: (context) => sl()..add(const GetArticles()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorObservers: [ChuckerFlutter.navigatorObserver],
        theme: theme(),
        home: const DailyNews(),
      ),
    );
  }
}
