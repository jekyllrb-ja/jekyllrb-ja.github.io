---
layout: docs
title: 継続的インテグレーション
prev_section: deployment-methods
next_section: troubleshooting
permalink: /docs/continuous-integration/
base_revision: 0fbdc6944041147c2d21b306751b078860b6603b[refs/heads/master]
---

<!--original
---
layout: docs
title: Continuous Integration
prev_section: deployment-methods
next_section: troubleshooting
permalink: /docs/continuous-integration/
---
-->

ひとつ、または複数のバージョンの Ruby でサイトのビルドをテストするのは簡単です。
以下のガイドでは、[GitHub][1] の pull request と関連づけられた [Travis][0] の
無料のビルド環境のセットアップ方法を解説します。
プライベートリポジトリ向けに、有料版もあります。

<!--original
You can easily test your website build against one or more versions of Ruby.
The following guide will show you how to set up a free build environment on
[Travis][0], with [GitHub][1] integration for pull requests. Paid
alternatives exist for private repositories.
-->

[0]: https://travis-ci.org/
[1]: https://github.com/

<!--original
[0]: https://travis-ci.org/
[1]: https://github.com/
-->

## 1. Travis と GitHub を使えるようにする

<!--original
## 1. Enabling Travis and GitHub
-->

GitHub のリポジトリで Travis のビルドを有効にするのは極めて簡単です。

<!--original
Enabling Travis builds for your GitHub repository is pretty simple:
-->

1. travis-ci.org の自分のプロフィールページを開く: https://travis-ci.org/profile/username
2. ビルドを有効にしたいリポジトリを見つける。
3. 右側のスライダをクリックし、濃い灰色で "ON" と表示されるようにする。
4. お好みで、レンチのアイコンをクリックし、ビルドに関する設定を行う。
   さらなる設定は `.travis.yml` で可能。詳細は下記参照。

<!--original
1. Go to your profile on travis-ci.org: https://travis-ci.org/profile/username
2. Find the repository for which you're interested in enabling builds.
3. Click the slider on the right so it says "ON" and is a dark grey.
4. Optionally configure the build by clicking on the wrench icon. Further
   configuration happens in you `.travis.yml` file. More details on that
   below.
-->

## 2. テストスクリプト

<!--original
## 2. The Test Script
-->

最もシンプルなテストスクリプトは、単に `jekyll build` を実行し、
Jekyll がビルドに失敗しないことを確認する、というものです。
この場合、できあがったサイトのチェックはされませんが、
ビルドが適切に行われることは保証されます。

<!--original
The simplest test script simply runs `jekyll build` and ensures that Jekyll
doesn't fail to build the site. It doesn't check the resulting site, but it
does ensure things are built properly.
-->

Jekyll の出力内容をチェックするなら、[html-proofer][2] に
勝るツールはありません。このツールは出力されたサイトをチェックし、
全てのリンクと画像が存在することを保証します。
便利な `htmlproof` コマンドライン実行可能ファイルを使うか、
あるいはこの gem を使う Ruby スクリプトを書くことで利用できます。

<!--original
When testing Jekyll output, there is no better tool than [html-proofer][2].
This tool checks your resulting site to ensure all links and images exist.
Utilize it either with the convenient `htmlproof` command-line executable,
or write a Ruby script which utilizes the gem.
-->

### HTML Proofer 実行可能ファイル

<!--original
### The HTML Proofer Executable
-->

{% highlight bash %}
#!/usr/bin/env bash
set -e # halt script on error

bundle exec jekyll build
bundle exec htmlproof ./_site
{% endhighlight %}

<!--original
{% highlight bash %}
#!/usr/bin/env bash
set -e # halt script on error

bundle exec jekyll build
bundle exec htmlproof ./_site
{% endhighlight %}
-->

コマンドラインスイッチで指定可能なオプションがあります。
`html-proofer` の README で詳細を確認するか、ローカルで
`htmlproof --help` を実行してください。

<!--original
Some options can be specified via command-line switches. Check out the
`html-proofer` README for more information about these switches, or run
`htmlproof --help` locally.
-->

### HTML Proofer ライブラリ

<!--original
### The HTML Proofer Library
-->

`html-proofer` を Ruby スクリプトで起動することもできます（例えば Rakefile などで）。

<!--original
You can also invoke `html-proofer` in Ruby scripts (e.g. in a Rakefile):
-->

{% highlight ruby %}
#!/usr/bin/env ruby

require 'html/proofer'
HTML::Proofer.new("./_site").run
{% endhighlight %}

