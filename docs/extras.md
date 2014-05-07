---
layout: docs
title: Extras
prev_section: plugins
next_section: github-pages
permalink: /docs/extras/
---

<!--original
---
layout: docs
title: Extras
prev_section: plugins
next_section: github-pages
permalink: /docs/extras/
---
-->

Jekyllには、これをサポートする多数の（オプショナルな）追加機能があるので、あなたの使い方に応じてそれらをインストールしたくなるでしょう。

<!--original
There are a number of (optional) extra features that Jekyll supports that you
may want to install, depending on how you plan to use Jekyll.
-->

## LaTeXのサポート

<!--original
## LaTeX Support
-->

Marukuは、blahtex(バージョン0.6)を使ってPNGをレンダリングするLaTeXのオプショナルなサポートを持っています（blahtexは`dvips`と共に`$PATH`に置く必要があります）。Marukuに`dvips`の固定的な場所を仮定させたくない場合は、[RemiによるMarukuフォーク版](http://github.com/remi/maruku)をチェックしてください。

<!--original
Maruku comes with optional support for LaTeX to PNG rendering via blahtex
(Version 0.6) which must be in your `$PATH` along with `dvips`. If you need
Maruku to not assume a fixed location for `dvips`, check out [Remi’s Maruku
fork](http://github.com/remi/maruku).
-->

## 他のMarkdownプロセッサ

<!--original
## Alternative Markdown Processors
-->

Jekyllは、Markdownの変換にデフォルトでMarukuを使用していますが、他の3つの定義済みmarkdownパーサを使うことも、これを自身で定義することもできます。

<!--original
While Jekyll defaults to using Maruku for Markdown conversion, you may use one
of the other three pre-defined markdown parsers or define your own.
-->

### RDiscount

<!--original
### RDiscount
-->

[Maruku](http://github.com/bhollis/maruku)の代わりに[RDiscount](http://github.com/rtomayko/rdiscount)を使用する場合は、それがインストールされていることを確認してください。

<!--original
If you prefer to use [RDiscount](http://github.com/rtomayko/rdiscount) instead
of [Maruku](http://github.com/bhollis/maruku) for Markdown, just make sure you have
it installed:
-->

{% highlight bash %}
$ [sudo] gem install rdiscount
{% endhighlight %}

<!--original
{% highlight bash %}
$ [sudo] gem install rdiscount
{% endhighlight %}
-->

そして、`_config.yml`ファイルのMarkdownエンジンにRDiscountを指定して、Jekyllがこのオプションで実行されるようにします。

<!--original
And then specify RDiscount as the Markdown engine in your `_config.yml` file to
have Jekyll run with that option.
-->

{% highlight yaml %}
# _config.yml内で
markdown: rdiscount
{% endhighlight %}

<!--original
{% highlight yaml %}
# In _config.yml
markdown: rdiscount
{% endhighlight %}
-->

### Kramdown

<!--original
### Kramdown
-->

Marukuの代わりに[Kramdown](http://kramdown.rubyforge.org/)を使用する場合は、それがインストールされていることを確認してください。

<!--original
You can also use [Kramdown](http://kramdown.rubyforge.org/) instead of Maruku
for Markdown. Make sure that Kramdown is installed:
-->

{% highlight bash %}
$ [sudo] gem install kramdown
{% endhighlight %}

<!--original
{% highlight bash %}
$ [sudo] gem install kramdown
{% endhighlight %}
-->

これで、`_config.yml`ファイルのMarkdownエンジンにKramdownが指定できます。

<!--original
Then you can specify Kramdown as the Markdown engine in `_config.yml`.
-->

{% highlight yaml %}
# _config.yml内で
markdown: kramdown
{% endhighlight %}

<!--original
{% highlight yaml %}
# In _config.yml
markdown: kramdown
{% endhighlight %}
-->

KramdownにはHTML出力をカスタマイズするためのさまざまなオプションがあります。[Configuration](/docs/configuration/)ページで、Jekyllで使われるデフォルトのオプションが一覧できます。オプションの完全なリストは[Kramdownのウェブサイト](http://kramdown.rubyforge.org/options.html)にあります。

<!--original
Kramdown has various options for customizing the HTML output. The
[Configuration](/docs/configuration/) page lists the default options used by
Jekyll. A complete list of options is also available on the [Kramdown
website](http://kramdown.rubyforge.org/options.html).
-->

### ユーザーによる定義

<!--original
### User-Defined
-->

これら4つの組み込みMarkdownパーサが全く気に入らないって？問題ありません。これをプラグインとして定義できますから。

<!--original
So, you're totally at odds with our four built-in markdown parsers, eh? No
sweat. You can define one as a plugin:
-->

{% highlight ruby %}
require 'jekyll'
require 'some_renderer'

class Jekyll::Converters::Markdown::MyCustomParser
  def initialize(config)
    @site_config = config
  end

  def convert(content)
    # (ここでは_必ず_レンダリング後の結果の文字列を返します)
    SomeRenderer.new(@site_config).to_html(content)
  end
end

<!--original
{% highlight ruby %}
require 'jekyll'
require 'some_renderer'

class Jekyll::Converters::Markdown::MyCustomParser
  def initialize(config)
    @site_config = config
  end

  def convert(content)
    # (this _must_ return the resulting String after the rendering)
    SomeRenderer.new(@site_config).to_html(content)
  end
end
{% endhighlight %}
-->

用意ができたら、`_config.yml`ファイルであなた仕様のmarkdownパーサを使うよう指定します。

<!--original
Once you've got that setup, ask Jekyll to use your custom markdown parser in
your `_config.yml` file:
-->

{% highlight yaml %}
markdown: MyCustomParser
{% endhighlight %}

<!--original
{% highlight yaml %}
markdown: MyCustomParser
{% endhighlight %}
-->

(注：ここでは大文字小文字は区別され、`Jekyll::Converters::Markdown`の後の部分だけとする)。これで完成です！

<!--original
(Note that this **is case-sensitive**, and is only the piece after
`Jekyll::Converters::Markdown`.) And there you are!
-->

