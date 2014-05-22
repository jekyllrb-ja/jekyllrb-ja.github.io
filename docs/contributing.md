---
layout: docs
title: 貢献
prev_section: upgrading
next_section: history
permalink: /docs/contributing/
---

<!--original
---
layout: docs
title: Contributing
prev_section: upgrading
next_section: history
permalink: /docs/contributing/
---
-->

あなたは Jekyll に投じるすばらしいアイディアを持っています。
すばらしいことです！次の事柄を心に留めてください。

<!--original
So you've got an awesome idea to throw into Jekyll. Great! Please keep the
following in mind:
-->

* もし、既存の機能への小さな修正やパッチを作成したなら、シンプルなテストを行います。
  現在のテストスイートの範囲にとどまり、そして
  [Shoulda](http://github.com/thoughtbot/shoulda/tree/master) や
  [RR](http://github.com/btakita/rr/tree/master) を使用してください。
* もし、それが新しい機能の場合は、必ず新しい
  [Cucumber](https://github.com/cucumber/cucumber/) の機能を作成し、
  必要に応じて手順を再利用します。
  また、あなたがフォークした `site` に
  急ぎいくつかのドキュメントを用意し、一度マージを行い
  メイン `site` の jekyllrb.com に転送していただければ幸いです。
* あなたの貢献によって Jekyll の振る舞いが変わった場合、
  それは `site/docs` にあります。
  もし、 docs に情報の誤りがあった場合、遠慮なく追加してください。
  すばらしいドキュメントはすばらしいプロジェクトを作ります！
* Ruby のコードを変更するときは、 [GitHub Ruby Styleguide](https://github.com/styleguide/ruby)
  に従ってください。
* **小さなプルリクエスト** に最善を尽くしてください。
  簡単に提案された変更はレビューされ、マージされる可能性が高いです。
* プルリクエストを送信するとき、プルリクエストのボディを賢明に使用してください。
  変更されたかどうかの記述、変更の背後にある動機、 [完了したかどうかのタスクリスト](http://git.io/gfm-tasks)
  もレビュー時間を早めます。


<!--original
* If you're creating a small fix or patch to an existing feature, just a simple
  test will do. Please stay in the confines of the current test suite and use
  [Shoulda](http://github.com/thoughtbot/shoulda/tree/master) and
  [RR](http://github.com/btakita/rr/tree/master).
* If it's a brand new feature, make sure to create a new
  [Cucumber](https://github.com/cucumber/cucumber/) feature and reuse steps
  where appropriate. Also, whipping up some documentation in your fork's `site`
  would be appreciated, and once merged it will be transferred over to the main
  `site`, jekyllrb.com.
* If your contribution changes any Jekyll behavior, make sure to update the
  documentation. It lives in `site/docs`. If the docs are missing information,
  please feel free to add it in. Great docs make a great project!
* Please follow the [GitHub Ruby Styleguide](https://github.com/styleguide/ruby)
  when modifying Ruby code.
* Please do your best to submit **small pull requests**. The easier the proposed
  change is to review, the more likely it will be merged.
* When submitting a pull request, please make judicious use of the pull request
  body. A description of what changes were made, the motivations behind the
  changes and [any tasks completed or left to complete](http://git.io/gfm-tasks)
  will also speed up review time.
-->

<div class="note warning">
  <h5>テストなしでは貢献はできません</h5>
  <p>
    もし、既存の機能への小さな修正やパッチを作成したなら、ただのシンプルなテストを行います。
  </p>
</div>

<!--original
<div class="note warning">
  <h5>Contributions will not be accepted without tests</h5>
  <p>
    If you’re creating a small fix or patch to an existing feature, just
    a simple test will do.
  </p>
</div>
-->

テストの依存関係
-----------------

<!--original
Test Dependencies
-----------------
-->


テストスイートの実行や gem のビルドのために、
Jekyll の依存ツールをインストールする必要があります。
Jekyll は Bundler を使用しており、 `bundle` コマンドを実行すると全ての設定が迅速に行われます！

<!--original
To run the test suite and build the gem you'll need to install Jekyll's
dependencies. Jekyll uses Bundler, so a quick run of the `bundle` command and
you're all set!
-->

{% highlight bash %}
$ bundle
{% endhighlight %}

<!--original
{% highlight bash %}
$ bundle
{% endhighlight %}
-->

はじめる前に、テストを実行し、必ずテストが通ることを
確認してください(あなたの環境が適切に設定されているかを確認するために):

<!--original
Before you start, run the tests and make sure that they pass (to confirm your
environment is configured properly):
-->

{% highlight bash %}
$ bundle exec rake test
$ bundle exec rake features
{% endhighlight %}

<!--original
{% highlight bash %}
$ bundle exec rake test
$ bundle exec rake features
{% endhighlight %}
-->

ワークフロー
--------

<!--original
Workflow
--------
-->

これは、あなたの作業がプロジェクトにマージされるもっとも直接的な方法です:

<!--original
Here's the most direct way to get your work merged into the project:
-->

* プロジェクトをフォークします
* あなたのフォークプロジェクトをクローンします:

<!--original
* Fork the project.
* Clone down your fork:
-->

{% highlight bash %}
git clone git://github.com/<username>/jekyll.git
{% endhighlight %}

<!--original
{% highlight bash %}
git clone git://github.com/<username>/jekyll.git
{% endhighlight %}
-->

* トピックブランチを作成し、あなたの変更を含んでください:

<!--original
* Create a topic branch to contain your change:
-->

{% highlight bash %}
git checkout -b my_awesome_feature
{% endhighlight %}

<!--original
{% highlight bash %}
git checkout -b my_awesome_feature
{% endhighlight %}
-->

* ハックし、テストを追加します。必ずしもこの順番でなくてかまいません
* `rake` を実行し、テストが必ず全て通ることを確認してください
* 必要に応じて、エラーがないようにコミットを論理的な塊にリベースしてください
* ブランチをプッシュしてください

<!--original

* Hack away, add tests. Not necessarily in that order.
* Make sure everything still passes by running `rake`.
* If necessary, rebase your commits into logical chunks, without errors.
* Push the branch up:
-->

{% highlight bash %}
git push origin my_awesome_feature
{% endhighlight %}

<!--original
{% highlight bash %}
git push origin my_awesome_feature
{% endhighlight %}
-->

* jekyll/jekyll プロジェクトの master ブランチに対してプルリクエストを作成し、
  あなたの変更内容と、なぜそれをマージすべきかを記述してください

<!--original
* Create a pull request against jekyll/jekyll:master and describe what your
  change does and the why you think it should be merged.
-->

ドキュメントの更新
----------------------

<!--original
Updating Documentation
----------------------
-->

私たちは Jekyll のドキュメントについて最善を尽くしたいです。
私たちはドキュメントをオープンソース化しました、そして
あなたが Jekyll に欠けているものを見つけた場合、私たちはプルリクエストを歓迎しています。

<!--original
We want the Jekyll documentation to be the best it can be. We've
open-sourced our docs and we welcome any pull requests if you find it
lacking.
-->

あなたは、 GitHub.com 上の Jekyll リポジトリの [site](https://github.com/jekyll/jekyll/tree/master/site) で
jekyllrb.comのドキュメントを見つけることができます。

<!--original
You can find the documentation for jekyllrb.com in the
[site]({{ site.repository }}/tree/master/site) directory of
Jekyll's repo on GitHub.com.
-->

全てのドキュメントのプルリクエストは `master` に向けられる必要があります。
他のブランチに向けたプルリクエストは受け入れられません。

<!--original
All documentation pull requests should be directed at `master`.  Pull
requests directed at another branch will not be accepted.
-->

GitHub の [Jekyll wiki]({{ site.repository }}/wiki) は、
自由に更新することができるように、プルリクエストなしで
全ての GitHub ユーザがアクセス権を持つことができます。

<!--original
The [Jekyll wiki]({{ site.repository }}/wiki) on GitHub 
can be freely updated without a pull request as all 
GitHub users have access.
-->

もし、あなたのプラグインを[プラグイン一覧](/docs/plugins/#available_plugins)に追加したいなら、
あなたのプラグインのタイプに応じて適切な小見出しの下にリンクを追加し、
[プラグインページのソースファイル]({{ site.repository }}/blob/master/site/docs/plugins.md)へ
プルリクエストを送ってください。

<!--original
If you want to add your plugin to the [list of plugins](/docs/plugins/#available_plugins),
please submit a pull request modifying the [plugins page source
file]({{ site.repository }}/blob/master/site/docs/plugins.md) by adding a
link to your plugin under the proper subheading depending upon its type.
-->

落とし穴
-------

<!--original
Gotchas
-------
-->

* もし、 gem のバージョンがかちあった場合、コミットを分けてください。
  この方法だと、メンテナが gem をリリースするときに制御できます。
* jekyll/jekyll の最新コミットに基づいて(複数の)パッチを維持してください。
  それは適用するためのあなたの仕事で、メンテナがしなければならないことを少なくするのは
  とてもよいことです。
* あなたの GitHub issue で \[fix\], \[feature\] などのタグをつけないでください。
  メンテナは積極的に issue を読み、彼らが問題に出くわしたらラベルをつけるでしょう。 

<!--original
* If you want to bump the gem version, please put that in a separate commit.
  This way, the maintainers can control when the gem gets released.
* Try to keep your patch(es) based from the latest commit on jekyll/jekyll.
  The easier it is to apply your work, the less work the maintainers have to do,
  which is always a good thing.
* Please don't tag your GitHub issue with \[fix\], \[feature\], etc. The maintainers
  actively read the issues and will label it once they come across it.
-->

<div class="note">
  <h5>もっとよくできる方法をお知らせください！</h5>
  <p>
    Jekyll の使用とハックは楽しく単純、簡単でなければなりません。
    なんらかの理由で苦痛を見つけた場合、 あなたの経験をGitHub の<a
    href="{{ site.repository }}/issues/new">issue に追加</a>すると、
    私たちはそれを改善することができます。
  </p>
</div>

<!--original
<div class="note">
  <h5>Let us know what could be better!</h5>
  <p>
    Both using and hacking on Jekyll should be fun, simple, and easy, so if for
    some reason you find it’s a pain, please <a
    href="{{ site.repository }}/issues/new">create an issue</a> on
    GitHub describing your experience so we can make it better.
  </p>
</div>
-->

