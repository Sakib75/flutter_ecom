import 'package:flutter/material.dart';
import 'bottomBar.dart';
Color titlecolor = Color(0xFF545D68);
class Details extends StatelessWidget {
  final cookiename,cookieprice,imagePath;
  Details({this.cookiename,this.cookieprice,this.imagePath});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon : Icon(
              Icons.arrow_back,
              color: titlecolor,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          centerTitle: true,
          title: Text(
            'Pickup',
            style: TextStyle(color: titlecolor, fontSize: 25),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: Icon(
                Icons.notifications_none,
                color: titlecolor,
              ),
            )
          ],
        ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 40,),
          Row(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Align(
                alignment: Alignment.topLeft,
                child: Text('Cookie',style: TextStyle(fontFamily: 'Varela',fontSize: 40,color: Color(0xFFF17532),fontWeight: FontWeight.bold),)),
          ),

          Hero(
            tag: imagePath,
            child: Container(
                height: 200,
                width: 300,
                child: Image.asset('$imagePath',)),
          ),
          SizedBox(height: 20,),
          Text('$cookieprice',style: TextStyle(fontFamily: 'Varela',fontSize: 25,color: Color(0xFFF17532),fontWeight: FontWeight.bold) ,),
          SizedBox(height: 5,),
          Text('$cookiename',style: TextStyle(fontFamily: 'Varela',fontSize: 25,color: Colors.black,fontWeight: FontWeight.w500) ,),


          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 50),
            child: Text('Cold, creamy ice cream sadwiched between elicious deluxe cookies. pick your favourite deluxe cookies ansd ice cream flavour',
              style: TextStyle(fontFamily: 'Varela',fontSize: 15
            ),
              textAlign: TextAlign.center,

            ),
          ),
          SizedBox(height: 10,),

          Container(
            height: 60,
            width: MediaQuery.of(context).size.width * .8,
            decoration: BoxDecoration(
              color: Color(0xFFF17532),
              borderRadius: BorderRadius.all(Radius.circular(60))
            ),
            child: Center(child: Text('Add to cart',style: TextStyle(fontSize: 20,fontFamily: 'Varela',color: Colors.white),)),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.fastfood),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBar(),
    );
  }
}
