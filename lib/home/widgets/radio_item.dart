import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart'hide Radio;
import 'package:islami/home/models/radio_model.dart';
class RadioItem extends StatefulWidget {
   RadioItem({required this.player,required this.radio, super.key});
Radios radio;
  AudioPlayer player;
  @override
  State<RadioItem> createState() => _RadioItemState();
}

class _RadioItemState extends State<RadioItem> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height*.1),
          Text(
            widget.radio.name??"",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () async{

                    await widget.player.play(UrlSource(widget.radio.url??""));
                  },
                  icon: const Icon(
                    Icons.play_arrow_rounded,
                    size: 40,
                  )),
              IconButton(
                  onPressed: () async{
                    await widget.player.pause();
                  },
                  icon: const Icon(
                    Icons.stop,
                    size: 40,
                  )),

            ],
          )
        ],
      ),
    );
  }
}
