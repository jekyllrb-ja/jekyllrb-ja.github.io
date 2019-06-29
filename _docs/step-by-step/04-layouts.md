---
layout: step
title: レイアウト
position: 4
---
<!-- ---
layout: step
title: Layouts
position: 4
--- -->

Webサイトには通常複数のページがあり、このWebサイトでも違いはありません。

<!-- Websites typically have more than one page and this website is no different. -->

JekyllはページのためにHTMLと同様[Markdown](https://daringfireball.net/projects/markdown/syntax){:target="_blank"}もサポートしています。MarkdownはHTMLと比較して少ない要素で済み、（段落とヘッダと画像という）シンプルな構成要素のページには素晴らしい選択です。2つ目のページでは、それに挑戦してみましょう。

<!-- Jekyll supports [Markdown](https://daringfireball.net/projects/markdown/syntax)
as well as HTML for pages. Markdown is a great choice for pages with a simple
content structure (just paragraphs, headings and images), as it's less verbose
than raw HTML. Let's try it out on the next page. -->

rootに`about.md`を作成します。

<!-- Create `about.md` in the root. -->

構成は`index.html`をコピーして、aboutページになるよう修正します。これを行う際の問題は、重複しているコードがあることです。スタイルシートをサイトに追加したくなったら、各ページの`<head>`に指定を追加しなければなりません。2ページだけならそう大変には思えないでしょうが、100ページある場合を想像してみてください。簡単な変更でも、長い時間がかかります。

<!-- For the structure you could copy `index.html` and modify it for the about page.
The problem with doing this is duplicate code. Let's say you wanted to add a
stylesheet to your site, you would have to go to each page and add it to the
`<head>`. It might not sound so bad for a two page site, imagine doing it
for 100 pages. Even simple changes will take a long time to make. -->

## レイアウトを作る
<!-- ## Creating a layout -->

レイアウトを使うことは、より良い選択です。レイアウトはコンテンツを包み込むテンプレートです。それらは、`_layouts`に入っています。

<!-- Using a layout is a much better choice. Layouts are templates that wrap around
your content. They live in a directory called `_layouts`. -->

以下の内容で、`_layouts/default.html`にあなたの最初のレイアウトを作りましょう。

<!-- Create your first layout at `_layouts/default.html` with the following content: -->

{% raw %}
```liquid
<!doctype html>
<html>
  <head>
    <meta charset="utf-8">
    <title>{{ page.title }}</title>
  </head>
  <body>
    {{ content }}
  </body>
</html>
```
{% endraw %}

`index.html`とほとんど同じことに気づいたのではないでしょうか。違いは、front matterが無いことと、ページのコンテンツが`content`変数に置き換わっていることです。`content`は特別な変数で、ページが読み込まれたときに、そのレンダリングされたコンテンツを持っています。

<!-- You'll notice this is almost identical to `index.html` except there's
no front matter and the content of the page is replaced with a `content`
variable. `content` is a special variable which has the value of the rendered
content of the page it's called on. -->

`index.html`がこのレイアウトを使う用にするために、front matterに`layout`変数をセットします。レイアウトがコンテンツを包み込むため、`index.html`に入れる必要があるのは、いかが全てです。

<!-- To have `index.html` use this layout, you can set a `layout` variable in front
matter. The layout wraps around the content of the page so all you need in
`index.html` is: -->

{% raw %}
```html
---
layout: default
title: Home
---
<h1>{{ "Hello World!" | downcase }}</h1>
```
{% endraw %}

これを行ったあと、出力は以前と全く同じになります。レイアウトから、`page`のfront matterにアクセスすることができます。今回の場合は、`title`がindexページのfront matterで設定されていますが、レイアウトで出力されています。

<!-- After doing this, the output will be exactly the same as before. Note that you
can access the `page` front matter from the layout. In this case `title` is
set in the index page's front matter but is output in the layout. -->

## Aboutページ
<!-- ## About page -->

aboutページに戻り、`index.html`からコピーする代わりに、レイアウトを使用することができます。

<!-- Back to the about page, instead of copying from `index.html`, you can use the
layout. -->

`about.md`を以下のようにします。

<!-- Add the following to `about.md`: -->

{% raw %}
```html
---
layout: default
title: About
---
# About page

This page tells you a little bit about me.
```
{% endraw %}

<a href="http://localhost:4000/about.html" target="_blank" data-proofer-ignore>http://localhost:4000/about.html</a>をブラウザで開き、新しいページを見てみましょう。

<!-- Open <a href="http://localhost:4000/about.html" target="_blank" data-proofer-ignore>http://localhost:4000/about.html</a>
in your browser and view your new page. -->

おめでとうございます、2つのページのWebサイトができました！　しかし、どうやってあるページから別のページへナビゲートしましょう？　それを見つけるため、引き続き読み進めてください。

<!-- Congratulations, you now have a two page website! But how do you
navigate from one page to another? Keep reading to find out. -->
