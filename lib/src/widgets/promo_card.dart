//  Un widget reutilizable que representa una promoción.
import 'package:flutter/material.dart';

class PromotionTile extends StatefulWidget {
// class PromotionTile extends StatelessWidget {
  final String title;
  final String imagePath;

  const PromotionTile({
    Key? key,
    required this.title,
    required this.imagePath,
  }) : super(key: key);

  @override
  State<PromotionTile> createState() => _PromotionTileState();
}

class _PromotionTileState extends State<PromotionTile> {
  bool _isLoaded = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        setState(() {
          _isLoaded = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 16.0, bottom: 8.0),
          child: Text(widget.title, style: Theme.of(context).textTheme.headlineSmall),
          // child: Text(title, style: Theme.of(context).textTheme.headlineSmall),
        ),
        Center(
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: _isLoaded
                ? Container(
//           child: Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(widget.imagePath, fit: BoxFit.cover, width: MediaQuery.of(context).size.width * 0.9,
                        height: 200, // Altura fija
                      ),
                    ),
                  )



                : Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 200, // Altura fija
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator(),
                  ),
          ),
        ),
      ],
    );
  }
}