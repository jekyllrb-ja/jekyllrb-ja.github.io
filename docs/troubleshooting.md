---
layout: docs
title: トラブルシューティング
prev_section: deployment-methods
next_section: sites
permalink: /docs/troubleshooting/
---

<!--original
---
layout: docs
title: Troubleshooting
prev_section: deployment-methods
next_section: sites
permalink: /docs/troubleshooting/
---
-->

あなたが今までJekyllのインストールや使用した際に問題が発生した場合、
いくつか助けになるかもしれないヒントがあります。以下にあるヒントでも解決しない場合、
[その問題を報告]({{ site.repository }}/issues/new) してください。そうすることで
Jekyll コミュニティはすべての人によりよい体験を与えられます。

<!--original
If you ever run into problems installing or using Jekyll, here's a few tips
that might be of help. If the problem you’re experiencing isn’t covered below,
please [report an issue]({{ site.repository }}/issues/new) so the
Jekyll community can make everyone’s experience better.
-->

## インストールでの問題

<!--original
## Installation Problems
-->

もしあなたがgem インストールにおいてエラーに遭遇したら, あなたはruby 1.9.1
用の拡張モジュールをコンパイルするためのヘッダファイルをインストールする必要があります。
Ubuntu や Debian 上で以下を実行することでインストールできます。

<!--original
If you encounter errors during gem installation, you may need to install
the header files for compiling extension modules for ruby 1.9.1. This
can be done on Ubuntu or Debian by running:
-->

{% highlight bash %}
sudo apt-get install ruby1.9.1-dev
{% endhighlight %}

<!--original
{% highlight bash %}
sudo apt-get install ruby1.9.1-dev
{% endhighlight %}
-->

Red Hat、CentOSやFedoraのシステム上では以下を実行することでインストールできます。

<!--original
On Red Hat, CentOS, and Fedora systems you can do this by running:
-->

{% highlight bash %}
sudo yum install ruby-devel
{% endhighlight %}

<!--original
{% highlight bash %}
sudo yum install ruby-devel
{% endhighlight %}
-->

