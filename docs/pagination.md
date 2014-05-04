---
layout: docs
title: ページネーション
prev_section: permalinks
next_section: plugins
permalink: /docs/pagination/
---

<!--original
---
layout: docs
title: Pagination
prev_section: permalinks
next_section: plugins
permalink: /docs/pagination/
---
-->

多くのウェブサイト、とりわけブログにおいては、メインの投稿リストを小さなリストに分割して
複数のページにわたって表示させることがごく一般的に行われています。
Jekyllはページネーションを組み込んでおり、リストのページ分割のために必要となる
適切なファイルとフォルダを自動生成できます。

<!--original
With many websites—especially blogs—it’s very common to break the main listing
of posts up into smaller lists and display them over multiple pages. Jekyll has
pagination built-in, so you can automatically generate the appropriate files and
folders you need for paginated listings.
-->

<div class="note info">
  <h5>ページネーションはHTMLファイル内でのみ動作します</h5>
  <p>
    ページネーションはJekyllサイトのMarkdownファイルやTextileファイルでは動作しません。
    HTMLファイルの中で使用された場合のみ動作します。おそらくページネーションは
    postsのリストを作成するために使われるでしょうから、このことは問題にならないでしょう。
  </p>
</div>

<!--original
<div class="note info">
  <h5>Pagination only works within HTML files</h5>
  <p>
    Pagination does not work with Markdown or Textile files in your Jekyll site.
    It will only work when used within HTML files. Since you’ll likely be using
    this for the list of Posts, this shouldn’t be an issue.
  </p>
</div>
-->

## ページネーションを有効にする

<!--original
## Enable pagination
-->

ブログでページネーションを有効にするには、1ページあたりの表示アイテム数の指定を
`_config.yml` に追記します。

<!--original
To enable pagination for your blog, add a line to the `_config.yml` file that
specifies how many items should be displayed per page:
-->

{% highlight yaml %}
paginate: 5
{% endhighlight %}

<!--original
{% highlight yaml %}
paginate: 5
{% endhighlight %}
-->

生成されたサイトの1ページに表示させたいpost数の最大値を指定してください。

<!--original
The number should be the maximum number of Posts you’d like to be displayed per-
page in the generated site.
-->

ページネーションを行うページの生成先を指定することもできます:

<!--original
You may also specify where the destination of the pagination pages:
-->

{% highlight yaml %}
paginate_path: "blog/page:num"
{% endhighlight %}

<!--original
{% highlight yaml %}
paginate_path: "blog/page:num"
{% endhighlight %}
-->

この指定は、`blog/index.html` を読み込み、それをLiquidの各分割ページに `paginator` として送り、
出力を `blog/page:num` に書き込みます。ここで `:num` は `2` から始まるページ番号です。
もしサイトに12のpostsがあり、 `paginate: 5` が指定されていた場合、
Jekyllは `blog/index.html` に最初の5件を、 `blog/page2/index.html` に次の5件を、
`blog/page3/index.html` に最後の2件を書き込んで出力先ディレクトリに配置します。

<!--original
This will read in `blog/index.html`, send it each pagination page in Liquid as `paginator`
and write the output to `blog/page:num`, where `:num` is the pagination page number,
starting with `2`. If a site has 12 posts and specifies `paginate: 5`, Jekyll will write
`blog/index.html` with the first 5 posts, `blog/page2/index.html` with the next 5 posts
and `blog/page3/index.html` with the last 2 posts into the destination directory.
-->

## 利用できるLiquidの属性

<!--original
## Liquid Attributes Available
-->

ページネーションプラグインは `paginator` Liquidオブジェクトに下記の属性を付与します。

<!--original
The pagination plugin exposes the `paginator` liquid object with the following
attributes:
-->

