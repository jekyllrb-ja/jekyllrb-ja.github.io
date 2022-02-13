---
title: Jekyll on macOS
permalink: /docs/installation/macos/
---

## コマンドラインツールのインストール
<!-- ## Install Command Line Tools -->

最初に、ネイティブエクステンションをコンパイルできるようにするために、コマンドラインツールをインストールします。ターミナルを開いて、実行します。

<!-- First, you need to install the command-line tools to be able to compile native extensions, open a terminal and run: -->

```sh
xcode-select --install
```

## Rubyのインストール
## Install Ruby

Jekyllは**Ruby > {{ site.data.ruby.min_version }}**が必須です。
macOS Catalina 10.15にはruby 2.6.3が付属しています。
以前のmacOS利用している場合、Rubyの新しいバージョンをインストールする必要があります。

<!-- Jekyll requires **Ruby > {{ site.data.ruby.min_version }}**.
macOS Catalina 10.15 comes with ruby 2.6.3, so you're fine. 
If you're running a previous macOS system, you'll have to install a newer version of Ruby. -->

### With Homebrew {#brew}

最新のRubyバージョンを実行するには、[Homebrew](https://brew.sh){:target="_blank"}を通じてインストールする必要があります。

<!-- To run the latest Ruby version you need to install it through [Homebrew](https://brew.sh). -->

```sh
# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install ruby
```

brew Rubyパスをshell configに追加してください。

<!-- Add the brew ruby path to your shell config: -->

```bash
echo 'export PATH="/usr/local/opt/ruby/bin:$PATH"' >> ~/.bash_profile
```

ターミナルを再起動し、Rubyのセットアップの更新を確認します。

<!-- Then relaunch your terminal and check your updated Ruby setup: -->

```sh
which ruby
# /usr/local/opt/ruby/bin/ruby

ruby -v
{{ site.data.ruby.current_version_output }}
```

現在の安定版Rubyを実行できるようになりました。

<!-- Yay, we are now running current stable Ruby! -->

### With rbenv {#rbenv}

複数のRubyバージョンを管理するために、[rbenv](https://github.com/rbenv/rbenv){:target="_blank"}を使用することもあります。これは、プロジェクトで特定のRubyバージョンを実行する必要がある場合には、とても便利です。

<!-- People often use [rbenv](https://github.com/rbenv/rbenv) to manage multiple
Ruby versions. This is very useful when you need to be able to run a given Ruby version on a project. -->

```sh
# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Install rbenv and ruby-build
brew install rbenv

# Set up rbenv integration with your shell
rbenv init

# Check your installation
curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash
```

変更を有効にするために、ターミナルを再起動します。これで、選択したRubyバージョンをインストールできます。最新の安定版Rubyを使ってみましょう。

<!-- Restart your terminal for changes to take effect.
Now you can install the Ruby version of our choice, let's go with current latest stable Ruby: -->

```sh
rbenv install {{ site.data.ruby.current_version }}
rbenv global {{ site.data.ruby.current_version }}
ruby -v
{{ site.data.ruby.current_version_output }}
```

以上です。[rbenv command references](https://github.com/rbenv/rbenv#command-reference){:target="_blank"}を読んで、プロジェクトでの異なるRubyバージョンの使い方を学んでください。

<!-- That's it! Head over [rbenv command references](https://github.com/rbenv/rbenv#command-reference) to learn how to use different versions of Ruby in your projects. -->

## Jekyllのインストール
<!-- ## Install Jekyll -->

後は、[Bundler]({{ '/docs/ruby-101/#bundler' | relative_url }}))とJekyllをインストールするだけです。

<!-- Now all that is left is installing [Bundler]({{ '/docs/ruby-101/#bundler' | relative_url }})) and Jekyll. -->

### ローカルインストール
<!-- ### Local Install -->

```sh
gem install --user-install bundler jekyll
```

それからRubyのバージョンを取得します。

<!-- and then get your Ruby version using -->

```sh
ruby -v
{{ site.data.ruby.current_version_output }}
```

それから、パスファイルに以下を追加します。`X.X`には、あなたのRubyバージョンの最初の2桁を入れてください。

<!-- Then append your path file with the following, replacing the `X.X` with the first two digits of your Ruby version. -->

```bash
echo 'export PATH="$HOME/.gem/ruby/X.X.0/bin:$PATH"' >> ~/.bash_profile
```

gemパスがホームディレクトリを指していることを確認するには、次のコマンドを実行します。

<!-- To check that your gem paths point to your home directory run: -->

```sh
gem env
```

`GEM PATHS:`がホームディレクトリを指していることを確認してください。

<!-- And check that `GEM PATHS:` points to a path in your home directory -->

{: .note .info}
最初の2桁が異なるRubyバージョンに更新する度に、パスもあわせて更新する必要があります。

<!-- {: .note .info}
Every time you update Ruby to a version with a different first two digits, you will need to update your path to match. -->

### グローバルインストール
<!-- ### Global Install -->

{: .note .warning}
ファイルのパーミッションの問題を回避するため、`sudo`を使用してRuby Gemsをグローバル環境にインストールしないことを、強く推奨します。

<!-- {: .note .warning}
We strongly recommend against installing Ruby gems globally to avoid file permissions problems and using `sudo`. -->

#### Mojave(10.14)の場合
<!-- #### On Mojave (10.14) -->

MojaveのSIPプロテクションのため、以下を実行しなければなりません。

<!-- Because of SIP Protections in Mojave, you must run: -->

```sh
sudo gem install bundler
sudo gem install -n /usr/local/bin/ jekyll
```

#### Mojave以前（<10.14）
<!-- #### Before Mojave (<10.14) -->

次を実行するだけです。

<!-- You only have to run: -->

```sh
sudo gem install bundler jekyll
```

## 問題が発生しましたか？
<!-- ## Problems? -->

[トラブルシューティング]({{ '/docs/troubleshooting/' | relative_url }})ページを確認したり、[フォーラムで助けを求めて](https://talk.jekyllrb.com){:target="_blank"}ください。

<!-- Check out the [troubleshooting]({{ '/docs/troubleshooting/' | relative_url }}) page or [ask for help on our forum](https://talk.jekyllrb.com). -->
