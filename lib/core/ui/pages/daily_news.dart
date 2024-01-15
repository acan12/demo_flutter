import 'package:demo_flutter/core/ui/bloc/article/article_bloc.dart';
import 'package:demo_flutter/core/ui/bloc/article/article_state.dart';
import 'package:demo_flutter/core/ui/widgets/article_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(),
    );
  }

  _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text(
        'Daily News',
        style: TextStyle(color: Colors.black),
      ),
      actions: [
        GestureDetector(
          onTap: () => _onShowSavedArticlesViewTapped(context),
          child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 14),
              child: Icon(Icons.bookmark, color: Colors.black,),
          ),
        )
      ],
    );
  }

  _buildBody() {
    return BlocBuilder<ArticleBloc, ArticleState>(
      builder: (_, state) {
        if (state is ArticleLoading) {
          return const Center(child: CupertinoActivityIndicator());
        }
        if (state is ArticleError) {
          return const Center(child: Icon(Icons.refresh));
        }
        if (state is ArticleDone) {
          return ListView.builder(itemBuilder: (context, index) {
            return ArticleWidget(
              article: state.articles![index] ,
              // onArticlePressed: (article) => _onArticlePressed(context,article),
            );
          }, itemCount: state.articles!.length,);
        }
        return const SizedBox();
      },
    );
  }

  void _onShowSavedArticlesViewTapped(BuildContext context) {
    Navigator.pushNamed(context, '/SavedArticle');
  }
}