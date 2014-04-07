---
layout: docs
title: ページ作成
prev_section: drafts
next_section: variables
permalink: /docs/pages/
---

<!--original
---
layout: docs
title: Creating pages
prev_section: drafts
next_section: variables
permalink: /docs/pages/
---
-->

[Post の書き方](../posts/)に加え、あなたが Jekyll サイトで
やりたいもう一つのことは静的なページを作成することです。
この方法を利用することにより、 Jekyll はファイルとディレクトリを
コピーします、これを行うのは簡単です。

<!--original
In addition to [writing posts](../posts/), another thing you may want to do with
your Jekyll site is create static pages. By taking advantage of the way Jekyll
copies files and directories, this is easy to do.
-->

## ホームページ

<!--original
## Homepage
-->

あなたが遭遇するほぼ全ての Web サーバの設定では、
サイトのルートフォルダで(慣例により) `index.html` と呼ばれる HTML ファイルを探し、
そしてホームページとして表示します。
あなたが使用する Web サーバが、いくつかの他のファイル名を
デフォルトとして探しにいくと設定されていない限り、
このファイルは Jekyll が生成したサイトのホームページに変わります。

<!--original
Just about every web server configuration you come across will look for an HTML
file called `index.html` (by convention) in the site's root folder and display
that as the homepage. Unless the web server you’re using is configured to look
for some different filename as the default, this file will turn into the
homepage of your Jekyll-generated site.
-->

<div class="note">
  <h5>ProTip™: あなたのホームページで layouts を使用する</h5>
  <p>
    あなたのサイトの任意の HTML は layouts そして/または includes を
    ホームページで使うことができます。
    共通のコンテンツは、ヘッダーそしてフッターのように、
    レイアウトへ抽出するための優れた候補を作ります。
  </p>
</div>

<!--original
<div class="note">
  <h5>ProTip™: Use layouts on your homepage</h5>
  <p>
    Any HTML file on your site can use layouts and/or includes, even the
    homepage. Common content, like headers and footers, make excellent
    candidates for extraction into a layout.
  </p>
</div>
-->

## 追加したページの在り処

<!--original
## Where additional pages live
-->

あなたが Page として配置した HTML ファイルが
どのように働いてほしいかは場所に依存します。
Page を作成する主な方法は 2 つあります:

<!--original
Where you put HTML files for pages depends on how you want the pages to work.
There are two main ways of creating pages:
-->

- サイトのルートフォルダ内に各々の Page として 配置した HTML ファイル
- サイトのルートに各々の Page としてフォルダを作成し、各々の Page のフォルダ内に配置した index.html ファイル

<!--original
- Place named HTML files for each page in your site's root folder.
- Create a folder in the site's root for each page, and place an index.html file
  in each page folder.
-->

どちらの方法もうまくいき(そして、お互いに組み合わせて使用することができます)、
唯一の本当の違いは結果の URL です。

<!--original
Both methods work fine (and can be used in conjunction with each other),
with the only real difference being the resulting URLs.
-->

### HTML ファイルの命名

<!--original
### Named HTML files
-->

Page を追加するもっとも単純な方法は、ルートディレクトリ内に
あなたが作成したいと思う適切な名前の HTML ファイルをただ追加することです。
ホームページ、アバウトページやコンタクトページを持つサイトについて、
ルートディレクトリと関連した URL がどのように見えるかここに表します:

<!--original
The simplest way of adding a page is just to add an HTML file in the root
directory with a suitable name for the page you want to create. For a site with
a homepage, an about page, and a contact page, here’s what the root directory
and associated URLs might look like:
-->

{% highlight bash %}
.
|-- _config.yml
|-- _includes/
|-- _layouts/
|-- _posts/
|-- _site/
|-- about.html    # => http://example.com/about.html
|-- index.html    # => http://example.com/
└── contact.html  # => http://example.com/contact.html
{% endhighlight %}

<!--original
{% highlight bash %}
.
|-- _config.yml
|-- _includes/
|-- _layouts/
|-- _posts/
|-- _site/
|-- about.html    # => http://example.com/about.html
|-- index.html    # => http://example.com/
└── contact.html  # => http://example.com/contact.html
{% endhighlight %}
-->

### 名づけられたフォルダが index HTML ファイルを含んでいる場合

<!--original
### Named folders containing index HTML files
-->

上記の方法には何の問題もありませんが、しかしながら、
一部の人々はファイル名の拡張子のようなものがなくても URL を維持したいと思っています。
Jekyll を使用したページできれいな URL を実現するには、
あなたは単純にトップレベルのページにあなたがほしいと思う必要なフォルダを作成し、
そして各ページのフォルダに `index.html`  ファイルを配置します。
この方法では、ページの URL は フォルダ名になり、
Web サーバは `index.html` ファイルを提供します。
ここでは、この構造がどのように見えるかの例を示します:

<!--original
There is nothing wrong with the above method, however some people like to keep
their URLs free from things like filename extensions. To achieve clean URLs for
pages using Jekyll, you simply need to create a folder for each top-level page
you want, and then place an `index.html` file in each page’s folder. This way
the page URL ends up being the folder name, and the web server will serve up the
respective `index.html` file. Here's an example of what this structure might
look like:
-->

{% highlight bash %}
.
├── _config.yml
├── _includes/
├── _layouts/
├── _posts/
├── _site/
├── about/
|   └── index.html  # => http://example.com/about/
├── contact/
|   └── index.html  # => http://example.com/contact/
└── index.html      # => http://example.com/
{% endhighlight %}

<!--original
{% highlight bash %}
.
├── _config.yml
├── _includes/
├── _layouts/
├── _posts/
├── _site/
├── about/
|   └── index.html  # => http://example.com/about/
├── contact/
|   └── index.html  # => http://example.com/contact/
└── index.html      # => http://example.com/
{% endhighlight %}
-->

このアプローチは、すべての人々にはあわないかもしれませんが、
それはきれいな URL を好む人々のために簡単に動作します。
最終的に決定するのはあなた自身です！

<!--original
This approach may not suit everyone, but for people who like clean URLs it’s
simple and it works. In the end the decision is yours!
-->