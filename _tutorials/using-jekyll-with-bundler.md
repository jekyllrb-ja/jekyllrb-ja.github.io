---
title: BundlerでJekyllを使う
author: mkasberg
date: 2018-03-06 21:33:25 -0700
---
<!-- ---
title: Using Jekyll with Bundler
author: mkasberg
date: 2018-03-06 21:33:25 -0700
--- -->

>Bundlerは、必要なgemとバージョンを追跡しインストールすることで、Rubyプロジェクトに一貫した環境を提供します。

<!-- > Bundler provides a consistent environment for Ruby projects by tracking and
> installing the exact gems and versions that are needed. -->

[Bundler](https://bundler.io){:target="_blank"}はJekyllで使用できる素晴らしいツールです。プロジェクト毎に依存関係を追跡するため、異なるプロジェクトで異なるバージョンのJekyllを使用する場合に便利です。

<!-- [Bundler](https://bundler.io) can be a great tool to use with Jekyll. Because it
tracks dependencies on a per-project basis, it is particularly useful if you
need to run different versions of Jekyll in different projects.-->

加えて、(オプションで)プロジェクトフォルダにインストールでき、実行時のパーミッションの問題を回避できます。  
通常Jekyllを使用する場合、システムのデフォルトgemインストールディレクトリにJekyllをインストールし、`jekyll new`を実行します。このチュートリアルでは、プロジェクトディレクトリの外にgemをインストールせずにBundlerで新しいJekyllプロジェクトを作成する方法を示します。

<!-- In addition, because it can (optionally) install dependencies in the project
folder, it can help you avoid permissions issues you might otherwise run into.
The usual way to use Jekyll is to install Jekyll to the system's default gem
installation directory and then run `jekyll new`. In this tutorial, we'll show
you how to create a new Jekyll project using Bundler and without installing gems
outside the project directory. -->

<div class="note info">
  <h5>Jekyllを使い始める最もシンプルな方法ではありません</h5>
  <!-- <h5>This is not the simplest way to start using Jekyll</h5> -->
  <p>このチュートリアルはシステムワイドのgemインストールをせずに、Bundlerを使用してJekyllをセットアップすることを助けます。デフォルトのgemインストールディレクトリにjekyllをインストールしたい場合は、<a href="{% link _docs/index.md %}">クイックスタート</a>がよいかもしれません。</p>
  <!-- <p>
    This tutorial helps you get Jekyll set up using Bundler, and optionally
    without any system-wide gem installations. If prefer installing the jekyll
    command to your default gem installation directory, you might want the
    <a href="{% link _docs/index.md %}">Quickstart</a>.
  </p> -->
</div>

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

## Bundlerインストールパスの設定
<!-- ## Configure Bundler Install Path -->

このステップはオプションです。プロジェクトのサブディレクトリ`./vendor/bundle/`にgemをインストールするため、Bundlerの設定を行います。  
これを行う利点は、`gem install`で使用される場所ではなく、依存関係をプロジェクトフォルダにgemをインストールすることです。これにより、Rubyのインストール方法に応じて、gemのインストール中に発生する可能性がある権限エラーを回避できます。  
このステップを飛ばすと、Bundlerは依存関係を`gem install`で使用される場所にインストールします。

<!-- This step is optional. In this step, we're going to configure Bundler to install
gems in the `./vendor/bundle/` project subdirectory. The advantage of doing this
is that bundler will install gems within your project folder instead of the
location used by `gem install`. This can help you avoid permissions errors you
might otherwise get during gem installation, depending how you installed Ruby.
If you skip this step, Bundler will install your dependencies to the location
used by `gem install`. -->

```sh
bundle install --local path vendor/bundle
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

次は、新しいプロジェクトが依存するJekyllを追加するためにBundlerを使用します。このコマンドはJekyll gemをGemfileに追加し、`./vendor/bundle/`フォルダ(カスタムパスを設定していない場合はデフォルトのgemインストールディレクトリ)にインストールします。

<!-- Now, we're going to use Bundler to add Jekyll as a dependency of our new
project. This command will add the Jekyll gem to our Gemfile and install it to
the `./vendor/bundle/` folder (or your default gem installation directory if you
didn't set a custom path). -->

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
# Ignore metadata generated by Jekyll
_site/
.sass-cache/
.jekyll-cache/
.jekyll-metadata

# Ignore folders generated by Bundler
.bundle/
vendor/
```