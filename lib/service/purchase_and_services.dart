
class Items {
  Items({required this.name, required this.price });

  String name;
  String price;
  Map<DateTime,Map> history = {};
  int? loose_qty = null;
  int? packed_qty = null;
  //int? price_per_piece;
  //bool price_given_for_box = false;


  void addToHistory(DateTime date,name,price,seller,loose_qty,packed_qty,bool price_given_for_box) {
      history[date] = {
        'name ' : name,
        'price_per_box' : price_given_for_box ? price : price*loose_qty,
        'seller': seller,
        'loose_qty' : loose_qty,
        'packed_qty' : packed_qty,
        'min_price_all_time' : getMinPrice(),
        'min_price_6_month' : getMinPrice(period: 6),
        'min_price_year' : getMinPrice(period: 12),
        'price_per_piece' : price_given_for_box ? price/loose_qty : price,

      };

  }

  int getMinPrice({int period = 0}) {
    //TODO : funtion to get the minimum price from all history
    if (period == 0) {
      //return price from all the time
      return 10;
    } else {
      //return price for last specific month
      return 10;
    }
  }



  DateTime last() {
    //TODO funtion to return the last time item was purchase from the item history and all the details

    return DateTime(2024);

  }

}


class PurchasesManager {

  List Unique_items = [];
  List purchase_history = [];


  //purchase_manager();

}
