
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'form_model.dart';
import 'form_state_notifier.dart';

export 'riverpod_screen.dart';

final formStateProvider =
    StateNotifierProvider<FormStateNotifier, FormModel>((ref) {
  return FormStateNotifier();
});
