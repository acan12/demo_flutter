import 'package:demo_flutter/core/ui/bloc/article/article_bloc.dart';
import 'package:demo_flutter/core/ui/bloc/article/article_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({Key? key}): super(key: key)

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: _buildAppBar(),
      body: ,
    );
  }

  _buildAppBar() {
    return AppBar(
      title: const Text(
        'Daily News',
        style: TextStyle(
          color: Colors.black
        ),
      ),
    );
  }

  _buildBody() {
    return BlocBuilder<ArticleBloc, ArticleState>(
      builder: (_, state) {
        if(state is ArticleLoading) {
          return const Center(child: CupertinoActivityIndicator());
        }
        if(state is ArticleError) {
          return const Center(child: Icon(Icons.refresh));
        }
        if(state is ArticleDone) {
          return ListView.builder(itemBuilder: itemBuilder);
        }
      },
    );
  }
}