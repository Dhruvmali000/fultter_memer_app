import 'package:flutter_test/flutter_test.dart';
import 'package:fultter_memer_app/services/api.dart';

void main() {
  test('test api', () async {
    final response = await APis.getMeme();
    expect(response.memes?.isNotEmpty, true);
  });
}
