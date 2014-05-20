---
layout: docs
title: プラグイン
prev_section: pagination
next_section: extras
permalink: /docs/plugins/
---

<!--original
---
layout: docs
title: Plugins
prev_section: pagination
next_section: extras
permalink: /docs/plugins/
---
-->

Jekyllはフックによるプラグイン(plugin)システムを備えており、これによりあなたのサイト向けに特化したコンテンツの生成が可能になります。Jekyllのソース自体を修正することなく、あなたのサイト用のコードを実行できます。

<!--original
Jekyll has a plugin system with hooks that allow you to create custom generated
content specific to your site. You can run custom code for your site without
having to modify the Jekyll source itself.
-->


<div class="note info">
  <h5>GitHub Pagesにおけるプラグイン</h5>
  <p>
    <a href="http://pages.github.com/">GitHub Pages</a>はJekyllで動いていますが、ここで構築されるすべてのサイトは、セキュリティ上の理由から<code>--safe</code>オプションで生成され、カスタムプラグインが利用できないようになっています。残念ながら、これはあなたのプラグインをGitHub Pagesにデプロイしても動作しないことを意味します。<br><br>
    あなたのサイトを公開するためにGitHub Pagesを利用することはできますが、そのためには、Jekyllのソースファイルの代わりに、サイトをローカルで変換して、生成された静的ファイルをGitHubレポジトリにプッシュする必要があります。
  </p>
</div>

<!--original
<div class="note info">
  <h5>Plugins on GitHub Pages</h5>
  <p>
    <a href="http://pages.github.com/">GitHub Pages</a> is powered by Jekyll,
    however all Pages sites are generated using the <code>--safe</code> option
    to disable custom plugins for security reasons. Unfortunately, this means
    your plugins won’t work if you’re deploying to GitHub Pages.<br><br>
    You can still use GitHub Pages to publish your site, but you’ll need to
    convert the site locally and push the generated static files to your GitHub
    repository instead of the Jekyll source files.
  </p>
</div>
-->

## プラグインのインストール

<!--original
## Installing a plugin
-->

プラグインをインストールする２つの方法があります。

<!--original
You have 2 options for installing plugins:
-->

1. サイトのルートに`_plugins`ディレクトリを作って、プラグインをここに配置します。このディレクトリ内の`*.rb`で終わるすべてのファイルは、Jekyllがサイトを生成するときに読み込まれます。


2. `_config.yml`ファイルに、`gems`をキーとし、使いたいプラグインのgem名を値とする新たな行を追加します。例を示します。

        gems: [jekyll-test-plugin, jekyll-jsonify, jekyll-assets]
        # これで各gemが自動的に読み込まれます。


<!--original
1. In your site source root, make a `_plugins` directory. Place your plugins here.
    Any file ending in `*.rb` inside this directory will be loaded before Jekyll
    generates your site.
2. In your `_config.yml` file, add a new array with the key `gems` and the values
    of the gem names of the plugins you'd like to use. An example:

        gems: [jekyll-test-plugin, jekyll-jsonify, jekyll-assets]
        # This will require each of these gems automatically.
-->

<div class="note info">
  <h5>
    <code>_plugins</code>と<code>gems</code>
    は同時に使用できます。
  </h5>
  <p>
    前述した２つのプラグインの選択肢は、同じサイトにおいて同時に使うことができます。一方の使用は、他方の使用を制限しません。
  </p>
</div>

<!--original
<div class="note info">
  <h5>
    <code>_plugins</code> and <code>gems</code>
    can be used simultaneously
  </h5>
  <p>
    You may use both of the aforementioned plugin options simultaneously in the
    same site if you so choose. Use of one does not restrict the use of the other
  </p>
</div>
-->

通常、あなたが作るpluginは次の３つのカテゴリの何れかに該当します。

<!--original
In general, plugins you make will fall into one of three categories:
-->

1. ジェネレータ(Generators)
2. コンバータ(Converters)
3. タグ(Tags)

<!--original
1. Generators
2. Converters
3. Tags
-->

## ジェネレータ(Generators)

<!--original
## Generators
-->

独自ルールでJekyllに追加コンテンツを生成させる必要があるときは、ジェネレータを作ります。

<!--original
You can create a generator when you need Jekyll to create additional content
based on your own rules.
-->

ジェネレータは、`generate`メソッドを定義している`Jekyll::Generator`のサブクラスであり、このメソッドは、[`Jekyll::Site`]({{ site.repository }}/blob/master/lib/jekyll/site.rb)のインスタンスを取ります。

<!--original
A generator is a subclass of `Jekyll::Generator` that defines a `generate`
method, which receives an instance of
[`Jekyll::Site`]({{ site.repository }}/blob/master/lib/jekyll/site.rb).
-->

ジェネレータは、その副作用のために起動され、`generate`メソッドの返り値は無視されます。Jekyllは引き起こされる如何なる特定の副作用も期待しておらず、ただそのメソッドを呼ぶだけです。

<!--original
Generation is triggered for its side-effects, the return value of `generate` is
ignored. Jekyll does not assume any particular side-effect to happen, it just
runs the method.
-->

ジェネレータは、Jekyllが存在するコンテンツの目録を作った後、サイトが生成される前に、動作します。YAML front-matterを備えたpageは、[`Jekyll::Page`]({{ site.repository }}/blob/master/lib/jekyll/page.rb)のインスタンスとして格納され、`site.pages`を通して利用可能になります。静的ファイルは、[`Jekyll::StaticFile`]({{ site.repository }}/blob/master/lib/jekyll/static_file.rb)のインスタンスになり、`site.static_files`を通して利用可能になります。詳しくは、[`Jekyll::Site`]({{ site.repository }}/blob/master/lib/jekyll/site.rb)を確認して下さい。

<!--original
Generators run after Jekyll has made an inventory of the existing content, and
before the site is generated. Pages with YAML front-matters are stored as
instances of
[`Jekyll::Page`]({{ site.repository }}/blob/master/lib/jekyll/page.rb)
and are available via `site.pages`. Static files become instances of
[`Jekyll::StaticFile`]({{ site.repository }}/blob/master/lib/jekyll/static_file.rb)
and are available via `site.static_files`. See
[`Jekyll::Site`]({{ site.repository }}/blob/master/lib/jekyll/site.rb)
for more details.
-->

例えばジェネレータは、ビルド時に計算された値をテンプレート変数を使い挿入できます。次の例ではテンプレート`reading.html`は２つの変数、`ongoing`および`done`を持っており、これらはジェネレータにおいて値を埋め込まれます。

<!--original
For instance, a generator can inject values computed at build time for template
variables. In the following example the template `reading.html` has two
variables `ongoing` and `done` that we fill in the generator:
-->

{% highlight ruby %}
module Reading
  class Generator < Jekyll::Generator
    def generate(site)
      ongoing, done = Book.all.partition(&:ongoing?)

      reading = site.pages.detect {|page| page.name == 'reading.html'}
      reading.data['ongoing'] = ongoing
      reading.data['done'] = done
    end
  end
end
{% endhighlight %}

<!--original
{% highlight ruby %}
module Reading
  class Generator < Jekyll::Generator
    def generate(site)
      ongoing, done = Book.all.partition(&:ongoing?)

      reading = site.pages.detect {|page| page.name == 'reading.html'}
      reading.data['ongoing'] = ongoing
      reading.data['done'] = done
    end
  end
end
{% endhighlight %}
-->

以下は、新しいページを生成する、より複雑なジェネレータです。

<!--original
This is a more complex generator that generates new pages:
-->