<div class="mobile-side-scroller">
<table>
  <thead>
    <tr>
      <th>属性</th>
      <th>内容</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><p><code>page</code></p></td>
      <td><p>現在のページ番号</p></td>
    </tr>
    <tr>
      <td><p><code>per_page</code></p></td>
      <td><p>ページあたりのpostの件数</p></td>
    </tr>
    <tr>
      <td><p><code>posts</code></p></td>
      <td><p>現在のページのpostのリスト</p></td>
    </tr>
    <tr>
      <td><p><code>total_posts</code></p></td>
      <td><p>サイトのpostの総件数</p></td>
    </tr>
    <tr>
      <td><p><code>total_pages</code></p></td>
      <td><p>分割されたページの総数</p>
    </tr>
    <tr>
      <td><p><code>previous_page</code></p></td>
      <td>
          <p>
              前ページのページ番号。
              前ページがない場合は<code>nil</code>
          </p>
      </td>
    </tr>
    <tr>
      <td><p><code>previous_page_path</code></p></td>
      <td>
          <p>
              前ページのパス。
              前ページがない場合は<code>nil</code>
          </p>
      </td>
    </tr>
    <tr>
      <td><p><code>next_page</code></p></td>
      <td>
          <p>
              次ページのページ番号。
              次ページがない場合は<code>nil</code>
          </p>
      </td>
    </tr>
    <tr>
      <td><p><code>next_page_path</code></p></td>
      <td>
          <p>
              次ページのパス。
              次ページがない場合は<code>nil</code>
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
      <th>Attribute</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><p><code>page</code></p></td>
      <td><p>current page number</p></td>
    </tr>
    <tr>
      <td><p><code>per_page</code></p></td>
      <td><p>number of posts per page</p></td>
    </tr>
    <tr>
      <td><p><code>posts</code></p></td>
      <td><p>a list of posts for the current page</p></td>
    </tr>
    <tr>
      <td><p><code>total_posts</code></p></td>
      <td><p>total number of posts in the site</p></td>
    </tr>
    <tr>
      <td><p><code>total_pages</code></p></td>
      <td><p>number of pagination pages</p></td>
    </tr>
    <tr>
      <td><p><code>previous_page</code></p></td>
      <td>
          <p>
              page number of the previous pagination page,
              or <code>nil</code> if no previous page exists
          </p>
      </td>
    </tr>
    <tr>
      <td><p><code>previous_page_path</code></p></td>
      <td>
          <p>
              path of previous pagination page,
              or <code>nil</code> if no previous page exists
          </p>
      </td>
    </tr>
    <tr>
      <td><p><code>next_page</code></p></td>
      <td>
          <p>
              page number of the next pagination page,
              or <code>nil</code> if no subsequent page exists
          </p>
      </td>
    </tr>
    <tr>
      <td><p><code>next_page_path</code></p></td>
      <td>
          <p>
              path of next pagination page,
              or <code>nil</code> if no subsequent page exists
          </p>
      </td>
    </tr>
  </tbody>
</table>
</div>
-->

<div class="note info">
  <h5>ページネーションはタグとカテゴリをサポートしていません</h5>
  <p>ページネーションでは、各ページのYAML Front Matterにどのような変数が
  指定されているかには関知せず、サイトの <code>posts</code> 全部をページ分割します。
  現在のところ、共通のタグやカテゴリで紐付けられたグループごとでの
  ページネーションはできません。
</div>

<!--original
<div class="note info">
  <h5>Pagination does not support tags or categories</h5>
  <p>Pagination pages through every post in the <code>posts</code>
  variable regardless of variables defined in the YAML Front Matter of
  each. It does not currently allow paging over groups of posts linked
  by a common tag or category.</p>
</div>
-->

## 分割されたページのレンダリング

<!--original
## Render the paginated Posts
-->

`paginator` 変数が使えるようになったので、次は、
これを使って実際のpostの一覧を表示させます。
おそらくあなたはサイトのメインページのひとつでリストを表示させたいと思うでしょう。
ページ分割されたpostsをHTMLファイルでレンダリングするシンプルなやり方の例は下記のとおりです:

<!--original
The next thing you need to do is to actually display your posts in a list using
the `paginator` variable that will now be available to you. You’ll probably want
to do this in one of the main pages of your site. Here’s one example of a simple
way of rendering paginated Posts in a HTML file:
-->

{% highlight html %}
{% raw %}
---
layout: default
title: My Blog
---
<!-- ページ分割されたpostsに対してループ -->
{% for post in paginator.posts %}
  <h1><a href="{{ post.url }}">{{ post.title }}</a></h1>
  <p class="author">
    <span class="date">{{ post.date }}</span>
  </p>
  <div class="content">
    {{ post.content }}
  </div>
{% endfor %}

