---
title: レイアウト
description: placeholder
permalink: /docs/layouts/
---
<!-- ---
title: Layouts
description: placeholder
permalink: /docs/layouts/
--- -->

レイアウトはコンテンツを包み込むテンプレートです。テンプレートでソースコードを一カ所にまとめることができますので、フッターやナビゲーションをページ毎に繰り返す必要がありません。

<!-- Layouts are templates that wrap around your content. They allow you to have the
source code for your template in one place so you don't have to repeat things
like your navigation and footer on every page. -->

レイアウトは`_layouts`ディレクトリに入れます。慣例として、`default.html`という基本テンプレートを用意し、必要に応じて他のレイアウトがこれを[継承](#inheritance)するようにします。

<!-- Layouts live in the `_layouts` directory. The convention is to have a base
template called `default.html` and have other layouts [inherit](#inheritance)
from this as needed. -->

<div class="note">
  <h5>レイアウトディレクトリ</h5>
  <!-- <h5>Layouts Directory</h5> -->
  <p>
    Jekyllはサイトの<code>source</code>のrootかテーマのrootのどちらかで<code>_layouts</code>ディレクトリを探します。
  </p>
  <!-- <p>
    Jekyll looks for the <code>_layouts</code> directory either at the root of
    your site's <code>source</code> or at the root of your theme.
  </p> -->
  <p>
    設定ファイルの<code>layouts_dir</code>キーでレイアウトを入れるディレクトリの名前を変更できますが、そのディレクトリはサイトの<code>source</code>のrootにある必要があります。
  </p>
  <!-- <p>
    While you can configure the directory name in which your layouts can reside by
    setting the <code>layouts_dir</code> key in your config file, the directory
    itself should be located at the root of your site's <code>source</code> directory.
  </p> -->
</div>


## 使い方
<!-- ## Usage -->

まず始めに、`default.html`にテンプレートのソースコードを書きます。`content`は特別な変数で、ポストやページのコンテンツをレンダリングして、入れ込みます。

<!-- The first step is to put the template source code in `default.html`. `content`
is a special variable, the value is the rendered content of the post or page
being wrapped. -->



{% raw %}
```
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>{{ page.title }}</title>
    <link rel="stylesheet" href="/css/style.css">
  </head>
  <body>
    <nav>
      <a href="/">Home</a>
      <a href="/blog/">Blog</a>
    </nav>
    <h1>{{ page.title }}</h1>
    <section>
      {{ content }}
    </section>
    <footer>
      &copy; to me
    </footer>
  </body>
</html>
```
{% endraw %}

元のファイルの全front matterにアクセスできます。上記の例では、`page.title`がページのfront matterから読み込まれます。

<!-- You have full access to the front matter of the origin. In the
example above, `page.title` comes from the page front matter. -->

次にページのfront matterで使用するレイアウトを指定する必要があります。[front matterのデフォルト](/docs/configuration/front-matter-defaults/)を使用して、全ページに設定するのを省くことができます。

<!-- Next you need to specify what layout you're using in your page's front matter.
You can also use
[front matter defaults](/docs/configuration/front-matter-defaults/) to save you
from having to set this on every page. -->

```
---
title: My First Page
layout: default
---

This is the content of my page
```

このページは次のように出力します。

<!-- The rendered output of this page is: -->

```
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>My First Page</title>
    <link rel="stylesheet" href="/css/style.css">
  </head>
  <body>
    <nav>
      <a href="/">Home</a>
      <a href="/blog/">Blog</a>
    </nav>
    <h1>My First Page</h1>
    <section>
      This is the content of my page
    </section>
    <footer>
      &copy; to me
    </footer>
  </body>
</html>
```


## 継承
<!-- ## Inheritance -->

レイアウトの継承は、サイトの一部のドキュメントには、既存のレイアウトに何かを追加したい場合に便利です。例としては、ブログのポストには日付と著者を表示したいけれど、他ではベースのレイアウトを使用する場合です。

<!-- Layout inheritance is useful when you want to add something to an existing
layout for a portion of documents on your site. A common example of this is
blog posts, you might want a post to display the date and author but otherwise
be identical to your base layout. -->

その様な場合は、違うレイアウトを作成して、元にするレイアウトをfront matterで指定します。例えば、次のような`_layouts/post.html`を作ります。

<!-- To achieve this you need to create another layout which specifies your original
layout in front matter. For example this layout will live at
`_layouts/post.html`: -->

{% raw %}
```
---
layout: default
---
<p>{{ page.date }} - Written by {{ page.author }}</p>

{{ content }}
```
{% endraw %}

これで、ポストはこのレイアウトを使用して、ページではデフォルトを使用することができます。

<!-- Now posts can use this layout while the rest of the pages use the default. -->

## 変数
<!-- ## Variables -->

レイアウトにもfront matterを設定することができます。Liquidを使用する場合のみ違いがあり、`page`変数ではなく、`layout`変数を使用します。例えば：

<!-- You can set front matter in layouts, the only difference is when you're
using in Liquid, you need to use the `layout` variable instead of `page`. For
example: -->

{% raw %}
```
---
city: San Francisco
---
<p>{{ layout.city }}</p>

{{ content }}
```
{% endraw %}
