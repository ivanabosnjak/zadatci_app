// ignore_for_file: avoid_print

import 'dart:async';

import 'package:zadatci_app/repozitorij.dart';

Future<void> main() async {
  final repo1 = ZadatakRepozitorij(neuspjeha: 0);
  final repo2 = ZadatakRepozitorij(neuspjeha: 0);

  for (var pokusaj = 1; pokusaj <= 2; pokusaj++) {
    final sw = Stopwatch()..start();
    try {
      print('Pokušaj $pokusaj: dohvaćam...');

      final listaZadataka = await Future.wait([
        repo1.dohvati(),
        repo2.dohvati(),
      ]).timeout(Duration(milliseconds: 300));

      for (final l in listaZadataka) {
        for (final z in l) {
          print('- ${z.naslov} (${z.zavrsen ? 'gotovo' : 'u tijeku'})');
        }
      }
      break;
    } on TimeoutException {
      print('Isteklo vrijeme');
    } on ZadatciException catch (e) {
      print('Pogreška: ${e.poruka}');
    } finally {
      print('Pokušaj $pokusaj završen');
      sw.stop();
      print('Trajanje: ${sw.elapsedMilliseconds} ms');
    }
  }
}
