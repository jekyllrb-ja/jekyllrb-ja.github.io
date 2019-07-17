---
layout: tutorials
permalink: /tutorials/navigation/
title: ナビゲーション
---
<!-- ---
layout: tutorials
permalink: /tutorials/navigation/
title: Navigation
--- -->

Jekyllサイトに多くのページがあるなら、ページのナビゲーションを作りたくなるでしょう。ナビゲーションリンクをハードコーディングする代わりに、ページのリストをプログラムで取得してサイトのナビゲーションを構築することができます。

<!-- If your Jekyll site has a lot of pages, you might want to create navigation for the pages. Instead of hard-coding navigation links, you can programmatically retrieve a list of pages to build the navigation for your site. -->

Jekyllドキュメンテ—ションには[dataファイルとのやりとり]({{ "/docs/datafiles/" | relative_url }})についての情報がありますが、ここではより堅牢なナビゲーションの構築に挑戦します。

<!-- Although there's already information about [interacting with data files]({% link _docs/datafiles.md %}) in other Jekyll docs, this tutorial dives into building more robust navigation for your site. -->

jekyllサイトのページを取得するには主に2つの方法があります。

<!-- There are two primary ways of retrieving pages on a Jekyll site: -->

* **YAMLデータソースにリストされているページの取得**。`_data`フォルダのYAML（やJSONやCSV）ファイルにページデータを保管し、YAMLプロパティをル—プさせ、その値をテーマに挿入します。
* **ページのfront matterをループしてページを取得**。front matterを通じページを識別し、ページを返し、そのページのfront matterの値をテーマに挿入します。

<!-- * **Retrieve pages listed in a YAML data source**. Store the page data in a YAML (or JSON or CSV) file in the `_data` folder, loop through the YAML properties, and insert the values into your theme.
* **Retrieve pages by looping through the page front matter**. Look through the front matter of your pages to identify certain properties, return those pages, and insert the pages' front matter values into your theme. -->

以下では、基本的なナビゲーションのシナリオから始め、ページを返す異なる方法のデモンストレーションに洗練された要素の追加を例示します。どのシナリオでも、3つの要素があります。

<!-- The examples that follow start with a basic navigation scenario and add more sophisticated elements to demonstrate different ways of returning the pages. In every scenario, you'll see 3 elements: -->

* YAML
* Liquid
* Result

`_data`ディレクトリのYAMLファイルは、`samplelist.yml`という名前です。

<!-- The YAML file in the `_data` directory is called `samplelist.yml`. -->

シナリオは次の通りです。

<!-- The scenarios are as follows: -->

* TOC
{:toc}

## シナリオ1：基本的なリスト
<!-- ## Scenario 1: Basic List -->

ページの基本的なリストを返します。

<!-- You want to return a basic list of pages. -->

**YAML**

```yaml
docs_list_title: ACME Documentation
docs:

- title: Introduction
  url: introduction.html

- title: Configuration
  url: configuration.html

- title: Deployment
  url: deployment.html
```

**Liquid**

{% raw %}
```liquid
<h2>{{ site.data.samplelist.docs_list_title }}</h2>
<ul>
   {% for item in site.data.samplelist.docs %}
      <li><a href="{{ item.url }}">{{ item.title }}</a></li>
   {% endfor %}
</ul>
```
{% endraw %}

**Result**
<div class="highlight result" data-proofer-ignore>
   <h2>ACME Documentation</h2>
   <ul>
      <li><a href="#">Introduction</a></li>
      <li><a href="#">Configuration</a></li>
      <li><a href="#">Deployment</a></li>
   </ul>
</div>

{: .note .info }
この架空のサンプルの結果では、404エラーを回避するために実際のリンク値を`#`に手動で置き換えています。

<!-- {: .note .info }
For the results in these fictitious samples, `#` is manually substituted for the actual link value to avoid 404 errors.) -->

`for`ループを使用する場合、参照するためのアイテムは選ぶことができます。選択した変数（この場合は`item`）はリストの各アイテムのプロパティにアクセスするためのものになります。ドットはアイテムのプロパティを取得するのに使います（例：`item.url`）。

