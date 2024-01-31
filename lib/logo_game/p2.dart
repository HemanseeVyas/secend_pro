import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

import 'p1.dart';
import 'p3.dart';
// import 'package:p2/logo_game/logo_pageview.dart';
// import 'package:p2/logo_game/p1.dart';
// import 'package:p2/logo_game/play.dart';

class grid1 extends StatefulWidget {
  const grid1({super.key});

  @override
  State<grid1> createState() => _grid1State();
}

class _grid1State extends State<grid1> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  List logo=[
    "myassets/img/l_a_facebook_s.png","myassets/img/l_a_mercedes.png","myassets/img/l_a_adidas.png",
    "myassets/img/l_a_redbull.png","myassets/img/l_a_starbucks_s.png","myassets/img/l_a_toyota_s.png",
    "myassets/img/l_a_mcdonalds_s.png","myassets/img/int_a_google_a.png","myassets/img/l_a_shell_s.png",
    "myassets/img/l_a_hello_kitty_s.png","myassets/img/l_a_honda.png","myassets/img/l_a_amazon.png",
    "myassets/img/l_a_dell.png","myassets/img/l_a_lacoste.png","myassets/img/l_a_volkswagen_s.png",
    "myassets/img/l_a_dropbox.png","myassets/img/l_a_nike_s.png","myassets/img/l_a_burger_king.png",
    "myassets/img/l_a_visa.png","myassets/img/l_a_apple_s.png","myassets/img/l_a_louis_vuitton.png",
    "myassets/img/l_a_audi.png","myassets/img/l_a_citroen.png","myassets/img/l_a_intel.png",
    "myassets/img/l_a_barbie.png","myassets/img/l_a_wikipedia.png","myassets/img/l_a_ebay.png",
    "myassets/img/l_a_twitter_s.png","myassets/img/l_m_android_s.png","myassets/img/l_s_instagram.png",
    "myassets/img/l_a_facebook_s.png","myassets/img/l_z_chrome_s.png","myassets/img/l_t_nintendo.png",
    "myassets/img/l_a_facebook_s.png","myassets/img/l_a_nbc_s.png","myassets/img/l_o_dr_pepper.png",
    "myassets/img/l_q_panasonic.png","myassets/img/l_q_mobil.png","myassets/img/l_w_cnn.png",
    "myassets/img/l_m_pinterest.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Expanded(child:
        Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill,
            image: AssetImage("myassets/img/main_background_header.png"),
          )),
          child: Row(children: [
            Expanded(
              child: InkWell(onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return logos1();
                },));
                setState(() {

                });
              },
                child: Container(
                  height: 40,
                  width: 20,
                  decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill,
                    image: AssetImage("myassets/img/n_arrow_back.png"),
                  )),
                ),
              ),
            ),
            Expanded(flex: 6,
              child: Container(
                height: double.infinity,
                width: double.infinity,
                alignment: Alignment.center,
                child: Text("Level 1",style: TextStyle(color: Colors.white,fontSize: 20),),
              ),
            ),
            Expanded(
              child: Container(
                height: 60,
                width: 40,
                // color: Colors.orange,
                decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill,
                  image: AssetImage("myassets/img/n_bulb_mark.png"),
                )),
              ),
            ),
            Expanded(
              child: Container(
                height: double.infinity,
                width: double.infinity,
                alignment: Alignment.center,
                child: Text("hints\n50",style: TextStyle(color: Colors.white,fontSize: 20),),
              ),
            ),
          ]),
        )
        ),
        Expanded(flex: 8,
          child: Container(
            margin: EdgeInsets.all(20),
            height: double.infinity,
            width: double.infinity,
            child: GridView.builder(itemCount: logo.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ), itemBuilder: (context, index) {
                String test=  logos1.prefs!.getString("win$index")?? "";
                return InkWell(onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return hh(index,logo);
                  },));
                  setState(() {
                  });
                },
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(image: DecorationImage(
                        image: AssetImage("${logo[index]}")
                    )),
                    child: (test=="yes")?Image.asset("myassets/img/abc_btn_check_to_on_mtrl_015.png"):null,
                  ),
                );
              },),
          ),
        )
      ]),
    );
  }
}