<!--original
{% highlight ruby %}
#!/usr/bin/env ruby

require 'html/proofer'
HTML::Proofer.new("./_site").run
{% endhighlight %}
-->

オプションは `.new` の第2引数として、シンボルをキーに持つ Ruby のハッシュで
渡されます。設定オプションの詳細は `html-proofer` の README ファイルを参照してください。

<!--original
Options are given as a second argument to `.new`, and are encoded in a
symbol-keyed Ruby Hash. More information about the configuration options,
check out `html-proofer`'s README file.
-->

[2]: https://github.com/gjtorikian/html-proofer

<!--original
[2]: https://github.com/gjtorikian/html-proofer
-->

## 3. Travis のビルドの設定

<!--original
## 3. Configuring Your Travis Builds
-->

このファイルは Travis のビルドの設定を行います。
Jekyll は Ruby で構築され、インストールには RubyGems を必要としますから、
Travis では Ruby 言語のビルド環境を使用します。
下記は `.travis.yml` のサンプルファイルです。
その続きに、各行の解説を記載しています。

<!--original
This file is used to configure your Travis builds. Because Jekyll is built
with Ruby and requires RubyGems to install, we use the Ruby language build
environment. Below is a sample `.travis.yml` file, and what follows that is
an explanation of each line.
-->

{% highlight yaml %}
language: ruby
rvm:
- 2.1
script: ./script/cibuild

# branch whitelist
branches:
  only:
  - gh-pages     # gh-pages ブランチをテストする
  - /pages-(.*)/ # "pages-" で始まる全てのブランチをテストする

env:
  global:
  - NOKOGIRI_USE_SYSTEM_LIBRARIES=true # html-proofer のインストールを高速化する
{% endhighlight %}

<!--original
{% highlight yaml %}
language: ruby
rvm:
- 2.1
script: ./script/cibuild

# branch whitelist
branches:
  only:
  - gh-pages     # test the gh-pages branch
  - /pages-(.*)/ # test every branch which starts with "pages-"

env:
  global:
  - NOKOGIRI_USE_SYSTEM_LIBRARIES=true # speeds up installation of html-proofer
{% endhighlight %}
-->

では、各行の解説をしましょう。

<!--original
Ok, now for an explanation of each line:
-->

{% highlight yaml %}
language: ruby
{% endhighlight %}

<!--original
{% highlight yaml %}
language: ruby
{% endhighlight %}
-->

この行は Travis に Ruby のビルドコンテナを使うよう指示します。
これによりスクリプトで Bundler, RubyGems, Ruby ランタイムへのアクセスが許可されます。

<!--original
This line tells Travis to use a Ruby build container. It gives your script
access to Bundler, RubyGems, and and Ruby runtime.
-->

{% highlight yaml %}
rvm:
- 2.1
{% endhighlight %}

<!--original
{% highlight yaml %}
rvm:
- 2.1
{% endhighlight %}
-->

RVM はポピュラーな Ruby のバージョンマネージャです（rbenv, chruby のような）。
このディレクティブは Travis に、テスト実行時に使用すべき Ruby のバージョンを指示します。

<!--original
RVM is a popular Ruby Version Manager (like rbenv, chruby, etc). This
directive tells Travis the Ruby version to use when running your test
script.
-->

{% highlight yaml %}
script: ./script/cibuild
{% endhighlight %}

<!--original
{% highlight yaml %}
script: ./script/cibuild
{% endhighlight %}
-->

Travis ではサイトのテスト時に任意のスクリプトを実行させることが可能です。
ある規約によれば、プロジェクトの全てのスクリプトを `script` ディレクトリに配置し、
テストスクリプトを `cibuild` と命名します。
この行は完全にカスタマイズ可能です。もしテストスクリプトが今後も大きく
変わらないようなら、テストのおまじないを以下のように直接書いてしまうこともできます。

<!--original
Travis allows you to run any arbitrary shell script to test your site. One
convention is to put all scripts for your project in the `script`
directory, and to call your test script `cibuild`. This line is completely
customizable. If your script won't change much, you can write your test
incantation here directly:
-->

{% highlight yaml %}
script: jekyll build && htmlproof ./_site
{% endhighlight %}

<!--original
{% highlight yaml %}
script: jekyll build && htmlproof ./_site
{% endhighlight %}
-->

`script` ディレクティブはシェルコマンドとして有効なものならなんでも記述可能です。

<!--original
The `script` directive can be absolutely any valid shell command.
-->

