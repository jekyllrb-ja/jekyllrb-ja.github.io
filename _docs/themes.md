---
title: テーマ
permalink: /docs/themes/
---
<!-- ---
title: Themes
permalink: /docs/themes/
--- -->

Jekyllには幅広いテーマシステムがあり、サイトの表現をカスタマイズできる、コミュティーで管理されたテンプレートとスタイルを提供します。Jekyllのテーマは、プラグインとパッケージ化されたAsset、レイアウト、インクルード、スタイルシートで、サイトのコンテンツで上書きできます。

<!-- Jekyll has an extensive theme system that allows you to leverage community-maintained templates and styles to customize your site's presentation. Jekyll themes specify plugins and package up assets, layouts, includes, and stylesheets in a way that can be overridden by your site's content. -->

## gemベーステーマを理解する
<!-- ## Understanding gem-based themes -->

`jekyll new <PATH>`コマンドを実行して、[新しいJekyllサイトを作る]({{ "/docs/" | relative_url }})時、Jekyllは[Minima](https://github.com/jekyll/minima){:target="_blank"}というgemベーステーマをインストールします。

<!-- When you [create a new Jekyll site](/docs/) (by running the `jekyll new <PATH>` command), Jekyll installs a site that uses a gem-based theme called [Minima](https://github.com/jekyll/minima). -->

gemベーステーマでは、いくつかのサイトディレクトリ（`assets`や`_layouts`、`_includes`、`_sass`ディレクトリ）はテーマに内包されていて、直接見えるところからは隠れています。ですが、全ての必要なディレクトリはJekyllが構築するときに読み込み、作業を行います。

<!-- With gem-based themes, some of the site's directories (such as the `assets`, `_layouts`, `_includes`, and `_sass` directories) are stored in the theme's gem, hidden from your immediate view. Yet all of the necessary directories will be read and processed during Jekyll's build process. -->

Minimaの場合、Jekyllのサイトディレクトリでは以下のファイルだけが見えます。

<!-- In the case of Minima, you see only the following files in your Jekyll site directory: -->

```
├── Gemfile
├── Gemfile.lock
├── _config.yml
├── _posts
│   └── 2016-12-04-welcome-to-jekyll.markdown
├── about.markdown
└── index.markdown
```

`Gemfile`と`Gemfile.lock`は、Jekyllのサイトを構築するのに必要なgemの必須バージョンを追跡するために、Bundlerが使用します。

<!-- The `Gemfile` and `Gemfile.lock` files are used by Bundler to keep track of the required gems and gem versions you need to build your Jekyll site. -->

gemベーステーマは、テーマ開発者が使用者に更新を利用可能にするのを簡単にします。更新があるとき、開発者はRubyGemsに更新をプッシュします。

<!-- Gem-based themes make it easier for theme developers to make updates available to anyone who has the theme gem. When there's an update, theme developers push the update to RubyGems. -->

テーマgemを使用している場合、（希望するなら）プロジェクトの全てのgemを更新するには、`bundle update`を実行します。`bundle update <THEME>`の`<THEME>`に`minima`のようなテーマの名前を入れて、テーマgemのみを更新することもできます。開発者が追加や更新した（スタイルシートやインクルード）ファイルが自動でプロジェクトにプルします。

<!-- If you have the theme gem, you can (if you desire) run `bundle update` to update all gems in your project. Or you can run `bundle update <THEME>`, replacing `<THEME>` with the theme name, such as `minima`, to just update the theme gem. Any new files or updates the theme developer has made (such as to stylesheets or includes) will be pulled into your project automatically. -->

gemベーステーマの目標は、テーマのファイルを取得し直す手間無く更新したり、過度に複雑にすること無く、テーマの利点を享受し、コンテンツの作成に注力することです。

<!-- The goal of gem-based themes is to allow you to get all the benefits of a robust, continually updated theme without having all the theme's files getting in your way and over-complicating what might be your primary focus: creating content. -->

## テーマのデフォルトを上書きする
<!-- ## Overriding theme defaults -->

Jekyllのテーマはデフォルトのレイアウトやインクルド、スタイルシートを設定します。しかし、サイトのコンテンツでテーマのデフォルトを上書きすることができます。

<!-- Jekyll themes set default layouts, includes, and stylesheets. However, you can override any of the theme defaults with your own site content. -->

テーマのレイアウトやインクルードを置き換えるには、あなたの`_layouts`や`_includes`ディレクトリに修正するファイルをコピーしたり、上書きしたいファイルと同じ名前のファイルを新たに作成します。

<!-- To replace layouts or includes in your theme, make a copy in your `_layouts` or `_includes` directory of the specific file you wish to modify, or create the file from scratch giving it the same name as the file you wish to override. -->

例えば、テーマに`page`レイアウトがある場合、`_layouts`ディレクトリに`page`レイアウト（`_layouts/page.html`）を作成することで、テーマのレイアウトを上書きできます。

<!-- For example, if your selected theme has a `page` layout, you can override the theme's layout by creating your own `page` layout in the `_layouts` directory (that is, `_layouts/page.html`). -->

コンピューターにあるテーマのファイルを見つけるには、

<!-- To locate a theme's files on your computer: -->

1. `bundle show`にテーマgemの名前をつけて実行します。Jekyllのデフォルトテーマなら、`bundle show minima`です。  
   これは、gemベーステーマのファイルの場所を返します。例えばmacOSなら、Minimaテーマのファイルは、`/usr/local/lib/ruby/gems/2.3.0/gems/minima-2.1.0`にあるはずです。

   <!-- 1. Run `bundle show` followed by the name of the theme's gem, e.g., `bundle show minima` for Jekyll's default theme. -->

   <!-- This returns the location of the gem-based theme files. For example, the Minima theme's files might be located in `/usr/local/lib/ruby/gems/2.3.0/gems/minima-2.1.0` on macOS. -->

2. FinderやExplorerでテーマのディレクトリを開きます。

   <!-- 2. Open the theme's directory in Finder or Explorer: -->

   ```sh
   # On MacOS
   open $(bundle show minima)

   # On Windows
   # First get the gem's installation path:
   #
   #   bundle show minima
   #   => C:/Ruby24-x64/lib/ruby/gems/2.4.0/gems/minima-2.1.0
   #
   # then invoke explorer with above path, substituting `/` with `\`
   explorer C:\Ruby24-x64\lib\ruby\gems\2.4.0\gems\minima-2.1.0

   # On Linux
   xdg-open $(bundle show minima)
   ```

   FinderやExplorerが開き、テーマのファイルやディレクトリが表示されます。Minimaテーマgemはこれらのファイルを含んでいます。

   <!-- A Finder or Explorer window opens showing the theme's files and directories. The Minima theme gem contains these files: -->

    ```
    ├── LICENSE.txt
    ├── README.md
    ├── _includes
    │   ├── disqus_comments.html
    │   ├── footer.html
    │   ├── google-analytics.html
    │   ├── head.html
    │   ├── header.html
    │   ├── icon-github.html
    │   ├── icon-github.svg
    │   ├── icon-twitter.html
    │   └── icon-twitter.svg
    ├── _layouts
    │   ├── default.html
    │   ├── home.html
    │   ├── page.html
    │   └── post.html
    ├── _sass
    │   ├── minima
    │   │   ├── _base.scss
    │   │   ├── _layout.scss
    │   │   └── _syntax-highlighting.scss
    │   └── minima.scss
    └── assets
        └── main.scss
     ```

テーマファイルをはっきり理解するには、あなたのJekyllサイトのディレクトリに同じ名前のファイルを作成します。

<!-- With a clear understanding of the theme's files, you can now override any theme file by creating a similarly named file in your Jekyll site directory. -->

Minimaのフッターを上書きしたい例です。Jekyllサイトに`_includes`フォルダを作り、`footer.html`というファイルを追加します。これで、JekyllはMinimaテーマの`footer.html`ではなく、あなたのサイトの`footer.html`を使用するようになります。

<!-- Let's say, for a second example, you want to override Minima's footer. In your Jekyll site, create an `_includes` folder and add a file in it called `footer.html`. Jekyll will now use your site's `footer.html` file instead of the `footer.html` file from the Minima theme gem. -->

スタイルシートを修正する場合はもう一つステップが必要で、メインのsassファイル（Minimaテーマの場合は`_sass/minima.scss`）もサイトのソースの`_sass`ディレクトリにコピーします。

<!-- To modify any stylesheet you must take the extra step of also copying the main sass file (`_sass/minima.scss` in the Minima theme) into the `_sass` directory in your site's source. -->

Jekyllは以下のフォルダへのリクエストがあったときは、テーマのデフォルトを探す前に、まずサイトのコンテンツを探します。

<!-- Jekyll will look first to your site's content before looking to the theme's defaults for any requested file in the following folders: -->

- `/assets`
- `/_layouts`
- `/_includes`
- `/_sass`

テーマのファイルのコピーを作成すると、それらの更新を受け取れなくなります。テーマの全てのスタイルシートの更新を受け取りたい場合、あなた自身のCSSセレクタを追加し、別名のCSSファイルを使用するとよいでしょう。

<!-- Note that making copies of theme files will prevent you from receiving any theme updates on those files. An alternative, to continue getting theme updates on all stylesheets, is to use higher specificity CSS selectors in your own additional, originally named CSS files. -->

上書きできるファイルの詳細については、選択したテーマのドキュメントやソースリポジトリを参照してください。
{: .note .info}

<!-- Refer to your selected theme's documentation and source repository for more information on what files you can override.
{: .note .info} -->

## gemベーステーマから通常のテーマへの変換
<!-- ## Converting gem-based themes to regular themes -->

gemベーステーマを取り除き、全てのファイルがテーマgemでは無く、Jekyllサイトディレクトリにある通常のテーマに、切り替えたいとします。

<!-- Suppose you want to get rid of the gem-based theme and convert it to a regular theme, where all files are present in your Jekyll site directory, with nothing stored in the theme gem. -->

これを行うには、テーマgemのディレクトリから、Jekyllサイトのディレクトリにファイルをコピーします。（Jekyllサイトを`/myblog`に作成したなら、`/myblog`にコピーします。詳細は前項を見てください。）

<!-- To do this, copy the files from the theme gem's directory into your Jekyll site directory. (For example, copy them to `/myblog` if you created your Jekyll site at `/myblog`. See the previous section for details.) -->

次に、テーマが参照しているプラグインをJekyllに知らせなければなりません。これらのプラグインは、ランタイムと従属関係のテーマのgemspecファイルで見つけることができます。例えば、Minimaテーマの場合は次のようになります。

<!-- Then you must tell Jekyll about the plugins that were referenced by the theme. You can find these plugins in the theme's gemspec file as runtime dependencies. If you were converting the Minima theme, for example, you might see: -->

```
spec.add_runtime_dependency "jekyll-feed", "~> 0.9"
spec.add_runtime_dependency "jekyll-seo-tag", "~> 2.1"
```

これらのリファレンスを2つの方法のどちらかで、`Gemfile`に含めなければなりません。

<!-- You should include these references in the `Gemfile` in one of two ways. -->

`Gemfile`と`_config.yml`の両方に記載する方法があります。

<!-- You could list them individually in both `Gemfile` and `_config.yml`. -->

```ruby
# ./Gemfile

gem "jekyll-feed", "~> 0.9"
gem "jekyll-seo-tag", "~> 2.1"
```

```yaml
# ./_config.yml

plugins:
  - jekyll-feed
  - jekyll-seo-tag
```

もしくは、JekyllプラグインとしてGemfileに記載し、`_config.yml`は更新しない方法もあります。

<!-- Or you could list them explicitly as Jekyll plugins in your Gemfile, and not update `_config.yml`, like this: -->

```ruby
# ./Gemfile

group :jekyll_plugins do
  gem "jekyll-feed", "~> 0.9"
  gem "jekyll-seo-tag", "~> 2.1"
end
```

どちらの方法でも、`bundle update`を忘れないでください。

<!-- Either way, don't forget to `bundle update`. -->

GitHub Pagesで公開している場合は、GitHub PagesはBundler経由でプラグインをロードしないため、`_config.yml`だけを更新してください。

<!-- If you're publishing on GitHub Pages you should update only your `_config.yml` as GitHub Pages doesn't load plugins via Bundler. -->

最後に、`Gemfile`のテーマgemへの参照と設定を削除します。`minima`を削除する場合を例示します。

<!-- Finally, remove references to the theme gem in `Gemfile` and configuration. For example, to remove `minima`: -->

- `Gemfile`を開き、`gem "minima", "~> 2.0"`を削除します。
- `_config.yml`を開き、`theme: minima`を削除します。

<!-- - Open `Gemfile` and remove `gem "minima", "~> 2.0"`.
- Open `_config.yml` and remove `theme: minima`. -->

これで、`bundle update`をしてもテーマgemの更新は取得されません。

<!-- Now `bundle update` will no longer get updates for the theme gem. -->

## <span id="installing-a-theme"></span>gemベーステーマのインストール
<!-- ## Installing a gem-based theme {#installing-a-theme} -->

`jekyll new <PATH>`コマンドはgemベーステーマの新しいJekyllサイトを作る唯一の方法ではありません。Gemベーステーマをオンラインで見つけ、それをJekyllプロジェクトに組み込むこともできます。

<!-- The `jekyll new <PATH>` command isn't the only way to create a new Jekyll site with a gem-based theme. You can also find gem-based themes online and incorporate them into your Jekyll project. -->

例えば、[RubyGemsでJekyllテーマ](https://rubygems.org/search?utf8=%E2%9C%93&query=jekyll-theme){:target="_blank"}を検索すると、他のgemベーステーマを見つけることができます。（全てのテーマが`jekyll-theme`をテーマの名前に使用しているわけではありません。）

<!-- For example, search for [jekyll theme on RubyGems](https://rubygems.org/search?utf8=%E2%9C%93&query=jekyll-theme) to find other gem-based themes. (Note that not all themes are using `jekyll-theme` as a convention in the theme name.) -->

gemベーステーマをインストールするには：

<!-- To install a gem-based theme: -->

1. サイトの`Gemfile`にテーマgemを追加します。

   <!-- 1. Add the theme gem to your site's `Gemfile`: -->

   ```ruby
   # ./Gemfile

   # This is an example, declare the theme gem you want to use here
   gem "jekyll-theme-minimal"
   ```

   もしくは、`jekyll new`コマンドで開始するときなら、`gem "minima", "~> 2.0"`を好きなように書き換えてください。

   <!-- Or if you've started with the `jekyll new` command, replace `gem "minima", "~> 2.0"` with the gem you want, e.g: -->

   ```diff
   # ./Gemfile

   - gem "minima", "~> 2.0"
   + gem "jekyll-theme-minimal"
   ```

2. テーマをインストールします。

   <!-- 2. Install the theme: -->

   ```sh
   bundle install
   ```

3. テーマを有効にするために、サイトの`_config.yml`に以下を追加します。

   <!-- 3. Add the following to your site's `_config.yml` to activate the theme: -->

   ```yaml
   theme: jekyll-theme-minimal
   ```

4. サイトを構築します。
   <!-- 4. Build your site: -->

   ```sh
   bundle exec jekyll serve
   ```

`Gemfile`には、複数のテーマをリストアップできます。しかし、サイトの`_config.yml`に指定した1つのテーマだけが選択されます。{: .note .info }

<!-- You can have multiple themes listed in your site's `Gemfile`, but only one theme can be selected in your site's `_config.yml`.
{: .note .info } -->

Jekyllサイトを[GitHub Pages](https://pages.github.com/){:target="_blank"}で公開している場合、GitHub Pagesは[いくつかのgemベーステーマ](https://pages.github.com/themes/){:target="_blank"}しかサポートしていないことに注意してください。GitHub Pagesは`remote_theme`設定で、gemベーステーマなら[GitHubがホストのテーマの使用](https://help.github.com/articles/adding-a-jekyll-theme-to-your-github-pages-site/#adding-a-jekyll-theme-in-your-sites-_configyml-file){:target="_blank"}をサポートしています。

<!-- If you're publishing your Jekyll site on [GitHub Pages](https://pages.github.com/), note that GitHub Pages supports only [some gem-based themes](https://pages.github.com/themes/). GitHub Pages also supports [using any theme hosted on GitHub](https://help.github.com/articles/adding-a-jekyll-theme-to-your-github-pages-site/#adding-a-jekyll-theme-in-your-sites-_configyml-file) using the `remote_theme` configuration as if it were a gem-based theme. -->

## gemベーステーマの作成
<!-- ## Creating a gem-based theme -->

あなたが（テーマの使用者というよりも）開発者なら、あなたのテーマをBundlerを通じユーザーがインストールできるように、RubyGemsにパッケージにすることができます。

<!-- If you're a Jekyll theme developer (rather than a consumer of themes), you can package up your theme in RubyGems and allow users to install it through Bundler. -->

Ruby gemsの作成になれていなくても、心配しないでください。Jekyllは`new-theme`コマンドで新しいテーマの骨組みを作成します。テーマ名を引数にして`jekyll new-theme`を実行してください。

<!-- If you're unfamiliar with creating Ruby gems, don't worry. Jekyll will help you scaffold a new theme with the `new-theme` command. Run `jekyll new-theme` with the theme name as an argument. -->

こちらがその例です。

<!-- Here is an example: -->

```sh
jekyll new-theme jekyll-theme-awesome
    create /path/to/jekyll-theme-awesome/_layouts
    create /path/to/jekyll-theme-awesome/_includes
    create /path/to/jekyll-theme-awesome/_sass
    create /path/to/jekyll-theme-awesome/_layouts/page.html
    create /path/to/jekyll-theme-awesome/_layouts/post.html
    create /path/to/jekyll-theme-awesome/_layouts/default.html
    create /path/to/jekyll-theme-awesome/Gemfile
    create /path/to/jekyll-theme-awesome/jekyll-theme-awesome.gemspec
    create /path/to/jekyll-theme-awesome/README.md
    create /path/to/jekyll-theme-awesome/LICENSE.txt
    initialize /path/to/jekyll-theme-awesome/.git
    create /path/to/jekyll-theme-awesome/.gitignore
Your new Jekyll theme, jekyll-theme-awesome, is ready for you in /path/to/jekyll-theme-awesome!
For help getting started, read /path/to/jekyll-theme-awesome/README.md.
```

テンプレートファイルを対応するフォルダに追加してください。必要に応じ`.gemspec`とREADMEファイルを完成させてください。

<!-- Add your template files in the corresponding folders. Then complete the `.gemspec` and the README files according to your needs. -->

### レイアウトとインクルード
<!-- ### Layouts and includes -->

テーマのレイアウトとインクルードはJekyllサイトと同様に働きます。レイアウトは`/_layouts`フォルダに、インクルードは`/_includes`フォルダに入れてください。

<!-- Theme layouts and includes work just like they work in any Jekyll site. Place layouts in your theme's `/_layouts` folder, and place includes in your themes `/_includes` folder. -->

例えば、テーマに`/_layouts/page.html`があり、ページのfront matterに`layout: page`があれば、Jekyllはまずサイトの`_layouts`フォルダに`page`があるかを確認し、無ければテーマの`page`レイアウトを使用します。

<!-- For example, if your theme has a `/_layouts/page.html` file, and a page has `layout: page` in its front matter, Jekyll will first look to the site's `_layouts` folder for the `page` layout, and if none exists, will use your theme's `page` layout. -->

### Assets

`/assets`フォルダのファイルは、同じ相対パスのファイルが無ければ、ユーザーがサイトを構築するときにコピーされます。SCSS、画像、Webフォントなどを出荷することができます。これらのファイルは、Jekyllに静的ファイルの様に取り扱われます。

<!-- Any file in `/assets` will be copied over to the user's site upon build unless they have a file with the same relative path. You can ship any kind of asset here: SCSS, an image, a webfont, etc. These files behave like pages and static files in Jekyll: -->

- ファイルの冒頭に[front matter]({{ "/docs/front-matter/" | relative_url }})がある場合、レンダリングされます。
- front matterが無い場合、単純にサイトにコピーされます。

<!-- - If the file has [front matter](/docs/front-matter/) at the top, it will be rendered.
- If the file does not have front matter, it will simply be copied over into the resulting site. -->

これにより、テーマの作成者は`/assets/styles.css`を出荷することが可能になり、レイアウトで`/assets/styles.css`を使用できます。

<!-- This allows theme creators to ship a default `/assets/styles.scss` file which their layouts can depend on as `/assets/styles.css`. -->

サイトでJekyllを使用しているのと同じように、`/assets`内のファイルは、作成されたサイトの`/assets`フォルダにコピーされます。

<!-- All files in `/assets` will be output into the compiled site in the `/assets` folder just as you'd expect from using Jekyll on your sites. -->

### Stylesheets

テーマのスタイルシートは、Jekyllサイトを作成するときと同じように、テーマの `_sass`フォルダに入れます。

<!-- Your theme's stylesheets should be placed in your theme's `_sass` folder, again, just as you would when authoring a Jekyll site. -->

```
_sass
├── jekyll-theme-awesome.scss
```

テーマのスタイルシートは`@import`を使用することでダイレクトにユーザーのスタイルシートを取り込めます。

<!-- Your theme's styles can be included in the user's stylesheet using the `@import` directive. -->

{% raw %}
```css
@import "{{ site.theme }}";
```
{% endraw %}

### テーマgemの依存関係 {%- include docs_version_badge.html version="3.5.0" -%}
<!-- ### Theme-gem dependencies {%- include docs_version_badge.html version="3.5.0" -%} -->

サイトの設定ファイルに`plugins`として明示されていなくても、テーマgemのホワイトリストの`runtime_dependencies`を、Jekyllは自動的に必要とします。（注：ホワイトリストは`--safe`オプションで提供するとき、構築するときのみ必要です。）

<!-- Jekyll will automatically require all whitelisted `runtime_dependencies` of your theme-gem even if they're not explicitly included under the `plugins` array in the site's config file. (Note: whitelisting is only required when building or serving with the `--safe` option.) -->

これにより、エンドユーザーはテーマgemが機能するように、設定ファイルに含めたプラグインを追跡する必要がありません。

<!-- With this, the end-user need not keep track of the plugins required to be included in their config file for their theme-gem to work as intended. -->

{% if site.version == '4.0.0' %}
{% comment %} Remove this encapsulation when `v4.0` ships {% endcomment %}

### テーマgemの事前設定 {%- include docs_version_badge.html version="4.0.0" -%}
<!-- ### Pre-configuring Theme-gems {%- include docs_version_badge.html version="4.0.0" -%} -->

Jekyllはテーマgemのrootで `_config.yml`を読み込み、そのデータをサイトの既存の設定データにマージします。

<!-- Jekyll will read-in a `_config.yml` at the root of the theme-gem and merge its data into the site's existing configuration data. -->

しかし、テーマ内からロードされた他のエンティティとは異なり、設定ファイルのロードには、以下に要約するように、いくつかの制限があります。

<!-- But unlike other entities loaded from within the theme, loading the config file comes with a few restrictions, as summarized below: -->

  * Jekkyllのデフォルト設定はテーマの設定で上書きできません。*権限はまだ、ユーザーにあります*。
  * テーマの設定ファイルは、`safe mode`やシンボリックリンクが指すファイルがテーマgem内の正当なファイルであるかどうかにかかわらず、シンボリックリンクはできません。
  * テーマの設定は一連のキーと値のペアでなければなりません。空の設定ファイル、キーの下の項目を単にリストする設定ファイル、または単純なテキスト文字列を含む設定ファイルは、単に黙って無視されます。この矛盾に関する警告やログ出力は表示されません。
  * 全てのテーマ設定ファイルの内容は、ユーザーが上書き可能です。

<!-- * Jekyll's default settings cannot be overridden by a theme-config. That *ball is still in the user's court.*
  * The theme-config-file cannot be a symlink, irrespective of `safe mode` and whether the file pointed to by the symlink is a legitimate file within the theme-gem.
  * The theme-config should be a set of key-value pairs. An empty config file, a config file that simply *lists items* under a key, or a config file with just a simple string of text will simply be ignored silently. Users will not get a warning or any log output regarding this discrepancy.
  * Any settings defined by the theme-config can be overridden by the user. -->

この機能はテーマをより簡単に採用できるようにするためのものですが、制限によってテーマ設定が適切な方法でビルドに影響を及さないようにします。テーマに必要なすべてのプラグインはユーザーが手動でリストするか、テーマの `gemspec`ファイルで提供されなければなりません。

<!-- While this feature is to enable easier adoption of a theme, the restrictions ensure that a theme-config cannot affect the build in a concerning manner. Any plugins required by the theme will have to be listed manually by the user or provided by the theme's `gemspec` file. -->

この機能により、テーマgemは*テーマ固有の設定変数*をそのまま使用できるようになります。

<!-- This feature will let the theme-gem to work with *theme-specific config variables* out-of-the-box. -->
{% endif %}

### テーマのドキュメンテーション
<!-- ### Documenting your theme -->

テーマには、テーマのインストールや使用法を伝えるための`/README.md`ファイルを含めるべきです。どんなレイアウト、どんなファイルが含まれていますか？　使用者はサイトの設定ファイルに何か特別なことを書き加えなければなりませんか？

<!-- Your theme should include a `/README.md` file, which explains how site authors can install and use your theme. What layouts are included? What includes? Do they need to add anything special to their site's configuration file? -->

### スクリーンショットの追加
<!-- ### Adding a screenshot -->

テーマは見た目です。スクリーンショットをテーマのリポジトリ内に `/ screenshot.png`としてプログラムで取得できるように含めることで、テーマの見た目をユーザーに示すことができます。このスクリーンショットをテーマのドキュメンテーションに含めることもできます。

<!-- Themes are visual. Show users what your theme looks like by including a screenshot as `/screenshot.png` within your theme's repository where it can be retrieved programmatically. You can also include this screenshot within your theme's documentation. -->

### テーマのプレビュー
<!-- ### Previewing your theme -->

著者としてテーマのプレビューを行うには、`/index.html`や`/page.html`のダミーコンテンツを追加するのが便利です。`jekyll build`や`jekyll serve`をプレビューのために利用できるようになります。あとは、Jekyllサイトのプレビューを行うだけです。

 <!-- To preview your theme as you're authoring it, it may be helpful to add dummy content in, for example, `/index.html` and `/page.html` files. This will allow you to use the `jekyll build` and `jekyll serve` commands to preview your theme, just as you'd preview a Jekyll site. -->

ローカル環境でテーマのプレビューを行ったら、テーマを配布するときにコンパイル済みのサイトが含まれないように、テーマの`.gitignore`に`/_site`を追加するのを忘れないようにしましょう。
{: .info .note}

<!-- If you do preview your theme locally, be sure to add `/_site` to your theme's `.gitignore` file to prevent the compiled site from also being included when you distribute your theme.
{: .info .note} -->

### あなたのテーマを公開
<!-- ### Publishing your theme -->

テーマは[RubyGems.org](https://rubygems.org){:target="_blank"}で公開されています。RubyGemsのアカウントが必要なら、[無料で作成](https://rubygems.org/sign_up){:target="_blank"}できます。

<!-- Themes are published via [RubyGems.org](https://rubygems.org). You will need a RubyGems account, which you can [create for free](https://rubygems.org/sign_up). -->

1. 始めに、gitリポジトリを用意する必要があります。

   <!-- 1. First, you need to have it in a git repository: -->

   ```sh
   git init # Only the first time
   git add -A
   git commit -m "Init commit"
   ```

2. 次に、以下のコマンドでテーマをパッケージ化します。`jekyll-theme-awesome`はあなたのテーマの名前に変えてください。

   <!-- 2. Next, package your theme, by running the following command, replacing `jekyll-theme-awesome` with the name of your theme: -->

   ```sh
   gem build jekyll-theme-awesome.gemspec
   ```

3. 最後に、RubyGemsサービスに以下のコマンドを実行して、パッケージ化したテーマをプッシュしてください。`jekyll-theme-awesome`はあなたのテーマの名前に変えてください。

   <!-- 3. Finally, push your packaged theme up to the RubyGems service, by running the following command, again replacing `jekyll-theme-awesome` with the name of your theme: -->

   ```sh
   gem push jekyll-theme-awesome-*.gem
   ```

4. テーマの新しいバージョンをリリースするときは、gemspecファイル（この例では`jekyll-theme-awesome.gemspec`）のバージョンナンバーを更新し、上記の1〜3のステップを繰り返してください。テーマバージョンを上げながら、[Semantic Versioning](http://semver.org/){:target="_blank"}に従うことをお勧めします。

<!-- 4. To release a new version of your theme, update the version number in the gemspec file, ( `jekyll-theme-awesome.gemspec` in this example ), and then repeat Steps 1 - 3 above. We recommend that you follow [Semantic Versioning](http://semver.org/) while bumping your theme-version. -->
