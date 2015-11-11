---
layout: docs
title: インストール
prev_section: quickstart
next_section: usage
permalink: /docs/installation/
base_revision: 52c76b5d9333a98285db7e04ee7ae8051228ec76[refs/heads/master]
---

<!--original
---
layout: docs
title: Installation
prev_section: quickstart
next_section: usage
permalink: /docs/installation/
---
-->

Jekyll は数分でインストールと運用準備ができます。
もし、それが悩みの種となっていたら、[issue(英語)]({{ site.repository }}/issues/new)に
あなたが遭遇した問題を報告することで(または、プルリクエスト送信で)、我々がプロセスを
より簡単に変更するかもしれません。

<!--original
Getting Jekyll installed and ready-to-go should only take a few minutes. If it
ever becomes a pain in the ass, please [file an
issue]({{ site.repository }}/issues/new) (or submit a pull request)
describing the issue you encountered and how we might make the process easier.
-->

### 必要条件

<!--original
### Requirements
-->

Jekyll のインストールは簡単で単純明快です。
しかし、いくつかの必要条件があり、
インストールを始める前にあなたのシステムで
使用されていることを確かめる必要があります。

<!--original
Installing Jekyll is easy and straight-forward, but there are a few requirements
you’ll need to make sure your system has before you start.
-->

