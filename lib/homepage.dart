import 'package:flutter/material.dart';
import 'bottomBar.dart';
import 'cookies.dart';
Color titlecolor = Color(0xFF545D68);

class homepage extends StatefulWidget {
  @override
  _homepageState createState() => _homepageState();
}

class _homepageState extends State<homepage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.arrow_back,
          color: titlecolor,
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
      body: ListView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20),
        children: <Widget>[
          SizedBox(
            height: 15,
          ),
          Container(
            child: Text(
              'Categories',
              style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Varela'),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          TabBar(
            controller: _tabController,
            labelColor: Color(0xFFC88D67),
            isScrollable: true,
            labelPadding: EdgeInsets.only(right: 45),
            labelStyle: TextStyle(fontSize: 25, fontFamily: 'Valera'),
            indicatorColor: Colors.transparent,
            unselectedLabelColor: Color(0xFFCDCDCD),
            tabs: <Widget>[
              Tab(
                child: Text('Cookies'),
              ),
              Tab(
                child: Text('Cookies Cake'),
              ),
              Tab(
                child: Text('Ice cream'),
              ),
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height  ,
            color: Colors.pink,
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                Cookies(),
                Cookies(),
                Cookies(),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFF17532),
        child: Icon(
          Icons.fastfood,
        ),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBar(),
    );
  }
}
