---
layout: step
title: コレクション
position: 9
---
<!-- ---
layout: step
title: Collections
position: 9
--- -->

著者について肉付けするため、各著者の紹介と公開したポストのページを準備しましょう。

<!-- Let's look at fleshing out authors so each author has their own page with a
blurb and the posts they've published. -->

それを行うために、コレクションを使用します。コレクションはポストによく似ていますが、日付でグループ化されない点が異なります。

<!-- To do this you'll use collections. Collections are similar to posts except the
content doesn't have to be grouped by date. -->

## 設定
<!-- ## Configuration -->

コレクションをセットアップするために、Jekyllに教える必要があります。（デフォルトでは）Jekyllの設定は`_config.yml`というファイルで行います。

<!-- To set up a collection you need to tell Jekyll about it. Jekyll configuration
happens in a file called `_config.yml` (by default). -->

以下の内容で`_config.yml`を作成します。

<!-- Create `_config.yml` in the root with the following: -->

```yaml
collections:
  authors:
```

設定ファイルを（再）読み込みするために、Jekyllサーバーをリスタートします。ターミナルで、`Ctrl`+`C`を押しサーバーを止めてから、`jekyll serve`で再起動します。

<!-- To (re)load the configuration, restart the jekyll server. Press `Ctrl`+`C` in your terminal to stop the server, and then `jekyll serve` to restart it. -->

## 著者を追加する
<!-- ## Add authors -->

ドキュメント（コレクションのアイテム）は、サイトのrootの`_*collection_name*`に入れます。今回の場合は、`_authors`です。

<!-- Documents (the items in a collection) live in a folder in the root of the site
named  `_*collection_name*`. In this case, `_authors`. -->

各著者のドキュメントを作成します。

<!-- Create a document for each author: -->

`_authors/jill.md`:

```markdown
---
short_name: jill
name: Jill Smith
position: Chief Editor
---
Jill is an avid fruit grower based in the south of France.
```

`_authors/ted.md`:

```markdown
---
short_name: ted
name: Ted Doe
position: Writer
---
Ted has been eating fruit since he was baby.
```

## スタッフページ
<!-- ## Staff page -->

サイトの全著者のリストのページを追加しましょう。Jekyllは`site.authors`でコレクションを利用可能にします。

<!-- Let's add a page which lists all the authors on the site. Jekyll makes the
collection available at `site.authors`. -->

`staff.html`を作り、`site.authors`を繰り返し処理して全てのスタッフを出力します。

<!-- Create `staff.html` and iterate over `site.authors` to output all the staff: -->

{% raw %}
```html
---
layout: default
title: Staff
---
<h1>Staff</h1>

<ul>
  {% for author in site.authors %}
    <li>
      <h2>{{ author.name }}</h2>
      <h3>{{ author.position }}</h3>
      <p>{{ author.content | markdownify }}</p>
    </li>
  {% endfor %}
</ul>
```
{% endraw %}

contentはmarkdownで書かれていますので、`markdownify`フィルタを通す必要があります。レイアウトで{% raw %}`{{ content }}`{% endraw %}を使用するときは、自動で行われています。

<!-- Since the content is markdown, you need to run it through the
`markdownify` filter. This happens automatically when outputting using
{% raw %}`{{ content }}`{% endraw %} in a layout. -->

また、メインナビゲーションでこのページに移動できるようにしましょう。`_data/navigation.yml`を開き、スタッフページの記述を追加しましょう。

<!-- You also need a way to navigate to this page through the main navigation. Open
`_data/navigation.yml` and add an entry for the staff page: -->

```yaml
- name: Home
  link: /
- name: About
  link: /about.html
- name: Blog
  link: /blog.html
- name: Staff
  link: /staff.html
```

## ページの出力
<!-- ## Output a page -->

デフォルトでは、コレクションはドキュメントのページを出力しません。今回の場合、各著者のページが必要ですので、コレクションの設定を修正します。

<!-- By default, collections do not output a page for documents. In this case we
want each author to have their own page so let's tweak the collection
configuration. -->

`_config.yml`を開き、authorコレクションの設定に`output: true`を追加します。

<!-- Open `_config.yml` and add `output: true` to the author collection
configuration: -->

```yaml
collections:
  authors:
    output: true
```

出力したページへのリンクは、`author.url`を使用して行えます。

<!-- You can link to the output page using `author.url`. -->

`staff.html`ページにリンクを追加します。

<!-- Add the link to the `staff.html` page: -->

{% raw %}
```html
---
layout: default
---
<h1>Staff</h1>

<ul>
  {% for author in site.authors %}
    <li>
      <h2><a href="{{ author.url }}">{{ author.name }}</a></h2>
      <h3>{{ author.position }}</h3>
      <p>{{ author.content | markdownify }}</p>
    </li>
  {% endfor %}
</ul>
```
{% endraw %}

