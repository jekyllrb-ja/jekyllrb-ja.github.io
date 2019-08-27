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

このコマンドは多くの使い方ができます：
<!-- You can use this command in a number of ways: -->

* `jekyll new` - デフォルトのgem-basedテーマで、新しいJekyllサイトを作ります
* `jekyll new --blank` - 新しい空白のJekyllサイトの骨組みを作ります
* `jekyll build`や`jekyll b` - （デフォルトでは）`./_site`にサイトを一度だけ構築します。
* `jekyll serve`や`jekyll s` - ソースファイルが変更される度サイトを構築し、ローカルにサーバを立てます。
* `jekyll doctor` - 不備や設定の問題をアウトプットします
* `jekyll clean` - 作成した全てのファイルを取り除きます：出力フォルダ、メタデータファイル、SassおよびJekyllキャッシュ
* `jekyll help` - ヘルプを表示します。オプションでサブコマンドを使用できます。例：`jekyll help build`
* `jekyll new-theme` - 新しいJekyllテーマの骨組みを作ります

<!-- * `jekyll new` - Creates a new Jekyll site with default gem-based theme
* `jekyll new --blank` - Creates a new blank Jekyll site scaffold
* `jekyll build` or `jekyll b` - Performs a one off build your site to `./_site` (by default)
* `jekyll serve` or `jekyll s` - Builds your site any time a source file changes and serves it locally
* `jekyll doctor` - Outputs any deprecation or configuration issues
* `jekyll clean` - Removes all generated files: destination folder, metadata file, Sass and Jekyll caches.
* `jekyll help` - Shows help, optionally for a given subcommand, e.g. `jekyll help build`
* `jekyll new-theme` - Creates a new Jekyll theme scaffold -->

通常は、`jekyll serve`をローカル開発中に使用し、'jekyll build'は出来上がったサイトを作成する良きに必要となります。
<!-- Typically you'll use `jekyll serve` while developing locally and `jekyll build` when you need to generate the site for production. -->

Jekyllのデフォルトのビルドの振る舞いを変更したいときは、[設定オプション]({{ "/docs/configuration/" | relative_url }})を通読してください。
<!-- To change Jekyll's default build behavior have a look through the [configuration options](/docs/configuration/). -->
