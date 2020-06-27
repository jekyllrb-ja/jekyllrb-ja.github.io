---
layout: step
title: セットアップ
menu_name: Step by Stepチュートリアル
position: 1
---
<!-- ---
layout: step
title: Setup
menu_name: Step by Step Tutorial
position: 1
--- -->

Jekkylのstep-by-stepチュートリアルへようこそ。このチュートリアルの目的は、デフォルトのgemベースのテーマに頼ることなく、一から最初のJekyllサイトを構築し、フロントエンドのWeb開発の経験をすることです。  
さあ、始めましょう！

<!-- Welcome to Jekyll's step-by-step tutorial. The goal of this tutorial is to take
you from having some front end web development experience to building your
first Jekyll site from scratch — not relying on the default gem-based theme.
Let's get into it! -->

## インストール
<!-- ## Installation -->

JekyllはRubyプログラムですので、最初にRubyをあなたのマシーンにインストールする必要があります。[インストールガイド]({{ "/docs/installation/" | relative_url }})へ向かい、OSにあわせた説明を確認してください。

<!-- Jekyll is a Ruby program so you need to install Ruby on your machine to begin
with. Head over to the [install guide](/docs/installation/) and follow the
instructions for your operating system. -->

Rubyをセットアップしたら、ターミナルで以下を実行し、Jekyllをインストールできます。

<!-- With Ruby setup you can install Jekyll by running the following in your
terminal: -->

```sh
gem install jekyll bundler
```

プロジェクトの依存関係のリストのために、新しい`Gemfile`を作成します。

<!-- To create a new `Gemfile` to list your project's dependencies run: -->

```sh
bundle init
```

`Gemfile`を編集し、依存関係としてJekyllを追加します。

<!-- Now edit the `Gemfile`and add jekyll as a dependency: -->

```ruby
gem "jekyll"
```

最後にプロジェクトのためのJekyllをインストールするために`bundle`を実行します。

<!-- Finally run `bundle` to install jekyll for your project. -->

以上でこのチュートリアルに書かれている全てのコマンドの前に`bundle exec`をつけることで、`Gemfile`で定義されたjekyllのバーションを使用できます。

<!-- You can now prefix all jekyll commands listed in this tutorial with `bundle exec`
to make sure you use the jekyll version defined in your `Gemfile`. -->

## サイトを作る
<!-- ## Create a site -->

サイトを作るときです！　サイト用の新しいディレクトリを作り、好きな名前をつけましょう。このチュートリアルでは、そのディレクトリを“root”とします。

<!-- It's time to create a site! Create a new directory for your site, you can name
it whatever you'd like. Through the rest of this tutorial we'll refer to this
directory as “root”. -->

冒険がお好きなら、ここでGitリポジトリを初期化することができます。Jekyllの素晴らしいところの一つは、データベースが無いことです。全てのコンテンツとサイトの構成はGitのリポジトリでバージョン管理できるファイルです。リポジトリを使用するのは完全にオプションですが、習得するのは良い習慣です。Gitの使用については、[Git Handbook](https://guides.github.com/introduction/git-handbook/){:target="_blank"}を読むことで学べます。

<!-- If you're feeling adventurous, you can also initialize a Git repository here.
One of the great things about Jekyll is there's no database. All content and
site structure are files which a Git repository can version. Using a repository
is completely optional but it's a great habit to get into. You can learn more
about using Git by reading through the
[Git Handbook](https://guides.github.com/introduction/git-handbook/). -->

最初のファイルを作成しましょう。rootに以下の内容の`index.html`を作成します。

<!-- Let's add your first file. Create `index.html` in the root with the following
content: -->

```html
<!doctype html>
<html>
  <head>
    <meta charset="utf-8">
    <title>Home</title>
  </head>
  <body>
    <h1>Hello World!</h1>
  </body>
</html>
```

## ビルド
<!-- ## Build -->

Jekyllは静的サイトのジェネレータですので、サイトを見る前にJekyllで構築する必要があります。  
構築するためにrootで実行できるコマンドは2つあります。

<!-- Jekyll is a static site generator so we need Jekyll to build the site
before we can view it. There are two commands you can run in the root of your site
to build it: -->

* `jekyll build` - サイトを構築し、`_site`ディレクトリに出力します。
* `jekyll serve` - 上記と同じことをし、変更を加える度に再構築を行います。あわせて`http://localhost:4000`でローカルサーバを走らせます。

<!-- * `jekyll build` - Builds the site and outputs a static site to a directory
called `_site`.
* `jekyll serve` - Does the same thing except it rebuilds any time you make
a change and runs a local web server at `http://localhost:4000`. -->

サイトを開発しているときは、変更を更新するために`jekyll serve`を使用するとよいでしょう。

<!-- When you're developing a site you'll use `jekyll serve` as it updates with any
changes you make. -->

`jekyll serve`を実行し、ブラウザで<a href="http://localhost:4000" target="_blank" data-proofer-ignore>http://localhost:4000</a>を見てみましょう。"Hello World!"と表示されるはずです。

<!-- Run `jekyll serve` and go to
<a href="http://localhost:4000" target="_blank" data-proofer-ignore>http://localhost:4000</a> in
your browser. You should see "Hello World!". -->

さて、あなたはこれが何だというのかと、考えているでしょうか？　JekyllはただHTMLファイルをある場所から別の場所へコピーしただけです。もう少し我慢してください。まだまだ学ぶことがあります。

<!-- Well, you might be thinking what's the point in this? Jekyll just copied an
HTML file from one place to another. Well patience young grasshopper, there's
still much to learn! -->
