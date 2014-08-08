---
layout: docs
title: アップグレード
prev_section: resources
next_section: contributing
permalink: /docs/upgrading/
base_revision: 0fbdc6944041147c2d21b306751b078860b6603b[refs/heads/master]
---

<!--original
---
layout: docs
title: Upgrading
prev_section: resources
next_section: contributing
permalink: /docs/upgrading/
---
-->

Jekyllの古いバージョンからのアップグレードですね？関心があると思われるいくつかの事項が1.0で変更されました。

<!--original
Upgrading from an older version of Jekyll? A few things have changed in 1.0
that you'll want to know about.
-->

作業に入る前に、まずはJekyllの最新版を取得します。

<!--original
Before we dive in, go ahead and fetch the latest version of Jekyll:
-->

{% highlight bash %}
$ gem update jekyll
{% endhighlight %}

<!--original
{% highlight bash %}
$ gem update jekyll
{% endhighlight %}
-->

<div class="note feature">
  <h5 markdown="1">始めてみる</h5>
  <p markdown="1">最新のJekyllサイトを直ぐに立ち上げたいですか？それなら単に<code>jekyll new SITENAME</code>を実行すれば、最低限のJekyllサイトを備えた新しいフォルダが得られます。
   </p>
</div>

<!--original
<div class="note feature">
  <h5 markdown="1">Diving in</h5>
  <p markdown="1">Want to get a new Jekyll site up and running quickly? Simply
   run <code>jekyll new SITENAME</code> to create a new folder with a bare bones
   Jekyll site.</p>
</div>
-->

### Jekyllコマンド

<!--original
### The Jekyll Command
-->

より明確にする目的で、Jekyllは`build`と`serve`というコマンドを受けるようになりました。以前は、サイトを生成するのに`jekyll`コマンドだけを実行し、ローカルでこれを見るのに`jekyll --server`を実行していましたが、今度は同じことをするのに、`jekyll build`および`jekyll serve`サブコマンドを使います。さらに、ファイルが変更されるたびにJekyllが自動で再構築をするようにしたいときは、`--watch`フラグをその最後に追加すればいいです。

<!--original
For better clarity, Jekyll now accepts the commands `build` and `serve`.
Whereas before you might simply run the command `jekyll` to generate a site
and `jekyll --server` to view it locally, now use the subcommands `jekyll build`
and `jekyll serve` to do the same. And if you want Jekyll to automatically
rebuild each time a file changes, just add the `--watch` flag at the end.
-->

<div class="note info">
  <h5>watchフラグとserveサブコマンド</h5>
  <p markdown="1">新たなサブコマンドにおいては、ローカルでサイトをプレビューする方法が少し変更されています。
  サイトの設定ファイルにおいて`server: true`を指定する代わりに、`jekyll serve`を使います。`watch: true`についても同様で、代わりに、`jekyll serve`および`jekyll build`で`--watch`フラグを使います。
   </p>
</div>

<!--original
<div class="note info">
  <h5>Watching and Serving</h5>
  <p markdown="1">With the new subcommands, the way sites are previewed locally
   changed a bit. Instead of specifying `server: true` in the site's
   configuration file, use `jekyll serve`. The same hold's true for
   `watch: true`. Instead, use the `--watch` flag with either `jekyll serve`
    or `jekyll build`.</p>
</div>
-->

### 絶対パーマリンク

<!--original
### Absolute Permalinks
-->

Jekyllのv1.0で、サブディレクトリ内のpageのための絶対パーマリンクが導入されましたが、これはv2.0までは**オプトイン**（その指定が必要）です。しかし、v2.0以降では、絶対パーマリンクは**オプトアウト**になります。つまり、Jekyllのデフォルトでは相対パーマリンクではなく、絶対パーマリンクを使うようになります。

<!--original
In Jekyll v1.0, we introduced absolute permalinks for pages in subdirectories.
Until v2.0, it is **opt-in**. Starting with v2.0, however, absolute permalinks
will become **opt-out**, meaning Jekyll will default to using absolute permalinks
instead of relative permalinks.
-->

* 絶対パーマリンクを使用する場合は、設定ファイル内で`relative_permalinks: false`を設定します。
* 引き続き相対パーマリンクを使う場合は、設定ファイル内で`relative_permalinks: true`を設定します。

<!--original
* To use absolute permalinks, set `relative_permalinks: false` in your configuration file.
* To continue using relative permalinks, set `relative_permalinks: true` in your configuration file.
-->

