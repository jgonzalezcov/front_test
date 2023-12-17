import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:test/src/models/topic_model.dart';
import 'package:test/src/helpers/database_helpers/topic_helpers/database_topic_helpers.dart';

class BackendHandler {
  final String baseUrl = "https://backendtest-production-c7b9.up.railway.app";

  Future<void> fetchAndSaveTopics() async {
    final response = await http.get(Uri.parse('$baseUrl/topic/1'));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);

      for (var topicData in data) {
        TopicModel topic = TopicModel(
          id: topicData['id'],
          topic: topicData['topic'],
          userId: topicData['user_id'],
        );

        await DatabaseTopicHelper.instance.insertTopic(topic);
      }
    } else {
      throw Exception('Error al obtenener los datos desde el backend');
    }
  }
}
