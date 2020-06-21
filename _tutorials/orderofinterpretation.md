---
title: 解釈の順番
author: tomjoht
date: 2017-01-29 21:45:03 -0800
---
<!-- ---
title: Order of interpretation
author: tomjoht
date: 2017-01-29 21:45:03 -0800
--- -->

Jekyllの主な仕事は、あなたのテキストファイルを静的Webサイトに変換することです。LiquidやMarkdown、その他の変換を行い、静的HTMLを作成し出力します。

<!-- Jekyll's main job is to convert your raw text files into a static website. It does this by rendering Liquid, Markdown, and other transforms as it generates the static HTML output. -->

この変換プロセス中の、Jekyllの解釈の順番を理解することは重要です。「解釈の順番」は、何がレンダリングされるのか、どのような順序でレンダリングされるのか、そしてコンテンツの変換にどのような規則が適用されるのかを意味します。

<!-- In this conversion process, it's important to understand Jekyll's order of interpretation. By "order of interpretation," we mean what gets rendered, in what order, and what rules get applied in converting content. -->

要素が変換されない場合は、解釈の順番を分析して問題を解決できます。

<!-- If an element isn't converting, you can troubleshoot the problem by analyzing the order of interpretation. -->

## 解釈の順番
<!-- ## Order of interpretations -->

Jekyllは以下の順番でサイトを作成します。

<!-- Jekyll converts your site in the following order: -->

