import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_workspace/pages/form_field_key_workspace/common/form_field_key_extension.dart';
import 'package:flutter_workspace/pages/form_field_key_workspace/common/form_field_key_hooks.dart';
import 'package:flutter_workspace/pages/form_field_key_workspace/common/validator.dart';

// TODO: 実際にプロダクトで動かすイメージのページを作る
// 案１： 一度 submit ボタンを押すと isReactive が tue になる
// 案2: パスワードの強度チェックをする
class FormFieldKeyWorkspacePage extends HookWidget {
  const FormFieldKeyWorkspacePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final validator = Validator();
    final formKey = useFormFieldKey();
    final output = useState('');
    final isReactive = useState(false);

    void submit() {
      final isValid = formKey.validate();
      if (!isValid) return;

      output.value = formKey.currentValue;
      formKey.clear();
    }

    return Scaffold(
      appBar: AppBar(title: const Text('FormFieldState Workspace')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              '出力',
              style: TextStyle(fontSize: 16),
            ),
            output.value.isEmpty
            ? Text(
              'なし',
              style: TextStyle(color: Colors.grey[300], fontSize: 64),
            )
            : Text(
              output.value,
              style: const TextStyle(fontSize: 64),
            ),
            const SizedBox(
              height: 82,
            ),
            TextFormField(
              key: formKey,
              validator: validator.requiredValidator,
              onChanged: isReactive.value ? (_) => formKey.validate() : null,
              onFieldSubmitted: (_) => submit(),
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                OutlinedButton(
                    onPressed: formKey.clear, child: const Text('Clear')),
                ElevatedButton(
                    onPressed: submit,
                    child: const Text('Submit')),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'リアクティブに\nバリデーションを実行する',
                  style: TextStyle(fontSize: 16),
                ),
                Switch(
                  value: isReactive.value,
                  onChanged: (value) {
                    isReactive.value = value;

                    // isReactive => true への切り替えなら、変更時にバリデーションを実行して、リアクティブのように見せる。
                    if (value) {
                      formKey.validate();
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
