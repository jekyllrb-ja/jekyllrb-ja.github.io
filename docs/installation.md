---
layout: docs
title: インストール
prev_section: quickstart
next_section: usage
permalink: /docs/installation/
---

Jekyll は数分でインストールと運用準備ができます。
もし、それが悩みの種となっていたら、[file an 
issue]({{ site.repository }}/issues/new)に(または、プルリクエスト送信で)
あなたが遭遇した問題を記述することで、我々がプロセスを
より簡単に変更するかもしれません。
<!--
Getting Jekyll installed and ready-to-go should only take a few minutes. If it
ever becomes a pain in the ass, please [file an
issue]({{ site.repository }}/issues/new) (or submit a pull request)
describing the issue you encountered and how we might make the process easier.
-->

### 必要条件
<!--
### Requirements
-->

Jekyll のインストールは簡単で単純明快です。
しかし、いくつかの必要条件があり、
インストールを始める前にあなたのシステムで
使用されていることを確かめる必要があります。
<!--
Installing Jekyll is easy and straight-forward, but there are a few requirements
you’ll need to make sure your system has before you start.
-->

- [Ruby](http://www.ruby-lang.org/en/downloads/)
- [RubyGems](http://rubygems.org/pages/download)
- Linux, Unix, or Mac OS X

<div class="note info">
  <h5>Jekyll を Windows で実行する</h5>
  <p>
    <a href="http://www.madhur.co.in/blog/2011/09/01/runningjekyllwindows.html">
    Jekyll を Windows 上で実行する</a>ことは可能です。
    しかし、公式ドキュメントでは Windows プラットフォームへの
    インストールはサポートしていません。
  </p>
  <!--
  <h5>Running Jekyll on Windows</h5>
  <p>
    It is possible to get
    <a href="http://www.madhur.co.in/blog/2011/09/01/runningjekyllwindows.html">
    Jekyll running on Windows</a>, but the official documentation does not
    support installation on Windows platforms.
  </p>
  -->
</div>

## Rubygems を使ったインストール
<!--
## Install with RubyGems
-->

Jekyll をインストールする最もよい方法は
[RubyGems](http://docs.rubygems.org/read/chapter/3) を経由する事です。
ターミナルプロンプトで、単純に Jekyll をインストールするには
以下のコマンドを実行します。
<!--
The best way to install Jekyll is via
[RubyGems](http://docs.rubygems.org/read/chapter/3). At the terminal prompt,
simply run the following command to install Jekyll:
-->

{% highlight bash %}
$ gem install jekyll
{% endhighlight %}

Jekyll の gem の全ての依存関係は、上記のコマンドで自動的にインストールされるため、
あなたはそれらについて心配する必要はありません。
もし Jekyll のインストールに問題が発生した場合、
Jekyll コミュニティは、皆のための体験を向上できるので
[トラブルシューティング](../troubleshooting/) ページか、
[report an issue]({{ site.repository }}/issues/new) をチェックしてください。
<!--
All of Jekyll’s gem dependencies are automatically installed by the above
command, so you won’t have to worry about them at all. If you have problems
installing Jekyll, check out the [troubleshooting](../troubleshooting/) page or
[report an issue]({{ site.repository }}/issues/new) so the Jekyll
community can improve the experience for everyone.
-->

<div class="note info">
  <h5>Xcode コマンドラインツールをインストール</h5>
  <p>
    (it ships withのニュアンスが汲み取れない)
    もし、あなたがMac OS X を利用中にネイティブ拡張を使用して
    Jekyll に依存するもののインストール中に問題に出くわした場合、
    あなたは Xcode と コマンドラインツールを
    インストールする必要があります。
    ダウンロードは、
    <code>Preferences &#8594; Downloads &#8594; Components</code>.
  </p>
  <!--
  <h5>Installing Xcode Command-Line Tools</h5>
  <p>
    If you run into issues installing Jekyll's dependencies which make use of
    native extensions and are using Mac OS X, you will need to install Xcode
    and the Command-Line Tools it ships with. Download in
    <code>Preferences &#8594; Downloads &#8594; Components</code>.
  </p>
  -->
</div>

## 追加オプション
<!--
## Optional Extras
-->

Jekyll には、インストールした方がよい、 Jekyll の使用プランに応じてサポートする
いくつかの(オプションの)追加機能があります。
これらの追加はLaTeX サポートやコンテンツレンダリングエンジンの選択を含みます。
詳細については [the extras page](../extras/) をチェックしてください。

<!--
There are a number of (optional) extra features that Jekyll supports that you
may want to install, depending on how you plan to use Jekyll. These extras
include LaTeX support, and the use of alternative content rendering engines.
Check out [the extras page](../extras/) for more information.
-->

<div class="note">
  <h5>ProTip™: シンタックスハイライト有効化</h5>
  <p>
    Jekyll を使用している人ならば、 Pygments を使用してシンタックスハイライトを有効化したほうがよいでしょう。
    これ以上進む前に<a href="../templates/#code_snippet_highlighting">やり方を調べる</a>べきです。
  </p>
  <!--
  <h5>ProTip™: Enable Syntax Highlighting</h5>
  <p>
    If you’re the kind of person who is using Jekyll, then chances are you’ll
    want to enable syntax highlighting using Pygments. You should really
    <a href="../templates/#code_snippet_highlighting">check out how to do
    that</a> before you go any further.
  </p>
  -->
</div>

今やあなたは全てをインストールしたに違いないのだから、さあ取り掛かろう！
<!--
Now that you’ve got everything installed, let’s get to work!
-->