<div class="note warning" id="absolute-permalinks-warning">
  <h5 markdown="1">絶対パーマリンクはv2.0からデフォルトに</h5>
  <p markdown="1">
    Jekyllのv2.0以降、`relative_permalinks`はデフォルトで`false`になります。つまり、すべてのページは絶対パーマリンクに基づき構築されます。
    この設定項目はv2.0までは存在します。
  </p>
</div>

<!--original
<div class="note warning" id="absolute-permalinks-warning">
  <h5 markdown="1">Absolute permalinks will be default in v2.0 and on</h5>
  <p markdown="1">
    Starting with Jekyll v2.0, `relative_permalinks` will default to `false`,
    meaning all pages will be built using the absolute permalink behaviour.
    The switch will still exist until v2.0.
  </p>
</div>
-->

### 下書き投稿(Draft Posts)

<!--original
### Draft Posts
-->

Jekyllで、下書き投稿ができるようになり、これによって公開前に簡単にその見た目をプレビューできます。下書きを始めるには、`_drafts`というフォルダをサイトのソースディレクトリに(つまり`_posts`と並んで)作り、そこに新たなmarkdownファイルを追加するだけです。この新しいpostをプレビューするには、`jekyll serve`コマンドを`--drafts`フラグ付きで実行すればいいです。

<!--original
Jekyll now lets you write draft posts, and allows you to easily preview how
they will look prior to publishing. To start a draft, simply create a folder
called `_drafts` in your site's source directory (e.g., alongside `_posts`),
and add a new markdown file to it. To preview your new post, simply run the
`jekyll serve` command with the `--drafts` flag.
-->

<div class="note info">
  <h5 markdown="1">下書きは日付けを持たない</h5>
  <p markdown="1">
    postと異なり、下書きは公開されていないものなので、日付けを持ちません。
    下書きには、`2013-07-01-my-draft-post.md`といったファイル名を付けるのではなく、最終的な投稿のタイトルになるようなファイル名(この例では`my-draft-post.md`)を付けます。</p>
</div>

<!--original
<div class="note info">
  <h5 markdown="1">Drafts don't have dates</h5>
  <p markdown="1">
    Unlike posts, drafts don't have a date, since they haven't
    been published yet. Rather than naming your draft something like
    `2013-07-01-my-draft-post.md`, simply name the file what you'd like your
    post to eventually be titled, here `my-draft-post.md`.</p>
</div>
-->

### カスタム設定ファイル

<!--original
### Custom Config File
-->

コマンドラインを通して個々のフラグを渡すことに代えて、それらが揃ったカスタムJekyll設定ファイルを渡すことができるようになりました。これは、複数環境を区別したり、あるいはユーザ指定のデフォルトをプログラムで上書きしたりするときに役立ちます。`--config`フラグを`jekyll`コマンドに付加し、１または複数の設定ファイルをそれに続ければいいです(コンマ区切り、空白無し)。

<!--original
Rather than passing individual flags via the command line, you can now pass an
entire custom Jekyll config file. This helps to distinguish between
environments, or lets you programmatically override user-specified defaults.
Simply add the `--config` flag to the `jekyll` command, followed by the path
to one or more config files (comma-delimited, no spaces).
-->

#### 以下のコマンドラインのフラグは非推奨となりました

<!--original
#### As a result, the following command line flags are now deprecated:
-->

* `--no-server`
* `--no-auto`
* `--auto` (now `--watch`)
* `--server`
* `--url=`
* `--maruku`, `--rdiscount`, and `--redcarpet`
* `--pygments`
* `--permalink=`
* `--paginate`

<!--original
* `--no-server`
* `--no-auto`
* `--auto` (now `--watch`)
* `--server`
* `--url=`
* `--maruku`, `--rdiscount`, and `--redcarpet`
* `--pygments`
* `--permalink=`
* `--paginate`
-->

<div class="note info">
  <h5>設定フラグで設定ファイルを明示的に指定する</h5>
  <p markdown="1">`--config`フラグを使うと、Jekyllは`_config.yml`ファイルを無視します。カスタム設定を通常の設定に統合したいですか？問題はありません。Jekyllはコマンドラインを通して、複数のカスタム設定ファイルを取ることができます。設定ファイルは、右から左に重ねられます。つまり仮に、`jekyll serve --config _config.yml,_config-dev.yml`を実行した場合、これらの設定ファイルが同じキーを持っていたなら、右側の設定ファイル(`_config-dev.yml`)の値が、左側(`_config.yml`)の値を上書きします。</p>
