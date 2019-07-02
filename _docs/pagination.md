---
title: Pagination（ページ分け）
permalink: /docs/pagination/
---
<!-- ---
title: Pagination
permalink: /docs/pagination/
--- -->

多くのWebサイト、特にブログでは、ポストのリストをいくつかの小さなリストに分けて、複数のページに分けて表示することは一般的です。Jekyllにはページ分けプラグインがあり、ページ区切り付きリストに適切なファイルとフォルダを自動的に生成できます。

<!-- With many websites &mdash; especially blogs &mdash; it’s very common to
break the main listing of posts up into smaller lists and display them over
multiple pages. Jekyll offers a pagination plugin, so you can automatically
generate the appropriate files and folders you need for paginated listings. -->

Jekyll 3では、`jekyll-paginate`プラグインが、Gemfileや`_config.yml`の`plugins`に含まれています。Jekyll 2ではスタンダードです。

<!-- For Jekyll 3, include the `jekyll-paginate` plugin in your Gemfile and in
your `_config.yml` under `plugins`. For Jekyll 2, this is standard. -->

<div class="note info">
  <h5>ページ分けは、HTMLファイルでのみ働きます</h5>
  <!-- <h5>Pagination only works within HTML files</h5> -->
  <p>
    ページ分けはJekyllサイトのMarkdownファイルでは機能しません。<code>index.html</code>という名前のHTMLファイルで呼び出されたときのみ機能します。<code>paginate_path</code>設定値でサブディレクトリ無いでページ分けを行うこともできます。
  </p>
  <!-- <p>
    Pagination does not work from within Markdown files from
    your Jekyll site. Pagination works when called from within the HTML
    file, named <code>index.html</code>, which optionally may reside in and
    produce pagination from within a subdirectory, via the
    <code>paginate_path</code> configuration value.
  </p> -->
</div>

## ページ分けの有効化
<!-- ## Enable pagination -->

ブログでポストのページ分けを有効にするには、`_config.yml`ふぁいるに1ページに何個のアイテムを表示するかの設定を追加します。

<!-- To enable pagination for posts on your blog, add a line to the `_config.yml` file that
specifies how many items should be displayed per page: -->

```yaml
paginate: 5
```

数字は、生成したサイトで1ページに表示するポストの最大数です。

<!-- The number should be the maximum number of Posts you’d like to be displayed
per-page in the generated site. -->

ページ分けしたページの出力先も指定できます。

<!-- You may also specify the destination of the pagination pages: -->

```yaml
paginate_path: "/blog/page:num/"
```

これで`blog/index.html`を読み込み、`paginator`としてLiquidのページ分けしたページを送り、`blog/page:num/`に出力します。ここで`:num`には`2`から始まるページ番号が入ります。  
`paginate: 5`の設定で12個のポストをページ分けした場合、Jekyllは`blog/index.html`には最初の5個、`blog/page2/index.html`には次の5個、`blog/page3/index.html`には最後の2個を出力します。

<!-- This will read in `blog/index.html`, send it each pagination page in Liquid as
`paginator` and write the output to `blog/page:num/`, where `:num` is the
pagination page number, starting with `2`. <br/>
If a site has 12 posts and specifies `paginate: 5`, Jekyll will write `blog/index.html`
with the first 5 posts, `blog/page2/index.html` with the next 5 posts and
`blog/page3/index.html` with the last 2 posts into the destination directory. -->

<div class="note warning">
  <h5>パーマリンクを設定しないでください</h5>
  <!-- <h5>Don't set a permalink</h5> -->
  <p>
    ブログページのfront matterにパーマリンクを設定すると、ページ分けが壊れます。パーマリンクは省いてください。
  </p>
  <!-- <p>
    Setting a permalink in the front matter of your blog page will cause
    pagination to break. Just omit the permalink.
  </p> -->
</div>

<div class="note info">
  <h5>カテゴリやタグ、コレクションのページ分け</h5>
  <!-- <h5>Pagination for categories, tags and collections</h5> -->
  <p>
    新しい<a href="https://github.com/sverrirs/jekyll-paginate-v2" target="_blank">jekyll-paginate-v2</a>プラグインには更なる機能があります。<a href="https://github.com/sverrirs/jekyll-paginate-v2/tree/master/examples" target="_blank">
    pagination examples</a>のリポジトリをご覧ください。<strong>このプラグインは、GitHub Pagesではサポートされていません。</strong>
  </p>
  <!-- <p>
    The more recent <a href="https://github.com/sverrirs/jekyll-paginate-v2">
    jekyll-paginate-v2</a> plugin supports more features. See the
    <a href="https://github.com/sverrirs/jekyll-paginate-v2/tree/master/examples">
    pagination examples</a> in the repository. <strong>This plugin is not
    supported by GitHub Pages</strong>.
  </p> -->