- [Ruby](http://www.ruby-lang.org/en/downloads/) (開発用ヘッダもこちら)
- [RubyGems](http://rubygems.org/pages/download)
- Linux, Unix または Mac OS X
- [NodeJS](http://nodejs.org)か、あるいは別のJavaScriptランタイム(CoffeeScriptをサポートするため)

<!--original
- [Ruby](http://www.ruby-lang.org/en/downloads/) (including development
  headers)
- [RubyGems](http://rubygems.org/pages/download)
- Linux, Unix, or Mac OS X
- [NodeJS](http://nodejs.org), or another JavaScript runtime (for
  CoffeeScript support).
-->

<div class="note info">
  <h5>Jekyll を Windows で実行する</h5>
  <p>
    Windowsは公式にはサポートしていませんが、Windows上でJekyllを実行できるかもしれません。
    <a href="../windows/#installation">Windows向けのドキュメントページ</a>に、説明があります。
  </p>
</div>

<!--original
<div class="note info">
  <h5>Running Jekyll on Windows</h5>
  <p>
    While Windows is not officially supported, it is possible to get it running
    on Windows. Special instructions can be found on our
    <a href="../windows/#installation">Windows-specific docs page</a>.
  </p>
</div>
-->

## Rubygems を使ったインストール

<!--original
## Install with RubyGems
-->

Jekyll をインストールする最もよい方法は
[RubyGems](http://rubygems.org/pages/download) を経由する事です。
ターミナルプロンプトで、単純に Jekyll をインストールするには
以下のコマンドを実行します。

<!--original
The best way to install Jekyll is via
[RubyGems](http://rubygems.org/pages/download). At the terminal prompt,
simply run the following command to install Jekyll:
-->

{% highlight bash %}
$ gem install jekyll
{% endhighlight %}

<!--original
{% highlight bash %}
$ gem install jekyll
{% endhighlight %}
-->

Jekyll の gem の全ての依存関係は、上記のコマンドで自動的にインストールされるため、
あなたはそれらについて心配する必要はありません。
もし Jekyll のインストールに問題が発生した場合、
Jekyll コミュニティは、皆のための体験を向上できるので
[トラブルシューティング](../troubleshooting/) ページをチェックするか、
[その問題を報告(英語)]({{ site.repository }}/issues/new) してください。

<!--original
All of Jekyll’s gem dependencies are automatically installed by the above
command, so you won’t have to worry about them at all. If you have problems
installing Jekyll, check out the [troubleshooting](../troubleshooting/) page or
[report an issue]({{ site.repository }}/issues/new) so the Jekyll
community can improve the experience for everyone.
-->

<div class="note info">
  <h5>Xcode コマンドラインツールをインストール</h5>
  <p>
    ネイティブ拡張を利用したJekyllの依存関係をインストールする際に問題が生じた場合、
    あなたがMax OS Xを使っているなら、Xcodeと、
    付属のコマンドラインツールをインストールする必要があるでしょう。
    ダウンロードは、
    <code>Preferences &#8594; Downloads &#8594; Components</code>.
  </p>
</div>

<!--original
<div class="note info">
  <h5>Installing Xcode Command-Line Tools</h5>
  <p>
    If you run into issues installing Jekyll's dependencies which make use of
    native extensions and are using Mac OS X, you will need to install Xcode
    and the Command-Line Tools it ships with. Download in
    <code>Preferences &#8594; Downloads &#8594; Components</code>.
  </p>
</div>
-->

## Pre-releases

<!--original
## Pre-releases
-->

pre-release をインストールするためには、必要なものをインストールした状態で、以下を実行してください。

<!--original
In order to install a pre-release, make sure you have all the requirements
installed properly and run:
-->

{% highlight bash %}
gem install jekyll --pre
{% endhighlight %}

<!--original
{% highlight bash %}
gem install jekyll --pre
{% endhighlight %}
-->

このコマンドで、最新の pre-release がインストールできます。もし、特定のバージョンの pre-release を使いたい場合は `-v` オプションを使い、インストールしたいバージョンを指定してください。

<!--original
This will install the latest pre-release. If you want a particular pre-release,
use the `-v` switch to indicate the version you'd like to install:
-->

{% highlight bash %}
gem install jekyll -v '2.0.0.alpha.1'
{% endhighlight %}

<!--original
{% highlight bash %}
gem install jekyll -v '2.0.0.alpha.1'
{% endhighlight %}
-->

もし、開発バージョンの Jekyll をインストールしたい場合、少し手順が複雑です。
開発バージョンでは最新の素晴らしい利点を得ることができますが、安定性に欠ける恐れがあります。

<!--original
If you'd like to install a development version of Jekyll, the process is a bit
more involved. This gives you the advantage of having the latest and greatest,
but may be unstable.
-->

{% highlight bash %}
$ git clone git://github.com/jekyll/jekyll.git
$ cd jekyll
$ script/bootstrap
$ bundle exec rake build
$ ls pkg/*.gem | head -n 1 | xargs gem install -l
{% endhighlight %}

<!--original
{% highlight bash %}
$ git clone git://github.com/jekyll/jekyll.git
$ cd jekyll
$ script/bootstrap
$ bundle exec rake build
$ ls pkg/*.gem | head -n 1 | xargs gem install -l
{% endhighlight %}
-->

## その他の追加機能

<!--original
## Optional Extras
-->

Jekyll には、インストールした方がよい、 Jekyll の使用プランに応じてサポートする
いくつかの(オプションの)追加機能があります。
これらの追加は LaTeX サポートやコンテンツレンダリングエンジンの選択を含みます。
詳細については [the extras page](../extras/) をチェックしてください。

<!--original
There are a number of (optional) extra features that Jekyll supports that you
may want to install, depending on how you plan to use Jekyll. These extras
include LaTeX support, and the use of alternative content rendering engines.
Check out [the extras page](../extras/) for more information.
-->

<div class="note">
  <h5>ProTip™: シンタックスハイライト有効化</h5>
  <p>
    Jekyll を使用している人ならば、 <a href="http://pygments.org/">Pygments</a> を使用して
    シンタックスハイライトを有効化したほうがよいでしょう。
    これ以上進む前に<a href="../templates/#code-snippet-highlighting">やり方を調べる</a>べきです。
  </p>
</div>

<!--original
<div class="note">
  <h5>ProTip™: Enable Syntax Highlighting</h5>
  <p>
    If you’re the kind of person who is using Jekyll, then chances are you’ll
    want to enable syntax highlighting using <a href="http://pygments.org/">Pygments</a>
    or <a href="https://github.com/jayferd/rouge">Rouge</a>. You should really
    <a href="../templates/#code-snippet-highlighting">check out how to
    do that</a> before you go any farther.
  </p>
</div>
-->

今やあなたは全てをインストールしたに違いないのだから、さあ取り掛かろう！

<!--original
Now that you’ve got everything installed, let’s get to work!
-->
