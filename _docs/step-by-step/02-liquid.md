---
layout: step
title: Liquid
position: 2
---

LiquidでJekyllはもっと面白くなります。Liquidは3つの主なパート：[オブジェクト](#objects)、[タグ](#tags)、[フィルタ](#filters)を持つテンプレート言語です。

<!-- Liquid is where Jekyll starts to get more interesting. Liquid is a templating
language which has three main parts: [objects](#objects), [tags](#tags) and
[filters](#filters). -->


## オブジェクト {#objects}
<!-- ## Objects -->

ObjectはLiquidにコンテンツを出力する場所を指示します。2つの中括弧：{% raw %}`{{`{% endraw %}と{% raw %}`}}`{% endraw %}で示します。例えば、

<!-- Objects tell Liquid where to output content. They're denoted by double curly
braces: {% raw %}`{{`{% endraw %} and {% raw %}`}}`{% endraw %}. For example: -->

{% raw %}
```liquid
{{ page.title }}
```
{% endraw %}

ページに`page.title`という変数の内容を出力します。

<!-- Outputs a variable called `page.title` on the page. -->

## タグ {#tags}
<!-- ## Tags -->

タグはロジックを作成し、テンプレートの流れをコントロールします。中括弧とパーセント：{% raw %}`{%`{% endraw %}と{% raw %}`%}`{% endraw %}で示します。例えば、

<!-- Tags create the logic and control flow for templates. They are denoted by curly
braces and percent signs: {% raw %}`{%`{% endraw %} and
{% raw %}`%}`{% endraw %}. For example: -->

{% raw %}
```liquid
{% if page.show_sidebar %}
  <div class="sidebar">
    sidebar content
  </div>
{% endif %}
```
{% endraw %}

もし`page.show_sidebar`がtrueなら、サイドバーを出力します。Jekyllで使用できるタグについては、[こちら]({{ "/docs/liquid/tags/" | relative_url }})をご確認ください。

<!-- Outputs the sidebar if `page.show_sidebar` is true. You can learn more about the
tags available to Jekyll [here](/docs/liquid/tags/). -->

## フィルタ {#filters}
<!-- ## Filters -->

フィルタはLiquidオブジェクトの出力を変更します。アプトプットの中で使用し、`|`で区切ります。例えば、

<!-- Filters change the output of a Liquid object. They are used within an output
and are separated by a `|`. For example: -->

{% raw %}
```liquid
{{ "hi" | capitalize }}
```
{% endraw %}

`Hi`が出力されます。Jekyllで使用できるフィルタについては、[こちら]({{ "/docs/liquid/filters/" | relative_url }})をご確認ください。

<!-- Outputs `Hi`. You can learn more about the filters available to Jekyll
[here](/docs/liquid/filters/). -->

## Liquidを使う
<!-- ## Use Liquid -->

あなたの番です。ページのHello World!を小文字での出力に変更しましょう。

<!-- Now it's your turn, change the Hello World! on your page to output as lowercase: -->

{% raw %}
```liquid
...
<h1>{{ "Hello World!" | downcase }}</h1>
...
```
{% endraw %}

変更をJekyllが処理するには、ページの先頭に[front matter](../03-front-matter/)を追加する必要があります。

<!-- To get our changes processed by Jekyll we need to add [front matter](../03-front-matter/) to the top of the page: -->

```markdown
---
# front matter tells Jekyll to process Liquid
---
```

"Hello World!"はレンダリング時に小文字になります。

<!-- Our "Hello World!" will now be downcased on render. -->

今は何もないように見えるかもしれませんが、JekyllはLiquidや他の機能と組み合わせることで、大きな力を発揮します。

<!-- It may not seem like it now, but much of Jekyll's power comes from combining
Liquid with other features.  -->

`downcase`のLiquidフィルタによる変更を見るには、front matterを追加する必要があります。

<!-- In order to see the changes from `downcase` Liquid filter, we will need to add front matter.  -->

歩みを止めず、次へ進みましょう。

<!-- That's next. Let's keep going. -->
