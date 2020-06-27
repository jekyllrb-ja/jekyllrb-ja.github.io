---
title: プラグイン
permalink: /docs/plugins/installation/
---
<!-- ---
title: Plugins
permalink: /docs/plugins/installation/
--- -->

プラグインのインストールに3つのオプションがあります。

<!-- You have 3 options for installing plugins: -->

1. サイトのソースrootに`_plugins`ディレクトリを作ります。プラグインをここに入れます。このディレクトリにある`*.rb`で終わる全てのファイルはJekyllがサイトを生成する前に読み込まれます。
2. `_config.yml`ファイルに`plugins`キー（もしくはJekyll < `3.5.0`は`gems`）と使用したいgem名の値の配列を追加します。例えば、

  ```yaml
  # This will require each of these plugins automatically.
  plugins:
    - jekyll-gist
    - jekyll-coffeescript
    - jekyll-assets
    - another-jekyll-plugin
  ```

   次に`gem install jekyll-gist jekyll-coffeescript jekyll-assets another-jekyll-plugin`でプラグインをインストールします。
3.  `Gemfile`のBundlerグループに関連するプラグインを追加します。例えば、

  ```ruby
    group :jekyll_plugins do
      gem "jekyll-gist"
      gem "jekyll-coffeescript"
      gem "jekyll-assets"
      gem "another-jekyll-plugin"
    end
   ```

   `bundle install`コマンドを実行して、Bundlerグループから全てのプラグインをインストールする必要があります。

<!-- 1. In your site source root, make a `_plugins` directory. Place your plugins
   here. Any file ending in `*.rb` inside this directory will be loaded before
   Jekyll generates your site.

2. In your `_config.yml` file, add a new array with the key `plugins` (or `gems` for Jekyll < `3.5.0`) and the
   values of the gem names of the plugins you'd like to use. An example:

   ```yaml
   # This will require each of these plugins automatically.
   plugins:
     - jekyll-gist
     - jekyll-coffeescript
     - jekyll-assets
     - another-jekyll-plugin
   ```

   Then install your plugins using `gem install jekyll-gist jekyll-coffeescript jekyll-assets another-jekyll-plugin`

3. Add the relevant plugins to a Bundler group in your `Gemfile`. An
   example:

   ```ruby
    group :jekyll_plugins do
      gem "jekyll-gist"
      gem "jekyll-coffeescript"
      gem "jekyll-assets"
      gem "another-jekyll-plugin"
    end
   ```

   Now you need to install all plugins from your Bundler group by running single command `bundle install`. -->

<div class="note info">
  <h5>GitHub Pagesでのプラグイン</h5>
  <!-- <h5>Plugins on GitHub Pages</h5> -->
  <p>
    <a href="https://pages.github.com/" target="_blank">GitHub Pages</a>はJekyllで動いています。セキュリティ上の理由で（いくつかの<a href="https://pages.github.com/versions" target="_blank">ホワイトリストのプラグイン</a>を除く）プラグインを無効にする<code>--safe</code>オプションで全てのページを生成します。GitHub Pagesで公開する場合はあなたのプラグインが機能しないことを意味します。<br /><br />
    GitHubページを使用してサイトを公開することはできますが、サイトをローカルで変換し、Jekyllのソースファイルではなく、生成された静的ファイルをGitHubリポジトリにプッシュする必要があります。
  </p>
  <!-- <p>
    <a href="https://pages.github.com/">GitHub Pages</a> is powered by Jekyll.
    All Pages sites are generated using the <code>--safe</code> option
    to disable plugins (with the exception of some
    <a href="https://pages.github.com/versions">whitelisted plugins</a>) for
    security reasons. Unfortunately, this means
    your plugins won’t work if you’re deploying to GitHub Pages.<br><br>
    You can still use GitHub Pages to publish your site, but you’ll need to
    convert the site locally and push the generated static files to your GitHub
    repository instead of the Jekyll source files.
  </p> -->
</div>

<div class="note">
  <h5>
    <code>_plugins</code>と<code>_config.yml</code>、<code>Gemfile</code>は同時に使用できます。
  </h5>
  <!-- <h5>
    <code>_plugins</code>, <code>_config.yml</code> and <code>Gemfile</code>
    can be used simultaneously
  </h5> -->
  <p>
    同じサイト内で上記のプラグインオプションを同時に使用することもできます。1つの使用は他の使用を制限しません。
  </p>
  <!-- <p>
    You may use any of the aforementioned plugin options simultaneously in the
    same site if you so choose. Use of one does not restrict the use of the
    others.
  </p> -->
</div>

### jekyll_pligin グループ
<!-- ### The jekyll_plugins group -->

Jekyllは`Gemfile`の中の特定のGemグループを別に扱います。このグループに含まれる全てのGemは、Jekyllがあなたのソースディレクトリの残りを処理し始める前にロードされます。

<!-- Jekyll gives this particular group of gems in your `Gemfile` a different
treatment. Any gem included in this group is loaded before Jekyll starts
processing the rest of your source directory. -->

ここに含まれるGemは、設定ファイルの`plugins:`キーに明示されなくても、有効になります。

<!-- A gem included here will be activated even if its not explicitly listed under
the `plugins:` key in your site's config file. -->

{: .note .warning}
<code>:jekyll-plugins</code>グループに含まれるGemは、<code>--safe</code>モード設定に関係なく有効になります。このグループにどのようなGemが含まれているかに、注意してください！

<!-- {: .note .warning}
Gems included in the <code>:jekyll-plugins</code> group are activated
regardless of the <code>--safe</code> mode setting. Be aware of which
gems are included under this group! -->