import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task1/data.dart';

class BookingHistory extends StatefulWidget {
  const BookingHistory({super.key});

  @override
  State<BookingHistory> createState() => _BookingHistoryState();
}

class _BookingHistoryState extends State<BookingHistory> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Booking History"),
      //   centerTitle: true,
      //   backgroundColor: Colors.green,
      // ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Center(
                child: Text(
              "Booking history",
              style: TextStyle(fontSize: 20, color: Colors.white),
            )),
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
          ),
          SizedBox(
            height: 20,
          ),
          ListTileWidget(),
          SizedBox(
            height: 20,
          ),
          ListTileWidget(),
          SizedBox(
            height: 20,
          ),
          ListTileWidget(),
          SizedBox(
            height: 20,
          ),
          Center(
            child: TextButton.icon(
              onPressed: () {},
              icon: Icon(Icons.add),
              label: Text(
                "Booking More",
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
              style: TextButton.styleFrom(
                iconColor: Colors.grey,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.grey[80],
          currentIndex: 0,
          fixedColor: Colors.green,
          items: const [
            BottomNavigationBarItem(
                label: "Email",
                icon: Icon(Icons.email_outlined),
                backgroundColor: Colors.green),
            BottomNavigationBarItem(
                label: "Calender",
                icon: Icon(Icons.calendar_today_outlined),
                backgroundColor: Colors.grey),
            BottomNavigationBarItem(
                label: "Profile",
                icon: Icon(Icons.person),
                backgroundColor: Colors.orange),
          ],
          onTap: (int indexOfItem) {
            index = indexOfItem;
          }),
    );
  }
}

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: Container(
          child: Image.asset(
            "lib/images/img2.jfif",
          ),
        ),
        title: Text(
          "Ambrosia Hotel & Restaurant",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        subtitle: Row(children: [
          Icon(Icons.pin_drop_outlined),
          Text("kazi Deiry, Taiger Pass\n Chittagong"),
          SizedBox(
            width: 10,
          )
        ]),
        trailing: ElevatedButton(
          onPressed: () {},
          child: Text("check"),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green,
          ),
        ));
  }
}
