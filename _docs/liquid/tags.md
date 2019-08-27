---
title: タグフィルタ
permalink: "/docs/liquid/tags/"
---
<!-- ---
title: Tags Filters
permalink: "/docs/liquid/tags/"
--- -->

標準のLiquid[タグ](https://shopify.github.io/liquid/tags/control-flow/){:target="_blank"}は全てサポートされています。Jekyllはサイト構築のためにいくつかの組み込みタグを用意しています。また、あなた自身のタグを[プラグイン]({{ "/docs/plugins/" | relative_url }})を使用して作成することもできます。

<!-- All of the standard Liquid
[tags](https://shopify.github.io/liquid/tags/control-flow/) are supported.
Jekyll has a few built in tags to help you build your site. You can also create
your own tags using [plugins](/docs/plugins/). -->

## Includes

サイトに渡り、繰り返すページ構文がある場合は、[include]({{ "/docs/includes/" | relative_url }})は管理面からもよい方法です。

<!-- If you have page snippets that you use repeatedly across your site, an
[include](/docs/includes/) is the perfect way to make this more maintainable. -->

## コードの構文ハイライト
<!-- ## Code snippet highlighting -->

Jekyllは[Rouge](http://rouge.jneen.net){:target="_blank"}のおかげで100言語以上のシンタックスハイライトを組み込みサポートしています。RougeはJekyll 3以上のデフォルトのハイライターです。

<!-- Jekyll has built in support for syntax highlighting of over 100 languages
thanks to [Rouge](http://rouge.jneen.net). Rouge is the default highlighter
in Jekyll 3 and above.  -->

<div class="note warning">
  <p>Pygmentsの使用は推奨されず、Jekyll 4ではサポートされていません。<code>highlighter: pygments</code>の設定は、Pygmentsのスタイルシートと100%互換のRubyで書かれた<em>Rouge</em>の使用に、自動的に変更されます。
  </p>
  <!-- <p>Using Pygments has been deprecated and is not supported in
  Jekyll 4, the configuration setting <code>highlighter: pygments</code>
  now automatically falls back to using <em>Rouge</em> which is written in Ruby
  and 100% compatible with stylesheets for Pygments.</p> -->
</div>

コードブロックのシンタックスハイライトのレンダリングは、以下のようにコードを囲みます。

<!-- To render a code block with syntax highlighting, surround your code as follows: -->

{% raw %}
```liquid
{% highlight ruby %}
def foo
  puts 'foo'
end
{% endhighlight %}
```
{% endraw %}

`highlight`タグの引数（上記の例では`ruby`）は言語の識別子です。ハイライトしたい言語の適切な識別子は[Rouge
wiki](https://github.com/jayferd/rouge/wiki/List-of-supported-languages-and-lexers){:target="_blank"}から“short name”を探してください。

<!-- The argument to the `highlight` tag (`ruby` in the example above) is the
language identifier. To find the appropriate identifier to use for the language
you want to highlight, look for the “short name” on the [Rouge
wiki](https://github.com/jayferd/rouge/wiki/List-of-supported-languages-and-lexers). -->

<div class="note">
  <h5>Jekyllはコードブロックに全てのLiquidフィルタを適用します</h5>
  <!-- <h5>Jekyll processes all Liquid filters in code blocks</h5> -->
  <p>使用する言語に中括弧がある場合、<code>{&#37; raw &#37;}</code>と<code>{&#37; endraw &#37;}</code>でコードを囲む必要があります。{% include docs_version_badge.html version="4.0" %}以降、front matterに<code>render_with_liquid: false</code>を追加することで、特定のドキュメントに対してLiquidを完全に無効にできます。</p>
    <!-- <p>If you are using a language that contains curly braces, you
      will likely need to place <code>{&#37; raw &#37;}</code> and
      <code>{&#37; endraw &#37;}</code> tags around your code.
      Since {% include docs_version_badge.html version="4.0" %} you can add <code>render_with_liquid: false</code> in your front matter to disable Liquid entirely for a particular document.</p> -->
</div>

### 行番号
<!-- ### Line numbers -->

`linenos`という`highlight`の2番目の引数はオプションです。`linenos`引数を含む場合、ハイライトコードは強制的に行番号を含みます。例えば、以下のコードブロックは各行に行番号が振られます。

<!-- There is a second argument to `highlight` called `linenos` that is optional.
Including the `linenos` argument will force the highlighted code to include line
numbers. For instance, the following code block would include line numbers next
to each line: -->

{% raw %}
```liquid
{% highlight ruby linenos %}
def foo
  puts 'foo'
end
{% endhighlight %}
```
{% endraw %}

### シンタックスハイライトのスタイルシート
<!-- ### Stylesheets for syntax highlighting -->

ハイライトを表示するために、ハイライトのスタイルシートを含める必要があります。PygmentsやRougeには、Pygmentsのスタイルシートを使用でき、[こちら](https://jwarby.github.io/jekyll-pygments-themes/languages/ruby.html){:target="_blank"}のギャラリーや[そのリポジトリ](https://github.com/jwarby/jekyll-pygments-themes)で見つけることができます。

<!-- In order for the highlighting to show up, you’ll need to include a highlighting
stylesheet. For Pygments or Rouge you can use a stylesheet for Pygments, you
can find an example gallery
[here](https://jwarby.github.io/jekyll-pygments-themes/languages/ruby.html)
or from [its repository](https://github.com/jwarby/jekyll-pygments-themes).-->

あなたのcssディレクトリにCSSファイル(例えば、`native.css`)をコピーし、シンタックスハイライトのスタイルを`main.css`にインポートします。

<!--Copy the CSS file (`native.css` for example) into your css directory and import
the syntax highlighter styles into your `main.css`:-->

```css
@import "native.css";
```

## リンク
<!-- ## Links -->

{: .note }
Jekyll {% include docs_version_badge.html version="v4.0"%}以降、`link`や`post_url`タグの前に`site.baseurl`を使用する必要がなくなりました。

<!-- {: .note }
Since Jekyll {% include docs_version_badge.html version="v4.0"%} you don't need to prepend `link` and `post_url` tags with `site.baseurl` -->

### ページのリンク {#link}
<!-- ### Linking to pages {#link} -->

ポストやページ、コレクションアイテム、ファイルへのリンクは`link`タグで指定したパスへのパーマリンクURLを取得生成します。例えば、`mypage.html`へのリンクに`link`タグを使用した場合、パーマリンクのスタイルを拡張子を含むよう・含まないよう変更したとしても、`link`タグで作成したURLは常に有効です。

<!-- To link to a post, a page, collection item, or file, the `link` tag will generate the correct permalink URL for the path you specify. For example, if you use the `link` tag to link to `mypage.html`, even if you change your permalink style to include the file extension or omit it, the URL formed by the `link` tag will always be valid. -->

`link`タグを使用するときは、ファイルの元々の拡張子を含めなければなりません。以下にいくつか例を示します。

<!-- You must include the file's original extension when using the `link` tag. Here are some examples: -->

{% raw %}
```liquid
{% link _collection/name-of-document.md %}
{% link _posts/2016-07-26-name-of-post.md %}
{% link news/index.html %}
{% link /assets/files/doc.pdf %}
```
{% endraw %}

以下のように、Markdownのリンク作成にも`link`タグを使用できます。

<!-- You can also use the `link` tag to create a link in Markdown as follows: -->

{% raw %}
```liquid
[Link to a document]({% link _collection/name-of-document.md %})
[Link to a post]({% link _posts/2016-07-26-name-of-post.md %})
[Link to a page]({% link news/index.html %})
[Link to a file]({% link /assets/files/doc.pdf %})
```
{% endraw %}

ポストやページ、コレクションへのパスは、（設定ファイルのある）rootディレクトリからの相対パスで定義されます。既存のページから他のページへのパスではありません。

<!-- The path to the post, page, or collection is defined as the path relative to the root directory (where your config file is) to the file, not the path from your existing page to the other page. -->

例えば、（`pages/folder1/folder2`にある）`page_a.md`で、（`pages/folder1`にある）`page_b.md`へのリンクを作成しているとします。パスは`../page_b.html`ではありません。代わりに、`/pages/folder1/page_b.md`を使用します。

<!-- For example, suppose you're creating a link in `page_a.md` (stored in `pages/folder1/folder2`) to `page_b.md` (stored in  `pages/folder1`). Your path in the link would not be `../page_b.html`. Instead, it would be `/pages/folder1/page_b.md`. -->

パスが分からない場合、ページに`{% raw %}{{ page.path }}{% endraw %}`を追加し、パスを表示します。

<!-- If you're unsure of the path, add `{% raw %}{{ page.path }}{% endraw %}` to the page and it will display the path. -->

`link`または` post_url`タグを使用することの一つの大きな利点はリンク検証です。リンクが存在しない場合、Jekyllはあなたのサイトを構築しません。リンクが壊れていることを警告するので、（リンクが壊れたサイトを構築し公開するのではなく）修正することができます。

<!-- One major benefit of using the `link` or `post_url` tag is link validation. If the link doesn't exist, Jekyll won't build your site. This is a good thing, as it will alert you to a broken link so you can fix it (rather than allowing you to build and deploy a site with broken links). -->

`link`タグにフィルタは追加できませんので注意してください。例えば、`{% raw %}{% link mypage.html | append: "#section1" %} {% endraw %}`のようにLiquidフィルタで文字列を追加することはできません。ページのセクションへのリンクは、通常のHTMlやMarkdownのリンク方法を使用する必要があります。

<!-- Note you cannot add filters to `link` tags. For example, you cannot append a string using Liquid filters, such as `{% raw %}{% link mypage.html | append: "#section1" %} {% endraw %}`. To link to sections on a page, you will need to use regular HTML or Markdown linking techniques. -->

### ポストへのリンク
<!-- ### Linking to posts -->

サイトのポストへのリンクを行いたい場合、`post_url`タグで指定したポストへのリンクを取得生成できます。

<!-- If you want to include a link to a post on your site, the `post_url` tag will generate the correct permalink URL for the post you specify. -->

{% raw %}
```liquid
{% post_url 2010-07-21-name-of-post %}
```
{% endraw %}

ポストをサブディレクトリに整理している場合は、ポストへのパスにサブディレクトリを含めます。

<!-- If you organize your posts in subdirectories, you need to include subdirectory path to the post: -->

{% raw %}
```liquid
{% post_url /subdir/2010-07-21-name-of-post %}
```
{% endraw %}

`post_url`タグを使用するときは、ファイルの拡張子を含める必要はありません。

<!-- There is no need to include the file extension when using the `post_url` tag. -->

以下のようにMarkdownでのポストへのリンク作成でも、このタグを使用できます。

<!-- You can also use this tag to create a link to a post in Markdown as follows: -->

{% raw %}
```liquid
[Name of Link]({% post_url 2010-07-21-name-of-post %})
```
{% endraw %}
