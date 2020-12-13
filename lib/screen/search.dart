import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:where_am_i/data/model/subway_arrival_entity.dart';
import 'package:where_am_i/data/repository/subway_arrival_repository.dart';

class SearchStation extends StatefulWidget {
  SearchStation({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SearchStationState createState() => _SearchStationState();
}

class _SearchStationState extends State<SearchStation> {
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: <Widget>[
            Row(children: <Widget>[
              Expanded(
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '역 명칭',
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),
              IconButton(
                icon: Icon(Icons.search),
                onPressed: this._onSearch,
              ),
            ]),
            Expanded(
              child: StreamBuilder<List<SubwayArrivalEntity>>(
                initialData: [],
                stream: subwayArrivalRepository.subwayArrivals,
                builder: (context, snapshot) => ListView.separated(
                  itemBuilder: (context, index) =>
                      _renderItem(context, snapshot.data[index]),
                  separatorBuilder: (context, index) => SizedBox(height: 16),
                  itemCount: snapshot.data.length,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _renderItem(BuildContext context, SubwayArrivalEntity entity) {
    return Column(
      children: <Widget>[
        Text(
            '${entity.direction} 열차가 ${entity.arrivalAtSeconds}초 후 ${_renderStatus(entity.arrivalStatus)}'),
      ],
    );
  }

  String _renderStatus(SubwayArrivalStatus status) {
    switch (status) {
      case SubwayArrivalStatus.ARRIVAL:
        return '도착';
      case SubwayArrivalStatus.DEPARTED:
        return '출발';
      case SubwayArrivalStatus.ENTERED:
        return '진입';
      case SubwayArrivalStatus.PREV_ARRIVAL:
        return '전역 도착';
      case SubwayArrivalStatus.PREV_DEPARTED:
        return '전역 출발';
      case SubwayArrivalStatus.PREV_ENTERED:
        return '전역 진입';
      case SubwayArrivalStatus.ON_GOING:
        return '운행중';
    }
  }

  void _onSearch() {
    final String searchText = _searchController.text;
    subwayArrivalRepository.search(searchText);
  }
}