{% highlight ruby %}
module Jekyll

  class CategoryPage < Page
    def initialize(site, base, dir, category)
      @site = site
      @base = base
      @dir = dir
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'category_index.html')
      self.data['category'] = category

      category_title_prefix = site.config['category_title_prefix'] || 'Category: '
      self.data['title'] = "#{category_title_prefix}#{category}"
    end
  end

  class CategoryPageGenerator < Generator
    safe true

    def generate(site)
      if site.layouts.key? 'category_index'
        dir = site.config['category_dir'] || 'categories'
        site.categories.keys.each do |category|
          site.pages << CategoryPage.new(site, site.source, File.join(dir, category), category)
        end
      end
    end
  end

end
{% endhighlight %}

<!--original
{% highlight ruby %}
module Jekyll

  class CategoryPage < Page
    def initialize(site, base, dir, category)
      @site = site
      @base = base
      @dir = dir
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'category_index.html')
      self.data['category'] = category

      category_title_prefix = site.config['category_title_prefix'] || 'Category: '
      self.data['title'] = "#{category_title_prefix}#{category}"
    end
  end

  class CategoryPageGenerator < Generator
    safe true

    def generate(site)
      if site.layouts.key? 'category_index'
        dir = site.config['category_dir'] || 'categories'
        site.categories.keys.each do |category|
          site.pages << CategoryPage.new(site, site.source, File.join(dir, category), category)
        end
      end
    end
  end

end
{% endhighlight %}
-->

この例においてジェネレータは、各カテゴリごとに`categories`ディレクトリ下に一式のファイルを生成し、`category_index.html`レイアウトを使って、各カテゴリごとに記事をリスト表示します。

<!--original
In this example, our generator will create a series of files under the
`categories` directory for each category, listing the posts in each category
using the `category_index.html` layout.
-->

ジェネレータでは、１つのメソッドを実装すれば良いです。

<!--original
Generators are only required to implement one method:
-->

<div class="mobile-side-scroller">
<table>
  <thead>
    <tr>
      <th>メソッド</th>
      <th>解説</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <p><code>generate</code></p>
      </td>
      <td>
        <p>副作用でコンテンツを生成する</p>
      </td>
    </tr>
  </tbody>
</table>
</div>

<!--original
<div class="mobile-side-scroller">
<table>
  <thead>
    <tr>
      <th>Method</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <p><code>generate</code></p>
      </td>
      <td>
        <p>Generates content as a side-effect.</p>
      </td>
    </tr>
  </tbody>
</table>
</div>
-->

## コンバータ(Converters)

<!--original
## Converters
-->

サイトで利用したい新しいマークアップ言語があるときは、独自のコンバータを実装することで利用できるようになります。MarkdownおよびTextileマークアップ言語は、共にこの方法で実装されています。

<!--original
If you have a new markup language you’d like to use with your site, you can
include it by implementing your own converter. Both the Markdown and Textile
markup languages are implemented using this method.
-->

<div class="note info">
  <h5>YAML front-matterを忘れずに</h5>
  <p>
    Jekyllは先頭にYAMLヘッダーがあるファイルだけを変換しますが、これはたとえプラグインを使って追加されたコンバータであっても同じです。
  </p>
</div>

<!--original
<div class="note info">
  <h5>Remember your YAML front-matter</h5>
  <p>
    Jekyll will only convert files that have a YAML header at the top, even for
    converters you add using a plugin.
  </p>
</div>
-->

以下は、`.upcase`で終わる全postを対象に、これらを`UpcaseConverter`を使用して処理するコンバータの例です。

<!--original
Below is a converter that will take all posts ending in `.upcase` and process
them using the `UpcaseConverter`:
-->

{% highlight ruby %}
module Jekyll
  class UpcaseConverter < Converter
    safe true
    priority :low

    def matches(ext)
      ext =~ /^\.upcase$/i
    end

    def output_ext(ext)
      ".html"
    end

    def convert(content)
      content.upcase
    end
  end
end
{% endhighlight %}

<!--original
{% highlight ruby %}
module Jekyll
  class UpcaseConverter < Converter
    safe true
    priority :low

    def matches(ext)
      ext =~ /^\.upcase$/i
    end

    def output_ext(ext)
      ".html"
    end

    def convert(content)
      content.upcase
    end
  end
end
{% endhighlight %}
-->

コンバータには、最低３つのメソッドを実装する必要があります。

<!--original
Converters should implement at a minimum 3 methods:
-->

<div class="mobile-side-scroller">
<table>
  <thead>
    <tr>
      <th>メソッド</th>
      <th>解説</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <p><code>matches</code></p>
      </td>
      <td><p>
        与えられた拡張子はこのコンバータのアクセス可能な拡張子のリストにマッチするか？１引数を取る: ファイルの拡張子(ドットを含む)。マッチする場合は<code>true</code>を、それ以外は<code>false</code>を返す必要がある。
      </p></td>
    </tr>
    <tr>
      <td>
        <p><code>output_ext</code></p>
      </td>
      <td><p>
        出力ファイルに与えられる拡張子(ドットを含む)。
        通常、これは<code>".html"</code>である。
      </p></td>
    </tr>
    <tr>
      <td>
        <p><code>convert</code></p>
      </td>
      <td><p>
        コンテンツの変換をするためのロジック。１引数を取る: ファイルの未加工のコンテンツ(YAML front matterを含まない)。文字列を返す必要がある。
      </p></td>
    </tr>
  </tbody>
</table>
</div>

<!--original
<div class="mobile-side-scroller">
<table>
  <thead>
    <tr>
      <th>Method</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <p><code>matches</code></p>
      </td>
      <td><p>
        Does the given extension match this converter’s list of acceptable
        extensions? Takes one argument: the file’s extension (including the
        dot). Must return <code>true</code> if it matches, <code>false</code>
        otherwise.
      </p></td>
    </tr>
    <tr>
      <td>
        <p><code>output_ext</code></p>
      </td>
      <td><p>
        The extension to be given to the output file (including the dot).
        Usually this will be <code>".html"</code>.
      </p></td>
    </tr>
    <tr>
      <td>
        <p><code>convert</code></p>
      </td>
      <td><p>
        Logic to do the content conversion. Takes one argument: the raw content
        of the file (without YAML front matter). Must return a String.
      </p></td>
    </tr>
  </tbody>
</table>
</div>
-->

この例で、`UpcaseConverter#matches`は、ファイル名の拡張子が`.upcase`であるかをチェックし、そうである場合、このコンバータを使ってレンダリングを行います。`UpcaseConverter#convert`は、このコンテンツを処理するために呼ばれます。この簡単なコンバータでは単に全コンテンツの文字列を大文字化します。そして、このpageを保存するときは`.html`の拡張子で保存します。

<!--original
In our example, `UpcaseConverter#matches` checks if our filename extension is
`.upcase`, and will render using the converter if it is. It will call
`UpcaseConverter#convert` to process the content. In our simple converter we’re
simply uppercasing the entire content string. Finally, when it saves the page,
it will do so with a `.html` extension.
-->

## タグ(Tags)

<!--original
## Tags
-->


サイトで専用Liquidタグを使いたいときは、タグシステムにフックさせることで実現できます。jekyllの組み込みサンプルには、'highlight'タグと'include'タグが含まれています。次の例は、pageが作られるときの時刻を出力する専用Liquidタグです。


<!--original
If you’d like to include custom liquid tags in your site, you can do so by
hooking into the tagging system. Built-in examples added by Jekyll include the
`highlight` and `include` tags. Below is an example of a custom liquid tag that
will output the time the page was rendered:
-->

{% highlight ruby %}
module Jekyll
  class RenderTimeTag < Liquid::Tag

    def initialize(tag_name, text, tokens)
      super
      @text = text
    end

    def render(context)
      "#{@text} #{Time.now}"
    end
  end
end

Liquid::Template.register_tag('render_time', Jekyll::RenderTimeTag)
{% endhighlight %}

