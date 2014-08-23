---
layout: docs
title: Assets
prev_section: datafiles
next_section: migrations
permalink: /docs/assets/
base_revision: 0fbdc6944041147c2d21b306751b078860b6603b[refs/heads/master]
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
例えば、あなたが `/css/styles.scss` という名前のファイルを
サイトのソースフォルダに持っていた場合、
Jekyll はそれを処理し、そしてサイトの指定フォルダの下に
`/css/styles.css` を配置します。

<!--original
Jekyll treats these files the same as a regular page, in that the output file
will be placed in the same directory that it came from. For instance, if you
have a file named `/css/styles.scss` in your site's source folder, Jekyll
will process it and put it in your site's destination folder under
`/css/styles.css`.
-->

## Sass/SCSS

<!--original
## Sass/SCSS
-->

Jekyll は特定の方法で Sass 変換をカスタマイズする事ができます。

<!--original
Jekyll allows you to customize your Sass conversion in certain ways.
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

Sass コンバータはデフォルトで `_sass` を設定します。

<!--original
The Sass converter will default to `_sass`.
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
