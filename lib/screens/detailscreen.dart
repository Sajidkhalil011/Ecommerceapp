import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen(
      {Key? key,
      required this.image,
      required this.watchName,
      required this.price})
      : super(key: key);
  final String image;
  final String watchName;
  final String price;
  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool isSelect = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.40,
                  width: MediaQuery.of(context).size.width,
                  child: Image(
                    fit: BoxFit.cover,
                    image: AssetImage(widget.image),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.arrow_back)),
                      Icon(Icons.favorite_border),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.watchName,
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "(with Solo app)",
                        style: TextStyle(color: Colors.grey),
                      )
                    ],
                  ),
                  Text(
                    widget.price,
                    style: TextStyle(fontSize: 24, color: Colors.deepPurple[600]),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Colors",
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Container(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: colorsData.length,
                    itemBuilder: (context, index) => ColorCard(
                      name: colorsData[index].name,
                      color: colorsData[index].color,
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  TextButton(
                      onPressed: () {
                        setState(() {
                          isSelect = !isSelect;
                        });
                      },
                      child: Text(
                        "Detail",
                        style: TextStyle(
                            color: isSelect ? Colors.blue : Colors.grey,
                            fontSize: 18),
                      )),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          isSelect = !isSelect;
                        });
                      },
                      child: Text(
                        "Review",
                        style: TextStyle(
                            color: isSelect ? Colors.grey : Colors.blue,
                            fontSize: 18),
                      )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 19),
              child: Text(isSelect
                  ? "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book."
          : "Reviews",style: TextStyle(color: Colors.grey,fontSize: 15),),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 50),
              child: Center(
                child: Container(
                  height: 80,
                  width: 300,
                  child: OutlinedButton(
                    onPressed: (){
                      showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: const Text("Cart"),
                          content: const Text("Added to cart successfully!"),
                          actions: <Widget>[
                            ElevatedButton(
                              onPressed: () {
                                Navigator.of(ctx).pop();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue[50]
                              ),
                              child: Container(
                                padding: const EdgeInsets.all(14),
                                child: const Text("Goto cart",style: TextStyle(color: Colors.black),),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
                    ),
                    child: const Text("Add to cart",style: TextStyle(color: Colors.white,fontSize: 27),),
                  ),
                ),
              ),
            )
          ],

        ),
      ),
    );
  }

}

class ColorCard extends StatefulWidget {
  const ColorCard({Key? key, required this.color, required this.name})
      : super(key: key);

  final Color color;
  final String name;

  @override
  State<ColorCard> createState() => _ColorCardState();
}

class _ColorCardState extends State<ColorCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: Container(
        width: 100,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(17),
          border: Border.all(width: 2, color: Colors.black38),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: widget.color,
              ),
            ),
            Text(widget.name),
          ],
        ),
      ),
    );
  }
}

class ColorData {
  final Color color;
  final String name;

  ColorData({required this.color, required this.name});
}

List<ColorData> colorsData = [
  ColorData(color: Colors.red, name: "Red"),
  ColorData(color: Colors.pink, name: "pink"),
  ColorData(color: Colors.yellow, name: "yellow"),
];
