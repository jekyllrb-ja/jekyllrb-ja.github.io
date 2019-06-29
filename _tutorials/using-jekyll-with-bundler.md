---
layout: tutorials
permalink: /tutorials/using-jekyll-with-bundler/
title: BundlerでJekyllを使う
---
<!-- ---
layout: tutorials
permalink: /tutorials/using-jekyll-with-bundler/
title: Using Jekyll with Bundler
--- -->

>Bundlerは、必要なgemとバージョンを追跡しインストールすることで、Rubyプロジェクトに一貫した環境を提供します。

<!-- > Bundler provides a consistent environment for Ruby projects by tracking and
> installing the exact gems and versions that are needed. -->

[Bundler](https://bundler.io){:target="_blank"}はJekyllで使用できる素晴らしいツールです。プロジェクト毎に依存関係を追跡するため、異なるプロジェクトで異なるバージョンのJekyllを使用する場合や、システムやユーザーレベルでJekyllをインストールしたくない場合に、特に便利です。このチュートリアルでは、Baundlerを使用して、Jekyllをプロジェクト外にインストールせずに、新しいJekyllプロジェクトを作る方法を示します。

<!-- [Bundler](https://bundler.io) can be a great tool to use with Jekyll. Because it
tracks dependencies on a per-project basis, it is particularly useful if you
need to run different versions of Jekyll in different projects, or if you don't
want to install Jekyll at the system or user level. This tutorial will show you
how to create a new Jekyll project using Bundler and without installing Jekyll
outside the project. -->

## 始める前に
<!-- ## Before You Begin -->

このチュートリアルでは、[Ruby](https://www.ruby-lang.org/en/){:target="_blank"}と[Bundler](https://bundler.io/){:target="_blank"}のインストールが必要です。インストール手順は、それぞれのwebサイトをご確認ください。

<!-- To complete this tutorial, you'll need to have
[Ruby](https://www.ruby-lang.org/en/) and [Bundler](https://bundler.io/)
installed. You can find the installation instructions on their websites. -->

## Bunblerの初期化
<!-- ## Initialize Bundler -->

まず始めに行うことは、プロジェクト用の新しいディレクトリを作り、`bundle init`を実行することです。これは、（空のGemfileを作ることで）新しいBundlerプロジェクトを作成します。

<!-- The first thing to do is create a new directory for your project and run
`bundle init`. This creates a new Bundler project (by creating an empty
Gemfile). -->

```sh
mkdir my-jekyll-website
cd my-jekyll-website
bundle init
```

## Bundlerの設定
<!-- ## Configure Bundler -->

このステップはオプションですが、行った方がよいでしょう。プロジェクトのサブディレクトリ`./vendor/bundle/`にgemをインストールするため、Bundlerの設定を行います。これにより、依存関係を独立した環境にインストールして、システム上の他のgemと競合しないようにすることができます。このステップを飛ばすと、Bundlerは依存関係をシステムにグローバルにインストールします。

<!-- This step is optional, but encouraged. We're going to configure Bundler to install
gems in the `./vendor/bundle/` project subdirectory. This allows us to install
our dependencies in an isolated environment, ensuring they don't conflict with
other gems on your system. If you skip this step, Bundler will install your
dependencies globally on your system. -->

```sh
bundle install --path vendor/bundle
```

<div class="note info">
  <h5>Bundler設定は永続的です</h5>
  <!-- <h5>Bundler Config is Persistent</h5> -->
  <p>
    この手順はプロジェクト毎に1回だけ必要です。Bundlerは設定を<code>./.bundle/config</code>に保存するので、将来のgemは同じ場所にインストールされます。
  </p>
  <!-- <p>
    This step is only required once per project. Bundler saves your config in
    <code>./.bundle/config</code>, so future gems will be installed to the same
    location.
  </p> -->
</div>

## Jekyllを追加する
<!-- ## Add Jekyll -->

次は、新しいプロジェクトが依存するJekyllを追加するためにBundlerを使用します。このコマンドはJekyll gemをGemfileに追加し、`./vendor/bundle/`フォルダにインストールします。

<!-- Now, we're going to use Bundler to add Jekyll as a dependency of our new
project. This command will add the Jekyll gem to our Gemfile and install it to
the `./vendor/bundle/` folder. -->

```sh
bundle add jekyll
```

## Jekyll骨格を作成する
<!-- ## Create A Jekyll Scaffold -->

Jekyllがインストールされました。サイトの骨格を作るためにjekyllを使うことができます。フォルダにはBundlerのファイルが既にあり空ではないので、`--force`パラメータが必要です。Gemfileが既に存在しているとJekyllが混乱するので、`bundle install`を分割して実行します。

<!-- Now that Jekyll is installed, we can use it to create the scaffolding for our
site. We need the `--force` parameter because our folder isn't empty - it
already has some Bundler files in it. We run the `bundle install` separately
because Jekyll gets confused if the Gemfile already exists. -->

```sh
bundle exec jekyll new --force --skip-bundle .
bundle install
```

## サイトをサーブする
<!-- ## Serve the Site -->

webサイトの準備ができました！　`bundle exec jekyll serve`でWebサイトをサーブして、[http://127.0.0.1:4000](http://127.0.0.1:4000){:target="_blank"}を訪れましょう。これであなた自身がサイトの構築を続けていく準備ができました。Jekyllの通常のコマンドは全て利用できますが、プロジェクトフォルダにインストールしたJekyllのバージョンをBundlerで実行するために`bundle exec`をコマンドの前につけることを忘れないでください。

<!-- Your new website is ready! You can serve the website with
`bundle exec jekyll serve` and visit it at
[http://127.0.0.1:4000](http://127.0.0.1:4000). From here, you're ready to
continue developing the site on your own. All of the normal Jekyll commands are
available to you, but you should prefix them with `bundle exec` so that Bundler
runs the version of Jekyll that is installed in your project folder. -->

## ソース管理へのコミット
<!-- ## Commit to Source Control -->

新しいサイトをバージョン管理で保存している場合、`./vendor/`と`./.bundle/`フォルダにはユーザーやプラットフォーム固有の情報が含まれているため無視したいでしょう。新しいユーザーは最新の`Gemfile`と`Gemfile.lock`に基づいて正しい依存関係をインストールできます。`Gemfile`と`Gemfile.lock`はどちらもチェックインが必要です。必要に応じて、次の`.gitignore`を使用してください。

<!-- If you're storing your new site in version control, you'll want to ignore the
`./vendor/` and `./.bundle/` folders since they contain user- or
platform-specific information. New users will be able to install the correct
dependencies based on `Gemfile` and `Gemfile.lock`, which should both be checked
in. You can use this `.gitignore` to get started, if you want. -->

**.gitignore**

```
# Ignore folders generated by Bundler
vendor
.bundle

# Ignore folders generated by Jekyll
.sass-cache
_site
```

