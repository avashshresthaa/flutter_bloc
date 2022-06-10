import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice/cubit/app_cubit_states.dart';

import '../cubit/app_cubit.dart';
import '../misc/colors.dart';
import '../widgets/app_buttons.dart';
import '../widgets/app_large_text.dart';
import '../widgets/app_text.dart';
import '../widgets/responsive_button.dart';

class DetailPage extends StatefulWidget {
  DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStars = 4;
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(
      builder: (context, state) {
        if (state is DetailState) {
          DetailState detail = state as DetailState;
          return Scaffold(
            body: Container(
              height: double.maxFinite,
              width: double.maxFinite,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    right: 0,
                    child: Container(
                      width: double.maxFinite,
                      height: 350,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                  'http://mark.bslmeiyu.com/uploads/${detail.places.img}'),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    top: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            BlocProvider.of<AppCubits>(context).goHome();
                          },
                          icon: Icon(Icons.menu),
                          color: Colors.white,
                        ),
                        // IconButton(
                        //   onPressed: () {},
                        //   icon: Icon(Icons.menu),
                        //   color: Colors.white,
                        // ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 320,
                    child: Container(
                      padding: EdgeInsets.only(left: 20, right: 20, top: 30),
                      width: MediaQuery.of(context).size.width,
                      height: 500,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)),
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppLargeText(
                                text: detail.places.name,
                                color: Colors.black.withOpacity(0.8),
                              ),
                              AppLargeText(
                                  text: "\$" + detail.places.price.toString(),
                                  color: AppColors.mainColor),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: AppColors.mainColor,
                              ),
                              SizedBox(width: 5),
                              AppText(
                                text: detail.places.location,
                                color: AppColors.textColor1,
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Wrap(
                                children: List.generate(
                                    5,
                                    (index) => Icon(
                                          Icons.star,
                                          color: detail.places.stars > index
                                              ? AppColors.starColor
                                              : AppColors.textColor2,
                                        )),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              AppText(
                                text: '(5.0)',
                                color: AppColors.textColor2,
                              )
                            ],
                          ),
                          SizedBox(height: 25),
                          AppLargeText(
                            text: 'People',
                            size: 20,
                            color: Colors.black.withOpacity(0.8),
                          ),
                          SizedBox(height: 5),
                          AppText(
                            text: 'Number of people in your group',
                            color: AppColors.mainTextColor,
                          ),
                          SizedBox(height: 10),
                          Wrap(
                              children: List.generate(5, (index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 10),
                                child: AppButtons(
                                  size: 50,
                                  color: selectedIndex == index
                                      ? Colors.white
                                      : Colors.black,
                                  backgroungColor: selectedIndex == index
                                      ? Colors.black
                                      : AppColors.buttonBackground,
                                  borderColor: selectedIndex == index
                                      ? Colors.black
                                      : AppColors.buttonBackground,
                                  // icon: Icons.favorite_border,
                                  // isIcon: true,
                                  text: (index + 1).toString(),
                                ),
                              ),
                            );
                          })),
                          SizedBox(height: 20),
                          AppLargeText(
                            text: 'Description',
                            color: Colors.black.withOpacity(0.8),
                            size: 20,
                          ),
                          SizedBox(height: 10),
                          AppText(
                            text: detail.places.description,
                            color: AppColors.mainTextColor,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 20,
                    right: 20,
                    child: Row(
                      children: [
                        AppButtons(
                            size: 60,
                            color: AppColors.textColor1,
                            backgroungColor: Colors.white,
                            isIcon: true,
                            icon: Icons.favorite_border,
                            borderColor: AppColors.textColor1),
                        SizedBox(
                          width: 20,
                        ),
                        ResponsiveButton(
                          isResponsive: true,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
