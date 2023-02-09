import 'package:assignment/screens/detailscreen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(MediaQuery.of(context).size.height*0.35),
          child: AppBar(
              backgroundColor: Colors.blue[50],
              elevation: 0,
              flexibleSpace: Padding(
                padding: const EdgeInsets.fromLTRB(30, 80, 30, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        const Icon(Icons.menu_rounded, size: 40,),
                        const SizedBox(width: 50,),
                        Expanded(
                          child: TextFormField(
                            textAlign: TextAlign.start,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              prefixIcon: const Icon(Icons.search),
                              suffixIcon: InkWell(
                                child: const Icon(Icons.close),
                                onTap: () {
                                },
                              ),
                              hintText: 'Search Product',
                              contentPadding: const EdgeInsets.all(0),
                              border:  const OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(60)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Text("find your suitable watch now.", style: TextStyle(fontSize: 35),),
                    SizedBox(height: 30,),
                  ],
                ),
              ),
              bottom: TabBar(
                padding: EdgeInsets.symmetric(horizontal: 30),
                labelColor: Colors.blue,
                unselectedLabelColor: Colors.black26,
                tabs: [
                  Tab(text: "Smart watch",),
                  Tab(text: "Casio",),
                  Tab(text: "Tisto",),
                  Tab(text: "Siko",),
                ],
              )
          ),
        ),
        backgroundColor: Colors.blue[50],
        body: TabBarView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: GridView.builder(gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                childAspectRatio: 0.70,
        ),
                itemCount: data.length, itemBuilder: (context, index) => GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DetailScreen(image: data[index].image, watchName: data[index].watchName, price: data[index].price,),));
                    },
                    child: Card(name: data[index].watchName, image: data[index].image, price: data[index].price,subtitle: data[index].subtitle,)),),
            ),
            Container(),
            Container(),
            Container(),
          ],
        ),
      ),
    );
  }
}

class Card extends StatefulWidget {
  const Card({Key? key, required this.name, required this.image, required this.price, required this.subtitle}) : super(key: key);

  final String name, image, price,subtitle;

  @override
  State<Card> createState() => _CardState();
}

class _CardState extends State<Card> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
    ),
      padding: EdgeInsets.all(2),
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image(
                image: AssetImage(widget.image),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(widget.name),
                  Text(widget.price,style: TextStyle(color: Colors.grey),),
                  Text(widget.subtitle,),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Data {
  final String image;
  final String watchName;
  final String price;
  final String subtitle;

  Data({required this.image,required this.watchName, required this.price,required this.subtitle});
}

List<Data> data = [
  Data(image: "assets/img_2.png", watchName: "Apple Watch", price: "\$123", subtitle: "Series 1"),
  Data(image: "assets/2.png", watchName: "Galaxy Watch", price: "\$123", subtitle: "Series 2"),
  Data(image: "assets/3.png", watchName: "Mix Watch", price: "\$123", subtitle: "Series 3"),
  Data(image: "assets/4.png", watchName: "Amazo Fit Watch", price: "\$123", subtitle: "Series 4"),
];