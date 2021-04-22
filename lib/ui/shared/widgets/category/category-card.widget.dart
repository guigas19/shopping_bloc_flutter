import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shopping_comp/blocs/homo.bloc.dart';
import 'package:shopping_comp/models/category-list-item.model.dart';

import '../../../../settings.dart';

class CategoryCard extends StatelessWidget {
  final CategoryListItemModel item;

  const CategoryCard({@required this.item});

  @override
  Widget build(BuildContext context) {
    final HomeBloc bloc = Provider.of<HomeBloc>(context);

    return Container(
      height: 70,
      width: 70,
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: item.tag == bloc.selectedCategory
            ? Theme.of(context).primaryColor.withOpacity(0.3)
            : Theme.of(context).primaryColor,
        borderRadius: BorderRadius.all(
          Radius.circular(70),
        ),
      ),
      child: FlatButton(
        child: Image.asset("assets/categories/${Settings.theme}/${item.tag}.png"),
        onPressed: () {
          bloc.changeCategory(item.tag);
        },
      ),
    );
  }
}
