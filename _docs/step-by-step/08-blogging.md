---
layout: step
title: ブログ
position: 8
---
<!-- ---
layout: step
title: Blogging
position: 8
--- -->

データベースを使わず、どうやってブログにするのか不思議に思っているのではないでしょうか。Jekyllのスタイルなら、テキストファイルだけでブログを作ることができます。

<!-- You might be wondering how you can have a blog without a database. In true
Jekyll style, blogging is powered by text files only. -->

## ポスト
<!-- ## Posts -->

ブログポストは`_posts`フォルダに入れます。ポストのファイル名は特別なフォーマットで、公開日、タイトル、拡張子です。

<!-- Blog posts live in a folder called `_posts`. The filename for posts have a
special format: the publish date, then a title, followed by an extension. -->

最初のポストを、以下の内容で`_posts/2018-08-20-bananas.md`として作成しましょう。

<!-- Create your first post at `_posts/2018-08-20-bananas.md` with the
following content: -->

```markdown
---
layout: post
author: jill
---
A banana is an edible fruit – botanically a berry – produced by several kinds
of large herbaceous flowering plants in the genus Musa.

In some countries, bananas used for cooking may be called "plantains",
distinguishing them from dessert bananas. The fruit is variable in size, color,
and firmness, but is usually elongated and curved, with soft flesh rich in
starch covered with a rind, which may be green, yellow, red, purple, or brown
when ripe.
```

以前作成した`about.md`に似ていますが、レイアウトが異なり、著者（author）の指定が入っています。`author`はカスタム変数で、必須ではありませんし、`creator`の様な名前にすることもできます。

<!-- This is like the `about.md` you created before except it has an author and
a different layout. `author` is a custom variable, it's not required and could
have been named something like `creator`. -->

## レイアウト
<!-- ## Layout -->

`post`レイアウトがありませんので、以下の内容で`_layouts/post.html`を作成しましょう。

<!-- The `post` layout doesn't exist so you'll need to create it at
`_layouts/post.html` with the following content: -->

{% raw %}
```html
---
layout: default
---
<h1>{{ page.title }}</h1>
<p>{{ page.date | date_to_string }} - {{ page.author }}</p>

{{ content }}
```
{% endraw %}

これはレイアウトを継承する例です。postレイアウトはタイトル、日付、著者をコンテンツをdefaultレイアウトのbodyに出力します。

<!-- This is an example of layout inheritance. The post layout outputs the title,
date, author and content body which is wrapped by the default layout. -->

`date_to_string`はフィルタで、日付のフォーマットをより良いフォーマットに変換します。

<!-- Also note the `date_to_string` filter, this formats a date into a nicer format. -->

## ポストのリスト
<!-- ## List posts -->

ブログポストへの移動方法がまだありません。通常ブログはポストのリストのページがあります。次はそれを作ってみましょう。

<!-- There's currently no way to navigate to the blog post. Typically a blog has a
page which lists all the posts, let's do that next. -->

Jekyllはポストを`site.posts`で使用可能にします。

<!-- Jekyll makes posts available at `site.posts`. -->

以下の内容の`blog.html`をroot（`/blog.html`）に作成します。

<!-- Create `blog.html` in your root (`/blog.html`) with the following content: -->

{% raw %}
```html
---
layout: default
title: Blog
---
<h1>Latest Posts</h1>

<ul>
  {% for post in site.posts %}
    <li>
      <h2><a href="{{ post.url }}">{{ post.title }}</a></h2>
      <p>{{ post.excerpt }}</p>
    </li>
  {% endfor %}
</ul>
```
{% endraw %}

このコードのメモです。

<!-- There's a few things to note with this code: -->

* `post.url`はJekyllが自動でセットするポストの出力するパスです。
* `post.title`はポストのファイル名から取得され、front matterで`title`を設定することで上書きできます。
* `post.excerpt`はデフォルトではポストの内容の最初の段落です。

<!-- * `post.url` is automatically set by Jekyll to the output path of the post
* `post.title` is pulled from the post filename and can be overridden by
setting `title` in front matter
* `post.excerpt` is the first paragraph of content by default -->

また、メインナビゲーションにこのページへの移動が必要です。`_data/navigation.yml`を開き、ブログページを追加しましょう。

<!-- You also need a way to navigate to this page through the main navigation. Open
`_data/navigation.yml` and add an entry for the blog page: -->

```yaml
- name: Home
  link: /
- name: About
  link: /about.html
- name: Blog
  link: /blog.html
```

## ポストを増やす
<!-- ## More posts -->

一つのポストだけのブログは面白くありません。もう少し追加しましょう。

<!-- A blog isn't very exciting with a single post. Add a few more: -->

`_posts/2018-08-21-apples.md`:

```markdown
---
layout: post
author: jill
---
An apple is a sweet, edible fruit produced by an apple tree.

Apple trees are cultivated worldwide, and are the most widely grown species in
the genus Malus. The tree originated in Central Asia, where its wild ancestor,
Malus sieversii, is still found today. Apples have been grown for thousands of
years in Asia and Europe, and were brought to North America by European
colonists.
```

`_posts/2018-08-22-kiwifruit.md`:

```markdown
---
layout: post
author: ted
---
Kiwifruit (often abbreviated as kiwi), or Chinese gooseberry is the edible
berry of several species of woody vines in the genus Actinidia.

The most common cultivar group of kiwifruit is oval, about the size of a large
hen's egg (5–8 cm (2.0–3.1 in) in length and 4.5–5.5 cm (1.8–2.2 in) in
diameter). It has a fibrous, dull greenish-brown skin and bright green or
golden flesh with rows of tiny, black, edible seeds. The fruit has a soft
texture, with a sweet and unique flavor.
```

<a href="http://localhost:4000" target="_blank" data-proofer-ignore>http://localhost:4000</a>を開き、ブログポストを確認してみましょう。

<!-- Open <a href="http://localhost:4000" target="_blank" data-proofer-ignore>http://localhost:4000</a> and have
a look through your blog posts. -->

次は、ポストの著者のページの作成に焦点を合わせます。

<!-- Next we'll focus on creating a page for each post author. -->
