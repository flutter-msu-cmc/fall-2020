import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'models/quote_category.dart';
import 'blocs/quote_categories_bloc.dart';
import 'api/response.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CategoriesPage(),
    );
  }
}

class CategoriesPage extends StatefulWidget {
  CategoriesPage({Key key}) : super(key: key);

  @override
  _CategoriesPageState createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  QuoteCategoriesBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = QuoteCategoriesBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
      ),
      body: RefreshIndicator(
        onRefresh: () => _bloc.getCategories(),
        child: StreamBuilder(
          stream: _bloc.listStream,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              switch (snapshot.data.status) {
                case Status.loading:
                  return Center(child: Text('Is loading'));
                case Status.error:
                  print('${snapshot.data.message}');
                  return Container();
                case Status.completed:
                  return CategoryList(snapshot.data.data);
                default:
              }
            }
            return Container();
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
}

class CategoryList extends StatelessWidget {
  final QuoteCategories categoriesList;

  const CategoryList(this.categoriesList, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => ListView.builder(
        itemBuilder: (context, index) {
          final item = categoriesList.categories[index];
          return ListTile(title: Text(item.text));
        },
        itemCount: categoriesList.length,
      );
}