{% highlight yaml %}
# branch whitelist
branches:
  only:
  - gh-pages     # gh-pages ブランチをテストする
  - /pages-(.*)/ # "pages-" で始まる全てのブランチをテストする
{% endhighlight %}

<!--original
{% highlight yaml %}
# branch whitelist
branches:
  only:
  - gh-pages     # test the gh-pages branch
  - /pages-(.*)/ # test every branch which starts with "pages-"
{% endhighlight %}
-->

Travis におけるビルドが、サイトのコンテンツを含むブランチのみで
実行されることを保証する必要があります。
この切り分けを保証する一つの手段は、Travis の設定ファイルに
ブランチのホワイトリストを記述するというものです。
`gh-pages` ブランチを指定することで、サイトに紐付く（上述の）テストスクリプトが
サイトのブランチのみで実行されることが保証されます。
サイトの変更の提出のために pull request フローを使用しているのであれば、
上記で正規表現 `/pages-(.*)/` の例示があるとおり、
サイト編集のブランチ名にプレフィックスをつけるよう規約で強制するのが
よいかもしれません。

<!--original
You want to ensure the Travis builds for your site are being run only on
the branch or branches which contain your site. One means of ensuring this
isolation is including a branch whitelist in your Travis configuration
file. By specifying the `gh-pages` branch, you will ensure the associated
test script (discussed above) is only executed on site branches. If you use
a pull request flow for proposing changes, you may wish to enforce a
convention for your builds such that all branches containing edits are
prefixed, exemplified above with the `/pages-(.*)/` regular expression.
-->

`branches` ディレクティブは全く指定しなくても構いません。

<!--original
The `branches` directive is completely optional.
-->

{% highlight yaml %}
env:
  global:
  - NOKOGIRI_USE_SYSTEM_LIBRARIES=true # html-proofer のインストールを高速化する
{% endhighlight %}

<!--original
{% highlight yaml %}
env:
  global:
  - NOKOGIRI_USE_SYSTEM_LIBRARIES=true # speeds up installation of html-proofer
{% endhighlight %}
-->

`html-proofer` を使っていますか？ それならこの環境変数が必要でしょう。
コンパイル済みのサイトの HTML ファイルをパースするのに使われる Nokogiri には、
インストールのたびにコンパイルが必要になるようなライブラリがバンドルされています。
幸いなことに、環境変数 `NOKOGIRI_USE_SYSTEM_LIBRARIES` を `true` に設定することで
Nokogiri のインストールにかかる時間を劇的に短縮できます。

<!--original
Using `html-proofer`? You'll want this environment variable. Nokogiri, used
to parse HTML files in your compiled site, comes bundled with libraries
which it must compile each time it is installed. Luckily, you can
dramatically increase the install time of Nokogiri by setting the
environment variable `NOKOGIRI_USE_SYSTEM_LIBRARIES` to `true`.
-->

## 4. ここがポイント

<!--original
## 4. Gotchas
-->

### `vendor` を exclude する

<!--original
### Exclude `vendor`
-->

Travis はビルドサーバにおいて、すべての gem を `vendor` ディレクトリ内に
bundle しますから、Jekyll はそれを誤って読み込み、パンクしてしまいます。
これを避けるためには、`_config.yml` 内で `vendor` を exclude しておきます。

<!--original
Travis bundles all gems in the `vendor` directory on its build servers,
which Jekyll will mistakenly read and explode on. To avoid this, exclude
`vendor` in your `_config.yml`:
-->

{% highlight yaml %}
exclude: [vendor]
{% endhighlight %}

<!--original
{% highlight yaml %}
exclude: [vendor]
{% endhighlight %}
-->

### 質問、ありますか？

<!--original
### Questions?
-->

このガイドはすべてオープンソースです。もし修正案がおありでしたら
ご自由に[編集して][3]ください。
トラブルに巻き込まれて、ヘルプが必要な場合は[教えて][4]ください。

<!--original
This entire guide is open-source. Go ahead and [edit it][3] if you have a
fix or [ask for help][4] if you run into trouble and need some help.
-->

[3]: https://github.com/jekyll/jekyll/edit/master/site/docs/continuous-integration.md
[4]: https://github.com/jekyll/jekyll-help#how-do-i-ask-a-question

<!--original
[3]: https://github.com/jekyll/jekyll/edit/master/site/docs/continuous-integration.md
[4]: https://github.com/jekyll/jekyll-help#how-do-i-ask-a-question
-->