<!-- ページネーションリンク -->
<div class="pagination">
  {% if paginator.previous_page %}
    <a href="/page{{ paginator.previous_page }}" class="previous">Previous</a>
  {% else %}
    <span class="previous">Previous</span>
  {% endif %}
  <span class="page_number ">Page: {{ paginator.page }} of {{ paginator.total_pages }}</span>
  {% if paginator.next_page %}
    <a href="/page{{ paginator.next_page }}" class="next">Next</a>
  {% else %}
    <span class="next ">Next</span>
  {% endif %}
</div>
{% endraw %}
{% endhighlight %}

<!--original
{% highlight html %}
{% raw %}
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
    <a href="/page{{ paginator.previous_page }}" class="previous">Previous</a>
  {% else %}
    <span class="previous">Previous</span>
  {% endif %}
  <span class="page_number ">Page: {{ paginator.page }} of {{ paginator.total_pages }}</span>
  {% if paginator.next_page %}
    <a href="/page{{ paginator.next_page }}" class="next">Next</a>
  {% else %}
    <span class="next ">Next</span>
  {% endif %}
</div>
{% endraw %}
{% endhighlight %}
-->

<div class="note warning">
  <h5>1ページ目のエッジケースに注意</h5>
  <p>
    Jekyllは‘page1’フォルダを作らないので、上記のコードはもし <code>/page1</code>
    リンクが生成された場合は動きません。もしこれが問題になるようであれば、
    扱い方について以下を参照してください。
  </p>
</div>

<!--original
<div class="note warning">
  <h5>Beware the page one edge-case</h5>
  <p>
    Jekyll does not generate a ‘page1’ folder, so the above code will not work
    when a <code>/page1</code> link is produced. See below for a way to handle
    this if it’s a problem for you.
  </p>
</div>
-->

以下のHTMLは1ページ目をうまく取り扱い、現在のページ以外の全ページそれぞれの
リンクの一覧をレンダリングします。

<!--original
The following HTML snippet should handle page one, and render a list of each
page with links to all but the current page.
-->

{% highlight html %}
{% raw %}
{% if paginator.total_pages > 1 %}
<div class="pagination">
  {% if paginator.previous_page %}
    <a href="{{ paginator.previous_page_path | prepend: site.baseurl | replace: '//', '/' }}">&laquo; Prev</a>
  {% else %}
    <span>&laquo; Prev</span>
  {% endif %}

  {% for page in (1..paginator.total_pages) %}
    {% if page == paginator.page %}
      <em>{{ page }}</em>
    {% elsif page == 1 %}
      <a href="{{ '/index.html' | prepend: site.baseurl | replace: '//', '/' }}">{{ page }}</a>
    {% else %}
      <a href="{{ site.paginate_path | prepend: site.baseurl | replace: '//', '/' | replace: ':num', page }}">{{ page }}</a>
    {% endif %}
  {% endfor %}
  {% if paginator.next_page %}
    <a href="{{ paginator.next_page_path | prepend: site.baseurl | replace: '//', '/' }}">Next &raquo;</a>
  {% else %}
    <span>Next &raquo;</span>
  {% endif %}
</div>
{% endif %}
{% endraw %}
{% endhighlight %}

<!--original
{% highlight html %}
{% raw %}
{% if paginator.total_pages > 1 %}
<div class="pagination">
  {% if paginator.previous_page %}
    <a href="{{ paginator.previous_page_path | prepend: site.baseurl | replace: '//', '/' }}">&laquo; Prev</a>
  {% else %}
    <span>&laquo; Prev</span>
  {% endif %}

  {% for page in (1..paginator.total_pages) %}
    {% if page == paginator.page %}
      <em>{{ page }}</em>
    {% elsif page == 1 %}
      <a href="{{ '/index.html' | prepend: site.baseurl | replace: '//', '/' }}">{{ page }}</a>
    {% else %}
      <a href="{{ site.paginate_path | prepend: site.baseurl | replace: '//', '/' | replace: ':num', page }}">{{ page }}</a>
    {% endif %}
  {% endfor %}
  {% if paginator.next_page %}
    <a href="{{ paginator.next_page_path | prepend: site.baseurl | replace: '//', '/' }}">Next &raquo;</a>
  {% else %}
    <span>Next &raquo;</span>
  {% endif %}
</div>
{% endif %}
{% endraw %}
{% endhighlight %}
-->
