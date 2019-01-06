import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:food_receipe/models/recipe.dart';
import 'package:food_receipe/widgets/ratting_bar.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard(this.recipe, {this.elevation = 0, this.onTap});

  final Recipe recipe;
  final double elevation;
  final GestureTapCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Card(
            margin: EdgeInsets.all(24),
            elevation: elevation,
            color: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16))
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              child: Stack(
                  children: [
                    Image.network(recipe.imageUrl),
                    Positioned(
                      child: Builder(builder: _buildTitle),
                      top: 0,
                      left: 0,
                      right: 0,
                    ),
                  ]
              ),
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 22,
          child: Center(
            child: Material(
              borderRadius: BorderRadius.all(Radius.circular(24)),
              color: Colors.white,
              elevation: 7,
              child: InkWell(
                onTap: (){
                  if(this.onTap != null){
                    this.onTap();
                  }
                },
                borderRadius: BorderRadius.all(Radius.circular(24)),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 24
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text("Prepare",
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            fontFamily: 'Montserrat'
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Icon(CommunityMaterialIcons.chevron_right),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTitle(BuildContext context) => Container(
    padding: EdgeInsets.only(
        right: 24,
        left: 24,
        top: 8,
        bottom: 56
    ),
    decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment(0, 0),
            end: Alignment(0, 1),
            colors: [
              Colors.white,
              Color(0x00FFFFFF)
            ]
        )
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
              top: 12,
              bottom: 4
          ),
          child: Text(recipe.title,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              fontFamily: 'Montserrat',
            ),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("${recipe.ratting}",
              style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Colors.black54
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: 8
              ),
              child: RattingBar(
                value: recipe.ratting,
              )
            ),
          ],
        ),
      ],
    ),
  );
}