[NearlyFreeSpeech](http://nearlyfreespeech.net/) では、あなたはJekyllを
インストールする前に次のコマンドを実行する必要があります:

<!--original
On [NearlyFreeSpeech](http://nearlyfreespeech.net/) you need to run the
following commands before installing Jekyll:
-->

{% highlight bash %}
export GEM_HOME=/home/private/gems
export GEM_PATH=/home/private/gems:/usr/local/lib/ruby/gems/1.8/
export PATH=$PATH:/home/private/gems/bin
export RB_USER_INSTALL='true'
{% endhighlight %}

<!--original
{% highlight bash %}
export GEM_HOME=/home/private/gems
export GEM_PATH=/home/private/gems:/usr/local/lib/ruby/gems/1.8/
export PATH=$PATH:/home/private/gems/bin
export RB_USER_INSTALL='true'
{% endhighlight %}
-->

OSXでは、RubyGemsの更新をする必要があります:

<!--original
On OSX, you may need to update RubyGems:
-->

{% highlight bash %}
sudo gem update --system
{% endhighlight %}

<!--original
{% highlight bash %}
sudo gem update --system
{% endhighlight %}
-->

それでもまだ問題がある場合は、 [Xcodeを使ってコマンドラインツールをインストールする]
(http://www.zlu.me/ruby/os%20x/gem/mountain%20lion/2012/02/21/install-native-ruby-gem-in-mountain-lion-preview.html)
必要があります。
つまり、次のコマンドを使ってネイティブのgemsをインストールすることができます。

<!--original
If you still have issues, you may need to [use XCode to install Command Line
Tools](http://www.zlu.me/ruby/os%20x/gem/mountain%20lion/2012/02/21/install-native-ruby-gem-in-mountain-lion-preview.html)
that will allow you to install native gems using the following command:
-->

{% highlight bash %}
sudo gem install jekyll
{% endhighlight %}

<!--original
{% highlight bash %}
sudo gem install jekyll
{% endhighlight %}
-->

GentooでのRubyGemsのインストール:

<!--original
To install RubyGems on Gentoo:
-->

{% highlight bash %}
sudo emerge -av dev-ruby/rubygems
{% endhighlight %}

<!--original
{% highlight bash %}
sudo emerge -av dev-ruby/rubygems
{% endhighlight %}
-->

Windows では[RubyInstaller DevKit](http://wiki.github.com/oneclick/rubyinstaller/development-kit)
をインストールする必要があります。

<!--original
On Windows, you may need to install [RubyInstaller
DevKit](http://wiki.github.com/oneclick/rubyinstaller/development-kit).
-->

## Jekyllの実行での問題

<!--original
## Problems running Jekyll
-->

Debian や Ubuntuでは、あなたのターミナルで `jekyll` コマンドが実行できるようにするために
PATHに `/var/lib/gems/1.8/bin/` を追加する必要があります。

<!--original
On Debian or Ubuntu, you may need to add `/var/lib/gems/1.8/bin/` to your path
in order to have the `jekyll` executable be available in your Terminal.
-->

## Base-URL の問題

<!--original
## Base-URL Problems
-->

もし、あなたが次のようなbase-urlオプションを使用している場合:

<!--original
If you are using base-url option like:
-->

{% highlight bash %}
jekyll serve --baseurl '/blog'
{% endhighlight %}

<!--original
{% highlight bash %}
jekyll serve --baseurl '/blog'
{% endhighlight %}
-->

… その時は次の様にしてあなたのサイトにアクセスできることを確認してください:

<!--original
… then make sure that you access the site at:
-->

{% highlight bash %}
http://localhost:4000/blog/index.html
{% endhighlight %}

<!--original
{% highlight bash %}
http://localhost:4000/blog/index.html
{% endhighlight %}
-->

動作しない場合は次のアクセスを試してください:

<!--original
It won’t work to just access:
-->

{% highlight bash %}
http://localhost:4000/blog
{% endhighlight %}

<!--original
{% highlight bash %}
http://localhost:4000/blog
{% endhighlight %}
-->

## 設定での問題

<!--original
## Configuration problems
-->

[構成設定](../configuration/)の競合の優先順位は次のとおりです:

<!--original
The order of precedence for conflicting [configuration settings](../configuration/)
is as follows:
-->

1.  コマンドラインフラグ
2.  設定ファイルでの設定
3.  デフォルト値

<!--original
1.  Command-line flags
2.  Configuration file settings
3.  Defaults
-->

それは、次のとおりです: デフォルト値は`_config.yml`で指定されたオプションで上書きされて、
そしてコマンドラインで指定されたフラグは、他の場所で設定されたすべての設定を上書きします。

<!--original
That is: defaults are overridden by options specified in `_config.yml`,
and flags specified at the command-line will override all other settings
specified elsewhere.
-->

## マークアップでの問題

<!--original
## Markup Problems
-->

Jekyllが利用する様々なマークアップエンジンはいくつかの問題があることがあります。この
ページには、同じ問題が発生する可能性のある他の人を助けるためにそれらをドキュメント化します。

<!--original
The various markup engines that Jekyll uses may have some issues. This
page will document them to help others who may run into the same
problems.
-->

### Maruku

<!--original
### Maruku
-->

もし、あなたのリンクにエスケープが必要な文字が含まれていた場合、次の文法を使う必要があります:

<!--original
If your link has characters that need to be escaped, you need to use
this syntax:
-->

{% highlight text %}
![Alt text](http://yuml.me/diagram/class/[Project]->[Task])
{% endhighlight %}

<!--original
{% highlight text %}
![Alt text](http://yuml.me/diagram/class/[Project]->[Task])
{% endhighlight %}
-->

中身が空のタグがある場合、例えば`<script src="js.js"></ SCRIPT>`、Marukuは
次のように変換します`<script src="js.js" />`。
これはFirefoxやおそらく他のブラウザでも問題を引き起こし、
[非推奨なXHTMLになります。](http://www.w3.org/TR/xhtml1/#C_3)
簡単な修正は開始タグと終了タグの間にスペースを入れることです。

<!--original
If you have an empty tag, i.e. `<script src="js.js"></script>`, Maruku
transforms this into `<script src="js.js" />`. This causes problems in
Firefox and possibly other browsers and is [discouraged in
XHTML.](http://www.w3.org/TR/xhtml1/#C_3) An easy fix is to put a space
between the opening and closing tags.
-->

### RedCloth

<!--original
### RedCloth
-->

バージョン4.1.1以降ではnotextileタグに従いません。
[これは既知のバグで](http://aaronqian.com/articles/2009/04/07/redcloth-ate-my-notextile.html)
うまくいけばバージョン4.2で修正されるでしょう。
あなたはまだバージョン4.1.9を利用できますが、テストスイートは、4.1.0がインストールされている必要があります。
あなたがnotextileタグを持たないRedClothのバージョンを使用する場合、
Pygments や Rougeからのシンタックス・ハイライトのブロックが正しくフォーマットされてないことに気づくかもしれません。
その場合は、バージョン4.1.0がインストールされています。

<!--original
Versions 4.1.1 and higher do not obey the notextile tag. [This is a known
bug](http://aaronqian.com/articles/2009/04/07/redcloth-ate-my-notextile.html)
and will hopefully be fixed for 4.2. You can still use 4.1.9, but the
test suite requires that 4.1.0 be installed. If you use a version of
RedCloth that does not have the notextile tag, you may notice that
syntax highlighted blocks from Pygments or Rouge are not formatted
correctly, among other things. If you’re seeing this just install 4.1.0.
-->

### Liquid

<!--original
### Liquid
-->

最新版のバージョン2.0では、テンプレートでの`{{ "{{" }}`の利用を壊すようです。
以前のバージョンとは異なり、バージョン2.0での`{{ "{{" }}`の利用は以下のエラーの引き金になるようです:

<!--original
The latest version, version 2.0, seems to break the use of `{{ "{{" }}` in
templates. Unlike previous versions, using `{{ "{{" }}` in 2.0 triggers the
following error:
-->

{% highlight bash %}
'{{ "{{" }}' was not properly terminated with regexp: /\}\}/  (Liquid::SyntaxError)
{% endhighlight %}

<!--original
{% highlight bash %}
'{{ "{{" }}' was not properly terminated with regexp: /\}\}/  (Liquid::SyntaxError)
{% endhighlight %}
-->

### 抜粋

<!--original
### Excerpts
-->

v1.0.0 以降、Jekyllは投稿の抜粋を自動生成します。
v1.1.0 以降のJekyllではこれらの抜粋をLiquidに通すと参照が存在しないか、
タグが閉じられていないという奇妙なエラーを引き起こすことがありました。
もし、あなたがこれらのエラーに遭遇した場合、`_config.yml`に`excerpt_separator: ""`を
設定してみてください。あるいはそれに意味のない文字列を設定してみてください。

<!--original
Since v1.0.0, Jekyll has had automatically-generated post excerpts. Since
v1.1.0, Jekyll also passes these excerpts through Liquid, which can cause
strange errors where references don't exist or a tag hasn't been closed. If you
run into these errors, try setting `excerpt_separator: ""` in your
`_config.yml`, or set it to some nonsense string.
-->

<div class="note">
  <h5>あなたの遭遇した問題を報告してください</h5>
  <p>もしバグに遭遇した場合、他の方の為に我々が文書化できるように問題と回避策についてのGitHubに<a href="{{ site.repository }}/issues/new">Issueを作成</a>してください。
</div>

<!--original
<div class="note">
  <h5>Please report issues you encounter!</h5>
  <p>If you come across a bug, please <a href="{{ site.repository }}/issues/new">create an issue</a> on GitHub describing the problem and any work-arounds you find so we can document it here for others.</p>
</div>
-->
