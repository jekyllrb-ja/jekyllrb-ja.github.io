---
layout: tutorials
title: チュートリアル
permalink: /tutorials/home/
redirect_from: /tutorials/index.html
---
<!-- ---
layout: tutorials
title: Tutorials
permalink: /tutorials/home/
redirect_from: /tutorials/index.html
--- -->

[Docs]({{ "/docs/home/" | relative_url }})とは対照的に、チュートリアルではJekyllの様々なトピックやシナリオをカバーしたより詳細な説明を行います。チュートリアルには以下の内容が含まれています。

<!-- In contrast to [Docs](/docs/home/), Tutorials provide more detailed, narrative instruction that cover a variety of Jekyll topics and scenarios. Tutorials might contain the following: -->

* 特定のシナリオや課題のstep-by-stepプロセス。
* サンプルデータを利用したチュートリアル。サンプルデータの入力と結果。
* Jekyllの長所と短所の説明。
* Jekyllサイトの全ての機能を開発するための端から端までの解説。
* ドキュメンテーションを横断した様々なテクニックの解説。

<!-- * Step-by-step processes through particular scenarios or challenges
* Full walk-throughs using sample data, showing inputs and results from the sample data
* Detailed explanation about the pros and cons for different Jekyll strategies
* End-to-end instruction in developing a complete feature on a Jekyll site
* Instruction that combines various techniques from across the docs -->

簡単に言うと、チュートリアルはドキュメンテーションの情報の要約ではありません。ユーザーの最初から最後のプロセスを辿るものです。

<!-- In short, tutorials aren't the core reference information in docs. They walk users through processes from beginning to end. -->

{: .info .note}
**注：**チュートリアルのセクションは新しく、まだ数は多くありません。作成を助けるために、あなたのチュートリアルを追加することもできます。

<!-- {: .info .note}
**Note:** The Tutorials section is new, so there aren't many tutorials yet. You can add a tutorial here to help populate this section. -->

いくつかのテクニックは、サポートツールやスクリプトサービス、他のJekyllサイトのハックを通じたガイドの場合もあります。Jekyllを使った外部サービスに関することも、気軽に追加してください。ただし、チュートリアルに紹介されているサードパーティーツールを、Jekyllが推薦することはありません。

<!-- Some of these techniques might even guide you through a supporting tool, script, service, or other hack used with your Jekyll site. Feel free to include tutorials involving external services with Jekyll as well. However, note that Jekyll in no way endorses any third-party tools mentioned in tutorials. -->

## チュートリアルへの貢献の仕方
<!-- ## How to contribute a tutorial -->

チュートリアルへの貢献を歓迎します。あなたのチュートリアルを追加するには、

<!-- We welcome your tutorial contributions. To add your tutorial: -->

1. [jekyll/jekyll project Github repo](https://github.com/jekyll/jekyll/){:target="_blank"}の右上の**Fork**ボタンをクリックして、JekyllプロジェクトをForkします。
2. `_tutorials`コレクションにあなたのチュートリアルを追加します。
3. 他のチュートリアルと同様のfront matterを用意してください。
4. `_data/tutorials.yml`にあなたのチュートリアルのファイル名を追加してください。これであなたのチュートリアルをチュートリアルのサイドバーに表示します。
5. 通常のgitのワークフローに従い、pullリクエストを送信してください。

<!-- 1. Fork the Jekyll project by clicking the **Fork** button in the upper-right corner of the [jekyll/jekyll project Github repo](https://github.com/jekyll/jekyll/).
2. Add your tutorial in the `_tutorials` collection.
3. Make sure your tutorial has the same front matter items as other tutorial items.
5. Add a reference to your tutorial filename in `_data/tutorials.yml`. This allows your tutorial to appear in the Tutorials sidebar.
6. Follow the regular git workflow to submit the pull request. -->

pullリクエストが送信されると、Jekyllドキュメンテーションチームがレビューを行い、mergeするか編集の提案を行います。

<!-- When you submit your pull request, the Jekyll documentation team will review your contribution and either merge it or suggest edits. -->