<!-- When you use a `for` loop, you choose how you want to refer to the items you're looping through. The variable you choose (in this case, `item`) becomes how you access the properties of each item in the list. Dot notation is used to get a property of the item (for example, `item.url`). -->

YAMLコンテンツには、こちらに関連する2つの主なフォーマットがあります。

<!-- The YAML content has two main types of formats that are relevant here: -->

* マッピング
* リスト

<!-- * mapping
* list -->

`docs_list_title: ACME Documentation`はマッピングです。`site.data.samplelist.docs_list_title`変数でアクセスします。

<!-- `docs_list_title: ACME Documentation` is a mapping. You access the value with `site.data.samplelist.docs_list_title`. -->

`docs:`はリストです。リストの各アイテムはハイフンから始まります。マッピングとは異なり、通常はリストのプロパティに直接アクセスしません。リストの特定のアイテムにアクセスしたい場合、通常の配列表記に従って、リスト内の場所を指定します。例えば、`site.data.samplelist.docs[0]`でリストの最初のアイテムにアクセスします。しかし、これは滅多に行いません。

<!-- `docs:` is a list. The list begins each item with a hyphen. Unlike with mappings, you usually don't access list properties directly as you do with mappings. If you want to access a specific item in the list, you must identify the position in the list you want, following typical array notation. For example, `site.data.samplelist.docs[0]` would access the first item in the list. However, this is rarely done. -->

リストでは通常、リストのアイテムを回すために`for`ループを用い、各アイテムに操作を行います。ナビゲーションの場合、通常はHTMLテーマのナビゲーションの部分の`li`タグに各リストを挿入します。

<!-- With lists, you usually use `for` loops to cycle through the list of items and do something with each item. With navigation menus, you usually insert each list item into `li` tags based on the navigation structure you're using in your HTML theme. -->

各ハイフン（`-`）は、リストの他のアイテムであることを示します。この例では、`title`と`url`の2つのプロパティだけを持っています。各アイテムに望むだけプロパティを追加することができます。リスト内のプロパティの順序は関係ありません。

<!-- Each hyphen (`-`) indicates another item in the list. This example just has two properties with each list item: `title` and `url`. You can include as many properties as you want for each item. The order of properties at each position in the list doesn't matter. -->

## シナリオ2：リストのソート
<!-- ## Scenario 2: Sorted list -->

`title`でリストをソートする場合を考えます。行うには、`docs`コレクションへの参照を変数に変換する時に、Liquidの`sort`フィルタを使用します。

<!-- Suppose you wanted to sort the list by the `title`. To do this, convert the reference to the `docs` collection to a variable, and then apply Liquid's `sort` filter to the variable: -->

**Liquid**

{% raw %}
```liquid
{% assign doclist = site.data.samplelist.docs | sort: 'title'  %}
<ol>
{% for item in doclist %}
    <li><a href="{{ item.url }}">{{ item.title }}</a></li>
{% endfor %}
</ol>
```
{% endraw %}

**Result**

<div class="highlight result" data-proofer-ignore>
   <ol>
      <li><a href="#">Configuration</a></li>
      <li><a href="#">Deployment</a></li>
      <li><a href="#">Introduction</a></li>
   </ol>
</div>

アルファベット順になりました。Liquidフィルタの`sort`プロパティがリストの実際のプロパティである`title`に適用されました。`title`がプロパティで無ければ、他のプロパティでソートする必要があります。

<!-- The items now appear in alphabetical order. The `sort` property in the Liquid filter applies to the `title`, which is an actual property in the list. If `title` weren't a property, we would need to sort by another property. -->

