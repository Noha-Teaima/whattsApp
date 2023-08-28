import 'package:flutter/material.dart';

class task1 extends StatelessWidget {
  const task1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("WhatsApp")),
        actions: [Icon(Icons.messenger_outline_sharp)],
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(children: [
            _custom(icon: Icons.lock, name: "Locked Chats"),
            _custom(icon: Icons.lock, name: "Archive", count: "1"),
            // SizedBox(
            //   height: 20,
            // ),
            // _message(name: "noha", message: "hello", creatAt: "11:25 pm")

            ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: info.length,
                itemBuilder: (context, index) => _message(
                    name: info[index].name,
                    message: info[index].message,
                    creatAt: info[index].creatAt,
                    image: info[index].image))
          ]),
        ),
      ),
    );
  }
}

Widget _custom({required IconData icon, required String name, String? count}) {
  return Row(
    children: [
      Icon(
        icon,
        color: Colors.green,
      ),
      SizedBox(
        width: 10,
      ),
      Text(
        name,
        style: TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green),
      ),
      if (count != null) Spacer(),
      if (count != null)
        Text(
          count,
          style: TextStyle(fontSize: 15, color: Colors.green),
        ),
      SizedBox(
        height: 40,
      )
    ],
  );
}

Widget _message(
    {required String name,
    required String message,
    required String creatAt,
    required String image}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      CircleAvatar(backgroundImage: AssetImage(image)),
      SizedBox(
        width: 20,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          Text(
            message,
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
      Spacer(),
      Text(creatAt),
      SizedBox(
        height: 70,
      )
    ],
  );
}

List<data> info = [
  data(name: "noha", message: "message", creatAt: "12:35 pm", image: img1),
  data(name: "heba", message: "welcome Back", creatAt: "10:35 pm", image: img3),
  data(
      name: "yassmin",
      message: "Thanks for help",
      creatAt: "6:45 Am",
      image: img2),
  data(name: "ola", message: "hello", creatAt: "12:35 pm", image: img7),
  data(name: "reem", message: "message", creatAt: "12:35 pm", image: img4),
  data(name: "aya", message: " data send ", creatAt: "12:35 pm", image: img5),
  data(
      name: "hola",
      message: "can you help me",
      creatAt: "12:35 pm",
      image: img2),
  data(name: "mena", message: "message", creatAt: "12:35 pm", image: img6),
  data(name: "omnia", message: "message", creatAt: "12:35 pm", image: img7),
  data(name: "noha", message: "message", creatAt: "12:35 pm", image: img2),
  data(name: "noha", message: "message", creatAt: "12:35 pm", image: img1),
  data(name: "aya", message: " data send ", creatAt: "12:35 pm", image: img5),
  data(
      name: "hola",
      message: "can you help me",
      creatAt: "12:35 pm",
      image: img2),
  data(name: "mena", message: "message", creatAt: "12:35 pm", image: img6),
  data(name: "omnia", message: "message", creatAt: "12:35 pm", image: img2),
  data(name: "noha", message: "message", creatAt: "12:35 pm", image: img1),
  data(name: "noha", message: "message", creatAt: "12:35 pm", image: img2),
];

class data {
  final String name;
  final String creatAt;
  final String message;
  final String image;

  data(
      {required this.name,
      required this.message,
      required this.creatAt,
      required this.image});
}

String img1 = "lib/images/img1.jfif";
String img2 = "lib/images/img2.jfif";
String img3 = "lib/images/img3.jfif";
String img4 = "lib/images/img5.jfif";
String img5 = "lib/images/img6.jfif";
String img6 = "lib/images/img7.jfif";
String img7 = "lib/images/img4.png";
