import 'dart:ui';

import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:food_receipe/models/recipe.dart';
import 'package:food_receipe/pages/recipe_page.dart';
import 'package:food_receipe/widgets/body_bg.dart';
import 'package:food_receipe/widgets/receipe_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();

  final List<Recipe> recipes = [
    Recipe(
      imageUrl: "https://ichef.bbci.co.uk/food/ic/food_16x9_448/recipes/classic_cornish_pasty_67037_16x9.jpg",
      title: "Classic Cornish pasty",
      ratting: 5,
    ),
    Recipe(
      imageUrl: "https://blog-paleohacks.s3.amazonaws.com/wp-content/uploads/2014/09/SCHEMA-PHOTO-paleo-fruit-salad.jpg?x16148",
      title: "Fruit Salad",
      ratting: 3.5,
    ),
    Recipe(
      imageUrl: "http://maliksfuzion.com/wp-content/uploads/2017/09/fillet-burger-meal.jpg",
      title: "Burger",
      ratting: 1.5,
    ),
    Recipe(
      imageUrl: "https://www.gannett-cdn.com/-mm-/dfd18086b204d13ea814432e447bf496dfde5579/c=326-0-5433-3840/local/-/media/2018/07/17/IAGroup/DesMoines/636674359916676842-0717-NEW-STATEFAIR-FOODS-00032.jpg?width=520&height=390&fit=crop",
      title: "Burger",
      ratting: 1.5,
    ),
    Recipe(
      imageUrl: "https://ichef.bbci.co.uk/food/ic/food_16x9_832/recipes/one_pot_chorizo_and_15611_16x9.jpg",
      title: "Pasta",
      ratting: 4.6,
    ),
    Recipe(
      imageUrl: "https://images-gmi-pmc.edge-generalmills.com/3007ccc3-f7a9-46ee-99c2-67118ec7b07d.jpg",
      title: "Fruit Salad",
      ratting: 2.5,
    ),
  ];

}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Builder(builder: _buildBody),
  );

  Widget _buildBody(BuildContext context) => BodyBg(
    child: Stack(
      children: <Widget>[
        SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 32
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("New Receipes",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: Colors.white
                      ),
                    ),
                    CircleAvatar(
                      radius: 32,
                      backgroundImage: NetworkImage("https://www.avatarapi.com/images/person2.jpg"),
                    ),
                  ],
                ),
              ),
              Flexible(
                child: ListView.builder(
                  padding: EdgeInsets.only(
                    bottom: 72
                  ),
                  itemCount: widget.recipes.length,
                  itemBuilder: (context, index) => RecipeCard(widget.recipes[index],
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => RecipePage(widget.recipes[index])));
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Material(
              shape: Border(
                top: BorderSide(
                  color: Color(0x11000000)
                )
              ),
              color: Color(0x55FFFFFF),
              child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: 16
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                      color: Color(0xFFD8DADF),
                      icon: Icon(CommunityMaterialIcons.cart),
                      onPressed: (){},
                    ),
                    IconButton(
                      color: Color(0xFFD8DADF),
                      icon: Icon(CommunityMaterialIcons.compass),
                      onPressed: (){},
                    ),
                    IconButton(
                      color: Color(0xFFF76767),
                      icon: Icon(CommunityMaterialIcons.home),
                      onPressed: (){},
                    ),
                    IconButton(
                      color: Color(0xFFD8DADF),
                      icon: Icon(CommunityMaterialIcons.account),
                      onPressed: (){},
                    ),
                    IconButton(
                      color: Color(0xFFD8DADF),
                      icon: Icon(CommunityMaterialIcons.toolbox),
                      onPressed: (){},
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );

}
