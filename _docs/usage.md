---
title:  コマンドラインの使い方
permalink: /docs/usage/
---
<!-- ---
title:  Command Line Usage
permalink: /docs/usage/
--- -->

Jekyll gemは、ターミナルで`jekyll`を実行可能にします。
<!-- The Jekyll gem makes a `jekyll` executable available to you in your terminal. -->

`jekyll`プログラムはいくつかのコマンドを持っていますが、構成はいつも同じです：
<!-- The `jekyll` program has several commands but the structure is always: -->

```
jekyll command [argument] [option] [argument_to_option]
Examples:
    jekyll new site/ --blank
    jekyll serve --config _alternative_config.yml
```

`jekyll serve`はローカル環境で構築している時に、`jekyll build`はサイトをプロダクションとして生成する時に使用するとよいでしょう。
<!-- Typically you'll use `jekyll serve` while developing locally and `jekyll build` when you need to generate the site for production. -->

全てのオプションとコマンドのリストは[Buildコマンドオプション](/docs/configuration/options/#build-command-options)をご覧ください。
<!-- For a full list of options and their argument, see [Build Command Options](/docs/configuration/options/#build-command-options). -->

以下は、最も一般的なコマンドの一部です：
<!-- Here is some of the most common commands: -->

* `jekyll new PATH` - デフォルトのgem-basedテーマで、指定したpathに新しいJekyllサイトを作ります。必要であればディレクトリを作成します。
* `jekyll new PATH --blank` - 指定したpathに新しい空白のJekyllサイトの骨組みを作ります
* `jekyll build`や`jekyll b` - （デフォルトでは）`./_site`にサイトを一度だけ構築します。
* `jekyll serve`や`jekyll s` - ソースファイルが変更される度サイトを構築し、ローカルにサーバを立てます。
* `jekyll doctor` - 不備や設定の問題をアウトプットします
* `jekyll clean` - 作成した全てのファイルを取り除きます：出力フォルダ、メタデータファイル、SassおよびJekyllキャッシュ
* `jekyll help` - ヘルプを表示します。オプションでサブコマンドを使用できます。例：`jekyll help build`
* `jekyll new-theme` - 新しいJekyllテーマの骨組みを作ります
* `jekyll doctor` - 非推奨や設定の問題をアウトプットします

<!-- * `jekyll new PATH` - Creates a new Jekyll site with default gem-based theme at specified path. The directories will be created as necessary.
* `jekyll new PATH --blank` - Creates a new blank Jekyll site scaffold at path specified path.
* `jekyll build` or `jekyll b` - Performs a one off build your site to `./_site` (by default)
* `jekyll serve` or `jekyll s` - Builds your site any time a source file changes and serves it locally
* `jekyll doctor` - Outputs any deprecation or configuration issues
* `jekyll clean` - Removes all generated files: destination folder, metadata file, Sass and Jekyll caches.
* `jekyll help` - Shows help, optionally for a given subcommand, e.g. `jekyll help build`.
* `jekyll new-theme` - Creates a new Jekyll theme scaffold.
* `jekyll doctor` - Outputs any deprecation or configuration issues. -->

Jekyllのデフォルトのビルドの振る舞いを変更したいときは、[設定オプション]({{ "/docs/configuration/" | relative_url }})を通読してください。
<!-- To change Jekyll's default build behavior have a look through the [configuration options](/docs/configuration/). -->
