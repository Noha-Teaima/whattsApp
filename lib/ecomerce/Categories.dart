import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    print(cat.length);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 250,
              width: double.infinity,
              color: Color.fromARGB(255, 19, 84, 174),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Hey Halal",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          Spacer(),
                          Icon(Icons.search, color: Colors.white),
                          SizedBox(
                            width: 20,
                          ),
                          Icon(
                            Icons.message,
                            color: Colors.white,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Shop",
                        style: TextStyle(fontSize: 40, color: Colors.white),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "By Category",
                        style: TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ]),
              ),
            ),
            Container(
              height: 60,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: cat.length,
                separatorBuilder: (context, index) => SizedBox(
                  width: 10,
                ),
                itemBuilder: (context, index) => Category(name: cat[index]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Sales(
                      Title: "Halal Meats",
                      price: "\$90/KG",
                      img: "lib/images/category3.jpg",
                      subTitle: "Organics & Fresh"),
                  Sales(
                      Title: "Fruits ",
                      price: "\$50/KG",
                      img: "lib/images/category1.jpg",
                      subTitle: "orange & Fresh"),
                  Sales(
                      Title: "Big & Small Fishes",
                      price: "\$36/KG",
                      img: "lib/images/category7.jpg",
                      subTitle: "Fresh from sea"),
                  Sales(
                      Title: "Vegetables",
                      price: "\$20/KG",
                      img: "lib/images/category4.jpg",
                      subTitle: "Fresh from sea"),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.grey[100],
          currentIndex: index,
          fixedColor: Color.fromARGB(255, 19, 84, 174),
          items: const [
            BottomNavigationBarItem(
                label: "Home",
                icon: Icon(Icons.home_filled),
                backgroundColor: Colors.green),
            BottomNavigationBarItem(
                label: "Shopping",
                icon: Icon(Icons.shopping_cart),
                backgroundColor: Colors.grey),
            BottomNavigationBarItem(
                label: "Profile",
                icon: Icon(Icons.person),
                backgroundColor: Colors.orange),
          ],
          onTap: (int indexOfItem) {
            index = indexOfItem;
            setState(() {});
          }),
    );
  }

  List<String> cat = [
    "Fishes & Meals",
    "Vegetables",
    "Fruits",
    "jucies",
    "Clothes",
    "Shoses"
  ];
}

class Sales extends StatelessWidget {
  final String img;
  final String Title;
  final String subTitle;
  final String price;

  const Sales(
      {super.key,
      required this.Title,
      required this.price,
      required this.img,
      required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: double.infinity,
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Column(
          children: [
            Container(
                height: 120,
                width: 100,
                child: Image.asset(
                  img,
                  width: 150,
                  height: 200,
                  fit: BoxFit.fitHeight,
                ))
          ],
        ),
        SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(Title,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(
              height: 15,
            ),
            Text(subTitle,
                style: TextStyle(
                  fontSize: 15,
                )),
            SizedBox(
              height: 30,
            ),
            Text("Starting From",
                style: TextStyle(
                  fontSize: 10,
                )),
            SizedBox(
              height: 15,
            ),
            Text(
              price,
              style: TextStyle(fontSize: 16, color: Colors.blue),
            )
          ],
        )
      ]),
    );
  }
}

class Category extends StatefulWidget {
  final String name;
  const Category({super.key, required this.name});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  Color _textColor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {
          print("clicked");
          _textColor == Color.fromARGB(255, 19, 84, 174)
              ? _textColor = Colors.white
              : _textColor = Color.fromARGB(255, 19, 84, 174);
          setState(() {});
        },
        child: Container(
          height: 50,
          width: 150,
          child: Center(child: Text(widget.name)),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: _textColor,
              border: Border.all(color: Colors.grey)),
        ),
      ),
    );
  }
}
