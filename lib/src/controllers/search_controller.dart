import 'package:MyFlutterTest/src/models/Answer.dart';
import 'package:MyFlutterTest/src/services/stack_answers_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class SearchController extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SearchControllerState();
  }
}

class _SearchControllerState extends State<SearchController> {
  final StackAnswersService _stackAnswersService = StackAnswersService();
  List<Answer> _answers;
  Future<List<Answer>> _futureAnswers;

  int _page = 1;
  final int _pageSize = 10;

  @override
  void initState() {
    super.initState();

    _futureAnswers = _stackAnswersService.getAnswers(_page, _pageSize);
    _answers = List<Answer>();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Answer>>(
      future: _futureAnswers,
      builder: (BuildContext context, AsyncSnapshot<List<Answer>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (!snapshot.hasError) {
            _answers.addAll(snapshot.data);
            return RefreshIndicator(
              onRefresh: () async {
                _page = 1;
                var refresh =
                    await _stackAnswersService.getAnswers(_page, _pageSize);
                _answers.clear();
                setState(() {
                  _futureAnswers = Future.value(refresh);
                });
              },
              child: ListView.builder(
                itemCount: _answers.length,
                padding: EdgeInsets.all(15),
                physics: AlwaysScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  var answer = _answers[index];

                  return Card(
                    elevation: 6,
                    margin: EdgeInsets.only(bottom: 10),
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: 50,
                            height: 50,
                            margin: EdgeInsets.only(right: 20),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(40),
                              child: FadeInImage.memoryNetwork(
                                placeholder: kTransparentImage,
                                image: answer.owner.profileImage.toString(),
                              ),
                            ),
                          ),
                          Text('${answer.answerId}'),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          }
        }
        // case ConnectionState.none:
        // case ConnectionState.active:
        // case ConnectionState.waiting:

        return Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                  width: 100,
                  child: CircularProgressIndicator(),
                )
              ],
            )
          ],
        );
      },
    );
  }
}