</div>

## 利用可能なLiquid属性
<!-- ## Liquid Attributes Available -->

ページ分けプラグインは`paginator`Liquidオブジェクト属性を利用できます。

<!-- The pagination plugin exposes the `paginator` liquid object with the following
attributes: -->

{% include docs_variables_table.html scope=site.data.jekyll_variables.paginator %}

<div class="note info">
  <h5>Paginationはタグやカテゴリをサポートしていません</h5>
  <!-- <h5>Pagination does not support tags or categories</h5> -->
  <p>front matterで<code>hidden: true</code>でないポストを除き、全ての<code>posts</code>のポストがページ分けされたページに出力されます。現在のページ分けは、同じタグやカテゴリでグループを作る機能はありません。またポストに限定されるため、コレクションのドキュメントは含まれません。</p>
  <!-- <p>Pagination pages through every post in the <code>posts</code>
  variable unless a post has <code>hidden: true</code> in its front matter.
  It does not currently allow paging over groups of posts linked
  by a common tag or category. It cannot include any collection of
  documents because it is restricted to posts.</p> -->
</div>

## ページ分けしたポストのレンダリング
<!-- ## Render the paginated Posts -->

次に`paginator`変数を使用してポストのリストを実際に表示する必要が出てくるでしょう。 おそらく、サイトのメインページで行いたいのでしょう。以下は、ページ分けされたポストをHTMLファイルにレンダリングする簡単な方法の一例です。

<!-- The next thing you need to do is to actually display your posts in a list using
the `paginator` variable that will now be available to you. You’ll probably
want to do this in one of the main pages of your site. Here’s one example of a
simple way of rendering paginated Posts in a HTML file: -->

{% raw %}
```liquid
---
layout: default
title: My Blog
---

<!-- This loops through the paginated posts -->
{% for post in paginator.posts %}
  <h1><a href="{{ post.url }}">{{ post.title }}</a></h1>
  <p class="author">
    <span class="date">{{ post.date }}</span>
  </p>
  <div class="content">
    {{ post.content }}
  </div>
{% endfor %}

<!-- Pagination links -->
<div class="pagination">
  {% if paginator.previous_page %}
    <a href="{{ paginator.previous_page_path }}" class="previous">
      Previous
    </a>
  {% else %}
    <span class="previous">Previous</span>
  {% endif %}
  <span class="page_number ">
    Page: {{ paginator.page }} of {{ paginator.total_pages }}
  </span>
  {% if paginator.next_page %}
    <a href="{{ paginator.next_page_path }}" class="next">Next</a>
  {% else %}
    <span class="next ">Next</span>
  {% endif %}
</div>
```
{% endraw %}

<div class="note warning">
  <h5>端のページに注意してください</h5>
  <!-- <h5>Beware the page one edge-case</h5> -->
  <p>
    Jekyllは‘page1’フォルダを生成しませんので、上記のコードは<code>/page1</code>へのリンクが作成されたときには機能しません。これが問題でしたら、処理方法については下記をご覧ください。
  </p>
  <!-- <p>
    Jekyll does not generate a ‘page1’ folder, so the above code will not work
    when a <code>/page1</code> link is produced. See below for a way to handle
    this if it’s a problem for you.
  </p> -->
</div>

次のHTMLはページ1を処理し、現在のページを除く全てのページへのリンクをレンダリングします。

<!-- The following HTML snippet should handle page one, and render a list of each
page with links to all but the current page. -->

{% raw %}
```liquid
{% if paginator.total_pages > 1 %}
<div class="pagination">
  {% if paginator.previous_page %}
    <a href="{{ paginator.previous_page_path | relative_url }}">&laquo; Prev</a>
  {% else %}
    <span>&laquo; Prev</span>
  {% endif %}

  {% for page in (1..paginator.total_pages) %}
    {% if page == paginator.page %}
      <em>{{ page }}</em>
    {% elsif page == 1 %}
      <a href="{{ paginator.previous_page_path | relative_url }}">{{ page }}</a>
    {% else %}
      <a href="{{ site.paginate_path | relative_url | replace: ':num', page }}">{{ page }}</a>
    {% endif %}
  {% endfor %}

  {% if paginator.next_page %}
    <a href="{{ paginator.next_page_path | relative_url }}">Next &raquo;</a>
  {% else %}
    <span>Next &raquo;</span>
  {% endif %}
</div>
{% endif %}
```
{% endraw %}
