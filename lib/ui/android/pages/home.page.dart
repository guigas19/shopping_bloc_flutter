import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_comp/blocs/homo.bloc.dart';
import 'package:shopping_comp/ui/shared/widgets/category/category-list.widget.dart';
import 'package:shopping_comp/ui/shared/widgets/product/product-list.widget.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final HomeBloc bloc = Provider.of<HomeBloc>(context);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(10),
        child: ListView(
          children: [
            SizedBox(
              height: 60,
            ),
            Text(
              "Categoria",
              style: Theme.of(context).textTheme.headline,
            ),
            SizedBox(
              height: 10,
            ),
            CategoryList(categories: bloc.categories),
            SizedBox(
              height: 20,
            ),
            Text("Mais Vendidos", style: Theme.of(context).textTheme.headline,),
            SizedBox(
              height: 10,
            ),
            ProductList(
              products: bloc.products,
            )
          ],
        ),
      ),
    );
  }
}