フィルタのオプションは[Liquid array filter](https://help.shopify.com/themes/liquid/filters/array-filters){:target="_blank"}を見てください。この構文を以下のようにシンプルにすることはできません。

<!-- See the [Liquid array filter](https://help.shopify.com/themes/liquid/filters/array-filters) for more filter options. Note that you can't simply use this syntax: -->

{% raw %}
```liquid
{% for item in site.data.samplelist.docs | sort: "title" %}{% endfor %}
```
{% endraw %}

`site.data.samplelist.docs`を`assign`や`capture`タグで変数に変換する必要があります。

<!-- You have to convert `site.data.samplelist.docs` to a variable first using either `assign` or `capture` tags. -->

## シナリオ3：2レベルのナビゲーションリスト
<!-- ## Scenario 3: Two-level navigation list -->

見出しタイトルとサブアイテムの複数のセクションからなるリストが必要な場合を考えます。これを行うには、この情報を保管するために各リストアイテムにレベルを追加します。

<!-- Suppose you want a more robust list that incorporates multiple sections of heading titles and subitems. To do this, add an additional level to each list item to store this information: -->

**YAML**

```yaml
toc:
  - title: Group 1
    subfolderitems:
      - page: Thing 1
        url: /thing1.html
      - page: Thing 2
        url: /thing2.html
      - page: Thing 3
        url: /thing3.html
  - title: Group 2
    subfolderitems:
      - page: Piece 1
        url: /piece1.html
      - page: Piece 2
        url: /piece2.html
      - page: Piece 3
        url: /piece3.html
  - title: Group 3
    subfolderitems:
      - page: Widget 1
        url: /widget1.html
      - page: Widget 2
        url: /widget2.html
      - page: Widget 3
        url: /widget3.html
```

**Liquid**

{% raw %}
```liquid
{% for item in site.data.samplelist.toc %}
    <h3>{{ item.title }}</h3>
      <ul>
        {% for entry in item.subfolderitems %}
          <li><a href="{{ entry.url }}">{{ entry.page }}</a></li>
        {% endfor %}
      </ul>
  {% endfor %}
```
{% endraw %}

**Result**
<div class="highlight result" data-proofer-ignore>
    <h3>Group 1</h3>
      <ul>
          <li><a href="#">Thing 1</a></li>
          <li><a href="#">Thing 2</a></li>
          <li><a href="#">Thing 3</a></li>
      </ul>

    <h3>Group 2</h3>
      <ul>
          <li><a href="#">Piece 1</a></li>
          <li><a href="#">Piece 2</a></li>
          <li><a href="#">Piece 3</a></li>
      </ul>

    <h3>Group 3</h3>
      <ul>
          <li><a href="#">Widget 1</a></li>
          <li><a href="#">Widget 2</a></li>
          <li><a href="#">Widget 3</a></li>
      </ul>
</div>

この例では、`Group 1`が最初のリストアイテムです。このリストアイテムのサブページに、そのリスト（`subfolderitems`）をプロパティとして含んでいます。

<!-- In this example, `Group 1` is the first list item. Within that list item, its subpages are included as a property that itself contains a list (`subfolderitems`). -->

Liquidコードは`for item in site.data.samplelist.toc`でファーストレベルを、`for entry in item.subfolderitems`でセカンドレベルを見通しています。`item`はアイテムをループするための任意の名前で、`entry`も同様です。

<!-- The Liquid code looks through the first level with `for item in site.data.samplelist.toc`, and then looks through the second-level property with `for entry in item.subfolderitems`. Just as `item` is an arbitrary name for the items we're looping through, so is `entry`. -->

## シナリオ4：3レベルのナビゲーションリスト
<!-- ## Scenario 4: Three-level navigation list -->

前のセクションを発展させ、もう1つリストにレベル（`subsubfolderitems`）を追加しましょう。フォーマットは複雑になりますが、原則は同じです。

<!-- Building on the previous section, let's add one more level of depth (`subsubfolderitems`) to the list. The formatting will get more complex here, but the principles are the same. -->

**YAML**

```yaml
toc2:
  - title: Group 1
    subfolderitems:
      - page: Thing 1
        url: /thing1.html
      - page: Thing 2
        url: /thing2.html
        subsubfolderitems:
          - page: Subthing 1
            url: /subthing1.html
          - page: Subthing 2
            url: /subthing2.html
      - page: Thing 3
        url: /thing3.html
  - title: Group 2
    subfolderitems:
      - page: Piece 1
        url: /piece1.html
      - page: Piece 2
        url: /piece2.html
      - page: Piece 3
        url: /piece3.html
        subsubfolderitems:
          - page: Subpiece 1
            url: /subpiece1.html
          - page: Subpiece2
            url: /subpiece2.html
  - title: Group 3
    subfolderitems:
      - page: Widget 1
        url: /widget1.html
        subsubfolderitems:
          - page: Subwidget 1
            url: /subwidget1.html
          - page: Subwidget 2
            url: /subwidget2.html
      - page: Widget 2
        url: /widget2.html
      - page: Widget 3
        url: /widget3.html
```

**Liquid**

{% raw %}
```liquid
<div>
{% if site.data.samplelist.toc2[0] %}
  {% for item in site.data.samplelist.toc2 %}
    <h3>{{ item.title }}</h3>
      {% if item.subfolderitems[0] %}
        <ul>
          {% for entry in item.subfolderitems %}
              <li><a href="{{ entry.url }}">{{ entry.page }}</a>
                {% if entry.subsubfolderitems[0] %}
                  <ul>
                  {% for subentry in entry.subsubfolderitems %}
                      <li><a href="{{ subentry.url }}">{{ subentry.page }}</a></li>
                  {% endfor %}
                  </ul>
                {% endif %}
              </li>
          {% endfor %}
        </ul>
      {% endif %}
    {% endfor %}
{% endif %}
</div>
```
{% endraw %}

**Result**

<div class="highlight result" data-proofer-ignore>
   <div>
      <h3>Group 1</h3>
      <ul>
         <li><a href="#">Thing 1</a></li>
         <li><a href="#">Thing 2</a></li>
         <ul>
            <li><a href="#">Subthing 1</a></li>
            <li><a href="#">Subthing 2</a></li>
         </ul>
         <li><a href="#">Thing 3</a></li>
      </ul>
      <h3>Group 2</h3>
      <ul>
         <li><a href="#">Piece 1</a></li>
         <li><a href="#">Piece 2</a></li>
         <li><a href="#">Piece 3</a></li>
         <ul>
            <li><a href="#">Subpiece 1</a></li>
            <li><a href="#">Subpiece2</a></li>
         </ul>
      </ul>
      <h3>Group 3</h3>
      <ul>
         <li><a href="#">Widget 1</a></li>
         <ul>
            <li><a href="#">Subwidget 1</a></li>
            <li><a href="#">Subwidget 2</a></li>
         </ul>
         <li><a href="#">Widget 2</a></li>
         <li><a href="#">Widget 3</a></li>
      </ul>
   </div>
</div>

この例では、`if site.data.samplelist.toc2[0]`でYAMLレベルに本当にアイテムがあるのかを確認しています。ポジション`[0]`に何もなければ、そのレベルの処理をスキップします。

<!-- In this example, `if site.data.samplelist.toc2[0]` is used to ensure that the YAML level actually contains items. If there isn't anything at the `[0]` position, we can skip looking in this level. -->

<div class="note">
  <h5>ProTip: <code>for</code>ループと<code>if</code>文を揃える</h5>
  <!-- <h5>ProTip: Line up <code>for</code> loops and <code>if</code> statements</h5> -->
  <p>コードをきれいに保つために、<code>for</code>ループと<code>if</code>文のように、Liquidタグの始まりと終わりを揃えます。この方法で、タグがどこで始まりどこで終わったかが分かりやすくなります。コードがMarkdownページに表示される場合は、Markdownフィルタがコードサンプルとして扱わないように、HTMLタグの開始と終了を左端にあわせてください。 必要に応じて、コードサンプル全体を<code>div</code>タグで囲むことで、コードにコードを補足するHTMLタグを確実に含めることができます。</p>
  <!-- <p>To keep the code clear, line up the beginning and ending Liquid tags, such as the <code>for</code> loops and <code>if</code> statements. This way you know when the open tags have been closed. If the code will appear in a Markdown page, keep the opening and closing HTML tags flush against the left edge so that the Markdown filter won't treat the content as a code sample. If necessary, you can wrap the entire code sample in a <code>div</code> tag to ensure the code has HTML tags that bookend the code.</p> -->
</div>

## シナリオ5：YAMLリストの選択にページ変数を使用する
<!-- ## Scenario 5: Using a page variable to select the YAML list -->

いくつかのドキュメンテーションのセットでサイドバーを変更したい場合を考えます。サイトに3つの異なるプロダクトがあり、それぞれにあわせて3つの異なるサイドバーが必要だとします。

<!-- Suppose your sidebar will differ based on various documentation sets. You might have 3 different products on your site, and so you want 3 different sidebars &mdash; each unique for that product. -->

ページのfront matterにサイドバーのリストの名前を格納し、その値を動的にリストに渡します。

<!-- You can store the name of the sidebar list in your page front matter and then pass that value into the list dynamically. -->

**Page front matter**

```yaml
---
title: My page
sidebar: toc
---
```

**Liquid**

{% raw %}
```liquid
<ul>
    {% for item in site.data.samplelist[page.sidebar] %}
      <li><a href="{{ item.url }}">{{ item.title }}</a></li>
    {% endfor %}
</ul>
```
{% endraw %}

**Result**

<div class="highlight result" data-proofer-ignore>
   <ul>
      <li><a href="#">Introduction</a></li>
      <li><a href="#">Configuration</a></li>
      <li><a href="#">Deployment</a></li>
   </ul>
</div>

このシナリオでは、ページのfront matterからその値を`for`ループに渡しました。割り当てられた変数が文字列ではなくデータ参照である場合は、front matterの値を参照するために（中括弧ではなく）大括弧を使用する必要があります。

<!-- In this scenario, we want to pass values from the page's front matter into a `for` loop that contains a variable. When the assigned variable isn't a string but rather a data reference, you must use brackets (instead of curly braces) to refer to the front matter's value. -->

更なる情報は、Liquidのドキュメンテーションの[Expressions and Variables](https://github.com/Shopify/liquid/wiki/Liquid-for-Designers#expressions-and-variables){:target="_blank"}を見てください。ドット表記が使えない場所で大括弧が使用されます。この詳細は[Stack Overflow answer](http://stackoverflow.com/questions/4968406/javascript-property-access-dot-notation-vs-brackets/4968448#4968448){:target="_blank"}で読むことができます。

<!-- For more information, see [Expressions and Variables](https://github.com/Shopify/liquid/wiki/Liquid-for-Designers#expressions-and-variables) in Liquid's documentation. Brackets are used in places where dot notation can't be used. You can also read more details in this [Stack Overflow answer](http://stackoverflow.com/questions/4968406/javascript-property-access-dot-notation-vs-brackets/4968448#4968448). -->

## シナリオ6：現在のページにactiveクラスを適用する
<!-- ## Scenario 6: Applying the active class for the current page -->

YAMLデータファイルからリストへアイテムを挿入するとき、現在見ているページへのリンクは強調したいこともあるでしょう。現在のページのURLとアイテムがマッチした場合に`active`クラスを挿入することで、実現できます。

<!-- In addition to inserting items from the YAML data file into your list, you also usually want to highlight the current link if the user is viewing that page. You do this by inserting an `active` class for items that match the current page URL. -->

**CSS**
```css
.result li.active a {
    color: lightgray;
    cursor: default;
  }
```
**Liquid**

{% raw %}
```liquid
{% for item in site.data.samplelist.docs %}
    <li class="{% if item.url == page.url %}active{% endif %}">
      <a href="{{ item.url }}">{{ item.title }}</a>
    </li>
{% endfor %}
```
{% endraw %}

**Result**

<style>
.result li.active a {
    color: lightgray;
    cursor: default;
  }
</style>

<div class="highlight result" data-proofer-ignore>
   <ul>
      <li class=""><a href="#">Introduction</a></li>
      <li class=""><a href="#">Configuration</a></li>
      <li class="active"><a href="#">Deployment</a></li>
   </ul>
</div>

この例では`Deployment`が現在のページとしています。

<!-- In this case, assume `Deployment` is the current page. -->

（YAMLファイルに格納されている）`item.url`が`page.url`と確実に一致するようにするには、{％raw％} {{page.url}} {％endraw％}をページに出力すると便利です。

<!-- To make sure the `item.url` (stored in the YAML file) matches the `page.url`, it can be helpful to print the `{% raw %}{{ page.url }}{% endraw %}` to the page. -->

## シナリオ7：条件付きでアイテムを含める
<!-- ## Scenario 7: Including items conditionally -->

リストに条件付きで項目を含めたい場合を考えます。例えば、複数のサイトを持っていて、特定の項目だけを含むサイドバーが欲しい場合です。リストの各項目にプロパティを追加して、含める内容の条件にそのプロパティを使います。

<!-- You might want to include items conditionally in your list. For example, maybe you have multiple site outputs and only want to include the sidebar item for certain outputs. You can add properties in each list item and then use those properties to conditionally include the content. -->

**YAML**
```yaml
docs2_list_title: ACME Documentation
docs2:

- title: Introduction
  url: introduction.html
  version: 1

- title: Configuration
  url: configuration.html
  version: 1

- title: Deployment
  url: deployment.html
  version: 2
```

**Liquid**

{% raw %}
```liquid
  <ul>
    {% for item in site.data.samplelist.docs2 %}
      {% if item.version == 1 %}
        <li><a href="{{ item.url }}">{{ item.title }}</a></li>
      {% endif %}
    {% endfor %}
</ul>
```
{% endraw %}

**Result**

<div class="highlight result" data-proofer-ignore>
   <ul>
      <li><a href="#">Introduction</a></li>
      <li><a href="#">Configuration</a></li>
   </ul>
</div>

`Deployment`は`version`が`2`ですので書き出されていません。

<!-- The `Deployment` page is excluded because its `version` is `2`. -->

## シナリオ8：front matterのプロパティに基づくアイテムの取得
<!-- ## Scenario 8: Retrieving items based on front matter properties -->

ナビゲーションアイテムを`_data`フォルダのYAMLファイルに格納したくない場合、各ページやコレクションのfront matterを取得して`for`ループを使用し、front matterのプロパティを元にコンテンツを取得します。

<!-- If you don't want to store your navigation items in a YAML file in your `_data` folder, you can use `for` loops to look through the front matter of each page or collection and get the content based on properties in the front matter. -->

このシナリオでは、`_docs`というコレクションがあるとします。コレクションは、ループできるリストを持っているため、ページよりよい場合が多いです。（ビルド時間が長くなるため、多数の項目をループ処理するシナリオは避けてください。 [コレクション]({{ "/docs/collections/" | relative_url }})は範囲を狭めるのに役立ちます。）

<!-- In this scenario, suppose we have a collection called `_docs`. Collections are often better than pages because they allow you to narrow the list of what you're looping through. (Try to avoid scenarios where you loop through large numbers of items, since it will increase your build time. [Collections]({% link _docs/collections.md %}) help you narrow the scope.) -->

このシナリオでは、`docs`コレクションにSample 1, Sample 2, Topic 1, Topic 2, Widget 1, そしてWidget 2の6つのドキュメントがあるとします。

<!-- In our scenario, there are 6 docs in the `docs` collection: Sample 1, Sample 2, Topic 1, Topic 2, Widget 1, and Widget 2. -->

コレクションの各ドキュメントにはfront matterに最低3つのプロパティを含めます。

<!-- Each doc in the collection contains at least 3 properties in the front matter: -->

* `title`
* `category`
* `order`

各ページのfront matterは以下の通りです。（簡潔にするためここでは統合しています）

<!-- The front matter for each page is as follows (consolidated here for brevity): -->

```yaml
---
Title: Sample 1
category: getting-started
order: 1
---

---
Title: Sample 2
category: getting-started
order: 2
---

---
Title: Topic 1
category: configuration
order: 1
---

---
Title: Topic 2
category: configuration
order: 2
---

---
Title: Widget 1
category: deployment
order: 1
---

---
Title: Widget 2
category: deployment
order: 2
---
```

`category`をドキュメントのfront matterで使用していても、`category`はポストの場合の組み込み変数とは異なります。言い換えれば、`site.docs.category`で`category`の内部を直接見ることはできません。

<!-- Note that even though `category` is used in the doc front matter, `category` is not a built-in variable like it is with posts. In other words, you cannot look directly inside `category` with `site.docs.category`. -->

コレクション内の特定のカテゴリのドキュメントを簡単に取得したい場合、`for`ループ内で`if`文を使いそのカテゴリかをチェックします。

<!-- If you wanted to simply get all docs in the collection for a specific category, you could use a `for` loop with an `if` condition to check for a specific category: -->

{% raw %}
```liquid
<h3>Getting Started</h3>
<ul>
    {% for doc in site.docs %}
      {% if doc.category == "getting-started" %}
        <li><a href="{{ doc.url }}">{{ doc.title }}</a></li>
      {% endif %}
    {% endfor %}
</ul>
```
{% endraw %}

結果は以下のようになります。

<!-- The result would be as follows: -->

<div class="highlight result" data-proofer-ignore>
   <h3>Getting Started</h3>
   <ul>
      <li><a href="#">Sample1</a></li>
      <li><a href="#">Sample2</a></li>
   </ul>
</div>

これは、ナレッジベースを設定し、各カテゴリに多数のトピックがあり、各カテゴリをそれぞれのページに表示する場合に便利です。

<!-- This might be useful if you're setting up a knowledge base and have dozens of topics in each category, with each category displaying on its own page. -->

カテゴリ名をハードコーディングせずに、カテゴリ別にアイテムをソートし、それらをカテゴリ名の下にグループ化する場合を考えます。2つのフィルタを利用して、実現することができます。

<!-- But let's say you want to sort the items by category and group them under the category name, without hard-coding the category names. To achieve this, you could use two filters: -->

* `group_by`
* `sort`

カテゴリヘッダに対応したグループのページのリストを取得するコードを示します。

<!-- Here's the code for getting lists of pages grouped under their corresponding category headers: -->

**Liquid**

{% raw %}
```liquid
{% assign mydocs = site.docs | group_by: 'category' %}
{% for cat in mydocs %}
<h2>{{ cat.name | capitalize }}</h2>
    <ul>
      {% assign items = cat.items | sort: 'order' %}
      {% for item in items %}
        <li><a href="{{ item.url }}">{{ item.title }}</a></li>
      {% endfor %}
    </ul>
{% endfor %}
```
{% endraw %}

**Result**

<div class="highlight result" data-proofer-ignore>
   <h2>Getting-started</h2>
   <ul>
      <li><a href="#">Sample2</a></li>
      <li><a href="#">Sample1</a></li>
   </ul>
   <h2>Configuration</h2>
   <ul>
      <li><a href="#">Topic2</a></li>
      <li><a href="#">Topic1</a></li>
   </ul>
   <h2>Deployment</h2>
   <ul>
      <li><a href="#">Widget2</a></li>
      <li><a href="#">Widget1</a></li>
   </ul>
</div>

コードを見ていきましょう。まず、コレクションの内容（`site.docs`）の為の変数（`mydocs`）を設定しています。

<!-- Let's walk through the code. First, we assign a variable (`mydocs`) to the collection content (`site.docs`). -->

`group_by`フィルタでコレクションを`category`でグループ化しています。より正確には、`group_by`フィルタは`mydocs`を以下のように`name`, `items`, そして`size`の配列に変換しています。

<!-- The `group_by` filter groups the collection content by `category`. More specifically, the `group_by` filter converts `mydocs` into an array with `name`, `items`, and `size` properties, somewhat like this: -->

```yaml
[
  {"name": "getting-started", "items": [Sample 1, Sample 2],"size": 2},
  {"name": "configuration", "items": [Topic 1, Topic 2], "size": 2},
  {"name": "deployment", "items": [Widget 1, Widget 2, "size": 2}
]
```

`for cat in mydocs`を使用して、`mydocs`配列のアイテムを確認し、カテゴリ`name`をプリントしています。

<!-- Using `for cat in mydocs`, we look through each item in the `mydocs` array and print the category `name`. -->

カテゴリ名を取得した後、`sort`フィルタで`order`プロパティ順に並べたドキュメントを変数`items`に設定します。コンテンツの`items`配列にアクセスするために`cat.items`を使用しています。`sort`フィルタでアイテムの番号で昇順に並べ替えています。

<!-- After getting the category name, we assign the variable `items` for the docs and use the `sort` filter to arrange the docs by their `order` property. The dot notation `cat.items` is used because we're accessing the content in the `items` array. The `sort` filter orders the items by their numbers in ascending order. -->

`for item in items`ループは各`item`を確認し、リストのアイテムをリンクするために`title`と`url`を取得しています。

<!-- The `for item in items` loop looks through each `item` and gets the `title` and `url` to form the list item link. -->

`group_by`フィルタの詳細は[Jekyll's Templates documentation](https://jekyllrb.com/docs/templates/){:target="_blank"}や[this Siteleaf tutorial](https://www.siteleaf.com/blog/advanced-liquid-group-by/){:target="_blank"}をご覧ください。`sort`フィルタの詳細はLiquidドキュメンテーションの[sort](https://shopify.github.io/liquid/filters/sort/){:target="_blank"}をご覧ください。

<!-- For more details on the `group_by` filter, see [Jekyll's Templates documentation](https://jekyllrb.com/docs/templates/) as well as [this Siteleaf tutorial](https://www.siteleaf.com/blog/advanced-liquid-group-by/). For more details on the `sort` filter, see [sort](https://shopify.github.io/liquid/filters/sort/) in Liquid's documentation. -->

ドキュメントのfront matterを使用する場合、YAMLデータファイルを使用する場合のどちらでも、サイトに為のより堅牢なナビゲーションを構築することができるでしょう。

<!-- Whether you use properties in your doc's front matter to retrieve your pages or a YAML data file, in both cases you can programmatically build a more robust navigation for your site. -->

## Scenario 9: Nested tree navigation with recursion

Suppose you want a nested tree navigation of any depth. We can achieve this by recursively looping through our tree of navigation links.

**YAML**

```yaml
nav:
  - title: Deployment
    url: deployment.html
    subnav:
      - title: Heroku
        url: heroku.html
        subnav:
          - title: Jekyll on Heroku
            url: jekyll-on-heroku.html
  - title: Help
    url: help.html
```

**Liquid**

First, we'll create an include that we can use for rendering the navigation tree. This file would be `_includes/nav.html`

{% raw %}
```liquid
<ul>
  {% for item in include.nav %}
    <li><a href="{{ item.url }}">{{ item.title }}</a></li>

    {% if item.subnav %}
      {% include nav.html nav=item.subnav %}
    {% endif %}
  {% endfor %}
</ul>
```
{% endraw %}

To render this in your layout or pages, you would simply include the template and pass in the `nav` parameter. In this case, we'll use the `page.nav` to grab it from the yaml frontmatter.

{% raw %}
```liquid
{% include nav.html nav=page.nav %}
```
{% endraw %}

Our include will use this first, then look through each item for a `subnav` property to recursively render the nested lists.

**Result**
<div class="highlight result" data-proofer-ignore>
   <ul>
      <li><a href="#">Deployment</a></li>
      <ul>
        <li><a href="#">Heroku</a></li>
        <ul>
          <li><a href="#">Jekyll On Heroku</a></li>
        </ul>
      </ul>
      <li><a href="#">Help</a></li>
   </ul>
</div>