</div>

<!--original
<div class="note info">
  <h5>The config flag explicitly specifies your configuration file(s)</h5>
  <p markdown="1">If you use the `--config` flag, Jekyll will ignore your
    `_config.yml` file. Want to merge a custom configuration with the normal
    configuration? No problem. Jekyll will accept more than one custom config
    file via the command line. Config files cascade from right to left, such
    that if I run `jekyll serve --config _config.yml,_config-dev.yml`,
    the values in the config files on the right (`_config-dev.yml`) overwrite
    those on the left (`_config.yml`) when both contain the same key.</p>
</div>
-->

### 新しい設定ファイルのオプション

<!--original
### New Config File Options
-->

Jekyll1.0では、いくつかの新しい設定ファイルのオプションが導入されました。アップグレードの前に、以下に示すオプションがあなたの1.0以前の設定ファイルに存在しているかどうかを調べ、もし存在しているなら、それらが適切に使われているかを確認して下さい。

<!--original
Jekyll 1.0 introduced several new config file options. Before you upgrade, you
should check to see if any of these are present in your pre-1.0 config file, and
if so, make sure that you're using them properly:
-->

* `excerpt_separator`
* `host`
* `include`
* `keep_files`
* `layouts`
* `show_drafts`
* `timezone`
* `url`

<!--original
* `excerpt_separator`
* `host`
* `include`
* `keep_files`
* `layouts`
* `show_drafts`
* `timezone`
* `url`
-->

### ベースURL(Baseurl)

<!--original
### Baseurl
-->

Jekyllによるサイトを複数の場所で起動させる機能が欲しいことがよくあります(GitHub Pagesに公開する前にローカルでプレビューする場合など)。Jekyll1.0では、新たな`--baseurl`フラグでこれを簡単に実現できます。この機能を活かすには、最初にサイトの`_config.yml`ファイルに本番環境の`baseurl`を追加します。そして、サイト全体にわたって相対URLに`{% raw %}{{ site.baseurl }}{% endraw %}`を前置すればいいです。
サイトをローカルでプレビューする準備が整ったなら、`jekyll serve`に`--baseurl`フラグをローカルのベースURL(通常は`/`)と共に渡せば、Jekyllは渡されたものに入れ替え、これにより双方の環境ですべてのリンクが期待通りに機能することを保証します。

<!--original
Often, you'll want the ability to run a Jekyll site in multiple places, such as
previewing locally before pushing to GitHub Pages. Jekyll 1.0 makes that
easier with the new `--baseurl` flag. To take advantage of this feature, first
add the production `baseurl` to your site's `_config.yml` file. Then,
throughout the site, simply prefix relative URLs with `{% raw %}{{ site.baseurl }}{% endraw %}`.
When you're ready to preview your site locally, pass along the `--baseurl` flag
with your local baseurl (most likely `/`) to `jekyll serve` and Jekyll will
swap in whatever you've passed along, ensuring all your links work as you'd
expect in both environments.

-->

<div class="note warning">
  <h5 markdown="1">すべてのpageおよびpostのURLは先頭にスラッシュを含む</h5>
  <p markdown="1">上で説明した方法を使用する場合、すべてのpageおよびpostのURLは先頭にスラッシュを含んでいることを忘れないで下さい。よって、サイトのベースURLとpost/pageのURLを繋ぐとき、それらが`site.baseurl = /`と`post.url = /2013/06/05/my-fun-post/`であるなら、先頭スラッシュが２つ入ってしまう結果となり、リンクは間違ったものになるでしょう。そのため、`site.baseurl`に前置するのは、`baseurl`がデフォルトの`/`以外のものである場合だけにすることをお薦めします。</p>
</div>

<!--original
<div class="note warning">
  <h5 markdown="1">All page and post URLs contain leading slashes</h5>
  <p markdown="1">If you use the method described above, please remember
  that the URLs for all posts and pages contain a leading slash. Therefore,
  concatenating the site baseurl and the post/page url where
  `site.baseurl = /` and `post.url = /2013/06/05/my-fun-post/` will
  result in two leading slashes, which will break links. It is thus
  suggested that prefixing with `site.baseurl` only be used when the
  `baseurl` is something other than the default of `/`.</p>
</div>
-->
