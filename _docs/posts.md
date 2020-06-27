---
title: Posts（ポスト）
permalink: /docs/posts/
redirect_from:
  - /docs/drafts/
---

<!-- ---
title: Posts
permalink: /docs/posts/
redirect_from:
  - /docs/drafts/
--- -->

ブログはJekyllに組み込まれています。あなたがブログポストをテキストファイルで書き、Jekyllがそれをブログにします。

<!-- Blogging is baked into Jekyll. You write blog posts as text files and Jekyll
provides everything you need to turn it into a blog. -->

## ポストフォルダ
<!-- ## The Posts Folder -->

`_posts`フォルダがブログポストを入れるフォルダです。ポストを書くのには、[Markdown](https://daringfireball.net/projects/markdown/){:target="_blank"}、HTMLどちらもサポートしています。

<!-- The `_posts` folder is where your blog posts live. You typically write posts
in [Markdown](https://daringfireball.net/projects/markdown/), HTML is
also supported. -->

## ポストを作る
<!-- ## Creating Posts -->

ポストを作るには、`_posts`ディレクトリに以下のフォーマットでファイルを追加します。

<!-- To create a post, add a file to your `_posts` directory with the following
format: -->

```
YEAR-MONTH-DAY-title.MARKUP
```

`YEAR`は4桁を、`MONTH`と`DAY`は2桁を使用します。`MARKUP`はファイルで使用している形式を表す拡張子です。  
以下に有効なファイル名の例を示します。

<!-- Where `YEAR` is a four-digit number, `MONTH` and `DAY` are both two-digit
numbers, and `MARKUP` is the file extension representing the format used in the
file. For example, the following are examples of valid post filenames: -->

```
2011-12-31-new-years-eve-is-awesome.md
2012-09-12-how-to-write-a-blog.md
```

全てのブログポスト用ファイルは[front matter]({{ "docs/front-matter/" | relative_url }})で開始します。通常ここには使用する[レイアウト]({{ "docs/layouts/" | relative_url }})やその他メタデータを記述します。  
シンプルな例として、何も書かないも可能です。

<!-- All blog post files must begin with [front matter](/docs/front-matter/) which is
typically used to set a [layout](/docs/layouts/) or other meta data. For a simple
example this can just be empty: -->

```markdown
---
layout: post
title:  "Welcome to Jekyll!"
---

# Welcome

**Hello world**, this is my first Jekyll blog post.

I hope you like it!
```

<div class="note">
  <h5>ProTip™: 他のポストへのリンク</h5>
  <!-- <h5>ProTip™: Link to other posts</h5> -->
  <p>
    <a href="{{ "/docs/liquid/tags/#linking-to-posts" | relative_url }}"><code>post_url</code></a>タグを使用することで、パーマリンクの形式を変更したときにURLが壊れる心配なく、他のポストへリンクできます。
  </p>
  <!-- <p>
    Use the <a href="/docs/liquid/tags/#linking-to-posts"><code>post_url</code></a>
    tag to link to other posts without having to worry about the URLs
    breaking when the site permalink style changes.
  </p> -->
</div>



<div class="note info">
  <h5>文字コードに注意してください</h5>
  <!-- <h5>Be aware of character sets</h5> -->
  <p>
    コンテンツプロセッサはより美しく見せるために、特定の文字を変更できます。例えば、Redcarpetの<code>smart</code> extensionは、標準のASCII引用符をUnicodeの中括弧に変換します。ブラウザがこれらの文字を正しく表示するために、レイアウトの<code>&lt;head&gt;</code>に<code>&lt;meta charset=&quot;utf-8&quot;&gt;</code>の文字コード定義メタタグを入れてください。
  </p>
  <!-- <p>
    Content processors can modify certain characters to make them look nicer.
    For example, the <code>smart</code> extension in Redcarpet converts standard,
    ASCII quotation characters to curly, Unicode ones. In order for the browser
    to display those characters properly, define the charset meta value by
    including <code>&lt;meta charset=&quot;utf-8&quot;&gt;</code> in the
    <code>&lt;head&gt;</code> of your layout.
  </p> -->
</div>

## イメージやリソースを含める
<!-- ## Including images and resources -->

いくつかのポイントとして、テキストコンテンツに画像やダウンロード、その他デジタルファイルを入れたくなるでしょう。一般的な方法として、プロジェクトディレクトリのrootフォルダに`assets`のようなイメージや他のリソースを入れておくためのフォルダを作ります。そうすれば、どのようなポストでもサイトのrootパスから挿入するアイテムへのリンクを使用することができます。実行するには、サイトの（サブ）ドメインとパスの構成により方法が異なりますが、シンプルなMarkdownの例を示します。

<!-- At some point, you'll want to include images, downloads, or other
digital assets along with your text content. One common solution is to create
a folder in the root of the project directory called something like `assets`,
into which any images, files or other resources are placed. Then, from within
any post, they can be linked to using the site’s root as the path for the asset
to include. The best way to do this depends on the way your site’s (sub)domain
and path are configured, but here are some simple examples in Markdown: -->

ポストに画像を入れる：

<!-- Including an image asset in a post: -->

```markdown
... which is shown in the screenshot below:
![My helpful screenshot](/assets/screenshot.jpg)
```

読者がダウンロードするためのPDFリンク：

<!-- Linking to a PDF for readers to download: -->

```markdown
... you can [get the PDF](/assets/mydoc.pdf) directly.
```

## ポストのインデックスを表示する
<!-- ## Displaying an index of posts -->

他のページにポストのインデックスを作るのは、[Liquid](https://docs.shopify.com/themes/liquid/basics){:target="_blank"}とそのタグのおかげで簡単です。  
ここに、ブログポストへのリンクのリストを作り方のシンプルな例を示します。

<!-- Creating an index of posts on another page should be easy thanks to
[Liquid](https://docs.shopify.com/themes/liquid/basics) and its tags. Here’s a
simple example of how to create a list of links to your blog posts: -->

{% raw %}
```liquid
<ul>
  {% for post in site.posts %}
    <li>
      <a href="{{ post.url }}">{{ post.title }}</a>
    </li>
  {% endfor %}
</ul>
```
{% endraw %}

ポストをどのように（どこで）表示するか、サイトの構成をどのようにするかは、全てコントロールできます。もっと知りたい場合、Jekillの[テンプレートの働き方]({{ "docs/templates/" | relative_url }})を更に読むべきです。

<!-- You have full control over how (and where) you display your posts,
and how you structure your site. You should read more about [how templates
work](/docs/templates/) with Jekyll if you want to know more. -->

`post`が上記の`for`ループ内にのみ存在することに注意してください。変換対象のポストやページの変数（`for`ループの中にあるポストやページの変数）にアクセスしたいときは、代わりに`page`変数を使用してください。

<!-- Note that the `post` variable only exists inside the `for` loop above. If
you wish to access the currently-rendering page/posts's variables (the
variables of the post/page that has the `for` loop in it), use the `page`
variable instead. -->

## タグとカテゴリ
<!-- ## Tags and Categories -->

Jekyllはブログポストの*タグ*と*カテゴリ*をサポートしています。

<!-- Jekyll has first class support for *tags* and *categories* in blog posts. -->

### タグ
<!-- ### Tags -->

ポストのタグは一つだけなら`tag`、複数なら`tags`キーを利用してfront matterで指定します。  
Jekyllは`tags`に複数指定されていれば、自動で空白で*区切り*ます。例えば、`tag: classic hollywood`という指定であればタグは単一の`"classic hollywood"`として処理され、`tags: classic hollywood`の場合は`["classic", "hollywood"]`という配列として処理されます。

<!-- Tags for a post are defined in the post's front matter using either the key
`tag` for a single entry or `tags` for multiple entries. <br/> Since Jekyll
expects multiple items mapped to the key `tags`, it will automatically *split*
a string entry if it contains whitespace. For example, while front matter
`tag: classic hollywood` will be processed into a singular entity
`"classic hollywood"`, front matter `tags: classic hollywood` will be processed
into an array of entries `["classic", "hollywood"]`. -->

front matterで選択したキーにかかわらず、JekyllはLiquidテンプレートで参照できる複数形のキーとしてマップしメタデータに保存します。

<!-- Irrespective of the front matter key chosen, Jekyll stores the metadata mapped
to the plural key which is exposed to Liquid templates. -->

全てのタグはLiquidテンプレートでは`site.tags`で参照できます。ページ上で、`site.tags`からは異なる二つのアイテムが得られます。一つ目のアイテムはタグの名前で、二つ目はそのタグを持つ*ホストの配列*です。

<!-- All tags registered in the current site are exposed to Liquid templates via
`site.tags`. Iterating over `site.tags` on a page will yield another array with
two items, where the first item is the name of the tag and the second item being
*an array of posts* with that tag. -->

{% raw %}
```liquid
{% for tag in site.tags %}
  <h3>{{ tag[0] }}</h3>
  <ul>
    {% for post in tag[1] %}
      <li><a href="{{ post.url }}">{{ post.title }}</a></li>
    {% endfor %}
  </ul>
{% endfor %}
```
{% endraw %}

### カテゴリ
<!-- ### Categories -->

ポストのカテゴリは上述のタグと同様の働きをします:
  * front matterの`category`や`categories`キーで指定します。（タグと同じロジックに従います）
  * サイトに登録された全てのカテゴリは（上述のタグのforループと同様に）繰り返し処理可能な`site.categories`変数としてLiquidテンプレートに提供されます。

<!-- Categories of a post work similar to the tags above:
  * They can be defined via the front matter using keys `category` or
    `categories` (that follow the same logic as for tags)
  * All categories registered in the site are exposed to Liquid templates via
    `site.categories` which can be iterated over (similar to the loop for tags
    above.) -->

*ただし、カテゴリとタグの類似性はこれで終わりです。*

<!-- *The similarity between categories and tags however, ends there.* -->

タグとは異なり、カテゴリはポストのファイルパスで指定することも可能です。  
`_post`内のディレクトリはカテゴリとして扱われます。例えば、ポストのパスが`movies/horror/_posts/2019-05-21-bride-of-chucky.markdown`なら、自動で`movies`と`horror`がそのポストのカテゴリとなります。

<!-- Unlike tags, categories for posts can also be defined by a post's file path.
Any directory above `_post` will be read-in as a category. For example,
if a post is at path `movies/horror/_posts/2019-05-21-bride-of-chucky.markdown`,
then `movies` and `horror` are automatically registered as categories for that
post. -->

投稿にもカテゴリを定義するfront matterがある場合、パスで指定されたものでなければ、既存のリストに追加されます。

<!-- When the post also has front matter defining categories, they just get added to
the existing list if not present already. -->

カテゴリとタグの特徴的な違いは、投稿のカテゴリが投稿の[生成されたURL]('/docs/permalinks/#global')に組み込むことが可能ですが、タグはできません。

<!-- The hallmark difference between categories and tags is that categories of a post
may be incorporated into [the generated URL]('/docs/permalinks/#global') for the
post, while tags cannot be. -->

front matterで`category: classic hollywood`と`categories: classic hollywood`と指定する場合は挙動が異なります。この例では前者は`movies/horror/classic%20hollywood/2019/05/21/bride-of-chucky.html`に、後者は`movies/horror/classic/hollywood/2019/05/21/bride-of-chucky.html`となります。

<!-- Therefore, depending on whether front matter has `category: classic hollywood`,
or `categories: classic hollywood`, the example post above would have the URL as
either
`movies/horror/classic%20hollywood/2019/05/21/bride-of-chucky.html` or
`movies/horror/classic/hollywood/2019/05/21/bride-of-chucky.html` respectively. -->

## ポストの抜粋
<!-- ## Post excerpts -->

ポストで`excerpt`変数を使用することで、抜粋にアクセスすることができます。デフォルトはポストの最初の段落ですが、front matterや`_config.yml`で`excerpt_separator`を設定することでカスタマイズできます。

<!-- You can access a snippet of a posts's content by using `excerpt` variable on a
post. By default this is the first paragraph of content in the post, however it
can be customized by setting a `excerpt_separator` variable in front matter or
`_config.yml`. -->

```markdown
---
excerpt_separator: <!--more-->
---

Excerpt with multiple paragraphs

Here's another paragraph in the excerpt.
<!--more-->
Out-of-excerpt
```

抜粋付きのブログポストのリストを出力する例です：

<!-- Here's an example of outputting a list of blog posts with an excerpt: -->

{% raw %}
```liquid
<ul>
  {% for post in site.posts %}
    <li>
      <a href="{{ post.url }}">{{ post.title }}</a>
      {{ post.excerpt }}
    </li>
  {% endfor %}
</ul>
```
{% endraw %}

## <span id="drafts"></span>ドラフト
<!-- ## Drafts -->

ドラフトは、ファイル名に日付を含まないポストです。作業中で、まだ公開したくないポストです。ドラフトを立ち上げるには、サイトのrootに`_drafts`フォルダを作り、最初のドラフトを作成してください。

<!-- Drafts are posts without a date in the filename. They're posts you're still
working on and don't want to publish yet. To get up and running with drafts,
create a `_drafts` folder in your site's root and create your first draft: -->

```text
.
├── _drafts
│   └── a-draft-post.md
...
```

ドラフトを含むプレビューは、`jekyll serve`や`jekyll build`の実行時に`--drafts`スイッチをつけてください。ドラフトファイルの日付が割り当てられるため、現在編集中のドラフトは最新のポストとして表示されます。

<!-- To preview your site with drafts, run `jekyll serve` or `jekyll build`
with the `--drafts` switch. Each will be assigned the value modification time
of the draft file for its date, and thus you will see currently edited drafts
as the latest posts. -->