<!--original
{% highlight ruby %}
module Jekyll
  class RenderTimeTag < Liquid::Tag

    def initialize(tag_name, text, tokens)
      super
      @text = text
    end

    def render(context)
      "#{@text} #{Time.now}"
    end
  end
end

Liquid::Template.register_tag('render_time', Jekyll::RenderTimeTag)
{% endhighlight %}
-->

Liquidタグでは最低限、次を実装する必要があります。

<!--original
At a minimum, liquid tags must implement:
-->

<div class="mobile-side-scroller">
<table>
  <thead>
    <tr>
      <th>メソッド</th>
      <th>解説</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <p><code>render</code></p>
      </td>
      <td>
        <p>タグのコンテンツを出力する。</p>
      </td>
    </tr>
  </tbody>
</table>
</div>

<!--original
<div class="mobile-side-scroller">
<table>
  <thead>
    <tr>
      <th>Method</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <p><code>render</code></p>
      </td>
      <td>
        <p>Outputs the content of the tag.</p>
      </td>
    </tr>
  </tbody>
</table>
</div>
-->

また、Liquidテンプレートエンジンにこの専用タグを登録する必要があります。

<!--original
You must also register the custom tag with the Liquid template engine as
follows:
-->

{% highlight ruby %}
Liquid::Template.register_tag('render_time', Jekyll::RenderTimeTag)
{% endhighlight %}

<!--original
{% highlight ruby %}
Liquid::Template.register_tag('render_time', Jekyll::RenderTimeTag)
{% endhighlight %}
-->

上記の例で、任意のpageのどこにでも、次のようなタグを配置できるようになります。

<!--original
In the example above, we can place the following tag anywhere in one of our
pages:
-->

{% highlight ruby %}
{% raw %}
<p>{% render_time page rendered at: %}</p>
{% endraw %}
{% endhighlight %}

<!--original
{% highlight ruby %}
{% raw %}
<p>{% render_time page rendered at: %}</p>
{% endraw %}
{% endhighlight %}
-->

これにより、page上に次のような出力が得られます。

<!--original
And we would get something like this on the page:
-->

{% highlight html %}
<p>page rendered at: Tue June 22 23:38:47 –0500 2010</p>
{% endhighlight %}

<!--original
{% highlight html %}
<p>page rendered at: Tue June 22 23:38:47 –0500 2010</p>
{% endhighlight %}
-->

### Liquidフィルタ(Liquid filters)

<!--original
### Liquid filters
-->

上でタグを追加したように、Liquidテンプレートシステムに独自フィルタを追加することもできます。フィルタは、Liquidにメソッドをエクスポートする簡単なモジュールです。すべてのメソッドは、フィルタの入力としての少なくとも１つの引数を取る必要があります。その返り値はフィルタの出力になります。

<!--original
You can add your own filters to the Liquid template system much like you can add
tags above. Filters are simply modules that export their methods to liquid. All
methods will have to take at least one parameter which represents the input of
the filter. The return value will be the output of the filter.
-->

{% highlight ruby %}
module Jekyll
  module AssetFilter
    def asset_url(input)
      "http://www.example.com/#{input}?#{Time.now.to_i}"
    end
  end
end

Liquid::Template.register_filter(Jekyll::AssetFilter)
{% endhighlight %}

<!--original
{% highlight ruby %}
module Jekyll
  module AssetFilter
    def asset_url(input)
      "http://www.example.com/#{input}?#{Time.now.to_i}"
    end
  end
end

Liquid::Template.register_filter(Jekyll::AssetFilter)
{% endhighlight %}
-->

<div class="note">
  <h5>ProTip™: Liquidを通じたsiteオブジェクトへのアクセス</h5>
  <p>
    Jekyllでは<code>site</code>オブジェクトにアクセスでき、これはLiquidの<code>context.registers</code>機能を通じた<code>context.registers[:site]</code>により可能になります。例えば、グローバル設定ファイル<code>_config.yml</code>に<code>context.registers[:site].config</code>を使ってアクセスできます。
  </p>
</div>

<!--original
<div class="note">
  <h5>ProTip™: Access the site object using Liquid</h5>
  <p>
    Jekyll lets you access the <code>site</code> object through the
    <code>context.registers</code> feature of Liquid at <code>context.registers[:site]</code>. For example, you can
    access the global configuration file <code>_config.yml</code> using
    <code>context.registers[:site].config</code>.
  </p>
</div>
-->

### フラグ(Flags)

<!--original
### Flags
-->

プラグインを書くときに注意すべき２つのフラグがあります。

<!--original
There are two flags to be aware of when writing a plugin:
-->

<div class="mobile-side-scroller">
<table>
  <thead>
    <tr>
      <th>フラグ</th>
      <th>解説</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <p><code>safe</code></p>
      </td>
      <td>
        <p>
          任意のコードの実行が許可されていない環境で、対象のプラグインが安全に実行されるものであるか否かをJekyllに伝えるブーリアンフラグ。これはGitHub Pagesで利用され、そこでどのコアプラグインが利用でき、またどのプラグインが起動上安全でないかが判断される。あなたのプラグインが任意コードの実行を許可しない場合には、<code>true</code>をセットする。これをセットしたとしてもGitHub Pagesは依然としてあなたのプラグインを読み込むようにはならないが、Jekyll本体に組み込むべくプラグインを供するつもりなら、このオプションを正しく設定しておくのがよい。
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>priority</code></p>
      </td>
      <td>
        <p>
          このフラグは、プラグインがロードされる順番を決定する。有効な値は、 <code>:lowest</code>, <code>:low</code>, <code>:normal</code>,
          <code>:high</code>, および <code>:highest</code>。最上位(highest priority)のものは最初に適用され、最下位(lowest priority)のものは最後に適用される。
        </p>
      </td>
    </tr>
  </tbody>
</table>
</div>

<!--original
<div class="mobile-side-scroller">
<table>
  <thead>
    <tr>
      <th>Flag</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <p><code>safe</code></p>
      </td>
      <td>
        <p>
          A boolean flag that informs Jekyll whether this plugin may be safely
          executed in an environment where arbitrary code execution is not
          allowed. This is used by GitHub Pages to determine which core plugins
          may be used, and which are unsafe to run. If your plugin does not
          allow for arbitrary code, execution, set this to <code>true</code>.
          GitHub Pages still won’t load your plugin, but if you submit it for
          inclusion in core, it’s best for this to be correct!
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>priority</code></p>
      </td>
      <td>
        <p>
          This flag determines what order the plugin is loaded in. Valid values
          are: <code>:lowest</code>, <code>:low</code>, <code>:normal</code>,
          <code>:high</code>, and <code>:highest</code>. Highest priority
          matches are applied first, lowest priority are applied last.
        </p>
      </td>
    </tr>
  </tbody>
</table>
</div>
-->


上で説明したサンプルプラグインの一つを使う場合、これら２つのフラグの指定は次のようになります。

<!--original
To use one of the example plugins above as an illustration, here is how you’d
specify these two flags:
-->

{% highlight ruby %}
module Jekyll
  class UpcaseConverter < Converter
    safe true
    priority :low
    ...
  end
end
{% endhighlight %}

<!--original
{% highlight ruby %}
module Jekyll
  class UpcaseConverter < Converter
    safe true
    priority :low
    ...
  end
end
{% endhighlight %}
-->

## 利用可能なプラグイン

<!--original
## Available Plugins
-->

幾つかの便利なプラグインが次の場所にあります。

<!--original
You can find a few useful plugins at the following locations:
-->

#### ジェネレータ

<!--original
#### Generators
-->

