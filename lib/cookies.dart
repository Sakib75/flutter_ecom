import 'package:flutter/material.dart';
import 'package:ecomfirst/Cookie_details.dart';

var isFavorite = false;
class Cookies extends StatelessWidget {
  ScrollController _controller = new ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body : ListView(
        controller: _controller,
        physics: AlwaysScrollableScrollPhysics(),
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(15),
            color: Color(0xFFFCFAF8),
            height: MediaQuery.of(context).size.height - 50,
            width: MediaQuery.of(context).size.width,
            child: GridView.count(
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 15,
              primary: false,
              childAspectRatio: 0.8,
              crossAxisCount: 2,
              children: <Widget>[
                _buildCard('Cookie mint', '\$3.99', 'assets/cookiemint.jpg',
                    false, false, context),
                _buildCard('Cookie cream', '\$5.99', 'assets/cookiecream.jpg',
                    true, false, context),
                _buildCard('Cookie classic', '\$1.99',
                    'assets/cookieclassic.jpg', false, true, context),
                _buildCard('Cookie choco', '\$2.99', 'assets/cookiechoco.jpg',
                    false, false, context),
                _buildCard('Cookie van', '\$2.99', 'assets/cookievan.jpg',
                    false, false, context),


                Container(height: 50,),
                Container(height: 50,)


              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildCard(String name, String price, String imgPath, bool added,
      bool isFavorite, context) {
    return Padding(
        padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
        child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => Details(cookiename: name ,cookieprice: price,imagePath: imgPath,)));
            },
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 3.0,
                          blurRadius: 5.0)
                    ],
                    color: Colors.white),
                child: Column(children: [
                  Padding(
                      padding: EdgeInsets.all(5.0),
                      child: isfav()),
                  Hero(
                    tag: imgPath,
                    child: Container(
                        height: 75.0,
                        width: 75.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(imgPath),
                                fit: BoxFit.contain))),
                  ),
                  SizedBox(height: 7.0),
                  Text(price,
                      style: TextStyle(
                          color: Color(0xFFCC8053),
                          fontFamily: 'Varela',
                          fontSize: 14.0)),
                  Text(name,
                      style: TextStyle(
                          color: Color(0xFF575E67),
                          fontFamily: 'Varela',
                          fontSize: 14.0)),
                  Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Container(color: Color(0xFFEBEBEB), height: 1.0)),
                  Padding(
                      padding: EdgeInsets.only(left: 5.0, right: 5.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            if (!added) ...[
                              Icon(Icons.shopping_basket,
                                  color: Color(0xFFD17E50), size: 12.0),
                              Text('Add to cart',
                                  style: TextStyle(
                                      fontFamily: 'Varela',
                                      color: Color(0xFFD17E50),
                                      fontSize: 12.0))
                            ],
                            if (added) ...[
                              Icon(Icons.remove_circle_outline,
                                  color: Color(0xFFD17E50), size: 12.0),
                              Text('3',
                                  style: TextStyle(
                                      fontFamily: 'Varela',
                                      color: Color(0xFFD17E50),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12.0)),
                              Icon(Icons.add_circle_outline,
                                  color: Color(0xFFD17E50), size: 12.0),
                            ]
                          ]))
                ]))));
  }
}

class isfav extends StatefulWidget {
  const isfav({
    Key key,
  }) : super(key: key);

  @override
  _isfavState createState() => _isfavState();
}

class _isfavState extends State<isfav> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {

          if(isFavorite) {
            isFavorite = false;
          } else
            isFavorite = true;
        });
      },
      child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            isFavorite
                ? Icon(Icons.favorite, color: Color(0xFFEF7532))
                : Icon(Icons.favorite_border,
                color: Color(0xFFEF7532))
          ]),
    );
  }
}
