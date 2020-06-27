---
title: 初めてのプラグイン
permalink: /docs/plugins/your-first-plugin/
---
<!-- ---
title: Your first plugin
permalink: /docs/plugins/your-first-plugin/
--- -->

プラグインはあなたのニーズに合わせたJekyllの拡張動作を可能にします。Jekyllのプラグインには6種類あります。

<!-- Plugins allow you to extend Jekyll's behavior to fit your needs. There are six
types of plugins in Jekyll. -->

## Generatiors（ジェネレータ）
<!-- ## Generators -->

[Generators（ジェネレータ）]({{ "/docs/plugins/generators/" | relative_url }})はサイトにコンテンツを作成します。
例えば、

<!-- [Generators](/docs/plugins/generators/) create content on your site.
For example: -->

* [jekyll-feed](https://github.com/jekyll/jekyll-feed){:target="_blank"} ブログポストのAtomフィードを作成する。
* [jekyll-archives](https://github.com/jekyll/jekyll-archives){:target="_blank"} ブログのカテゴリやタグのアーカイブページを作成する。
* [jekyll-sitemap](https://github.com/jekyll/jekyll-sitemap){:target="_blank"} sitemapを作成する。

<!-- * [jekyll-feed](https://github.com/jekyll/jekyll-feed) creates an Atom feed of
blog posts.
* [jekyll-archives](https://github.com/jekyll/jekyll-archives) creates archive
pages for blog categories and tags.
* [jekyll-sitemap](https://github.com/jekyll/jekyll-sitemap) creates a sitemap. -->

## Converters（コンバータ）
<!-- ## Converters -->

[Converters（コンバータ）]({{ "/docs/plugins/converters/" | relative_url }})はマークアップ言語を他のフォーマットに変換します。
例えば、

<!-- [Converters](/docs/plugins/converters/) change a markup language into another
format. For example: -->

* [jekyll-textile-converter](https://github.com/jekyll/jekyll-textile-converter){:target="_blank"}
textileをHTMLに変換する。
* [jekyll-coffeescript](https://github.com/jekyll/jekyll-coffeescript){:target="_blank"} CoffeescriptをJavaScriptに変換する。
* [jekyll-opal](https://github.com/jekyll/jekyll-opal){:target="_blank"} RubyをJavaScriptに変換する。

<!-- * [jekyll-textile-converter](https://github.com/jekyll/jekyll-textile-converter)
converts textile to HTML.
* [jekyll-coffeescript](https://github.com/jekyll/jekyll-coffeescript) converts
Coffeescript to JavaScript.
* [jekyll-opal](https://github.com/jekyll/jekyll-opal) converts Ruby to
JavaScript. -->

## コマンド
<!-- ## Commands -->

[コマンド]({{ "/docs/plugins/commands/" | relative_url }}) サブコマンドで`jekyll`の実行を拡張します。
例えば、

<!-- [Commands](/docs/plugins/commands/) extend the `jekyll` executable with
subcommands. For example: -->

* [jekyll-compose](https://github.com/jekyll/jekyll-compose){:target="_blank"} ポストやページ、ドラフトを作成するサブコマンドを追加する。

<!-- * [jekyll-compose](https://github.com/jekyll/jekyll-compose) adds subcommands
for creating a post, page or draft. -->

## タグ
<!-- ## Tags -->

[タグ]({{ "/docs/plugins/tags/" | relative_url }})はカスタムLiquidタグを作成します。
例えば、

<!-- [Tags](/docs/plugins/tags/) create custom Liquid tags. For example: -->

* [jekyll-youtube](https://github.com/dommmel/jekyll-youtube){:target="_blank"} YouTubeビデオを埋め込む。
* [jekyll-asset-path-plugin](https://github.com/samrayner/jekyll-asset-path-plugin){:target="_blank"} アセットの相対パスを出力する。
* [jekyll-swfobject](https://github.com/sectore/jekyll-swfobject){:target="_blank"} SWFオブジェクトを埋め込む。

<!-- * [jekyll-youtube](https://github.com/dommmel/jekyll-youtube) embeds a YouTube
video.
* [jekyll-asset-path-plugin](https://github.com/samrayner/jekyll-asset-path-plugin)
outputs a relative URL for assets.
* [jekyll-swfobject](https://github.com/sectore/jekyll-swfobject) embeds a SWF
object. -->

## フィルタ
<!-- ## Filters -->

[フィルタ]({{ "/docs/plugins/filters/" | relative_url }})はカスタムLiquidフィルタを作成します。
例えば、

<!-- [Filters](/docs/plugins/filters/) create custom Liquid filters. For example: -->

* [jekyll-time-ago](https://github.com/markets/jekyll-timeago){:target="_blank"} 2つの日付の間隔。
* [jekyll-toc](https://github.com/toshimaru/jekyll-toc){:target="_blank"} 目次を作成する。
* [jekyll-email-protect](https://github.com/vwochnik/jekyll-email-protect){:target="_blank"} スパムボットから保護するために電子メールを難読化する。

<!-- * [jekyll-time-ago](https://github.com/markets/jekyll-timeago) - The distance
between two dates in words.
* [jekyll-toc](https://github.com/toshimaru/jekyll-toc) - Generates a table of
content.
* [jekyll-email-protect](https://github.com/vwochnik/jekyll-email-protect) -
Obfuscates emails to protect them from spam bots. -->

## Hooks（ホック）
<!-- ## Hooks -->

[Hooks（ホック）]({{ "/docs/plugins/hooks/" | relative_url }})はビルドプロセスを拡張するためのきめ細かい制御を与えます。例えば：

<!-- [Hooks](/docs/plugins/hooks/) give fine-grained control to extend the build
process. For example: -->

* [jemoji](https://github.com/jekyll/jemoji){: target="_balnk"} 絵文字を表示 :+1: 
* [jekyll-mentions](https://github.com/jekyll/jekyll-mentions){: target="_balnk"} メンション @jekyll をリンクに変換する
* [jekyll-spaceship](https://github.com/jeffreytse/jekyll-spaceship){: target="_balnk"} - 高度な例。テーブル、mathjax、plantuml、ビデオなどの強力なサポートを提供します。

<!-- * [jemoji](https://github.com/jekyll/jemoji) Display emojis :+1: 
* [jekyll-mentions](https://github.com/jekyll/jekyll-mentions) turns mentions @jekyll into links
* [jekyll-spaceship](https://github.com/jeffreytse/jekyll-spaceship) - advanced example. Provides
powerful supports for table, mathjax, plantuml, video, etc. -->

## Flags

プラグインを書くときに気をつけるべき2つのFlagがあります。

<!-- There are two flags to be aware of when writing a plugin: -->

<div class="mobile-side-scroller">
<table>
  <thead>
    <tr>
      <th>Flag</th>
      <th>説明</th>
    </tr>
    <!-- <tr>
      <th>Flag</th>
      <th>Description</th>
    </tr> -->
  </thead>
  <tbody>
    <tr>
      <td>
        <p><code>safe</code></p>
      </td>
      <td>
        <p>
          任意のコードの実行が許可されていない環境でこのプラグインを安全に実行できるかどうかをJekyllに通知するboolean flag。これはGitHubページがどのコアプラグインを使うことができるか、そしてどれを実行するのが危険かを判断するために使われます。プラグインが任意のコードの実行を許可していない場合は、これを<code>true</code>に設定してください。GitHub Pagesはまだあなたのプラグインをロードすることはできませんが、コアに含めるために提出することが、使用するための最善の方法です！
        </p>
        <!-- <p>
          A boolean flag that informs Jekyll whether this plugin may be safely
          executed in an environment where arbitrary code execution is not
          allowed. This is used by GitHub Pages to determine which core plugins
          may be used, and which are unsafe to run. If your plugin does not
          allow for arbitrary code execution, set this to <code>true</code>.
          GitHub Pages still won’t load your plugin, but if you submit it for
          inclusion in core, it’s best for this to be correct!
        </p> -->
      </td>
    </tr>
    <tr>
      <td>
        <p><code>priority</code></p>
      </td>
      <td>
        <p>
          プラグインがロードされる順位を定義します。使用できる値は、<code>:lowest</code>, <code>:low</code>, <code>:normal</code>, <code>:high</code>,  <code>:highest</code>です。highestが最初に適用され、lowestが最後に適用されます。
        </p>
        <!-- <p>
          This flag determines what order the plugin is loaded in. Valid values
          are: <code>:lowest</code>, <code>:low</code>, <code>:normal</code>,
          <code>:high</code>, and <code>:highest</code>. Highest priority
          matches are applied first, lowest priority are applied last.
        </p> -->
      </td>
    </tr>
  </tbody>
</table>
</div>

上記のことをプラグインで使用する例として、この2つのflagの指定方法を示します。

<!-- To use one of the example plugins above as an illustration, here is how you’d
specify these two flags: -->

```ruby
module Jekyll
  class UpcaseConverter < Converter
    safe true
    priority :low
    ...
  end
end
```

## Best Practices

ガイドがプラグインの作成の助けとなるでしょう。プラグイン構築に関して、推奨することがあります。

<!-- The guides help you with the specifics of creating plugins. We also have some
recommended best practices to help structure your plugin. -->

プラグインに[gem]({{ "/docs/ruby-101/#gems" | relative_url }})を使うことをお勧めします。依存関係の管理を助け、サイトのソースコードと切り分け、複数のプロジェクトに渡り共用できるようになります。gemの作成に関しては、[Ruby gems guide](https://guides.rubygems.org/make-your-own-gem/){:target="_blank"}や[jekyll-feed](https://github.com/jekyll/jekyll-feed){:target="_blank"}等既存のプラグインのソースを見てください。

<!-- We recommend using a [gem](/docs/ruby-101/#gems) for your plugin. This will
help you manage dependencies, keep separation from your site source code and
allow you to share functionality across multiple projects. For tips on creating
a gem take a look a the
[Ruby gems guide](https://guides.rubygems.org/make-your-own-gem/) or look
through the source code of an existing plugin such as
[jekyll-feed](https://github.com/jekyll/jekyll-feed). -->
