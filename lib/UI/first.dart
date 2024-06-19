import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wizo/UI/second.dart';

import '../Bloc/wizo_bloc.dart';
import '../Repostory/Model Class/WizoModel.dart';

class Screen1 extends StatefulWidget {
  const Screen1({super.key});

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  late WizoModel details;

  @override
  void initState() {
    BlocProvider.of<WizoBloc>(context).add(FetchWizoEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Wizo',
          style: GoogleFonts.roboto(
            textStyle: TextStyle(
              color: Colors.black,
              fontSize: 26.sp,
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: CircleAvatar(
            radius: 8.r,
            backgroundColor: Color(0xFFE5DCFC),
            child: SizedBox(
                width: 40.w, height: 40.h, child: Image.asset("assets/a.png")),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              children: [
                Icon(
                  Icons.notifications_outlined,
                  color: Colors.black,
                  size: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 11),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Icon(
                          Icons.favorite_border_outlined,
                          color: Colors.black,
                          size: 30,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 18, top: 5),
                        child: CircleAvatar(
                          backgroundColor: Color(0x338204FF),
                          radius: 10.r,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 2, bottom: 4),
                            child: Text("1", style: TextStyle(fontSize: 13)),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 370.w,
                height: 50.h,
                decoration: ShapeDecoration(
                    color: Colors.white60,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25))),
                child: TextField(
                  decoration: InputDecoration(
                    labelText: "Search",
                    prefixIcon: Icon(
                      Icons.search_outlined,
                      color: Colors.purple,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    "Categories",
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                        color: Color(0xFF414141),
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 260.w,
                  ),
                  Text(
                    'See all',
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                        color: Color(0xFF8204FF),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Row(
                children: [
                  Container(
                    width: 60.w,
                    height: 85.h,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                            width: 90.w,
                            height: 60.h,
                            child: Image.asset("assets/b.png")),
                        Text(
                          'Foods',
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Container(
                    width: 60.w,
                    height: 85.h,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                            width: 90.w,
                            height: 60.h,
                            child: Image.asset("assets/c.png")),
                        Text(
                          'Gift',
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Container(
                    width: 60.w,
                    height: 85.h,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                            width: 90.w,
                            height: 60.h,
                            child: Image.asset("assets/d.png")),
                        Text(
                          'Fashion',
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Container(
                    width: 60.w,
                    height: 85.h,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                            width: 90.w,
                            height: 60.h,
                            child: Image.asset("assets/e.png")),
                        Text(
                          'Gadget',
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  Container(
                    width: 60.w,
                    height: 85.h,
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                            width: 90.w,
                            height: 60.h,
                            child: Image.asset("assets/f.png")),
                        Text(
                          'Accessory',
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30.h,
            ),
            Stack(
              children: [
                Container(
                  width: 344.w,
                  height: 120.h,
                  decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: Image.asset(
                    "assets/k.png",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 13, left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Don't Miss Out!",
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 27.sp,
                              fontWeight: FontWeight.w800,
                              height: 0.h),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 3, left: 4),
                        child: Text(
                          'Save Up to 75% Off',
                          style: GoogleFonts.roboto(
                            textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w400,
                              height: 0.h,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8, left: 5),
                        child: Container(
                          width: 85.w,
                          height: 35.h,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),),),
                          child: Center(
                            child: Text(
                                'Shop now',
                                style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                    color: Color(0xFF8204FF),
                                    fontSize: 14.sp,
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w600,
                                    height: 0.h,
                                  ),)
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text(
                    'Featured products',
                    style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          color: Color(0xFF414141),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        )),
                  ),
                  SizedBox(
                    width: 230.w,
                  ),
                  Text(
                    'See all',
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                        color: Color(0xFF8204FF),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10.w,
            ),
            BlocBuilder<WizoBloc, WizoState>(
              builder: (context, state) {
                if(state is  WizoBlocLoading){
                  return Center(child: CircularProgressIndicator(),);
                }
                if(state is WizoBlocError){
                  return Center(child: Text("Error"),);
                }
                if(state is WizoBlocLoaded) {
                  details = BlocProvider
                      .of<WizoBloc>(context)
                      .wizoModel;

                  return SizedBox(
                    width: 500.w,
                    height: 130.h*details.data!.products!.length.toDouble(),
                    child: GridView.count(physics: NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                      childAspectRatio: 300/400,
                      shrinkWrap: true,
                      children: List.generate(
                        details.data!.products!.length,
                            (index) {
                          return Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: GestureDetector(onTap: () {
                               Navigator.of(context).push(MaterialPageRoute(builder: (_)=>Screen2(id:  details.data!.products![index].asin.toString() ,)));
                            },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  image: DecorationImage(
                                    image: NetworkImage('img.png'),
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20.0),
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(20),
                                      topLeft: Radius.circular(20)),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      SizedBox(width: 150.w,height: 150.h,
                                          child: Image.network(details.data!.products![index].productPhoto.toString())),
                                      Padding(
                                        padding:
                                        const EdgeInsets.only(left: 10, top: 6),
                                        child: SizedBox(width: 150.w,
                                          child: Text(maxLines: 1,
                                            details.data!.products![index].productTitle.toString(),
                                            style: GoogleFonts.roboto(
                                              textStyle: TextStyle(
                                                color: Colors.black,
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                        const EdgeInsets.only(left: 10, top: 6),
                                        child: Row(
                                          children: [
                                            Text(
                                              details.data!.products![index].productPrice.toString(),
                                              style: GoogleFonts.roboto(
                                                textStyle: TextStyle(
                                                  color: Color(0xFF8204FF),
                                                  fontSize: 19.sp,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 70.w,
                                            ),
                                            Icon(
                                              Icons.add_shopping_cart_outlined,
                                              color: Color(0xFF8204FF),
                                              size: 19,
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                }else{return (SizedBox());}
              },
            ),
          ],
        ),
      ),
    );
  }
}
