---
layout: step
title: Assets
position: 7
---

JekyllでCSSやJS、画像その他のファイルを使うのは、簡単です。サイトのフォルダにそれらを入れれば、サイトを構築する家庭でコピーされます。

<!-- Using CSS, JS, images and other assets is straightforward with Jekyll. Place
them in your site folder and they’ll copy across to the built site. -->

Jekyllのサイトでは、ファイルを整理するために次のような構成を取ることが多いです。

<!-- Jekyll sites often use this structure to keep assets organized: -->

```sh
.
├── assets
|   ├── css
|   ├── images
|   └── js
...
```

## Sass

`_includes/navigation.html`のインラインスタイルは、ベストではありません。classを使用して、現在のページの表示スタイルを設定してみましょう。

<!-- The inline styles used in `_includes/navigation.html` is not a best practice,
let's style the current page with a class instead. -->

{% raw %}
```liquid
<nav>
  {% for item in site.data.navigation %}
    <a href="{{ item.link }}" {% if page.url == item.link %}class="current"{% endif %}>{{ item.name }}</a>
  {% endfor %}
</nav>
```
{% endraw %}

スタイル設定のために一般的なCSSを使用することもできますが、このステップでは[Sass](https://sass-lang.com/){:target="_blank"}を使ってみましょう。SassはJekyllに組み込まれているCSSの素晴らしい拡張機能です。

<!-- You could use a standard CSS file for styling, we're going to take it a step
further by using [Sass](https://sass-lang.com/). Sass is a fantastic extension
to CSS baked right into Jekyll. -->

まず、以下の内容で`/assets/css/styles.scss`のファイルを作成します。

<!-- First create a Sass file at `/assets/css/styles.scss` with the following content: -->

{% raw %}
```css
---
---
@import "main";
```
{% endraw %}

冒頭にある空のfront matterは、Jekyllに処理が必要なファイルだと知らせるためのものです。`@import "main"`は、Sassへのsassディレクトリ（デフォルトではサイトのrootの`_sass/`）の`main.scss`というファイルを探すようにという指示です。

<!-- The empty front matter at the top tells Jekyll it needs to process the file. The
`@import "main"` tells Sass to look for a file called `main.scss` in the sass
directory (`_sass/` by default which is directly under root folder of your website). -->

この段階では、メインのcssファイルのみです。より大きなプロジェクトでは、CSSを整理するための素晴らしい方法になります。

<!-- At this stage you'll just have a main css file. For larger projects, this is a
great way to keep your CSS organized. -->

以下の内容で、`/_sass/main.scss`を作成します。

<!-- Create a Sass file at `/_sass/main.scss` with the following content: -->

```sass
.current {
  color: green;
}
```

レイアウトで、スタイルシートを参照するようにする必要があります。

<!-- You'll need to reference the stylesheet in your layout. -->

`_layouts/default.html`を開き、`<head>`にスタイルシートの参照を追加します。

<!-- Open `_layouts/default.html` and add the stylesheet to the `<head>`: -->

{% raw %}
```liquid
<!doctype html>
<html>
  <head>
    <meta charset="utf-8">
    <title>{{ page.title }}</title>
    <link rel="stylesheet" href="/assets/css/styles.css">
  </head>
  <body>
    {% include navigation.html %}
    {{ content }}
  </body>
</html>
```
{% endraw %}

<a href="http://localhost:4000" target="_blank" data-proofer-ignore>http://localhost:4000</a>を読み込み、ナビゲーションのそのページへのリンクが緑になっていることを確認しましょう。

<!-- Load up <a href="http://localhost:4000" target="_blank" data-proofer-ignore>http://localhost:4000</a>
and check the active link in the navigation is green. -->

次は、Jekyllの最もポピュラーな機能、ブログについて見てみましょう。

<!-- Next we're looking at one of Jekyll's most popular features, blogging. -->