ポストと同じように、著者のレイアウトを作成する必要があります。

<!-- Just like posts you'll need to create a layout for authors. -->

以下の内容で`_layouts/author.html`を作成します。

<!-- Create `_layouts/author.html` with the following content: -->

{% raw %}
```html
---
layout: default
---
<h1>{{ page.name }}</h1>
<h2>{{ page.position }}</h2>

{{ content }}
```
{% endraw %}

## front matterのデフォルト値
<!-- ## Front matter defaults -->

次は、著者のドキュメントに`author`レイアウトを設定する必要があります。これまでやったように、front matterで設定することができますが、それでは何度も同じ操作が必要です。

<!-- Now you need to configure the author documents to use the `author` layout. You
could do this in the front matter like we have previously but that's getting
repetitive. -->

自動でポストはpostレイアウト、著者のページにはauthorレイアウト、その他のページはdefaultレイアウトになるといいですよね。

<!-- What you really want is all posts to automatically have the post
layout, authors to have author and everything else to use the default. -->

`_config.yml`で[front matter defaults]({{ "/docs/configuration/front-matter-defaults/" | relative_url }})を使用すれば、できます。デフォルトをscopeに当てはめて、望むfront matterのデフォルト値を設定します。

<!-- You can achieve this by using [front matter defaults](/docs/configuration/front-matter-defaults/)
in `_config.yml`. You set a scope of what the default applies to, then the
default front matter you'd like. -->

実際に`_config.yml`にレイアウトのデフォルト値を追加してみましょう。

<!-- Add defaults for layouts to your `_config.yml`, -->

```yaml
collections:
  authors:
    output: true

defaults:
  - scope:
      path: ""
      type: "authors"
    values:
      layout: "author"
  - scope:
      path: ""
      type: "posts"
    values:
      layout: "post"
  - scope:
      path: ""
    values:
      layout: "default"
```

これで、全てのページやポストのfront matterからレイアウトの指定を省くことができます。`_config.yml`を更新した場合は、変更を反映するためにJekyllを再起動する必要があります。

<!-- Now you can remove layout from the front matter of all pages and posts. Note
that any time you update `_config.yml` you'll need to restart Jekyll for the
changes to take affect. -->

## 著者の投稿のリスト
<!-- ## List author's posts -->

著者のページに公開したポストをリストアップしてみましょう。これには、著者の`short_name`とポストの`author`を一致させる必要があります。ポストをauthorでフィルタすることで行うことができます。

<!-- Let's list the posts an author has published on their page. To do
this you need to match the author `short_name` to the post `author`. You
use this to filter the posts by author. -->

著者のポストを出力するために、`_layouts/author.html`のフィルタをかけたリストの繰り返し処理を行います。

<!-- Iterate over this filtered list in `_layouts/author.html` to output the
author's posts: -->

{% raw %}
```html
---
layout: default
---
<h1>{{ page.name }}</h1>
<h2>{{ page.position }}</h2>

{{ content }}

<h2>Posts</h2>
<ul>
  {% assign filtered_posts = site.posts | where: 'author', page.short_name %}
  {% for post in filtered_posts %}
    <li><a href="{{ post.url }}">{{ post.title }}</a></li>
  {% endfor %}
</ul>
```
{% endraw %}

## 著者ページへのリンク
<!-- ## Link to authors page -->

ポストでは著者を参照していますので、著者のページへのリンクを貼りましょう。`_layouts/post.html`で、先ほどとよく似たフィルタのテクニックを使います。

<!-- The posts have a reference to the author so let's link it to the author's page.
You can do this using a similar filtering technique in `_layouts/post.html`: -->

{% raw %}
```html
---
layout: default
---
<h1>{{ page.title }}</h1>

<p>
  {{ page.date | date_to_string }}
  {% assign author = site.authors | where: 'short_name', page.author | first %}
  {% if author %}
    - <a href="{{ author.url }}">{{ author.name }}</a>
  {% endif %}
</p>

{{ content }}
```
{% endraw %}

<a href="http://localhost:4000" target="_blank" data-proofer-ignore>http://localhost:4000</a>を開き、スタッフページやポストの著者のリンクが、きちんと機能していることを確認しましょう。

<!-- Open up <a href="http://localhost:4000" target="_blank" data-proofer-ignore>http://localhost:4000</a> and
have a look at the staff page and the author links on posts to check everything
is linked together correctly. -->

次はこのチュートリアルの最後のステップです。サイトに磨きをかけ、作品の配備の準備をします。

<!-- In the next and final step of this tutorial, we'll add polish to the site and
get it ready for a production deployment. -->
