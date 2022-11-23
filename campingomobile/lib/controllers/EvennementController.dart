import 'package:Campingo/constants/constants.dart';
import 'package:Campingo/models/EvennmentModel.dart';
import 'dart:convert';
import 'package:http/http.dart'as http;

  Future<List<EvennementModel>> GetallEvents() async {
    var data = await http.get(Uri.parse('$BaseUrl$GetEvent'));
    var jsonData = json.decode(data.body);
    List<EvennementModel> event = [];
    for (var e in jsonData) {
      EvennementModel events = new EvennementModel();
      events.id = e["id"];
      events.title = e["title"];
      events.description = e["description"];
      events.debut_event = e["debut_event"];
      events.fin_event = e["fin_event"];
      events.imageUrl = e["imageUrl"];
      event.add(events);
    }
    return event;
  }