1. **サイト変数** Jekyllはファイルを調べて`site`, `page`, `post`やコレクションオブジェクトといった[サイト変数]({{ "/docs/variables/" | relative_url }})を設定します。（これらから、パーマリンク、タグ、カテゴリなど詳細の値を決定します）
2. **Liquid** [front matter]({{ "/docs/front-matter/" | relative_url }})を含むページの[Liquid](https://github.com/Shopify/liquid){:target="_blank"}フォーマットを処理します。次のようにLiquidを識別できます。
   * **Liquid タグ** `{% raw %}{%{% endraw %}`から`{% raw %}%}{% endraw %}`まで。例えば、`{% raw %}{% highlight %}{% endraw %}`や`{% raw %}{% seo %}{% endraw %}`タグはブロックを定義することもインラインにすることもできます。 ブロック定義タグには対応する終了タグも付きます &mdash; `{% raw %}{% endhighlight %}{% endraw %}`など。
   * **Liquid 変数** 2つの中括弧で囲まれた部分。例えば、`{% raw %}{{ site.myvariable }}{% endraw %}`や`{% raw %}{{ content }}{% endraw %}`。
   * **Liquid フィルタ** **Liquid 変数**内でのみ使用できる、変数名の文字列の後で縦棒（`|`）から始まる部分。例えば、`{% raw %}{{ "css/main.css" | relative_url }}{% endraw %}`中の`relative_url`フィルタ。
3. **Markdown** 設定ファイルで指定されたMarkdownフィルタを用いてJekyllはMerkdownをHTMLに変換します。Jekyllがファイルを変換するためには、ファイルにMarkdownファイル拡張子とfront matterが必要です。
4. **レイアウト** （設定ファイルや）ページのfront matterで指定されたレイアウトに、コンテンツを押し込みます。コンテンツはレイアウト内の`{% raw %}{{ content }}{% endraw %}`タグ部に入ります。
5. **ファイル** 生成されたコンテンツを`_site`のディレクトリ構造内のファイルに書き込みます。 ページ、ポスト、およびコレクションは、パーマリンクの設定に基づいて構造化されます。`_`で始まるディレクトリ（`_includes`や`_data`など）は通常、出力時には隠されます。

<!-- 1. **Site variables**. Jekyll looks across your files and populates [site variables]({% link _docs/variables.md %}), such as `site`, `page`, `post`, and collection objects. (From these objects, Jekyll determines the values for permalinks, tags, categories, and other details.) -->

<!-- 2. **Liquid**. Jekyll processes any [Liquid](https://github.com/Shopify/liquid) formatting in pages that contain [front matter]({% link _docs/front-matter.md %}). You can identify Liquid as follows:
   * **Liquid tags** start with `{% raw %}{%{% endraw %}` and end with a `{% raw %}%}{% endraw %}`. For example: `{% raw %}{% highlight %}{% endraw %}` or `{% raw %}{% seo %}{% endraw %}`. Tags can define blocks or be inline. Block-defining tags will also come with a corresponding end tag &mdash; for example, `{% raw %}{% endhighlight %}{% endraw %}`.
   * **Liquid variables** start and end with double curly braces. For example: `{% raw %}{{ site.myvariable }}{% endraw %}` or `{% raw %}{{ content }}{% endraw %}`.
   * **Liquid filters** start with a pipe character (`|`) and can only be used within **Liquid variables** after the variable string. For example: the `relative_url` filter in `{% raw %}{{ "css/main.css" | relative_url }}{% endraw %}`. -->

<!-- 3. **Markdown**. Jekyll converts Markdown to HTML using the Markdown filter specified in your config file. Files must have a Markdown file extension and front matter in order for Jekyll to convert them. -->

<!-- 4. **Layout**. Jekyll pushes content into the layouts specified by the page's front matter (or as specified in the config file). The content from each page gets pushed into the `{% raw %}{{ content }}{% endraw %}` tags within the layouts. -->

<!-- 5. **Files**. Jekyll writes the generated content into files in the [directory structure]({% link _docs/structure.md %}) in `_site`. Pages, posts, and collections get structured based on their [permalink]({% link _docs/permalinks.md %}) setting. Directories that begin with `_` (such as `_includes` and `_data`) are usually hidden in the output. -->

## 誤った構成が問題を引き起こすシナリオ
<!-- ## Scenarios where incorrect configurations create problems -->

Jekyllサイトの構築で、多くの場合は解釈の順番を考える必要はありません。レンダリングが上手くいかない場合にこれらの詳細が重要になります。

<!-- For the most part, you don't have to think about the order of interpretation when building your Jekyll site. These details only become important to know when something isn't rendering. -->

以下のシナリオでは、発生する可能性がある潜在的な問題を強調しています。これらの問題は解釈の順番の誤解から来ており、簡単に修正することができます。

<!-- The following scenarios highlight potential problems you might encounter. These problems come from misunderstanding the order of interpretation and can be easily fixed. -->

### レイアウト上で割り当てられた変数はページ上ではレンダリングされません
<!-- ### Variable on page not rendered because variable is assigned in layout -->

レイアウトファイル（`_layouts/default.html`）で変数を割り当てたとします。

<!-- In your layout file (`_layouts/default.html`), suppose you have a variable assigned: -->

{% raw %}
```liquid
{% assign myvar = "joe" %}
```
{% endraw %}

レイアウトを使用するページで、その変数を参照します。

<!-- On a page that uses the layout, you reference that variable: -->

{% raw %}
```liquid
{{ myvar }}
```
{% endraw %}

変数はレンダリングされません。なぜなら、まずLiquidをレンダリングしてからレイアウトのプロセスに移行するという順番で解釈するためです。Liquidがレンダリングされる時点では、変数はまだ割り当てられていません。

<!-- The variable won't render because the page's order of interpretation is to render Liquid first and later process the Layout. When the Liquid rendering happens, the variable assignment isn't available. -->

このコードを動かすためには、変数の割り当てをページのfront matterで行います。

<!-- To make the code work, you could put the variable assignment into the page's front matter. -->

### インクルードファイルのMarkdownは処理されません
<!-- ### Markdown in include file not processed -->

`_includes/mycontent.md`というMarkdownファイルがあるとします。Markdownファイルでは、Markdownのフォーマットで書かれています。

<!-- Suppose you have a Markdown file at `_includes/mycontent.md`. In the Markdown file, you have some Markdown formatting: -->

```markdown
This is a list:
* first item
* second item
```

以下のように、HTMLファイルに先ほどのファイルをインクルードします。

<!-- You include the file into an HTML file as follows: -->

{% raw %}
```liquid
{% include mycontent.md %}
```
{% endraw %}

Markdownは処理されません。なぜなら、Liquid（`include`）タグがまず処理され、`mycontent.md`がHTMLファイルに挿入されるためです。Markdownは*それから*処理されることになります。

<!-- The Markdown is not processed because first the Liquid (`include` tag) gets processed, inserting `mycontent.md` into the HTML file. *Then* the Markdown would get processed. -->

ですが、*HTML*ページに挿入したため、Markdownは処理されません。Markdownの変換プロセスは、Markdownファイルでのみ行われます。

<!-- But because the content is included into an *HTML* page, the Markdown isn't rendered. The Markdown filter processes content only in Markdown files. -->

コードを動かすためには、HTMLファイルにインクルードするファイルはHTML形式にします。

<!-- To make the code work, use HTML formatting in includes that are inserted into HTML files. -->

`highlight`タグはMarkdownの処理を必要としません。以下のインクルードコンテンツがあるとします。

<!-- Note that `highlight` tags don't require Markdown to process. Suppose your include contains the following: -->

{% raw %}
```liquid
{% highlight javascript %}
console.log('alert');
{% endhighlight %}
```
{% endraw %}

`highlight`タグはLiquidです。（Liquidはコンテンツを構文強調表示のためにRougeに渡します。）その結果、このコードはHTMLにシンタックスハイライト処理され変換されます。Jekyllは`highlight`タグにMarkdown処理のプロセスを必要としません。

<!-- The `highlight` tag *is* Liquid. (Liquid passes the content to Rouge for syntax highlighting.) As a result, this code will actually convert to HTML with syntax highlighting. Jekyll does not need the Markdown filter to process `highlight` tags. -->

### LiquidとJavaScriptを混合するとレンダリングされません
<!-- ### Liquid mixed with JavaScript isn't rendered -->

Liquidの`assign`タグをJavaScriptで使おうとしているとします。

<!-- Suppose you try to mix Liquid's `assign` tag with JavaScript, like this: -->

{% raw %}
```javascript
<button onclick="someFunction()">Click me</button>

<p id="intro"></p>

<script>
{% assign someContent = "This is some content" %}
function someFunction() {
    document.getElementById("intro").innerHTML = someContent;
}
</script>
```
{% endraw %}

`assign`タグはサイトのLiquidレンダリング中のみ使用可能ですので、これは動きません。このJavaScriptの例では、HTMLページでユーザーがボタン（"Click me"）をクリックしたときに実行されます。Liquidロジックはもはや有効ではなく、`assign`タグは何も返しません。

<!-- This won't work because the `assign` tag is only available during the Liquid rendering phase of the site. In this JavaScript example, the script executes when a user clicks a button ("Click me") on the HTML page. At that time, the Liquid logic is no longer available, so the `assign` tag wouldn't return anything. -->

しかしながら、Jekyllサイトの変数やLiquidを、後からスクリプト実行時に*渡す*事もできます。例えば、`someContent: "This is some content"`のfront matterプロパティがあるとします。次のようにできます。

<!-- However, you can use Jekyll's site variables or Liquid to *populate* a script that is executed at a later time. For example, suppose you have the following property in your front matter: `someContent: "This is some content"`. You could do this: -->

{% raw %}
```js
<button onclick="someFunction()">Click me</button>

<p id="intro"></p>

<script>

function someFunction() {
    document.getElementById("intro").innerHTML = "{{ page.someContent }}";
}
</script>
```
{% endraw %}

Jekyllがビルドするときに、`someContent`プロパティをスクリプトの値に渡し、`{% raw %}{{ page.someContent }}{% endraw %}`を`"This is some content"`に変換します。

<!-- When Jekyll builds the site, this `someContent` property populates the script's values, converting `{% raw %}{{ page.someContent }}{% endraw %}` to `"This is some content"`. -->

JekyllがビルドするときにLiquidをレンダリングすることを覚えておいてください。Liquidはブラウザで実行時のユーザーイベントでは利用できません。

<!-- The key to remember is that Liquid renders when Jekyll builds your site. Liquid is not available at run-time in the browser when a user executes an event. -->

## YAMLでのLiquid使用についてのメモ
<!-- ## Note about using Liquid in YAML -->

LiquidはYAMLやfront matterではレンダリングされないことを覚えておいてください。（これは解釈の順番とは関係ありませんが、要素のレンダリングに関する一般的な問題ですので、言及する価値があります。）

<!-- There's one more detail to remember: Liquid does not render when embedded in YAML files or front matter. (This isn't related to order of interpretation, but it's worth mentioning because it's a common question about element rendering.) -->

例えば、`highlight`タグを`_data/mydata.yml`ファイルで使用したい場合を考えます。

<!-- For example, suppose you have a `highlight` tag in your `_data/mydata.yml` file: -->

{% raw %}
```liquid
myvalue: >
  {% highlight javascript %}
  console.log('alert');
  {% endhighlight %}
```
{% endraw %}

ページにこの値を挿入します。

<!-- On a page, you try to insert the value: -->

{% raw %}
```liquid
{{ site.data.mydata.myvalue }}
```
{% endraw %}

これは、構文を強調表示するコードサンプルではなく、文字列として表示されます。 コードをレンダリングするには、代わりにインクルードを使用することを検討してください。

<!-- This would render only as a string rather than a code sample with syntax highlighting. To make the code render, consider using an include instead. -->
