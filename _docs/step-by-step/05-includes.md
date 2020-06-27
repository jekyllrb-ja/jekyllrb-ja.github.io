---
layout: step
title: Includes（インクルード）
position: 5
---
<!-- ---
layout: step
title: Includes
position: 5
--- -->

サイトは一緒にできていますが、ページ間を移動する方法がありません。そこを修正していきましょう。

<!-- The site is coming together; however, there's no way to navigate between
pages. Let's fix that. -->

ナビゲーションは全てのページにあるべきですので、レイアウトに追加するのが正しいです。レイアウトに直接追加するのではなく、インクルードについて学ぶ機会に使いましょう。

<!-- Navigation should be on every page so adding it to your layout is the correct
place to do this. Instead of adding it directly to the layout, let's use this
as an opportunity to learn about includes. -->

## インクルードタグ
<!-- ## Include tag -->

`include`タグは、`_includes`フォルダにある別のファイルを読み込むことを可能にします。インクルードはサイト内で繰り返されるコードを一つにしたり、読みやすさを向上させるのに役立ちます。

<!-- The `include` tag allows you to include content from another file stored
in an `_includes` folder. Includes are useful for having a single source for
source code that repeats around the site or for improving the readability. -->

ナビゲーションのソースコードは複雑になる可能性があるため、インクルードに移動する方が場合があります。

<!-- Navigation source code can get complex so sometimes it's nice to move it into an
include.  -->

## インクルードの使い方
<!-- ## Include usage -->

以下の内容のナビゲーションファイルを`_includes/navigation.html`として作成します。

<!-- Create a file for the navigation at `_includes/navigation.html` with the
following content: -->

```
<nav>
  <a href="/">Home</a>
  <a href="/about.html">About</a>
</nav>
```

インクルードタグを使用して、`_layouts/default.html`にナビゲーションを追加してみましょう。

<!-- Try using the include tag to add the navigation to `_layouts/default.html`: -->

{% raw %}
```liquid
<!doctype html>
<html>
  <head>
    <meta charset="utf-8">
    <title>{{ page.title }}</title>
  </head>
  <body>
    {% include navigation.html %}
    {{ content }}
  </body>
</html>
```
{% endraw %}

<a href="http://localhost:4000" target="_blank" data-proofer-ignore>http://localhost:4000</a>をブラウザで開いて、ページの移動をやってみましょう。

<!-- Open <a href="http://localhost:4000" target="_blank" data-proofer-ignore>http://localhost:4000</a>
in your browser and try switching between the pages. -->

## 現在のページを強調
<!-- ## Current page highlighting -->

更に一歩進んで、ナビゲーションの現在のページを強調してみましょう。

<!-- Let's take this a step further and highlight the current page in the navigation. -->

スタイルを追加するためには、`_includes/navigation.html`が挿入されるページのURLを知っている必要があります。Jekyllでは便利な[変数]({{ "/docs/variables/" | relative_url }})を使用でき、その一つが`page.url`です。

<!-- `_includes/navigation.html` needs to know the URL of the page it's inserted into
so it can add styling. Jekyll has useful [variables](/docs/variables/) available
one of which is `page.url`. -->

`page.url`を使用して各リンクが現在のページなのかを確認し、そうなら色を赤にします。

<!-- Using `page.url` you can check if each link is the current page and color it red
if true: -->

{% raw %}
```liquid
<nav>
  <a href="/" {% if page.url == "/" %}style="color: red;"{% endif %}>
    Home
  </a>
  <a href="/about.html" {% if page.url == "/about.html" %}style="color: red;"{% endif %}>
    About
  </a>
</nav>
```
{% endraw %}

<a href="http://localhost:4000" target="_blank" data-proofer-ignore>http://localhost:4000</a>を見て、現在のページがレッドリンクになっていることを確認してください。

<!-- Take a look at <a href="http://localhost:4000" target="_blank" data-proofer-ignore>http://localhost:4000</a>
and see your red link for the current page. -->

ナビゲーションに新しい項目を追加したり、ハイライトの色を変更したい場合は、ここでも多くの繰り返しがあります。次のステップでは、これに対処します。

<!-- There's still a lot of repetition here if you wanted to add a new item to the
navigation or change the highlight color. In the next step we'll address this. -->
