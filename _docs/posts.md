---
layout: docs
title: Post を書く
prev_section: frontmatter
next_section: drafts
permalink: /docs/posts/
base_revision: 0fbdc6944041147c2d21b306751b078860b6603b[refs/heads/master]
---

<!--original
---
layout: docs
title: Writing posts
prev_section: frontmatter
next_section: drafts
permalink: /docs/posts/
---
-->

Jekyll の最高の側面の一つは、それが “Blog のようである” ということです。
これはまさに何を意味するのでしょうか？
まあ、簡単に言えば、それはブログは Jekyll の機能に焼成されることを意味しています。
もし、Post を書き、そしてそれらをオンラインで公開する場合、
これはあなたがブログの公開と維持をコンピュータ上のテキストファイルで
フォルダ管理をすることによって単純にできることを意味します。
データベースの設定と管理の手間や Web ベースの CMS システムと比較して、
これは喜ばしい変化になります！

<!--original
One of Jekyll’s best aspects is that it is “blog aware”. What does this mean,
exactly? Well, simply put, it means that blogging is baked into Jekyll’s
functionality. If you write articles and publish them online, this means that
you can publish and maintain a blog simply by managing a folder of text-files on
your computer. Compared to the hassle of configuring and maintaining databases
and web-based CMS systems, this will be a welcome change!
-->

## Post のフォルダ

<!--original
## The Posts Folder
-->

