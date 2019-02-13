---
layout: docs
title: テンプレート
prev_section: migrations
next_section: permalinks
permalink: /docs/templates/
---

<!--original
---
layout: docs
title: Templates
prev_section: migrations
next_section: permalinks
permalink: /docs/templates/
---
-->

Jekyll はテンプレートを処理するために
[Liquid](http://wiki.shopify.com/Liquid) テンプレート言語を使用しています。
標準の Liquid [タグ](http://wiki.shopify.com/Logic) や
[フィルタ](http://wiki.shopify.com/Filters) はすべてサポートされています。
Jekyll は一般的なタスクをより簡単に所有するために、
いくつかの便利なフィルタやタグが追加されています。

<!--original
Jekyll uses the [Liquid](http://wiki.shopify.com/Liquid) templating language to
process templates. All of the standard Liquid [tags](http://wiki.shopify.com/Logic) and
[filters](http://wiki.shopify.com/Filters) are
supported. Jekyll even adds a few handy filters and tags of its own to make
common tasks easier.
-->

## フィルタ

<!--original
## Filters
-->

<div class="mobile-side-scroller">
<table>
  <thead>
    <tr>
      <th>記述</th>
      <th><span class="filter">フィルタ</span> と <span class="output">出力</span></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <p class='name'><strong>日付を XML スキーマに</strong></p>
        <p>日付を XML スキーマ(ISO 8601)形式に変換します。</p>
      </td>
      <td class='align-center'>
        <p>
         <code class='filter'>{% raw %}{{ site.time | date_to_xmlschema }}{% endraw %}</code>
        </p>
        <p>
          <code class='output'>2008-11-07T13:07:54-08:00</code>
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p class='name'><strong>日付を RFC-822 形式に</strong></p>
        <p>日付を RSS フィードで使用される RFC-822 形式に変換します。</p>
      </td>
      <td class='align-center'>
        <p>
         <code class='filter'>{% raw %}{{ site.time | date_to_rfc822 }}{% endraw %}</code>
        </p>
        <p>
          <code class='output'>Mon, 07 Nov 2008 13:07:54 -0800</code>
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p class='name'><strong>日付を文字列に</strong></p>
        <p>日付を短い文字列形式に変換します。</p>
      </td>
      <td class='align-center'>
        <p>
         <code class='filter'>{% raw %}{{ site.time | date_to_string }}{% endraw %}</code>
        </p>
        <p>
          <code class='output'>07 Nov 2008</code>
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p class='name'><strong>日付を長い文字列に</strong></p>
        <p>日付を長い文字列形式に変換します。</p>
      </td>
      <td class='align-center'>
        <p>
         <code class='filter'>{% raw %}{{ site.time | date_to_long_string }}{% endraw %}</code>
        </p>
        <p>
          <code class='output'>07 November 2008</code>
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p class='name'><strong>XML エスケープ</strong></p>
        <p>XML で使用するためのいくつかのテキストをエスケープします。</p>
      </td>
      <td class='align-center'>
        <p>
         <code class='filter'>{% raw %}{{ page.content | xml_escape }}{% endraw %}</code>
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p class='name'><strong>CGI エスケープ</strong></p>
        <p>
          CGI エスケープは URL で使用される文字列をエスケープします。
          適切な %XX との交換で任意の特殊文字を置き換えます。
        </p>
      </td>
      <td class='align-center'>
        <p>
         <code class='filter'>{% raw %}{{ “foo,bar;baz?” | cgi_escape }}{% endraw %}</code>
        </p>
        <p>
          <code class='output'>foo%2Cbar%3Bbaz%3F</code>
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p class='name'><strong>URI エスケープ</strong></p>
        <p>
          URI エスケープします。
        </p>
      </td>
      <td class='align-center'>
        <p>
         <code class='filter'>{% raw %}{{ “'foo, bar \\baz?'” | uri_escape }}{% endraw %}</code>
        </p>
        <p>
          <code class='output'>foo,%20bar%20%5Cbaz?</code>
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p class='name'><strong>ワード数</strong></p>
        <p>テキスト内のワード数をカウントします。</p>
      </td>
      <td class='align-center'>
        <p>
         <code class='filter'>{% raw %}{{ page.content | number_of_words }}{% endraw %}</code>
        </p>
        <p>
          <code class='output'>1337</code>
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p class='name'><strong>文を配列</strong></p>
        <p>文を配列に変換します。タグのリストを表示するのに役立ちます。</p>
      </td>
      <td class='align-center'>
        <p>
         <code class='filter'>{% raw %}{{ page.tags | array_to_sentence_string }}{% endraw %}</code>
        </p>
        <p>
          <code class='output'>foo, bar, and baz</code>
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p class='name'><strong>Textile 化</strong></p>
        <p>RedCloth を経由で作成された Textile フォーマット文字列を HTML に変換します。</p>
      </td>
      <td class='align-center'>
        <p>
         <code class='filter'>{% raw %}{{ page.excerpt | textilize }}{% endraw %}</code>
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p class='name'><strong>Markdown 化</strong></p>
        <p>Markdown フォーマット文字列を HTML に変換します。</p>
      </td>
      <td class='align-center'>
        <p>
         <code class='filter'>{% raw %}{{ page.excerpt | markdownify }}{% endraw %}</code>
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p class='name'><strong>JSON 用のデータ</strong></p>
        <p>ハッシュや配列を JSON に変換します。</p>
      </td>
      <td class='align-center'>
        <p>
         <code class='filter'>{% raw %}{{ site.data.projects | jsonify }}{% endraw %}</code>
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
      <th>Description</th>
      <th><span class="filter">Filter</span> and <span class="output">Output</span></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <p class='name'><strong>Date to XML Schema</strong></p>
        <p>Convert a Date into XML Schema (ISO 8601) format.</p>
      </td>
      <td class='align-center'>
        <p>
         <code class='filter'>{% raw %}{{ site.time | date_to_xmlschema }}{% endraw %}</code>
        </p>
        <p>
          <code class='output'>2008-11-07T13:07:54-08:00</code>
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p class='name'><strong>Date to RFC-822 Format</strong></p>
        <p>Convert a Date into the RFC-822 format used for RSS feeds.</p>
      </td>
      <td class='align-center'>
        <p>
         <code class='filter'>{% raw %}{{ site.time | date_to_rfc822 }}{% endraw %}</code>
        </p>
        <p>
          <code class='output'>Mon, 07 Nov 2008 13:07:54 -0800</code>
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p class='name'><strong>Date to String</strong></p>
        <p>Convert a date to short format.</p>
      </td>
      <td class='align-center'>
        <p>
         <code class='filter'>{% raw %}{{ site.time | date_to_string }}{% endraw %}</code>
        </p>
        <p>
          <code class='output'>07 Nov 2008</code>
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p class='name'><strong>Date to Long String</strong></p>
        <p>Format a date to long format.</p>
      </td>
      <td class='align-center'>
        <p>
         <code class='filter'>{% raw %}{{ site.time | date_to_long_string }}{% endraw %}</code>
        </p>
        <p>
          <code class='output'>07 November 2008</code>
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p class='name'><strong>XML Escape</strong></p>
        <p>Escape some text for use in XML.</p>
      </td>
      <td class='align-center'>
        <p>
         <code class='filter'>{% raw %}{{ page.content | xml_escape }}{% endraw %}</code>
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p class='name'><strong>CGI Escape</strong></p>
        <p>
          CGI escape a string for use in a URL. Replaces any special characters
          with appropriate %XX replacements.
        </p>
      </td>
      <td class='align-center'>
        <p>
         <code class='filter'>{% raw %}{{ “foo,bar;baz?” | cgi_escape }}{% endraw %}</code>
        </p>
        <p>
          <code class='output'>foo%2Cbar%3Bbaz%3F</code>
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p class='name'><strong>URI Escape</strong></p>
        <p>
          URI escape a string.
        </p>
      </td>
      <td class='align-center'>
        <p>
         <code class='filter'>{% raw %}{{ “'foo, bar \\baz?'” | uri_escape }}{% endraw %}</code>
        </p>
        <p>
          <code class='output'>foo,%20bar%20%5Cbaz?</code>
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p class='name'><strong>Number of Words</strong></p>
        <p>Count the number of words in some text.</p>
      </td>
      <td class='align-center'>
        <p>
         <code class='filter'>{% raw %}{{ page.content | number_of_words }}{% endraw %}</code>
        </p>
        <p>
          <code class='output'>1337</code>
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p class='name'><strong>Array to Sentence</strong></p>
        <p>Convert an array into a sentence. Useful for listing tags.</p>
      </td>
      <td class='align-center'>
        <p>
         <code class='filter'>{% raw %}{{ page.tags | array_to_sentence_string }}{% endraw %}</code>
        </p>
        <p>
          <code class='output'>foo, bar, and baz</code>
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p class='name'><strong>Textilize</strong></p>
        <p>Convert a Textile-formatted string into HTML, formatted via RedCloth</p>
      </td>
      <td class='align-center'>
        <p>
         <code class='filter'>{% raw %}{{ page.excerpt | textilize }}{% endraw %}</code>
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p class='name'><strong>Markdownify</strong></p>
        <p>Convert a Markdown-formatted string into HTML.</p>
      </td>
      <td class='align-center'>
        <p>
         <code class='filter'>{% raw %}{{ page.excerpt | markdownify }}{% endraw %}</code>
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p class='name'><strong>Data To JSON</strong></p>
        <p>Convert Hash or Array to JSON.</p>
      </td>
      <td class='align-center'>
        <p>
         <code class='filter'>{% raw %}{{ site.data.projects | jsonify }}{% endraw %}</code>
        </p>
      </td>
    </tr>
  </tbody>
</table>
</div>
-->

## タグ

<!--original
## Tags
-->

### Includes

<!--original
### Includes
-->

もしあなたが小さなページの断片を持つなら、
`include` タグを使用することで、サイト上の複数の場所に含めることができます。

<!--original
If you have small page fragments that you wish to include in multiple places on
your site, you can use the `include` tag.
-->

{% highlight ruby %}
{% raw %}{% include footer.html %}{% endraw %}
{% endhighlight %}

<!--original
{% highlight ruby %}
{% raw %}{% include footer.html %}{% endraw %}
{% endhighlight %}
-->

Jekyll はすべてのインクルードファイルがソースディレクトリのルートの
`_includes` ディレクトリに配置されることを期待します。
上記は `<source>/_includes/footer.html` の内容が呼び出し元のファイルに埋め込まれます。

<!--original
Jekyll expects all include files to be placed in an `_includes` directory at the
root of your source directory. This will embed the contents of
`<source>/_includes/footer.html` into the calling file.
-->

<div class="note">
  <h5>ProTip™: ファイル名として変数を使用する</h5>
  <p>

    あなたが埋め込みたいファイル名は、(上記の例のように)リテラルを指定できます。
    また、 <code>{% raw %}{% include {{ my_variable }} %}{% endraw %}</code> のように
    liquid のような変数構文を使用して変数を使用することができます。

  </p>
</div>

<!--original
<div class="note">
  <h5>ProTip™: Use variables as file name</h5>
  <p>

    The name of the file you wish to embed can be literal (as in the example above),
    or you can use a variable, using liquid-like variable syntax as in
    <code>{% raw %}{% include {{ my_variable }} %}{% endraw %}</code>.

  </p>
</div>
-->

また、 include にパラメータを渡すこともできます:

<!--original
You can also pass parameters to an include:
-->

{% highlight ruby %}
{% raw %}{% include footer.html param="value" %}{% endraw %}
{% endhighlight %}

<!--original
{% highlight ruby %}
{% raw %}{% include footer.html param="value" %}{% endraw %}
{% endhighlight %}
-->

これらのパラメータは include 内の Liquid 経由で利用可能です。

<!--original
These parameters are available via Liquid in the include:
-->

{% highlight ruby %}
{% raw %}{{ include.param }}{% endraw %}
{% endhighlight %}

<!--original
{% highlight ruby %}
{% raw %}{{ include.param }}{% endraw %}
{% endhighlight %}
-->

### コードのハイライト化

<!--original
### Code snippet highlighting
-->

Jekyll は Pygments のおかげで [100 以上の言語](http://pygments.org/languages/)の
シンタックスハイライトサポートが組み込まれています。
[Pygments](http://pygments.org/) を使うためには、あなたのシステムに Python をインストールし、
サイトの設定ファイルの `highlighter` に `pygments` を設定する必要があります。

<!--original
Jekyll has built in support for syntax highlighting of [over 100
languages](http://pygments.org/languages/) thanks to
[Pygments](http://pygments.org/). To use Pygments, you must have Python installed
on your system and set `highlighter` to `pygments` in your site's configuration
file.
-->

または、コードハイライトに [Rouge](https://github.com/jayferd/rouge) を使うことができます。
それは Pygments のようにたくさんの言語をサポートしていませんが、
ほとんどのケースには対応していて、ピュア Ruby で書かれています ; あなたのシステムで Python を
必要としません！

<!--original
Alternatively, you can use [Rouge](https://github.com/jayferd/rouge) to highlight
your code snippets. It doesn't support as many languages as Pygments does but
it should fit in most cases and it's written in pure Ruby ; you don't need Python
on your system!
-->

シンタックスハイライトのコードブロックをレンダリングするためには、次のようにコードを囲みます。

<!--original
To render a code block with syntax highlighting, surround your code as follows:
-->

{% highlight text %}
{% raw %}
{% highlight ruby %}
def foo
  puts 'foo'
end
{% endhighlight %}
{% endraw %}
{% endhighlight %}

<!--original
{% highlight text %}
{% raw %}
{% highlight ruby %}
def foo
  puts 'foo'
end
{% endhighlight %}
{% endraw %}
{% endhighlight %}
-->

highlight タグの引数は言語識別子です。(上記の例では Ruby です)
適切な識別子を使用すると、 [Pygments' Lexers page](http://pygments.org/docs/lexers/) または
[Rouge wiki](https://github.com/jayferd/rouge/wiki/List-of-supported-languages-and-lexers) 上の
"short name" からハイライトしたい言語を探します。

<!--original
The argument to the `highlight` tag (`ruby` in the example above) is the
language identifier. To find the appropriate identifier to use for the language
you want to highlight, look for the “short name” on the [Pygments' Lexers
page](http://pygments.org/docs/lexers/) or the [Rouge
wiki](https://github.com/jayferd/rouge/wiki/List-of-supported-languages-and-lexers).
-->

#### 行番号

<!--original
#### Line numbers
-->

`highlight` タグの第 2 引数に `linenos` と呼ばれるオプションがあります。
`linenos` 引数を含めるとハイライトされたコードに行番号を含めることを強制します。
例えば、次のコードブロックは行ごとに行番号が含まれます:

<!--original
There is a second argument to `highlight` called `linenos` that is optional.
Including the `linenos` argument will force the highlighted code to include line
numbers. For instance, the following code block would include line numbers next
to each line:
-->

<!--original
{% highlight text %}
{% raw %}
{% highlight ruby linenos %}
def foo
  puts 'foo'
end
{% endhighlight %}
{% endraw %}
{% endhighlight %}
-->

#### シンタックスハイライトのためのスタイルシート

<!--original
#### Stylesheets for syntax highlighting
-->

表示するまでにハイライトするには、ハイライトスタイルシートを含める必要があります。
[syntax.css](http://github.com/mojombo/tpw/tree/master/css/syntax.css) でスタイルシートの例を見ることができます。
同一のスタイルが GitHub によって使用されており、あなたが自分のサイトのために自由に使用することができます。
もし `linenos` を使っているなら、ハイライトされたコードから行番号を区別するため `syntax.css` 内に `.lineno` 定義を
追加することをお勧めします。

<!--original
In order for the highlighting to show up, you’ll need to include a highlighting
stylesheet. For an example stylesheet you can look at
[syntax.css](http://github.com/mojombo/tpw/tree/master/css/syntax.css). These
are the same styles as used by GitHub and you are free to use them for your own
site. If you use `linenos`, you might want to include an additional CSS class
definition for the `.lineno` class in `syntax.css` to distinguish the line
numbers from the highlighted code.
-->

### Post の URL

<!--original
### Post URL
-->

もし、あなたのサイト上に Post のリンクを含めたいと思ったら、
`post_url` タグが指定した Post の正しいパーマリンクの URL を生成します。

<!--original
If you would like to include a link to a post on your site, the `post_url` tag
will generate the correct permalink URL for the post you specify.
-->

{% highlight text %}
{% raw %}
{% post_url 2010-07-21-name-of-post %}
{% endraw %}
{% endhighlight %}

<!--original
{% highlight text %}
{% raw %}
{% post_url 2010-07-21-name-of-post %}
{% endraw %}
{% endhighlight %}
-->

もし、サブディレクトリ内に Post を整理したなら、Post のサブディレクトリパスを含める必要があります。

<!--original
If you organize your posts in subdirectories, you need to include subdirectory
path to the post:
-->

{% highlight text %}
{% raw %}
{% post_url /subdir/2010-07-21-name-of-post %}
{% endraw %}
{% endhighlight %}

<!--original
{% highlight text %}
{% raw %}
{% post_url /subdir/2010-07-21-name-of-post %}
{% endraw %}
{% endhighlight %}
-->

`post_url` タグを使用するときは、ファイル拡張子を含める必要ありません。

<!--original
There is no need to include the file extension when using the `post_url` tag.
-->

また、以下のような Markdown 内で Post リンクを作成するためにこのタグを使用することもできます。

<!--original
You can also use this tag to create a link to a post in Markdown as follows:
-->

{% highlight text %}
{% raw %}
[Name of Link]({% post_url 2010-07-21-name-of-post %})
{% endraw %}
{% endhighlight %}

<!--original
{% highlight text %}
{% raw %}
[Name of Link]({% post_url 2010-07-21-name-of-post %})
{% endraw %}
{% endhighlight %}
-->

### Gist

<!--original
### Gist
-->

GitHub Gist をあなたのサイトに簡単に埋め込むために `gist` タグを使用します。

<!--original
Use the `gist` tag to easily embed a GitHub Gist onto your site:
-->

{% highlight text %}
{% raw %}
{% gist 5555251 %}
{% endraw %}
{% endhighlight %}

<!--original
{% highlight text %}
{% raw %}
{% gist 5555251 %}
{% endraw %}
{% endhighlight %}
-->

また、オプションで gist を表示するためにファイル名を指定することができます:

<!--original
You may also optionally specify the filename in the gist to display:
-->

{% highlight text %}
{% raw %}
{% gist 5555251 result.md %}
{% endraw %}
{% endhighlight %}

<!--original
{% highlight text %}
{% raw %}
{% gist 5555251 result.md %}
{% endraw %}
{% endhighlight %}
-->

`gist` タグはプライベート gist にも働きますが、 gist 所有者の GitHub ユーザ名が必須です:

<!--original
The `gist` tag also works with private gists, which require the gist owner's
github username:
-->

{% highlight text %}
{% raw %}
{% gist parkr/931c1c8d465a04042403 %}
{% endraw %}
{% endhighlight %}

<!--original
{% highlight text %}
{% raw %}
{% gist parkr/931c1c8d465a04042403 %}
{% endraw %}
{% endhighlight %}
-->

プライベート gist のシンタックスもファイル名でサポートしています。

<!--original
The private gist syntax also supports filenames.
-->
