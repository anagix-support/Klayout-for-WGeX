# Klayout-for-WGeX
MakeLSI:で使用しているWGeXと併用できるようにするためのKlayout入門資料です。
WGeXはMakeLSI:に参加すれば無料でLSIレイアウト設計に利用できます。DRCだけでなく簡単な素子抽出もでき、LSIレイアウト設計に必要十分な機能を備えています。ソースは公開されておらずWindows版しか提供されませんが、Wineを使えば、LinuxでもMacでも問題なく使用できます。残念ながら、undoが１回しかできないとかWireを使うと落ちる場合があるなど問題があり、開発者がA教授のみ公開ソフトではないため今後の発展はあまり期待できません。

一方、Klayout (http:/klayout.de/)は、オープンソースで開発されているレイアウトエディタで、すでに長い間（10
年くらい？）実際のユーザに使われています。Forumを見る限り、開発者はMatthias氏のみのようですが、さまざまな質問や要望に丁寧に答えています。開発者の広がりに不安はありますが、しっかり作られたソフトに見えます。

この資料は、WGeXのユーザが実際にKlayoutを使うにはどうすればよいかを説明します。

1. インストール
 * http://klayout.de/build.html からWindows版は実行モジュールを簡単にインストールできます
 * Linux版もバイナリがdistroごとに用意されてますが、Qtのインストールさえできればソースからのbuildも簡単です
2. 起動時のデフォルトがviewerになっているのでeditorにかえる
 * File->Setupのフォーム左側で、ApplicationのEditing Modeを選択し、Use editing mode by defaultをチェックする
3. レイアウト画面のバックグラウンドの色を黒にかえる
 * File->Setupのフォーム左側で、DisplayのBackgroundを選択し、一番上のBackground colorを黒に変える（Choose...から選べる）
4.
