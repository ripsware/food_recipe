import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_receipe/models/recipe.dart';
import 'package:food_receipe/widgets/ratting_bar.dart';

class RecipePage extends StatefulWidget {

  RecipePage(this.recipe);

  final Recipe recipe;

  @override
  _RecipePageState createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  @override
  Widget build(BuildContext context) => Container(
    color: Theme.of(context).canvasColor,
    child: Stack(
      children: <Widget>[
        Builder(builder: _buildBg),
        Positioned(
          left: 0,
          top: 0,
          bottom: 0,
          right: 0,
          child: Scaffold(
            appBar: AppBar(
              iconTheme: IconThemeData(
                color: Colors.white,
                size: 32,
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            backgroundColor: Colors.transparent,
            body: Builder(builder: _buildBody),
          ),
        ),
      ],
    ),
  );

  Widget _buildBody(BuildContext context) => Container(
    width: double.infinity,
    padding: EdgeInsets.only(
      left: 16,
      right: 16,
      bottom: 32
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text("THE",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Montserrat",
                      fontSize: 24,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 16
                      ),
                      height: 2,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              Text(widget.recipe.title,
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "AbrilFatface",
                    fontSize: 40,
                    fontWeight: FontWeight.w400
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16
                ),
                child: RattingBar(
                  color: Colors.white,
                  value: widget.recipe.ratting,
                  iconSize: 20,
                  emptyColor: Color(0x55FFFFFF),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Material(
            color: Colors.white,
            borderRadius:BorderRadius.all(Radius.circular(16)),
            elevation: 8,
            child: Container(
              padding: EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 16
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color(0xFFDDDDDD)
                        )
                      )
                    ),
                    child: Text("INGREDIENTS",
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: 18,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w700
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) => Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                                color: Color(0xFFDDDDDD),
                                style: BorderStyle.solid,
                                width: .5
                            )
                          )
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 16,
                          horizontal: 8
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(right: 16),
                              child: CircleAvatar(
                                radius: 4,
                                backgroundColor: Colors.black45,
                              ),
                            ),
                            Text("Item ${index + 1}",
                              style: TextStyle(
                                color: Colors.black45,
                                fontFamily: 'Montserrat',
                                fontSize: 16,
                                fontWeight: FontWeight.w400
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    ),
  );

  Widget _buildBg(BuildContext context) => Positioned(
    top: 0,
    left: 0,
    right: 0,
    bottom: MediaQuery.of(context).size.height * .5,
    child: Container(
      height: MediaQuery.of(context).size.height * .5,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(widget.recipe.imageUrl),
            fit: BoxFit.cover
        ),
      ),
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * .5,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment(0, .8),
                end: Alignment(0, 0),
                colors: [
                  Color(0xEE000000),
                  Color(0x33000000),
                ]
            )
        ),
      ),
    ),
  );
}