[ディレクトリ構成](../structure/) ページで説明した通り、
`_posts` フォルダはあなたのブログの Post がある場所です。
これらのファイルは
[Markdown](http://daringfireball.net/projects/markdown/) や
[Textile](http://redcloth.org/textile) フォーマットのテキストファイルの
どちらでも書くことができ、そしてそれらが
[YAML front-matter](../frontmatter/) を持っている限り、
これらのソースフォーマットから静的サイトの一部として HTML ページに変換されます。

<!--original
As explained on the [directory structure](../structure/) page, the `_posts`
folder is where your blog posts will live. These files can be either
[Markdown](http://daringfireball.net/projects/markdown/) or
[Textile](http://redcloth.org/textile) formatted text files, and as long as
they have [YAML front-matter](../frontmatter/), they will be converted from their
source format into an HTML page that is part of your static site.
-->

### Post ファイルを作成する

<!--original
### Creating Post Files
-->

新しい Post を作成するために、あなたが行う必要があることは、
`_posts` ディレクトリに新しいファイルを作成することです。
このフォルダ内のファイルにどのように名前をつけるかが重要になります。
Jekyll は以下のようなフォーマットによって命名されたブログの Post ファイルが必要です:

<!--original
To create a new post, all you need to do is create a new file in the `_posts`
directory. How you name files in this folder is important. Jekyll requires blog
post files to be named according to the following format:
-->

{% highlight bash %}
YEAR-MONTH-DAY-title.MARKUP
{% endhighlight %}

<!--original
{% highlight bash %}
YEAR-MONTH-DAY-title.MARKUP
{% endhighlight %}
-->

`YEAR` は 4 桁の数字、 `MONTH` と `DAY` は両方とも 2 桁の数字、
そして `MARKUP` はファイルで使用されるフォーマットを表すファイル拡張子です。
例えば、以下は有効な Post のファイル名の例になります:

<!--original
Where `YEAR` is a four-digit number, `MONTH` and `DAY` are both two-digit
numbers, and `MARKUP` is the file extension representing the format used in the
file. For example, the following are examples of valid post filenames:
-->

{% highlight bash %}
2011-12-31-new-years-eve-is-awesome.md
2012-09-12-how-to-write-a-blog.textile
{% endhighlight %}

<!--original
{% highlight bash %}
2011-12-31-new-years-eve-is-awesome.md
2012-09-12-how-to-write-a-blog.textile
{% endhighlight %}
-->

<div class="note">
  <h5>ProTip™: 別のポストへのリンク</h5>
  <p>
    <a href="../templates#post-url"><code>post_url</code></a> タグを使って
    別のポストにリンクをすることにより、サイトのパーマリンクの変更時のURL変更を
    気にしなくて済みます。
  </p>
</div>

<!--original
<div class="note">
  <h5>ProTip™: Link to other posts</h5>
  <p>
    Use the <a href="../templates#post-url"><code>post_url</code></a>
    tag to link to other posts without having to worry about the URL's
    breaking when the site permalink style changes.
  </p>
</div>
-->

### コンテンツのフォーマット

<!--original
### Content Formats
-->

すべてのブログ Post は [YAML front-matter](../frontmatter/) ではじまるべきです。
後は、あなたが好むフォーマットを決定するだけです。
Jekyll は 2 つの人気のあるマークアップフォーマットをサポートしています:
[Markdown](http://daringfireball.net/projects/markdown/) と
[Textile](http://redcloth.org/textile) です。
これらのフォーマットはそれぞれ
Post のコンテンツの異なるタイプをマークアップする独自の方法を持っているため、
あなたは自分のニーズにもっとも適したものを決定し、それらのフォーマットに慣れるべきです。

<!--original
All blog post files must begin with [YAML front-matter](../frontmatter/). After
that, it's simply a matter of deciding which format you prefer. Jekyll supports
two popular content markup formats:
[Markdown](http://daringfireball.net/projects/markdown/) and
[Textile](http://redcloth.org/textile). These formats each have their own way
of marking up different types of content within a post, so you should
familiarize yourself with these formats and decide which one best suits your
needs.
-->

<div class="note info">
  <h5>文字セットに注意してください</h5>
  <p>
    コンテンツプロセッサは、それらをよりよく見せるために、
    特定の文字を変更することができます。
    例えば、 Redcarpet 内の <code>smart</code> 拡張子は
    ASCII のクォーテーション文字を Unicode のものに通常変換します。
    ブラウザにそれらの文字を適切に表示するためには、
    layout ファイルの <code>&lt;head&gt;</code> 内に
    <code>&lt;meta charset=&quot;utf-8&quot;&gt;</code> を含むことによって
    文字セットのメタ値を定義します。
  </p>
</div>

<!--original
<div class="note info">
  <h5>Be aware of character sets</h5>
  <p>
    Content processors can modify certain characters to make them look nicer.
    For example, the <code>smart</code> extension in Redcarpet converts standard,
    ASCII quotation characters to curly, Unicode ones. In order for the browser
    to display those characters properly, define the charset meta value by
    including <code>&lt;meta charset=&quot;utf-8&quot;&gt;</code> in the
    <code>&lt;head&gt;</code> of your layout.
  </p>
</div>
-->

## 画像やリソースを含める

<!--original
## Including images and resources
-->

あなたが画像、ダウンロードや他のデジタル資産を
テキストのコンテンツに沿って含めるチャンスです。
これらのリソースにリンクするための構文は Markdown と Textile の間で異なり、
あなたのサイトにこれらのファイルを格納することの動作の問題は誰もが直面するものです。

<!--original
Chances are, at some point, you'll want to include images, downloads, or other
digital assets along with your text content. While the syntax for linking to
these resources differs between Markdown and Textile, the problem of working out
where to store these files in your site is something everyone will face.
-->

なぜなら Jekyll の柔軟性は、これらを行うための方法に
たくさんのソリューションがあるからです。
一つの一般的なソリューションは、任意の画像、
ダウンロードや他のリソースを配置した `assets` や `downloads` のように
呼ばれるディレクトリをプロジェクトのルートに作成することです。
その後、任意の Post の中からそれらは資産を含めたパスとして
サイトのルートを使用してリンクすることができます。
繰り返しますが、これはあなたのサイトの(サブ)ドメインとパスの設定方法に依存しますが、
ここであなたが Post の `site.url` 変数を使用してこれを行う方法の
いくつかの(Markdown での)例を示します。

<!--original
Because of Jekyll’s flexibility, there are many solutions to how to do this. One
common solution is to create a folder in the root of the project directory
called something like `assets` or `downloads`, into which any images, downloads
or other resources are placed. Then, from within any post, they can be linked to
using the site’s root as the path for the asset to include. Again, this will
depend on the way your site’s (sub)domain and path are configured, but here some
examples (in Markdown) of how you could do this using the `site.url` variable in
a post.
-->

Post 内に画像資産を含めます:

<!--original
Including an image asset in a post:
-->

{% highlight text %}
… 以下にスクリーンショットが表示されます:
![私の有用なスクリーンショット]({% raw %}{{ site.url }}{% endraw %}/assets/screenshot.jpg)
{% endhighlight %}

<!--original
{% highlight text %}
… which is shown in the screenshot below:
![My helpful screenshot]({% raw %}{{ site.url }}{% endraw %}/assets/screenshot.jpg)
{% endhighlight %}
-->

読者がダウンロードするための PDF へのリンクを貼ります:

<!--original
Linking to a PDF for readers to download:
-->

{% highlight text %}
… あなたはそのまま [PDFをダウンロードできます]({% raw %}{{ site.url }}{% endraw %}/assets/mydoc.pdf) 。
{% endhighlight %}

<!--original
{% highlight text %}
… you can [get the PDF]({% raw %}{{ site.url }}{% endraw %}/assets/mydoc.pdf) directly.
{% endhighlight %}
-->

<div class="note">
  <h5>ProTip™: 単にサイトのルート URL を使用してリンクする</h5>
  <p>
    もしあなたのサイトが今までドメインのルート URL で表示していたならば、
    <code>{% raw %}{{ site.url }}{% endraw %}</code> 変数をスキップすることができます。
    この場合、あなたは単に <code>/path/file.jpg</code> とすれば、
    資産を直接参照することができます。
  </p>
</div>

<!--original
<div class="note">
  <h5>ProTip™: Link using just the site root URL</h5>
  <p>
    You can skip the <code>{% raw %}{{ site.url }}{% endraw %}</code> variable
    if you <strong>know</strong> your site will only ever be displayed at the
    root URL of your domain. In this case you can reference assets directly with
    just <code>/path/file.jpg</code>.
  </p>
</div>
-->

## Post の index を表示する

<!--original
## Displaying an index of posts
-->

それは、フォルダ内で持っている Post がすべて順調でよいですが、
あなたがどこかで Post のリストを持っていない限りブログはそれを使用しません。
別のページ(または[テンプレート](../templates/)内)上の Post の index を作成するのは
簡単で、それは [Liquid template language](http://wiki.shopify.com/Liquid) と
そのタグのおかげと思っています。
これはあなたのブログの Post へのリンクのリストを作成する方法の基本的な例です:

<!--original
It’s all well and good to have posts in a folder, but a blog is no use unless
you have a list of posts somewhere. Creating an index of posts on another page
(or in a [template](../templates/)) is easy, thanks to the [Liquid template
language](http://wiki.shopify.com/Liquid) and its tags. Here’s a basic example of how
to create a list of links to your blog posts:
-->

{% highlight html %}
<ul>
  {% raw %}{% for post in site.posts %}{% endraw %}
    <li>
      <a href="{% raw %}{{ post.url }}{% endraw %}">{% raw %}{{ post.title }}{% endraw %}</a>
    </li>
  {% raw %}{% endfor %}{% endraw %}
</ul>
{% endhighlight %}

<!--original
{% highlight html %}
<ul>
  {% raw %}{% for post in site.posts %}{% endraw %}
    <li>
      <a href="{% raw %}{{ post.url }}{% endraw %}">{% raw %}{{ post.title }}{% endraw %}</a>
    </li>
  {% raw %}{% endfor %}{% endraw %}
</ul>
{% endhighlight %}
-->

もちろん、あなたは Post を表示する方法(と場所)や、
サイトを構築する方法を完全に制御することができます。
もし、さらに知りたい場合は、 Jekyll とともに
[テンプレートがどのように働くか](../templates/)について詳細を読むべきです。

<!--original
Of course, you have full control over how (and where) you display your posts,
and how you structure your site. You should read more about [how templates
work](../templates/) with Jekyll if you want to know more.
-->

## Post の抜粋

<!--original
## Post excerpts
-->

各々の Post は自動的に excerpt_separator の最初に発生するコンテンツの先頭から
文書のはじめのブロックが取られ、そして post.excerpt として設定されます。
上記の Post の index の例です。
多分、あなたは各々の Post のはじめの段落を追加することよって Post の
内容について少しヒント含めたいのです:

<!--original
Each post automatically takes the first block of text, from the beginning of the content
to the first occurrence of `excerpt_separator`, and sets it as the `post.excerpt`.
Take the above example of an index of posts. Perhaps you want to include
a little hint about the post's content by adding the first paragraph of each of your
posts:
-->

{% highlight html %}
<ul>
  {% raw %}{% for post in site.posts %}{% endraw %}
    <li>
      <a href="{% raw %}{{ post.url }}{% endraw %}">{% raw %}{{ post.title }}{% endraw %}</a>
      {% raw %}{{ post.excerpt }}{% endraw %}
    </li>
  {% raw %}{% endfor %}{% endraw %}
</ul>
{% endhighlight %}

<!--original
{% highlight html %}
<ul>
  {% raw %}{% for post in site.posts %}{% endraw %}
    <li>
      <a href="{% raw %}{{ post.url }}{% endraw %}">{% raw %}{{ post.title }}{% endraw %}</a>
      {% raw %}{{ post.excerpt }}{% endraw %}
    </li>
  {% raw %}{% endfor %}{% endraw %}
</ul>
{% endhighlight %}
-->

Jekyll はあなたのために既にはじめの段落を掴んでくれているので、
抜粋を `p` タグでラップする必要はありません。
あなたが好むなら、これらのタグは以下のように消すことができます:

<!--original
Because Jekyll grabs the first paragraph you will not need to wrap the excerpt in `p` tags,
which is already done for you. These tags can be removed with the following if you'd prefer:
-->

{% highlight html %}
{% raw %}{{ post.excerpt | remove: '<p>' | remove: '</p>' }}{% endraw %}
{% endhighlight %}

<!--original
{% highlight html %}
{% raw %}{{ post.excerpt | remove: '<p>' | remove: '</p>' }}{% endraw %}
{% endhighlight %}
-->

もし、あなたが自動的に生成された Post の抜粋を好まないなら、
Post の YAML ｆront-matter に `excerpt` を追加することによって上書きすることができます。
`excerpt_separator` に `""` を設定することによって、完全にそれを無効にします。

<!--original
If you don't like the automatically-generated post excerpt, it can be overridden by adding
`excerpt` to your post's YAML front-matter. Completely disable it by setting
your `excerpt_separator` to `""`.
-->

また、 Liquid タグによって生成された任意の出力も同様に、任意の html タグを
出力の中から削除するために `| strip_html` フラグを渡すことができます。
これはもし、あなたが `meta="description"` タグを Post の `head` として Post の抜粋を
出力するか、またはどこか他の内容の html タグ に沿って持つことを希望するなら、
望ましくないが特に有効です。

<!--original
Also, as with any output generated by Liquid tags, you can pass the `| strip_html` flag to remove any html tags in the output. This is particularly helpful if you wish to output a post excerpt as a `meta="description"` tag within the post `head`, or anywhere else having html tags along with the content is not desirable.
-->

## コードスニペットのハイライト化

<!--original
## Highlighting code snippets
-->

Jekyll もまた Pygments か Rouge を使用したコードスニペットの
シンタックスハイライトサポートが組み込まれているため、
任意の Post 内にコードスニペットを含めることは簡単です。
ちょうど、次のように専用の Liquid タグを使用します。

<!--original
Jekyll also has built-in support for syntax highlighting of code snippets using
either Pygments or Rouge, and including a code snippet in any post is easy. Just
use the dedicated Liquid tag as follows:
-->

{% highlight text %}
{% raw %}{% highlight ruby %}{% endraw %}
def show
  @widget = Widget(params[:id])
  respond_to do |format|
    format.html # show.html.erb
    format.json { render json: @widget }
  end
end
{% raw %}{% endhighlight %}{% endraw %}
{% endhighlight %}

<!--original
{% highlight text %}
{% raw %}{% highlight ruby %}{% endraw %}
def show
  @widget = Widget(params[:id])
  respond_to do |format|
    format.html # show.html.erb
    format.json { render json: @widget }
  end
end
{% raw %}{% endhighlight %}{% endraw %}
{% endhighlight %}
-->

そして、出力はこのようになります:

<!--original
And the output will look like this:
-->

{% highlight ruby %}
def show
  @widget = Widget(params[:id])
  respond_to do |format|
    format.html # show.html.erb
    format.json { render json: @widget }
  end
end
{% endhighlight %}

<!--original
{% highlight ruby %}
def show
  @widget = Widget(params[:id])
  respond_to do |format|
    format.html # show.html.erb
    format.json { render json: @widget }
  end
end
{% endhighlight %}
-->

<div class="note">
  <h5>ProTip™: 行番号を表示する</h5>
  <p>
    あなたは、このように highlight 開始タグの終端に <code>linenos</code> を
    加えることによってコードスニペットに行番号を含めることができます:
    <code>{% raw %}{% highlight ruby linenos %}{% endraw %}</code>。
  </p>
</div>

<!--original
<div class="note">
  <h5>ProTip™: Show line numbers</h5>
  <p>
    You can make code snippets include line-numbers by adding the word
    <code>linenos</code> to the end of the opening highlight tag like this:
    <code>{% raw %}{% highlight ruby linenos %}{% endraw %}</code>.
  </p>
</div>
-->

これらの基本情報は、あなたがはじめの Post を書き始めるのに十分でなければなりません。
あなたがそれ以外の情報を掘り下げる準備が可能になったとき、
あなたの Post やあなたのサイトの他の場所で
[Postのパーマリンクをカスタマイズする](../permalinks/)ことや、
[カスタム変数](../variables/)を使用するようなことに興味がわいているかもしれません。

<!--original
These basics should be enough to get you started writing your first posts. When
you’re ready to dig into what else is possible, you might be interested in doing
things like [customizing post permalinks](../permalinks/) or using [custom
variables](../variables/) in your posts and elsewhere on your site.
-->
