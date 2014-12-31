---
layout: docs
title: Assets
prev_section: datafiles
next_section: migrations
permalink: /docs/assets/
base_revision: 52c76b5d9333a98285db7e04ee7ae8051228ec76[refs/heads/master]
---

<!--original
---
layout: docs
title: Assets
prev_section: datafiles
next_section: migrations
permalink: /docs/assets/
---
-->

Jekyll は Sass と CoffeeScript の組み込みをサポートしています。
それらを使うためには、適切な拡張子名のファイルを作成( `.sass`, `.scss` や `.coffee` の一つ)
し、ファイルを2行の3ダッシュで開始します、このように:

<!--original
Jekyll provides built-in support for Sass and CoffeeScript. In order to use
them, create a file with the proper extension name (one of `.sass`, `.scss`,
or `.coffee`) and start the file with two lines of triple dashes, like this:
-->

{% highlight sass %}
---
---

// コンテンツのはじまり
.my-definition
  font-size: 1.2em
{% endhighlight %}

<!--original
{% highlight sass %}
---
---

// start content
.my-definition
  font-size: 1.2em
{% endhighlight %}
-->

Jekyll はこれらのファイルを通常ページと同一に扱われ、
その中で出力ファイルはもとファイルと同一ディレクトリに配置されます。
例えば、あなたが `css/styles.scss` という名前のファイルを
サイトのソースフォルダに持っていた場合、
Jekyll はそれを処理し、そしてサイトの指定フォルダの下に
`css/styles.css` を配置します。

<!--original
Jekyll treats these files the same as a regular page, in that the output file
will be placed in the same directory that it came from. For instance, if you
have a file named `css/styles.scss` in your site's source folder, Jekyll
will process it and put it in your site's destination folder under
`css/styles.css`.
-->

<div class="note info">
  <h5>Jekyll は asset ファイル中の全ての Liquid フィルタとタグを処理します</h5>
  <p><a href="http://mustache.github.io">Mustache</a> あるいは、
     <a href="/docs/templates/">Liquid template syntax</a> と衝突するその他の
     JavaScript テンプレート言語を使っている場合、
     コードを <code>{&#37; raw &#37;}</code> と <code>{&#37; endraw &#37;}</code>
     タグで囲む必要があります。</p>
</div>

<!--original
<div class="note info">
  <h5>Jekyll processes all Liquid filters and tags in asset files</h5>
  <p>If you are using <a href="http://mustache.github.io">Mustache</a>
     or another JavaScript templating language that conflicts with
     the <a href="/docs/templates/">Liquid template syntax</a>, you
     will need to place <code>{&#37; raw &#37;}</code> and
     <code>{&#37; endraw &#37;}</code> tags around your code.</p>
</div>
-->

## Sass/SCSS

<!--original
## Sass/SCSS
-->

Jekyll は特定の方法で Sass 変換をカスタマイズする事ができます。

<!--original
Jekyll allows you to customize your Sass conversion in certain ways.
-->

import されるファイルはすべて `sass_dir`（デフォルトは`<source>/_sass`）
に配置してください。
メインの SCSS または Sass ファイルは、当該ファイル自体を出力させたいパスに
格納してください。例えば `<source>/css` のように。
[Jekyll での Sass サポートを使用したこちらのサンプルサイト][example-sass]
もご覧ください。

<!--original
Place all your partials in your `sass_dir`, which defaults to
`<source>/_sass`. Place your main SCSS or Sass files in the place you want
them to be in the output file, such as `<source>/css`. For an example, take
a look at [this example site using Sass support in Jekyll][example-sass].
-->

もし、あなたが Sass の `@import` 文を使用している場合は、 Sass ファイルを含む
`sass_dir` が ベースディレクトリに設定されていることを保障する必要があります。
次いで、あなたはこうしてそれを行うことができます:

<!--original
If you are using Sass `@import` statements, you'll need to ensure that your
`sass_dir` is set to the base directory that contains your Sass files. You
can do that thusly:
-->

{% highlight yaml %}
sass:
    sass_dir: _sass
{% endhighlight %}

<!--original
{% highlight yaml %}
sass:
    sass_dir: _sass
{% endhighlight %}
-->

Sass コンバータは `sass_dir` オプションにデフォルトで `_sass` をセットします。

<!--original
The Sass converter will default the `sass_dir` configuration option to
`_sass`.
-->

[example-sass]: https://github.com/jekyll/jekyll-sass-converter/tree/master/example

<!--original
[example-sass]: https://github.com/jekyll/jekyll-sass-converter/tree/master/example
-->

<div class="note info">
  <h5><code>sass_dir</code> は Sass でのみ使用されます</h5>
  <p>

    <code>sass_dir</code> は Sass の import における読み込み対象パスであり、
    それ以上のものではありませんので注意してください。
    つまり、このフォルダのファイルについて Jekyll は直接は関知しないので、
    上述の YAML Front Matter を含めてはいけませんし、上述の変換もされません。
    このフォルダは import 対象のみを配置するようにしてください。

  </p>
</div>

<!--original
<div class="note info">
  <h5>The <code>sass_dir</code> is only used by Sass</h5>
  <p>

    Note that the <code>sass_dir</code> becomes the load path for Sass imports,
    nothing more. This means that Jekyll does not know about these files
    directly, so any files here should not contain the YAML Front Matter as
    described above nor will they be transformed as described above. This
    folder should only contain imports.

  </p>
</div>
-->

また、 `_config.yml` ファイルの `style` オプションで
出力スタイルを設定することもできます。

<!--original
You may also specify the output style with the `style` option in your
`_config.yml` file:
-->

{% highlight yaml %}
sass:
    style: :compressed
{% endhighlight %}

<!--original
{% highlight yaml %}
sass:
    style: :compressed
{% endhighlight %}
-->

これは Sass に渡されたため、
Sass の任意の出力スタイルのオプションサポートはここでも有効になります。

<!--original
These are passed to Sass, so any output style options Sass supports are valid
here, too.
-->
