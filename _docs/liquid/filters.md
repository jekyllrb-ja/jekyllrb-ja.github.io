---
title: #Liquid Filters
  Liquidフィルタ
permalink: "/docs/liquid/filters/"
shopify_filter_url: https://shopify.github.io/liquid/filters/
shopify_filters:
- abs
- append
- at_least
- at_most
- capitalize
- ceil
- compact
- concat
- date
- default
- divided_by
- downcase
- escape
- escape_once
- first
- floor
- join
- last
- lstrip
- map
- minus
- modulo
- newline_to_br
- plus
- prepend
- remove
- remove_first
- replace
- replace_first
- reverse
- round
- rstrip
- size
- slice
- sort
- sort_natural
- split
- strip
- strip_html
- strip_newlines
- times
- truncate
- truncatewords
- uniq
- upcase
- url_decode
- url_encode
---

全ての標準Liquid[フィルタ](#standard-liquid-filters)はサポートされています（以下をご覧ください）。

<!-- All of the standard Liquid [filters](#standard-liquid-filters) are supported (see below). -->

共通のタスクを簡単にするため、Jekyllはいくらかのフィルタを追加していて、それはこのページに全て掲載しています。また、[プラグイン]({{ "/docs/plugins/" | relative_url }})であなた自身のフィルタを作ることもできます。

<!-- To make common tasks easier, Jekyll even adds a few handy filters of its own,
all of which you can find on this page. You can also create your own filters
using [plugins](/docs/plugins/). -->

<div class="mobile-side-scroller">
<table>
  <thead>
    <tr>
      <th>説明<!-- Description --></th>
      <th><span class="filter">フィルタ</span>と<span class="output">出力</span><!-- <span class="filter">Filter</span> and <span class="output">Output</span> --></th>
    </tr>
  </thead>
  <tbody>
    {% for filter in site.data.jekyll_filters %}
      <tr>
        <td>
          <p class="name"><strong>{{ filter.name }}</strong></p>
          <p>
            {{- filter.description -}}
            {%- if filter.version_badge %}
              <span class="version-badge" title="This filter is available from version {{ filter.version_badge }}">
                {{- filter.version_badge -}}
              </span>
            {% endif -%}
          </p>
        </td>
        <td class="align-center">
          {%- for example in filter.examples %}
            <p><code class="filter">{{ example.input }}</code></p>
            {% if example.output %}<p><code class="output">{{ example.output }}</code></p>{% endif %}
          {% endfor -%}
        </td>
      </tr>
    {% endfor %}
  </tbody>
</table>
</div>

### `slugify`フィルタのオプション
<!-- ### Options for the `slugify` filter -->

`slugify`フィルタはオプションを受け入れ、それぞれがフィルタが何をするのかを指定します。デフォルトは`default`です。以下に（何をフィルタするのかと共に）示します。

<!-- The `slugify` filter accepts an option, each specifying what to filter.
The default is `default`. They are as follows (with what they filter): -->

- `none`: 文字無し
- `raw`: スペース
- `default`: スペースと、英数字以外の文字
- `pretty`: スペースと、`._~!$&'()+,;=@`を除く英数字以外の文字
- `ascii`: スペース、英数字以外の文字、ASCII以外の文字
- `latin`: `default`に似ている。ラテン文字以外は最初に音訳される（例えば、`àèïòü`は `aeiou`に） {%- include docs_version_badge.html version="3.7.0" -%}。

<!-- - `none`: no characters
- `raw`: spaces
- `default`: spaces and non-alphanumeric characters
- `pretty`: spaces and non-alphanumeric characters except for `._~!$&'()+,;=@`
- `ascii`: spaces, non-alphanumeric, and non-ASCII characters
- `latin`: like `default`, except Latin characters are first transliterated (e.g. `àèïòü` to `aeiou`) {%- include docs_version_badge.html version="3.7.0" -%}. -->

### `where`フィルタでの`nil`値の検出 {%- include docs_version_badge.html version="4.0" -%}
<!-- ### Detecting `nil` values with `where` filter {%- include docs_version_badge.html version="4.0" -%} -->

プロパティが`nil`や`""`のドキュメントやページの検出に`where`フィルタを使用できます。例えば、

<!-- You can use the `where` filter to detect documents and pages with properties that are `nil` or `""`. For example, -->

```liquid
// `my_prop`が設定されていないか、明示的に`nil`が設定されているポストを選択するために`nil`を使う。
{% raw %}{% assign filtered_posts = site.posts | where: 'my_prop', nil %}{% endraw %}
```

<!-- ```liquid
// Using `nil` to select posts that either do not have `my_prop` defined or `my_prop` has been set to `nil` explicitly.
{% raw %}{% assign filtered_posts = site.posts | where: 'my_prop', nil %}{% endraw %}
``` -->

```liquid
// `my_prop`に空文字が設定されているポストを選択するために、Liquidの特別なリテラル`empty`や`blank`を使う。
{% raw %}{% assign filtered_posts = site.posts | where: 'my_prop', empty %}{% endraw %}
```

<!-- ```liquid
// Using Liquid's special literal `empty` or `blank` to select posts that have `my_prop` set to an empty value.
{% raw %}{% assign filtered_posts = site.posts | where: 'my_prop', empty %}{% endraw %}
``` -->

{: #standard-liquid-filters}
### 標準のLiquidフィルタ
<!-- ### Standard Liquid Filters -->

利便性のため、こちらに全ての[Liquidフィルタ]({{ page.shopify_filter_url }})のリストを、公式Liquidドキュメンテーション内の使用例へのリンクと共に掲載しています。

<!-- For your convenience, here is the list of all [Liquid filters]({{ page.shopify_filter_url }}) with links to examples in the official Liquid documentation. -->

{% for filter in page.shopify_filters %}
- [{{ filter }}]({{ filter | prepend: page.shopify_filter_url | append: '/' }}){: target="_blank"}
{% endfor %}