- [ArchiveGenerator by Ilkka Laukkanen](https://gist.github.com/707909): [このarchive page](https://gist.github.com/707020)を使ってアーカイブを生成する。
- [LESS.js Generator by Andy Fowler](https://gist.github.com/642739): 生成の過程においてLESS.jsファイルをレンダリングする。
- [Version Reporter by Blake Smith](https://gist.github.com/449491): Jekyllのバージョンを含むversion.htmlファイルを作る。
- [Sitemap.xml Generator by Michael Levin](https://github.com/kinnetica/jekyll-plugins): 利用可能な全postおよびpageを走査して、sitemap.xmlファイルを生成する。
- [Full-text search by Pascal Widdershoven](https://github.com/PascalW/jekyll_indextank): プラグインと少しのJavaScriptを使って、あなたのJekyllサイトに全文テキスト検索を追加する。
- [AliasGenerator by Thomas Mango](https://github.com/tsmango/jekyll_alias_generator): YAML Front Matterでエイリアスが指定されたときに、postのためのリダイレクトページを生成する。
- [Pageless Redirect Generator by Nick Quinlan](https://github.com/nquinlan/jekyll-pageless-redirects): htaccessリダイレクトのサポートで、Jekyllのルート内のファイルに従ってリダイレクトを生成する。
- [Projectlist by Frederic Hemberger](https://github.com/fhemberger/jekyll-projectlist): ディレクトリ内のファイル群を、分割されたpostとする代わりに、単一のページとしてレンダリングする。
- [RssGenerator by Assaf Gelber](https://github.com/agelber/jekyll-rss): postからRSS 2.0フィードを自動的に生成する。
- [Monthly archive generator by Shigeya Suzuki](https://github.com/shigeya/jekyll-monthly-archive-plugin): MovableTypeスタイルの月ごとのアーカイブをレンダリングする、Ilkka Laukkanenその他の作品をベースにした、ジェネレータとテンプレート。
- [Category archive generator by Shigeya Suzuki](https://github.com/shigeya/jekyll-category-archive-plugin): MovableTypeスタイルのカテゴリーアーカイブをレンダリングする、Monthly archive generatorをベースにした、ジェネレータとテンプレート。
- [Emoji for Jekyll](https://github.com/yihangho/emoji-for-jekyll): 全postおよびpageでシームレスに利用可能な絵文字。
- [Compass integration for Jekyll](https://github.com/mscharley/jekyll-compass): CompassおよびSassをJekyllのウェブサイトに簡単に統合する。
- [Pages Directory by Ben Baker-Smith](https://github.com/bbakersmith/jekyll-pages-directory): pageファイル群のための`_pages`ディレクトリを定義し、それがプロジェクトのルートに対する出力先を作る。

<!--original
- [ArchiveGenerator by Ilkka Laukkanen](https://gist.github.com/707909): Uses [this archive page](https://gist.github.com/707020) to generate archives.
- [LESS.js Generator by Andy Fowler](https://gist.github.com/642739): Renders LESS.js files during generation.
- [Version Reporter by Blake Smith](https://gist.github.com/449491): Creates a version.html file containing the Jekyll version.
- [Sitemap.xml Generator by Michael Levin](https://github.com/kinnetica/jekyll-plugins): Generates a sitemap.xml file by traversing all of the available posts and pages.
- [Full-text search by Pascal Widdershoven](https://github.com/PascalW/jekyll_indextank): Adds full-text search to your Jekyll site with a plugin and a bit of JavaScript.
- [AliasGenerator by Thomas Mango](https://github.com/tsmango/jekyll_alias_generator): Generates redirect pages for posts when an alias is specified in the YAML Front Matter.
- [Pageless Redirect Generator by Nick Quinlan](https://github.com/nquinlan/jekyll-pageless-redirects): Generates redirects based on files in the Jekyll root, with support for htaccess style redirects.
- [Projectlist by Frederic Hemberger](https://github.com/fhemberger/jekyll-projectlist): Renders files in a directory as a single page instead of separate posts.
- [RssGenerator by Assaf Gelber](https://github.com/agelber/jekyll-rss): Automatically creates an RSS 2.0 feed from your posts.
- [Monthly archive generator by Shigeya Suzuki](https://github.com/shigeya/jekyll-monthly-archive-plugin): Generator and template which renders monthly archive like MovableType style, based on the work by Ilkka Laukkanen and others above.
- [Category archive generator by Shigeya Suzuki](https://github.com/shigeya/jekyll-category-archive-plugin): Generator and template which renders category archive like MovableType style, based on Monthly archive generator.
- [Emoji for Jekyll](https://github.com/yihangho/emoji-for-jekyll): Seamlessly enable emoji for all posts and pages.
- [Compass integration for Jekyll](https://github.com/mscharley/jekyll-compass): Easily integrate Compass and Sass with your Jekyll website.
- [Pages Directory by Ben Baker-Smith](https://github.com/bbakersmith/jekyll-pages-directory): Defines a `_pages` directory for page files which routes its output relative to the project root.
-->

#### コンバータ

<!--original
#### Converters
-->

- [Jade plugin by John Papandriopoulos](https://github.com/snappylabs/jade-jekyll-plugin): Jekyll用Jadeコンバータ。
- [HAML plugin by Sam Z](https://gist.github.com/517556): Jekyll用HAMLコンバータ。
- [HAML-Sass Converter by Adam Pearson](https://gist.github.com/481456): Jekyll用のシンプルなHAML-Sassコンバータ。Sam Xによる[Fork](https://gist.github.com/528642)。
- [Sass SCSS Converter by Mark Wolfe](https://gist.github.com/960150): 新しいCSS互換シンタックスを使ったSassコンバータで、上記Sam Xのfork版がベース。
- [LESS Converter by Jason Graham](https://gist.github.com/639920): LESSファイルをCSSに変換する。
- [LESS Converter by Josh Brown](https://gist.github.com/760265): シンプルなLESSコンバータ。
- [Upcase Converter by Blake Smith](https://gist.github.com/449463): サンプルとしてのJekyllコンバータ。
- [CoffeeScript Converter by phaer](https://gist.github.com/959938): [CoffeeScript](http://coffeescript.org)からJavascriptへのコンバータ。
- [Markdown References by Olov Lassus](https://github.com/olov/jekyll-references): すべてのmarkdownの参照型リンクを一つの\_references.mdファイルに保持する。
- [Stylus Converter](https://gist.github.com/988201): .stylを.cssに変換する。
- [ReStructuredText Converter](https://github.com/xdissent/jekyll-rst): ReSTドキュメントを、PygmentsシンタックスハイライトでHTMLに変換する。
- [Jekyll-pandoc-plugin](https://github.com/dsanson/jekyll-pandoc-plugin): markdownをレンダリングするためにpandocを使う。
- [Jekyll-pandoc-multiple-formats](https://github.com/fauno/jekyll-pandoc-multiple-formats) by [edsl](https://github.com/edsl): pandocを使って複数のフォーマットでサイトを生成する。pandocのmarkdown拡張をサポート。
- [ReStructuredText Converter](https://github.com/xdissent/jekyll-rst): ReSTドキュメントを、PygmentsシンタックスハイライトでHTMLに変換する。
- [Transform Layouts](https://gist.github.com/1472645): HAMLレイアウトを可能にする(これを機能させるには、HAMLコンバータプラグインが必要)。
- [Org-mode Converter](https://gist.github.com/abhiyerra/7377603): Jekyll用Org-modeコンバータ。

<!--original
- [Jade plugin by John Papandriopoulos](https://github.com/snappylabs/jade-jekyll-plugin): Jade converter for Jekyll.
- [HAML plugin by Sam Z](https://gist.github.com/517556): HAML converter for Jekyll.
- [HAML-Sass Converter by Adam Pearson](https://gist.github.com/481456): Simple HAML-Sass converter for Jekyll. [Fork](https://gist.github.com/528642) by Sam X.
- [Sass SCSS Converter by Mark Wolfe](https://gist.github.com/960150): Sass converter which uses the new CSS compatible syntax, based Sam X’s fork above.
- [LESS Converter by Jason Graham](https://gist.github.com/639920): Convert LESS files to CSS.
- [LESS Converter by Josh Brown](https://gist.github.com/760265): Simple LESS converter.
- [Upcase Converter by Blake Smith](https://gist.github.com/449463): An example Jekyll converter.
- [CoffeeScript Converter by phaer](https://gist.github.com/959938): A [CoffeeScript](http://coffeescript.org) to Javascript converter.
- [Markdown References by Olov Lassus](https://github.com/olov/jekyll-references): Keep all your markdown reference-style link definitions in one \_references.md file.
- [Stylus Converter](https://gist.github.com/988201): Convert .styl to .css.
- [ReStructuredText Converter](https://github.com/xdissent/jekyll-rst): Converts ReST documents to HTML with Pygments syntax highlighting.
- [Jekyll-pandoc-plugin](https://github.com/dsanson/jekyll-pandoc-plugin): Use pandoc for rendering markdown.
- [Jekyll-pandoc-multiple-formats](https://github.com/fauno/jekyll-pandoc-multiple-formats) by [edsl](https://github.com/edsl): Use pandoc to generate your site in multiple formats. Supports pandoc’s markdown extensions.
- [ReStructuredText Converter](https://github.com/xdissent/jekyll-rst): Converts ReST documents to HTML with Pygments syntax highlighting.
- [Transform Layouts](https://gist.github.com/1472645): Allows HAML layouts (you need a HAML Converter plugin for this to work).
- [Org-mode Converter](https://gist.github.com/abhiyerra/7377603): Org-mode converter for Jekyll.
-->

#### フィルタ

<!--original
#### Filters
-->

- [Truncate HTML](https://github.com/MattHall/truncatehtml) by [Matt Hall](http://codebeef.com): マークアップ構造を維持しつつHTMLをトランケートするJekyllフィルタ。
- [Domain Name Filter by Lawrence Woodman](https://github.com/LawrenceWoodman/domain_name-liquid_filter): ドメイン名が残るように入力テキストをフィルタする。
- [Summarize Filter by Mathieu Arnold](https://gist.github.com/731597): `<div id="extended">`タグの後のマークアップを除去する。
- [URL encoding by James An](https://gist.github.com/919275): URIパーセントエンコーディング。
- [JSON Filter](https://gist.github.com/1850654) by [joelverhagen](https://github.com/joelverhagen): 入力テキストを得てJSONとして出力するフィルタ。JavaScriptをレンダリングするのに好適。
- [i18n_filter](https://github.com/gacha/gacha.id.lv/blob/master/_plugins/i18n_filter.rb): I18nローカライゼーションに使うLiquidフィルタ。
- [Smilify](https://github.com/SaswatPadhi/jekyll_smilify) by [SaswatPadhi](https://github.com/SaswatPadhi): コンテンツ内の顔文字テキスト(emoticons)をテーマ別顔文字画像に変換する([デモ](http://saswatpadhi.github.com/))。
- [Read in X Minutes](https://gist.github.com/zachleat/5792681) by [zachleat](https://github.com/zachleat): 文字列(ブログ記事のコンテンツ)のリーディング時間を見積る。
- [Jekyll-timeago](https://github.com/markets/jekyll-timeago): 時間値を時間経過の単語に変換する。
- [pluralize](https://github.com/bdesham/pluralize): 数字と単語を文法的に正しい量(例：“1 minute” or “2 minute**s**”)で簡単に結合する。
- [reading_time](https://github.com/bdesham/reading_time): 単語をカウントし、テキスト片のリーディング時間を見積る。この場合、対象テキストとして含めるにそぐわないHTML要素は無視される。
- [Table of Content Generator](https://github.com/dafi/jekyll-toc-generator): 目次(TOC)を含むHTMLコードを生成する。目次は多様な方法でカスタマイズ可能であり、例えば、目次を持たないページを指定できる。
- [jekyll-humanize](https://github.com/23maverick23/jekyll-humanize): これはDjangoアプリhumanizeの移植版で、データに"人間らしさ"を追加する。各メソッドは、Fluidタイプフィルタを表し、Jekyllサイトのテンプレートで利用可能。Jekyllは静的サイトを生成するので、いくつかのオリジナルメソッドは移植版において論理的な意味をなさない(例：naturaltime)。

<!--original
- [Truncate HTML](https://github.com/MattHall/truncatehtml) by [Matt Hall](http://codebeef.com): A Jekyll filter that truncates HTML while preserving markup structure.
- [Domain Name Filter by Lawrence Woodman](https://github.com/LawrenceWoodman/domain_name-liquid_filter): Filters the input text so that just the domain name is left.
- [Summarize Filter by Mathieu Arnold](https://gist.github.com/731597): Remove markup after a `<div id="extended">` tag.
- [URL encoding by James An](https://gist.github.com/919275): Percent encoding for URIs.
- [JSON Filter](https://gist.github.com/1850654) by [joelverhagen](https://github.com/joelverhagen): Filter that takes input text and outputs it as JSON. Great for rendering JavaScript.
- [i18n_filter](https://github.com/gacha/gacha.id.lv/blob/master/_plugins/i18n_filter.rb): Liquid filter to use I18n localization.
- [Smilify](https://github.com/SaswatPadhi/jekyll_smilify) by [SaswatPadhi](https://github.com/SaswatPadhi): Convert text emoticons in your content to themeable smiley pics ([Demo](http://saswatpadhi.github.com/)).
- [Read in X Minutes](https://gist.github.com/zachleat/5792681) by [zachleat](https://github.com/zachleat): Estimates the reading time of a string (for blog post content).
- [Jekyll-timeago](https://github.com/markets/jekyll-timeago): Converts a time value to the time ago in words.
- [pluralize](https://github.com/bdesham/pluralize): Easily combine a number and a word into a gramatically-correct amount like “1 minute” or “2 minute**s**”.
- [reading_time](https://github.com/bdesham/reading_time): Count words and estimate reading time for a piece of text, ignoring HTML elements that are unlikely to contain running text.
- [Table of Content Generator](https://github.com/dafi/jekyll-toc-generator): Generate the HTML code containing a table of content (TOC), the TOC can be customized in many way, for example you can decide which pages can be without TOC.
- [jekyll-humanize](https://github.com/23maverick23/jekyll-humanize): This is a port of the Django app humanize which adds a "human touch" to data. Each method represents a Fluid type filter that can be used in your Jekyll site templates. Given that Jekyll produces static sites, some of the original methods do not make logical sense to port (e.g. naturaltime).
-->

#### タグ

<!--original
#### Tags
-->

- [Asset Path Tag](https://github.com/samrayner/jekyll-asset-path-plugin) by [Sam Rayner](http://www.samrayner.com/): 与えられたファイルのpostまたはpageに対する相対パスを出力することで、アセットをサブディレクトリに整理できるようにする。
- [Delicious Plugin by Christian Hellsten](https://github.com/christianhellsten/jekyll-plugins): delicious.comからブックマークを取得しレンダリングする。
- [Ultraviolet Plugin by Steve Alex](https://gist.github.com/480380): [Ultraviolet](http://ultraviolet.rubyforge.org/)コードハイライターのためのJekyllタグ。
- [Tag Cloud Plugin by Ilkka Laukkanen](https://gist.github.com/710577): タグページにリンクしたタグクラウドを生成する。
- [GIT Tag by Alexandre Girard](https://gist.github.com/730347): リスト内にGitのアクティビティを追加する。
- [MathJax Liquid Tags by Jessy Cowan-Sharp](https://gist.github.com/834610): インラインおよびブロック引用の数式を、適切なMathJaxスクリプトタグに変換するJekyll用のシンプルなLiquidタグ。
- [Non-JS Gist Tag by Brandon Tilley](https://gist.github.com/1027674) Gistsを埋め込み、JavaScript非対応ブラウザおよびリーダー用にコードを表示するLiquidタグ。
- [Render Time Tag by Blake Smith](https://gist.github.com/449509): Jekyllのページが生成された時刻を表示する。
- [Status.net/OStatus Tag by phaer](https://gist.github.com/912466): 渡されたstatus.net/ostatusフィード内の通知を表示する。
- [Raw Tag by phaer](https://gist.github.com/1020852): `raw`タグ間のLiquidをテキストパースに対して維持する。
- [Embed.ly client by Robert Böhnke](https://github.com/robb/jekyll-embedly-client): oEmbedを使ってURLから添付物(embeds)を自動生成する。
- [Logarithmic Tag Cloud](https://gist.github.com/2290195): フレキシブルな対数分布。説明はコード内を参照。
- [oEmbed Tag by Tammo van Lessen](https://gist.github.com/1455726): oEmbed経由で(YouTube, Flickr, Slideshareなどから)簡単にコンテンツの埋め込みができるようにする。
- [FlickrSetTag by Thomas Mango](https://github.com/tsmango/jekyll_flickr_set_tag): Flickrのsetから画像ギャラリーを生成する。
- [Tweet Tag by Scott W. Bradley](https://github.com/scottwb/jekyll-tweet-tag): Twitterの短いコードを使った[ツイートをサイトに埋め込む(Embedded Tweets)](https://dev.twitter.com/docs/embedded-tweets)のためのLiquidタグ。
- [Jekyll-contentblocks](https://github.com/rustygeldmacher/jekyll-contentblocks): テンプレートでRails風のcontent_forタグを使えるようにして、コンテンツをpostからレイアウトに渡せるようにする。
- [Generate YouTube Embed](https://gist.github.com/1805814) by [joelverhagen](https://github.com/joelverhagen): YouTubeビデオをそのIDを使ってpageに埋め込めるようにするJekyllのプラグイン。オプションでwidthとheightのサイズを指定できる。 YouTube専用の“oEmbed Tag”。
- [Jekyll-beastiepress](https://github.com/okeeblow/jekyll-beastiepress): Jekyllサイト用FreeBSDユーティリティタグ。
- [Jsonball](https://gist.github.com/1895282): JSONファイルを読んで、Jekyllファイルで使う写像(maps)を生成する。
- [Bibjekyll](https://github.com/pablooliveira/bibjekyll): bibtex2htmlを使ってBibTeX形式の目録/postおよびpageに含まれる引用をレンダリングする。
- [Jekyll-citation](https://github.com/archome/jekyll-citation): BibTeX形式の目録/postおよびpageに含まれる引用をレンダリングする（100%Ruby）。
- [Jekyll Dribbble Set Tag](https://github.com/ericdfields/Jekyll-Dribbble-Set-Tag): 任意ユーザからのDribbble画像ギャラリーを構築する。
- [Debbugs](https://gist.github.com/2218470): Debian BTSへのリンクの投稿を簡単にできるようにする。
- [Refheap_tag](https://github.com/aburdette/refheap_tag): [refheap](https://refheap.com)からのコードスニペットの埋め込みを可能にするLiquidタグ。
- [Jekyll-devonly_tag](https://gist.github.com/2403522): 開発期間だけにマークアップを挿入するブロックタグ。
- [JekyllGalleryTag](https://github.com/redwallhp/JekyllGalleryTag) by [redwallhp](https://github.com/redwallhp): 画像ディレクトリからサムネイルを生成し、グリッド状に表示する。
- [Youku and Tudou Embed](https://gist.github.com/Yexiaoxing/5891929): YoukuおよびTudouビデオを埋め込むためのLiquidプラグイン。
- [Jekyll-swfobject](https://github.com/sectore/jekyll-swfobject): [SWFObject](http://code.google.com/p/swfobject/)を使ってAdobe Flashファイル(.swf)を埋め込むためのLiquidプラグイン。
- [Jekyll Picture Tag](https://github.com/robwierzbowski/jekyll-picture-tag): Jekyll用の簡易なレスポンシブ画像タグ。[`<picture>`](http://picture.responsiveimages.org/) 要素案に基づき、Scott Jehlの[Picturefill](https://github.com/scottjehl/picturefill)でポリフィルされている。
- [Jekyll Image Tag](https://github.com/robwierzbowski/jekyll-image-tag): Jekyll用の高機能画像タグ。画像プリセットの保存、リサイズ画像の生成、並びに、クラス、altテキストおよび他の属性の追加ができる。
- [Ditaa Tag](https://github.com/matze/jekyll-ditaa) by [matze](https://github.com/matze): ASCIIダイアグラムアートをPNGイメージにレンダリングし、画像タグを挿入する。
- [Good Include](https://github.com/penibelst/jekyll-good-include) by [Anatol Broder](http://penibelst.de/): includeされるファイルが処理される前に、その文末から改行と空白を除去する。
- [Jekyll Suggested Tweet](https://github.com/davidensinger/jekyll-suggested-tweet) by [David Ensinger](https://github.com/davidensinger/): TwitterのWeb Intents APIを経由してサジェストされたツイートを埋め込めるようにするJekyll用Liquidタグ。
- [Jekyll Date Chart](https://github.com/GSI/jekyll_date_chart) by [GSI](https://github.com/GSI): texttile形式のテーブルで日付ラインチャートをレンダリングするブロック。
- [Jekyll Image Encode](https://github.com/GSI/jekyll_image_encode) by [GSI](https://github.com/GSI): ウェブから取得した画像のbase64コードをレンダリングするタグ。
- [Jekyll Quick Man](https://github.com/GSI/jekyll_quick_man) by [GSI](https://github.com/GSI): インターネット上のmanページのソースへのちょっとしたリンクをレンダリングするタグ。
- [jekyll-font-awesome](https://gist.github.com/23maverick23/8532525): postにFont Awesomeのアイコンを簡単に追加する。
- [Lychee Gallery Tag](https://gist.github.com/tobru/9171700) by [tobru](https://github.com/tobru): postに[Lychee](http://lychee.electerious.com/)アルバムを挿入する。はじめに、[Jekyll meets Lychee - A Liquid Tag plugin](https://tobrunet.ch/articles/jekyll-meets-lychee-a-liquid-tag-plugin/)を参照のこと。

<!--original
- [Asset Path Tag](https://github.com/samrayner/jekyll-asset-path-plugin) by [Sam Rayner](http://www.samrayner.com/): Allows organisation of assets into subdirectories by outputting a path for a given file relative to the current post or page.
- [Delicious Plugin by Christian Hellsten](https://github.com/christianhellsten/jekyll-plugins): Fetches and renders bookmarks from delicious.com.
- [Ultraviolet Plugin by Steve Alex](https://gist.github.com/480380): Jekyll tag for the [Ultraviolet](http://ultraviolet.rubyforge.org/) code highligher.
- [Tag Cloud Plugin by Ilkka Laukkanen](https://gist.github.com/710577): Generate a tag cloud that links to tag pages.
- [GIT Tag by Alexandre Girard](https://gist.github.com/730347): Add Git activity inside a list.
- [MathJax Liquid Tags by Jessy Cowan-Sharp](https://gist.github.com/834610): Simple liquid tags for Jekyll that convert inline math and block equations to the appropriate MathJax script tags.
- [Non-JS Gist Tag by Brandon Tilley](https://gist.github.com/1027674) A Liquid tag that embeds Gists and shows code for non-JavaScript enabled browsers and readers.
- [Render Time Tag by Blake Smith](https://gist.github.com/449509): Displays the time a Jekyll page was generated.
- [Status.net/OStatus Tag by phaer](https://gist.github.com/912466): Displays the notices in a given status.net/ostatus feed.
- [Raw Tag by phaer](https://gist.github.com/1020852): Keeps liquid from parsing text betweeen `raw` tags.
- [Embed.ly client by Robert Böhnke](https://github.com/robb/jekyll-embedly-client): Autogenerate embeds from URLs using oEmbed.
- [Logarithmic Tag Cloud](https://gist.github.com/2290195): Flexible. Logarithmic distribution. Documentation inline.
- [oEmbed Tag by Tammo van Lessen](https://gist.github.com/1455726): Enables easy content embedding (e.g. from YouTube, Flickr, Slideshare) via oEmbed.
- [FlickrSetTag by Thomas Mango](https://github.com/tsmango/jekyll_flickr_set_tag): Generates image galleries from Flickr sets.
- [Tweet Tag by Scott W. Bradley](https://github.com/scottwb/jekyll-tweet-tag): Liquid tag for [Embedded Tweets](https://dev.twitter.com/docs/embedded-tweets) using Twitter’s shortcodes.
- [Jekyll-contentblocks](https://github.com/rustygeldmacher/jekyll-contentblocks): Lets you use Rails-like content_for tags in your templates, for passing content from your posts up to your layouts.
- [Generate YouTube Embed](https://gist.github.com/1805814) by [joelverhagen](https://github.com/joelverhagen): Jekyll plugin which allows you to embed a YouTube video in your page with the YouTube ID. Optionally specify width and height dimensions. Like “oEmbed Tag” but just for YouTube.
- [Jekyll-beastiepress](https://github.com/okeeblow/jekyll-beastiepress): FreeBSD utility tags for Jekyll sites.
- [Jsonball](https://gist.github.com/1895282): Reads json files and produces maps for use in Jekyll files.
- [Bibjekyll](https://github.com/pablooliveira/bibjekyll): Render BibTeX-formatted bibliographies/citations included in posts and pages using bibtex2html.
- [Jekyll-citation](https://github.com/archome/jekyll-citation): Render BibTeX-formatted bibliographies/citations included in posts and pages (pure Ruby).
- [Jekyll Dribbble Set Tag](https://github.com/ericdfields/Jekyll-Dribbble-Set-Tag): Builds Dribbble image galleries from any user.
- [Debbugs](https://gist.github.com/2218470): Allows posting links to Debian BTS easily.
- [Refheap_tag](https://github.com/aburdette/refheap_tag): Liquid tag that allows embedding pastes from [refheap](https://refheap.com).
- [Jekyll-devonly_tag](https://gist.github.com/2403522): A block tag for including markup only during development.
- [JekyllGalleryTag](https://github.com/redwallhp/JekyllGalleryTag) by [redwallhp](https://github.com/redwallhp): Generates thumbnails from a directory of images and displays them in a grid.
- [Youku and Tudou Embed](https://gist.github.com/Yexiaoxing/5891929): Liquid plugin for embedding Youku and Tudou videos.
- [Jekyll-swfobject](https://github.com/sectore/jekyll-swfobject): Liquid plugin for embedding Adobe Flash files (.swf) using [SWFObject](http://code.google.com/p/swfobject/).
- [Jekyll Picture Tag](https://github.com/robwierzbowski/jekyll-picture-tag): Easy responsive images for Jekyll. Based on the proposed [`<picture>`](http://picture.responsiveimages.org/) element, polyfilled with Scott Jehl’s [Picturefill](https://github.com/scottjehl/picturefill).
- [Jekyll Image Tag](https://github.com/robwierzbowski/jekyll-image-tag): Better images for Jekyll. Save image presets, generate resized images, and add classes, alt text, and other attributes.
- [Ditaa Tag](https://github.com/matze/jekyll-ditaa) by [matze](https://github.com/matze): Renders ASCII diagram art into PNG images and inserts a figure tag.
- [Good Include](https://github.com/penibelst/jekyll-good-include) by [Anatol Broder](http://penibelst.de/): Strips newlines and whitespaces from the end of include files before processing.
- [Jekyll Suggested Tweet](https://github.com/davidensinger/jekyll-suggested-tweet) by [David Ensinger](https://github.com/davidensinger/): A Liquid tag for Jekyll that allows for the embedding of suggested tweets via Twitter’s Web Intents API.
- [Jekyll Date Chart](https://github.com/GSI/jekyll_date_chart) by [GSI](https://github.com/GSI): Block that renders date line charts based on textile-formatted tables.
- [Jekyll Image Encode](https://github.com/GSI/jekyll_image_encode) by [GSI](https://github.com/GSI): Tag that renders base64 codes of images fetched from the web.
- [Jekyll Quick Man](https://github.com/GSI/jekyll_quick_man) by [GSI](https://github.com/GSI): Tag that renders pretty links to man page sources on the internet.
- [jekyll-font-awesome](https://gist.github.com/23maverick23/8532525): Quickly and easily add Font Awesome icons to your posts.
- [Lychee Gallery Tag](https://gist.github.com/tobru/9171700) by [tobru](https://github.com/tobru): Include [Lychee](http://lychee.electerious.com/) albums into a post. For an introduction, see [Jekyll meets Lychee - A Liquid Tag plugin](https://tobrunet.ch/articles/jekyll-meets-lychee-a-liquid-tag-plugin/)
-->

#### コレクション

<!--original
#### Collections
-->

- [Jekyll Plugins by Recursive Design](http://recursive-design.com/projects/jekyll-plugins/): GitHubのREADMEからプロジェクトページを生成するプラグイン、カテゴリページとサイトマップのジェネレータ。
- [Company website and blog plugins](https://github.com/flatterline/jekyll-plugins) by Flatterline, a [Ruby on Rails development company](http://flatterline.com/): ポートフォリオ/プロジェクトページのジェネレータ、チーム/個人ページのジェネレータ、postで使える著者略歴用のLiquidタグ、およびその他の小さなプラグイン群。
- [Jekyll plugins by Aucor](https://github.com/aucor/jekyll-plugins): 不要な改行/空白を除去するプラグインと、weight属性でページをソートするプラグイン。

<!--original
- [Jekyll Plugins by Recursive Design](http://recursive-design.com/projects/jekyll-plugins/): Plugins to generate Project pages from GitHub readmes, a Category page, and a Sitemap generator.
- [Company website and blog plugins](https://github.com/flatterline/jekyll-plugins) by Flatterline, a [Ruby on Rails development company](http://flatterline.com/): Portfolio/project page generator, team/individual page generator, an author bio liquid tag for use on posts, and a few other smaller plugins.
- [Jekyll plugins by Aucor](https://github.com/aucor/jekyll-plugins): Plugins for trimming unwanted newlines/whitespace and sorting pages by weight attribute.
-->

#### その他

<!--original
#### Other
-->

- [Pygments Cache Path by Raimonds Simanovskis](https://github.com/rsim/blog.rayapps.com/blob/master/_plugins/pygments_cache_patch.rb): Pygmentsでシンタックスハイライトされたコードをキャッシュするプラグイン。
- [Draft/Publish Plugin by Michael Ivey](https://gist.github.com/49630): ドラフトとしてpostを保存する。
- [Growl Notification Generator by Tate Johnson](https://gist.github.com/490101): GrowlにJekyllの通知を送る。
- [Growl Notification Hook by Tate Johnson](https://gist.github.com/525267): 上記の高機能な他の選択肢だが、Jekyllの“hook”のフォーク版が必要。
- [Related Posts by Lawrence Woodman](https://github.com/LawrenceWoodman/related_posts-jekyll_plugin): `site.related_posts`を上書きし、関係性を評価したカテゴリを使えるようにする。
- [Tiered Archives by Eli Naeher](https://gist.github.com/88cda643aa7e3b0ca1e5): 多段テンプレート変数を生成し、年および月ごとにアーカイブをグループ化できるようにする。
- [Jekyll-localization](https://github.com/blackwinter/jekyll-localization): レンダリングエンジンにローカライゼーション機能を追加するJekyllプラグイン。
- [Jekyll-rendering](https://github.com/blackwinter/jekyll-rendering): レンダリングエンジンの他の選択肢を提供するJekyllプラグイン。
- [Jekyll-pagination](https://github.com/blackwinter/jekyll-pagination): ページネーションジェネレータを拡張するJekyllプラグイン。
- [Jekyll-tagging](https://github.com/pattex/jekyll-tagging): タグクラウドおよびタグページを自動で生成するJekyllプラグイン。
- [Jekyll-scholar](https://github.com/inukshuk/jekyll-scholar): 学術研究向けブログのためのJekyll拡張。
- [Jekyll-asset_bundler](https://github.com/moshen/jekyll-asset_bundler): JavaScriptとCSSをバンドルしミニファイする。
- [Jekyll-assets](http://ixti.net/jekyll-assets/) by [ixti](https://github.com/ixti): Rails風アセットパイプライン(アセットをCoffeeScript, Sass, LESSなどで書いて、アセット内の簡単な宣言的コメントで自動バンドリングのための依存関係を指定し、ミニファイおよび圧縮を実行し、JSTテンプレートを使用し、キャッシュ消去(cache bust)をし、その他諸々をする)。
- [File compressor](https://gist.github.com/2758691) by [mytharcher](https://github.com/mytharcher): サイトのビルドにおいてHTMLおよびJavaScriptファイルを圧縮する。
- [Jekyll-minibundle](https://github.com/tkareine/jekyll-minibundle): アセットのバンドリングおよびキャッシュ消去(cache busting)を、指定の外部ミニファイツールを使って行う。他のGemに依存しない。
- [Singlepage-jekyll](https://github.com/JCB-K/singlepage-jekyll) by [JCB-K](https://github.com/JCB-K): Jekyllを動的な単一ページWebサイトに変える。
- [generator-jekyllrb](https://github.com/robwierzbowski/generator-jekyllrb): Jekyllを[Yeoman](http://yeoman.io/)でラップするジェネレータ。Yeomanは、最新のWebアプリを構築するためのツールセットおよびワークフローである。
- [grunt-jekyll](https://github.com/dannygarcia/grunt-jekyll): 文字通りのJekyll用[Grunt](http://gruntjs.com/)プラグイン。
- [jekyll-postfiles](https://github.com/indirect/jekyll-postfiles): `_postfiles`ディレクトリと{% raw %}`{{ postfile }}`{% endraw %}タグを追加し、postが参照するファイルが常にレポジトリの直ぐ近くにあるようにする。

<!--original
- [Pygments Cache Path by Raimonds Simanovskis](https://github.com/rsim/blog.rayapps.com/blob/master/_plugins/pygments_cache_patch.rb): Plugin to cache syntax-highlighted code from Pygments.
- [Draft/Publish Plugin by Michael Ivey](https://gist.github.com/49630): Save posts as drafts.
- [Growl Notification Generator by Tate Johnson](https://gist.github.com/490101): Send Jekyll notifications to Growl.
- [Growl Notification Hook by Tate Johnson](https://gist.github.com/525267): Better alternative to the above, but requires his “hook” fork.
- [Related Posts by Lawrence Woodman](https://github.com/LawrenceWoodman/related_posts-jekyll_plugin): Overrides `site.related_posts` to use categories to assess relationship.
- [Tiered Archives by Eli Naeher](https://gist.github.com/88cda643aa7e3b0ca1e5): Create tiered template variable that allows you to group archives by year and month.
- [Jekyll-localization](https://github.com/blackwinter/jekyll-localization): Jekyll plugin that adds localization features to the rendering engine.
- [Jekyll-rendering](https://github.com/blackwinter/jekyll-rendering): Jekyll plugin to provide alternative rendering engines.
- [Jekyll-pagination](https://github.com/blackwinter/jekyll-pagination): Jekyll plugin to extend the pagination generator.
- [Jekyll-tagging](https://github.com/pattex/jekyll-tagging): Jekyll plugin to automatically generate a tag cloud and tag pages.
- [Jekyll-scholar](https://github.com/inukshuk/jekyll-scholar): Jekyll extensions for the blogging scholar.
- [Jekyll-asset_bundler](https://github.com/moshen/jekyll-asset_bundler): Bundles and minifies JavaScript and CSS.
- [Jekyll-assets](http://ixti.net/jekyll-assets/) by [ixti](https://github.com/ixti): Rails-alike assets pipeline (write assets in CoffeeScript, Sass, LESS etc; specify dependencies for automatic bundling using simple declarative comments in assets; minify and compress; use JST templates; cache bust; and many-many more).
- [File compressor](https://gist.github.com/2758691) by [mytharcher](https://github.com/mytharcher): Compress HTML and JavaScript files on site build.
- [Jekyll-minibundle](https://github.com/tkareine/jekyll-minibundle): Asset bundling and cache busting using external minification tool of your choice. No gem dependencies.
- [Singlepage-jekyll](https://github.com/JCB-K/singlepage-jekyll) by [JCB-K](https://github.com/JCB-K): Turns Jekyll into a dynamic one-page website.
- [generator-jekyllrb](https://github.com/robwierzbowski/generator-jekyllrb): A generator that wraps Jekyll in [Yeoman](http://yeoman.io/), a tool collection and workflow for builing modern web apps.
- [grunt-jekyll](https://github.com/dannygarcia/grunt-jekyll): A straightforward [Grunt](http://gruntjs.com/) plugin for Jekyll.
- [jekyll-postfiles](https://github.com/indirect/jekyll-postfiles): Add `_postfiles` directory and {% raw %}`{{ postfile }}`{% endraw %} tag so the files a post refers to will always be right there inside your repo.
-->

#### エディタ

<!--original
#### Editors
-->

- [sublime-jekyll](https://github.com/23maverick23/sublime-jekyll): Jekyll静的サイトのためのSublimeテキストエディタパッケージ。本パッケージは、Jekyllサイトの生成を助け投稿を容易にするもので、これは、キーテンプレートタグおよびフィルタ、並びに、良く使う補完および現在のdate/datetimeコマンド(postの日付け決め用)へのアクセスを提供することで実現される。本パッケージは手作業でGitHubから、または[Package Control](https://sublime.wbond.net/packages/Jekyll)を通してインストールできる。
- [vim-jekyll](https://github.com/parkr/vim-jekyll): Vimから離れることなく新規投稿および`jekyll build`の起動を可能にするVimプラグイン。

<!--original
- [sublime-jekyll](https://github.com/23maverick23/sublime-jekyll): A Sublime Text package for Jekyll static sites. This package should help creating Jekyll sites and posts easier by providing access to key template tags and filters, as well as common completions and a current date/datetime command (for dating posts). You can install this package manually via GitHub, or via [Package Control](https://sublime.wbond.net/packages/Jekyll).
- [vim-jekyll](https://github.com/parkr/vim-jekyll): A vim plugin to generate
  new posts and run `jekyll build` all without leaving vim.
-->

<div class="note info">
  <h5>Jekyllプラグイン求む</h5>
  <p>
    このリストに追加したいJekyllプラグインがある場合は、<a href="../contributing/">貢献(contributing)ページを読んで</a>、そうする方法を調べてください。
  </p>
</div>

<!--original
<div class="note info">
  <h5>Jekyll Plugins Wanted</h5>
  <p>
    If you have a Jekyll plugin that you would like to see added to this list,
    you should <a href="../contributing/">read the contributing page</a> to find
    out how to make that happen.
  </p>
</div>
-->

