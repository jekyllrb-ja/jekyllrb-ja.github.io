---
title: Assets
permalink: /docs/assets/
---

Jekyllは[Sass](https://sass-lang.com/){:target="_blank"}の組み込みをサポートし、Ruby gemで[CoffeeScript](https://coffeescript.org/){:target="_blank"}を使用することができます。これらを使用するには、適切な拡張子（`.sass`か`.scss`か`.coffee`）のファイルを作成し、下記のように***2行の3つのダッシュで始める***必要があります。

<!-- Jekyll provides built-in support for [Sass](https://sass-lang.com/)
and can work with [CoffeeScript](https://coffeescript.org/) via a Ruby gem.
In order to use them, you must first create a file with the proper extension
name (one of `.sass`, `.scss`, or `.coffee`) and
***start the file with two lines of triple dashes***, like this: -->

```sass
---
---

// start content
.my-definition
  font-size: 1.2em
```

Jekyllはこれらのファイルを他の通常のページと同じように扱い、同じディレクトリ配置になるように出力先に配置します。例えば、サイトのソースフォルダに`css/styles.scss`というファイルがあった場合、Jekyllは処理を行い、出力先のフォルダに`css/styles.css`を作成します。

<!-- Jekyll treats these files the same as a regular page, in that the output file
will be placed in the same directory that it came from. For instance, if you
have a file named `css/styles.scss` in your site's source folder, Jekyll
will process it and put it in your site's destination folder under
`css/styles.css`. -->

<div class="note info">
  <h5>JekyllはAssetファイルの全てのLiquidタグとフィルタを処理します。</h5>
  <!-- <h5>Jekyll processes all Liquid filters and tags in asset files</h5> -->
  <p><a href="{{ "docs/templates/" | relative_url }}">Liquidテンプレート文法</a>と競合する<a href="https://mustache.github.io" target="_blank">Mustache</a>
     や他のJavaScriptテンプレート言語を使用している場合、コードを<code>{&#37; raw &#37;}</code>と<code>{&#37; endraw &#37;}</code>で囲む必要があります。</p>
     <!-- <p>If you are using <a href="https://mustache.github.io">Mustache</a>
        or another JavaScript templating language that conflicts with
        the <a href="/docs/templates/">Liquid template syntax</a>, you
        will need to place <code>{&#37; raw &#37;}</code> and
        <code>{&#37; endraw &#37;}</code> tags around your code.</p> -->
</div>

## Sass/SCSS

Jekyllは、Sassの変換を特定の方法でカスタマイズできるようにします。

<!-- Jekyll allows you to customize your Sass conversion in certain ways. -->

全ての部品を`sass_dir`に配置します。デフォルトは、`<source>/_sass`です。メインのSCSSやSassファイルを、`<source>/css`のような出力後に配置したいフォルダに入れます。例は、[JekyllでSassをサポートしている例][example-sass]を見てください。

<!-- Place all your partials in your `sass_dir`, which defaults to
`<source>/_sass`. Place your main SCSS or Sass files in the place you want
them to be in the output file, such as `<source>/css`. For an example, take
a look at [this example site using Sass support in Jekyll][example-sass]. -->

Sass `@import`を使用している場合は、`sass_dir`がSassファイルのベースディテクとりに設定されていることを確認してください。

<!-- If you are using Sass `@import` statements, you'll need to ensure that your
`sass_dir` is set to the base directory that contains your Sass files: -->

```yaml
sass:
    sass_dir: _sass
```

Sassコンバータは`sass_dir`をデフォルトで`_sass`に設定します。

<!-- The Sass converter will default the `sass_dir` configuration option to
`_sass`. -->

[example-sass]: https://github.com/jekyll/jekyll-sass-converter/tree/master/docs

<div class="note info">
  <h5><code>sass_dir</code>はSassにのみ使用できます。</h5>
  <!-- <h5>The <code>sass_dir</code> is only used by Sass</h5> -->
  <p>

    <code>sass_dir</code>はSassをインポートするためのロードパスになるだけで、それ以外ではないことに注意してください。Jekyllはこのディレクトリのファイルは知らないということを意味します。ここのファイルには空のfront matterを含めるべきではありません。含んでいたとしても、変換されることはありません。このフォルダは、インポート用のファイルのみです。
  </p>
  <!-- <p>

    Note that the <code>sass_dir</code> becomes the load path for Sass imports,
    nothing more. This means that Jekyll does not know about these files
    directly. Any files here should not contain the empty front matter as
    described above. If they do, they'll not be transformed as described above. This
    folder should only contain imports.

  </p> -->
</div>

`_config.yml`ファイルの`style`で出力スタイルを指定することもできます。

<!-- You may also specify the output style with the `style` option in your
`_config.yml` file: -->

```yaml
sass:
    style: compressed
```

これらはSassに渡されるので、Sassがサポートする出力スタイルオプションはすべて、ここでも有効です。

<!-- These are passed to Sass, so any output style options Sass supports are valid
here, too. -->


## Coffeescript

CoffeeScriptはJekyll 3.0以上で有効です。

<!-- To enable Coffeescript in Jekyll 3.0 and up you must -->

* `jekyll-coffeescript` gemをインストールします
* `_config.yml`に下記を確実に書き込んでください。

<!-- * Install the `jekyll-coffeescript` gem
* Ensure that your `_config.yml` is up-to-date and includes the following: -->

```yaml
plugins:
  - jekyll-coffeescript
```
