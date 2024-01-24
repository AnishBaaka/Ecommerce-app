import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 237, 237),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: Text(
              "App Name",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange),
            ),
          ),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            padding: const EdgeInsets.all(10),
            height: 150,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Image.network(
                  "https://images.unsplash.com/photo-1600891964599-f61ba0e24092?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cmVzdGF1cmFudCUyMGZvb2R8ZW58MHx8MHx8fDA%3D",
                ),
                const SizedBox(
                  width: 20,
                ),
                Image.network(
                    "https://promova.com/content/clothes_for_summer_9079d238e3.png"),
                const SizedBox(
                  width: 20,
                ),
                Image.network(
                    "https://promova.com/content/winter_clothing_4b74068e12.png"),
                const SizedBox(
                  width: 20,
                ),
                Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSU89KXzZuk7phSTNFYOKZXrRYNzlEamib0TQ&usqp=CAU"),
                const SizedBox(
                  width: 20,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          itemsWidget("FOODS"),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: [
                itemsDetailsWidget(
                    "https://img.freepik.com/free-photo/tasty-burger-isolated-white-background-fresh-hamburger-fastfood-with-beef-cheese_90220-1063.jpg?size=338&ext=jpg&ga=GA1.1.632798143.1705968000&semt=sph",
                    "Burger"),
                const SizedBox(
                  width: 10,
                ),
                itemsDetailsWidget(
                    "https://images.immediate.co.uk/production/volatile/sites/30/2022/08/Corndogs-7832ef6.jpg?quality=90&resize=556,505",
                    "Corndog"),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          itemsWidget("CLOTHES"),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                itemsDetailsWidget(
                    "https://static-01.daraz.com.np/p/72595fecd595aa50df516c3ee4a7da16.jpg",
                    "Pant"),
                const SizedBox(
                  width: 10,
                ),
                itemsDetailsWidget(
                    "https://contents.mediadecathlon.com/p2511365/b56ebd41ddfccff9283ab6dcdbb0b224/p2511365.jpg",
                    "Shirt")
              ],
            ),
          ),
        ],
      ),
    );
  }

  Column itemsDetailsWidget(String imageAddress, String itemName) {
    return Column(
      children: [
        Image.network(
          imageAddress,
          height: 90,
        ),
        Text(
          itemName,
          style: const TextStyle(fontSize: 15, color: Colors.deepOrange),
        ),
        const AddToCart(),
      ],
    );
  }

  Padding itemsWidget(String itemname) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Text(
        itemname,
        textDirection: TextDirection.rtl,
        style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.deepOrange),
      ),
    );
  }
}

class AddToCart extends StatelessWidget {
  const AddToCart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      child: const Text(
        "Add To Cart",
        style: TextStyle(color: Colors.deepOrange),
      ),
    );
  }
}
