import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shopping_comp/blocs/cart.bloc.dart';
import 'package:shopping_comp/models/cart-item.model.dart';
import 'package:shopping_comp/ui/shared/widgets/cart/cart-item.widget.dart';
import 'package:shopping_comp/ui/shared/widgets/shared/loader.widget.dart';

class CartPage extends StatelessWidget {
  var bloc;
  final price = new NumberFormat("#,##0.00", "pt_BR");
  var items = new List<CartItemModel>();

  @override
  Widget build(BuildContext context) {
    bloc = Provider.of<CartBloc>(context);
    items = bloc.cart;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: 60,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
                child: Loader(
                  object: bloc.cart,
                  callback: list,
                ),
            ),
            Container(
              height: 80,
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "R\$ ${price.format(bloc.total)}",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  FlatButton(
                    color: Theme.of(context).primaryColor,
                      child: Text("Checkout"),
                    onPressed: () {},
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget list() {
    return ListView.builder(
      scrollDirection: Axis.vertical,
        itemCount: items.length,
        itemBuilder: (context, index) {
        return Dismissible(
          child: CartItem(
            item: items[index],
          ),
          key: Key(items[index].id),
          onDismissed: (direction) {
            bloc.remove(items[index]);
          },
          background: Container(
            color: Colors.red.withOpacity(0.1),
          ),
        );
        }
    );
  }
}
