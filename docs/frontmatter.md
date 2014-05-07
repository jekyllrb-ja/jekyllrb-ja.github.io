---
layout: docs
title: Front-matter
prev_section: configuration
next_section: posts
permalink: /docs/frontmatter/
---

<!--original
---
layout: docs
title: Front-matter
prev_section: configuration
next_section: posts
permalink: /docs/frontmatter/
---
-->

Front-matter は、本当にクールに Jekyll を開始します。
[YAML](http://yaml.org/) front matter ブロックを含む任意のファイルは Jekyll に特別なファイルとして処理されます。
front matter はファイルの最初になければならず、 トリプルダッシュの間に正しい YAML フォームをセットする必要があります。
基本的な例はこうです:

<!--original
The front-matter is where Jekyll starts to get really cool. Any file that
contains a [YAML](http://yaml.org/) front matter block will be processed by
Jekyll as a special file. The front matter must be the first thing in the file
and must take the form of valid YAML set between triple-dashed lines. Here is a
basic example:
-->

{% highlight yaml %}
---
layout: post
title: Blogging Like a Hacker
---
{% endhighlight %}

<!--original
{% highlight yaml %}
---
layout: post
title: Blogging Like a Hacker
---
{% endhighlight %}
-->

これらの トリプルダッシュの間には、定義済の変数をセット(以下を参照)したり、
あなた自身のカスタム変数を作成することができます。
これらの変数は、問題の page や post が依存している任意の layouts や includes ファイルの
両方のさらに下に Liquid タグを使用してのアクセスに利用することができます。

<!--original
Between these triple-dashed lines, you can set predefined variables (see below
for a reference) or even create custom ones of your own. These variables will
then be available to you to access using Liquid tags both further down in the
file and also in any layouts or includes that the page or post in question
relies on.
-->

<div class="note warning">
  <h5>UTF-8 キャラクタエンコーディング警告</h5>
  <p>
    もし、 UTF-8 エンコーディングを使用している場合、 <code>BOM</code> ヘッダの
    文字がファイルに存在するかどうか、またはとてもとても悪い何かが Jekyll に起こるか
    どうか確認してください。
    これは、 Windows 上で Jekyll を実行している場合、特に関連します。
  </p>
</div>

<!--original
<div class="note warning">
  <h5>UTF-8 Character Encoding Warning</h5>
  <p>
    If you use UTF-8 encoding, make sure that no <code>BOM</code> header
    characters exist in your files or very, very bad things will happen to
    Jekyll. This is especially relevant if you’re running Jekyll on Windows.
  </p>
</div>
-->

<div class="note">
  <h5>ProTip™: Front Matter 変数は任意です</h5>
  <p>
    <a href="../variables/">Liquid タグや変数</a>を使用したいが、 front-matter には
    何も必要でない場合、ただそれを空で残してください！
    トリプルダッシュの間に何もないセットは、 Jekyll はファイルを処理するために取得します。
    (これは、 CSS や RSS フィード のようなものに役立ちます！)
  </p>
</div>

<!--original
<div class="note">
  <h5>ProTip™: Front Matter Variables Are Optional</h5>
  <p>
    If you want to use <a href="../variables/">Liquid tags and variables</a> but
    don’t need anything in your front-matter, just leave it empty! The set of
    triple-dashed lines with nothing in between will still get Jekyll to process
    your file. (This is useful for things like CSS and RSS feeds!)
  </p>
</div>
-->


## 事前に定義されたグローバル変数

<!--original
## Predefined Global Variables
-->

あなたが page や post の front-matter でセットできる、
事前に定義されたグローバル変数がいくつかあります。

<!--original
There are a number of predefined global variables that you can set in the
front-matter of a page or post.
-->

<div class="mobile-side-scroller">
<table>
  <thead>
    <tr>
      <th>変数</th>
      <th>記述</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <p><code>layout</code></p>
      </td>
      <td>
        <p>

          使用されるレイアウトファイルを指定します。
          ファイル拡張子なしでレイアウトファイル名を使用してください。
          レイアウトファイルは <code>_layouts</code> ディレクトリに配置する必要があります。

        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>permalink</code></p>
      </td>
      <td>
        <p>

          ブログ post の URL をデフォルト <code>/year/month/day/title.html</code> 以外の
          何かにする必要がある場合、あなたはこの変数をセットすることができ、そして
          それが最終的な URL として使用されます。

        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>published</code></p>
      </td>
      <td>
        <p>
          サイトを生成したとき、特定の post を表示させたくない場合、false をセットします。
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p style="margin-bottom: 5px;"><code>category</code></p>
        <p><code>categories</code></p>
      </td>
      <td>
        <p>

          フォルダの内部に posts を配置する代わりに、
          post が属している 1 つまたはそれ以上のカテゴリを指定することができます。
          サイトが生成される時、 post は通常、これらのカテゴリに
          セットされていたかのように振る舞います。
          カテゴリ(複数キー)は、<a href="http://en.wikipedia.org/wiki/YAML#Lists">YAML list</a>
          または、スペースで分けられた文字列として指定されます。

        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>tags</code></p>
      </td>
      <td>
        <p>

          カテゴリや、 1 つのタグや複数タグと同じように post に追加することができます。
          タグもカテゴリのように YAML list または、スペースで分けられた文字列として指定されます。

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
      <th>Variable</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <p><code>layout</code></p>
      </td>
      <td>
        <p>

          If set, this specifies the layout file to use. Use the layout file
          name without the file extension. Layout files must be placed in the
          <code>_layouts</code> directory.

        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>permalink</code></p>
      </td>
      <td>
        <p>

          If you need your processed blog post URLs to be something other than
          the default <code>/year/month/day/title.html</code> then you can set
          this variable and it will be used as the final URL.

        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>published</code></p>
      </td>
      <td>
        <p>
          Set to false if you don’t want a specific post to show up when the
          site is generated.
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p style="margin-bottom: 5px;"><code>category</code></p>
        <p><code>categories</code></p>
      </td>
      <td>
        <p>

          Instead of placing posts inside of folders, you can specify one or
          more categories that the post belongs to. When the site is generated
          the post will act as though it had been set with these categories
          normally. Categories (plural key) can be specified as a <a
          href="http://en.wikipedia.org/wiki/YAML#Lists">YAML list</a> or a
          space-separated string.

        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>tags</code></p>
      </td>
      <td>
        <p>

          Similar to categories, one or multiple tags can be added to a post.
          Also like categories, tags can be specified as a YAML list or a space-
          separated string.

        </p>
      </td>
    </tr>
  </tbody>
</table>
</div>
-->


## カスタム変数

<!--original
## Custom Variables
-->

事前に定義されていない front matter 内の変数は
変換中にLiquid テンプレートエンジンに送られ、データの中に混ぜられます。
タイトルを設定した場合、あなたはページタイトルをセットするために、
あなたのレイアウト内で使用することができます。

<!--original
Any variables in the front matter that are not predefined are mixed into the
data that is sent to the Liquid templating engine during the conversion. For
instance, if you set a title, you can use that in your layout to set the page
title:
-->

{% highlight html %}
<!DOCTYPE HTML>
<html>
  <head>
    <title>{% raw %}{{ page.title }}{% endraw %}</title>
  </head>
  <body>
    ...
{% endhighlight %}

<!--original
{% highlight html %}
<!DOCTYPE HTML>
<html>
  <head>
    <title>{% raw %}{{ page.title }}{% endraw %}</title>
  </head>
  <body>
    ...
{% endhighlight %}
-->

## posts 用の事前に定義された変数

<!--original
## Predefined Variables for Posts
-->

これらは、 post 用 front-matter で使用される枠を超えた変数です。

<!--original
These are available out-of-the-box to be used in the front-matter for a post.
-->

<div class="mobile-side-scroller">
<table>
  <thead>
    <tr>
      <th>変数</th>
      <th>記述</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <p><code>date</code></p>
      </td>
      <td>
        <p>
          post 名からの日付をここの date で上書きします。
          これは、 posts の正しいソートを確実にするために使用されます。
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
      <th>Variable</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <p><code>date</code></p>
      </td>
      <td>
        <p>
          A date here overrides the date from the name of the post. This can be
          used to ensure correct sorting of posts.
        </p>
      </td>
    </tr>
  </tbody>
</table>
</div>
-->

