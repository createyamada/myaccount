# myaccount


------------------------------------------開発方式------------------------------------------


アジャイルの開発方式をとっているため機能を検討つつ進めている

----------------------------------------現在の優先度----------------------------------------


１、検討したメイン機能を実装する　　→現在ここ


２、ユーザビリティーを考えた機能を実装する


３、レイアウト修正





----------------------------------------課題・タスク----------------------------------------



※優先度１※


・代表取締役画面の機能検討・実装


・貯金偏差値画面の機能検討・実装


※優先度2※


・登録処理のある画面は登録処理が完了したら、全画面またはメイン画面に遷移


該当画面：新規登録画面、収支入力画面、支出入力画面


・ナビゲーションバーの設置（画面上部に戻るボタンのついているもの）


・テキストタップ時のキーボード表示（入力文字種によって制御）


※優先度3※


・全体的レイアウト見直し


　→テキストボックス幅


　→ラベル表示位置等


　→フォント等見直し




----------------------------------------発見不具合----------------------------------------



発生画面


カレンダー画面


仕様


収支画面にて登録した値は、カレンダー画面にて文字を黒色に表示する、支出は赤色という仕様


不具合内容


カレンダー初期表示時に収入データのある日付をタップすると黒色表示であるが、


一度支出データのある日付をタップすると赤色表示で、再度収入データのある日付をクリックすると赤色になってしまう。

