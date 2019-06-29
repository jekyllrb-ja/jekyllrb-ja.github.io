---
title: トラブルシューティング
permalink: /docs/troubleshooting/
---
<!-- ---
title: Troubleshooting
permalink: /docs/troubleshooting/
--- -->

Jekyllのインストールや使用に関する問題に出会ったら、ここにいくつかのヒントがあります。あなたが経験している問題が以下でカバーされていなければ、**[他のヘルプリソースをチェック]({{ "/help/" | relative_url }})してください**。

<!-- If you ever run into problems installing or using Jekyll, here are a few tips
that might be of help. If the problem you’re experiencing isn’t covered below,
**please [check out our other help resources](/help/)** as well. -->

- [インストールの問題](#installation-problems)
- [Jekyll実行の問題](#problems-running-jekyll)
- [Base-URLの問題](#base-url-problems)
- [設定の問題](#configuration-problems)
- [マークアップの問題](#markup-problems)
- [productionの問題](#production-problems)

<!-- - [Installation Problems](#installation-problems)
- [Problems running Jekyll](#problems-running-jekyll)
- [Base-URL Problems](#base-url-problems)
- [Configuration problems](#configuration-problems)
- [Markup Problems](#markup-problems)
- [Production Problems](#production-problems) -->

## インストールの問題 {#installation-problems}
<!-- ## Installation Problems -->

gemのインストール時にエラーに遭遇したら、Ruby 2.x用コンパイルの拡張モジュールのヘッダファイルをインストールする必要があります。UbuntuやDebianでは次を実行します。

<!-- If you encounter errors during gem installation, you may need to install
the header files for compiling extension modules for Ruby 2.x This
can be done on Ubuntu or Debian by running: -->

```sh
sudo apt-get install ruby2.6-dev
```

Red Hat, CentOS, そしてFedoraでは、次を実行します。

<!-- On Red Hat, CentOS, and Fedora systems you can do this by running: -->

```sh
sudo yum install ruby-devel
```

上記をインストールしたが、 - 特にFedora 23で - 拡張機能がまだコンパイルしない場合は、おそらく`redhat-rpm-config`が欠けているFedora imageを実行しているのでしょう。解決するために次を実行します。

<!-- If you installed the above - specifically on Fedora 23 - but the extensions would still not compile, you are probably running a Fedora image that misses the `redhat-rpm-config` package. To solve this, run: -->

```sh
sudo dnf install redhat-rpm-config
```

Arch Linuxでは次の実行が必要です。

<!-- On Arch Linux you need to run: -->

```sh
sudo pacman -S ruby-ffi
```

Ubuntuで`bundle exec jekyll serve`の後動けなくなり、`Could not locate Gemfile`や`.bundle/ directory`といったエラーが出たのでしたら、おそらく満たされていない要件があるのでしょう。最近の標準のUbuntuディストリビューションは`ruby`と`ruby-all-dev`パッケージの両方のインストールが必要です。

<!-- On Ubuntu if you get stuck after `bundle exec jekyll serve` and see error
messages like `Could not locate Gemfile` or `.bundle/ directory`, it's likely
because all requirements have not been fully met. Recent stock Ubuntu
distributions require the installation of both the `ruby` and `ruby-all-dev`
packages: -->

```sh
sudo apt-get install ruby ruby-all-dev
```

[NearlyFreeSpeech](https://www.nearlyfreespeech.net/){:target="_blank"}では、Jekyllをインストールする前に以下のコマンドを実行する必要があります。

<!-- On [NearlyFreeSpeech](https://www.nearlyfreespeech.net/) you need to run the
following commands before installing Jekyll: -->

```sh
export GEM_HOME=/home/private/gems
export GEM_PATH=/home/private/gems:/usr/local/lib/ruby/gems/1.8/
export PATH=$PATH:/home/private/gems/bin
export RB_USER_INSTALL='true'
```

GentooにRubyGemsをインストールするために：

<!-- To install RubyGems on Gentoo: -->

```sh
sudo emerge -av dev-ruby/rubygems
```

Windowsでは、[RubyInstaller
DevKit](https://wiki.github.com/oneclick/rubyinstaller/development-kit){:target="_blank"}のインストールが必要です。

<!-- On Windows, you may need to install [RubyInstaller
DevKit](https://wiki.github.com/oneclick/rubyinstaller/development-kit). -->

Android (with Termux)では全ての必要要件を次の実行でインストールできます。

<!-- On Android (with Termux) you can install all requirements by running: -->

```sh
apt update && apt install libffi-dev clang ruby-dev make
```

macOSでは、RubyGemsのアップデートが必要かもしれません（必要な場合だけ`sudo`を使用します）。

<!-- On macOS, you may need to update RubyGems (using `sudo` only if necessary): -->

```sh
gem update --system
```

まだ問題があるのでしたら、（`gcc`のような）新しいコマンドラインツールを以下のコマンドでインストールしてください。

<!-- If you still have issues, you can download and install new Command Line
Tools (such as `gcc`) using the following command: -->

```sh
xcode-select --install
```

これにより、このコマンド（必要な場合だけ`sudo`を使用します）でネイティブgemsをインストールできるようになります。

<!-- which may allow you to install native gems using this command (again, using
`sudo` only if necessary): -->

```sh
gem install jekyll
```

macOSのアップグレードは自動でXcodeをアップグレードしません（App Storeで別途行えます）、古いXcode.appは上記でダウンロードしたコマンドラインツールを妨害する恐れがあります。この問題に直面している場合は、Xcodeをアップグレードし、アップグレードされたコマンドラインツールをインストールしてください。

<!-- Note that upgrading macOS does not automatically upgrade Xcode itself
(that can be done separately via the App Store), and having an out-of-date
Xcode.app can interfere with the command line tools downloaded above. If
you run into this issue, upgrade Xcode and install the upgraded Command
Line Tools. -->

### Non-SuperuserとしてJekyllを実行する (no sudo!)
{: #no-sudo}
<!-- ### Running Jekyll as Non-Superuser (no sudo!)
{: #no-sudo} -->

Linux、macOS、およびWindows上のUbuntuのBashのほとんどのフレーバーでは、次の行を`.bashrc`ファイルの末尾に追加することで、Jekyllをnon-superuserとして実行し、システム全体の場所にgemをインストールする必要はありません。

<!-- On most flavors of Linux, macOS, and Bash on Ubuntu on Windows, it is
possible to run Jekyll as a non-superuser and without having to install
gems to system-wide locations by adding the following lines to the end
of your `.bashrc` file: -->

```
# Ruby exports

export GEM_HOME=$HOME/gems
export PATH=$HOME/gems/bin:$PATH
```

これは、`gem`の場所をシステム全体の場所ではなく、ユーザーのホームフォルダのgemsにし、システム全体のパスよりもユーザーの`PATH`にlocal jekyllコマンドを追加します。

<!-- This tells `gem` to place its gems within the user's home folder,
not in a system-wide location, and adds the local `jekyll` command to the
user's `PATH` ahead of any system-wide paths. -->

これは、ユーザーアカウントの権限が限られている多くの共有Webホスティングサービスにも役立ちます。`gem install jekyll bundler`を実行する前に、これらのexportを`.bashrc`に追加すると、Jekyllを完全にnon-`sudo`でインストールできます。

<!-- This is also useful for many shared webhosting services, where user accounts
have only limited privileges. Adding these exports to `.bashrc` before running
`gem install jekyll bundler` allows a complete non-`sudo` install of Jekyll. -->

新しいexportを有効にするには、Bashを閉じ再起動するか、shellアカウントからログアウトしてログインしなおすか、実行中のshellで`. .bashrc`を実行します。

<!-- To activate the new exports, either close and restart Bash, logout and
log back into your shell account, or run `. .bashrc` in the
currently-running shell. -->

`jekyll new`コマンドで以下のようなエラーを見た場合は、上記の手順で解決することができます。

<!-- If you see the following error when running the `jekyll new` command,
you can solve it by using the above-described procedure: -->

```sh
jekyll new test

Running bundle install in /home/user/test...

Your user account is not allowed to install to the system RubyGems.
You can cancel this installation and run:

    bundle install --path vendor/bundle

to install the gems into ./vendor/bundle/, or you can enter your password
and install the bundled gems to RubyGems using sudo.

Password:
```

一度これを行えば、`jekyll new`はあなたのユーザーアカウントで適切に動作するはずです。

<!-- Once this is done, the `jekyll new` command should work properly for
your user account. -->

### Jekyll &amp; macOS

v10.11でのSystem Integrity Protectionの導入により、以前は書き込み可能だったいくつかのディレクトリがシステムの場所と見なされ、使用できなくなりました。これらの変更を受け、起動して実行するにはいくつかの簡単な方法があります。1つの選択肢は、gemがインストールされる場所を変更することです（ここでも、必要な場合にのみ`sudo`を使用します）。

<!-- With the introduction of System Integrity Protection in v10.11, several directories
that were previously writable are now considered system locations and are no
longer available. Given these changes, there are a couple of simple ways to get
up and running. One option is to change the location where the gem will be
installed (again, using `sudo` only if necessary): -->

```sh
gem install -n /usr/local/bin jekyll
```

あるいは、HomebrewをインストールしてRubyのセットアップに使用することもできます。これは次のようにして行うことができます。

<!-- Alternatively, Homebrew can be installed and used to set up Ruby. This can be
done as follows: -->

```sh
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

Homebrewをインストールしたら、2番目のステップで実行します。

<!-- Once Homebrew is installed, the second step is to run: -->

```sh
brew install ruby
```

（より複雑なニーズを持っている）上級ユーザーはJekyllをインストールするために、多くのRubyバージョンマネージャ（[RVM][], [rbenv][], [chruby][], [etc][].）のうちの1つを選ぶのが役に立つかもしれません。

<!-- Advanced users (with more complex needs) may find it helpful to choose one of a
number of Ruby version managers ([RVM][], [rbenv][], [chruby][], [etc][].) in
which to install Jekyll. -->

[RVM]: https://rvm.io
[rbenv]: http://rbenv.org
[chruby]: https://github.com/postmodern/chruby
[etc]: https://github.com/rvm/rvm/blob/master/docs/alt.md

Rubyのインストールに上記の方法のいずれかを使用することを選択した場合は、次のコマンドを使用して`$PATH`変数を変更する必要がある場合があります。

<!-- If you elect to use one of the above methods to install Ruby, it might be
necessary to modify your `$PATH` variable using the following command: -->

```sh
export PATH=/usr/local/bin:$PATH
```

GUI appsは以下で`$PATH`を修正できます。

<!-- GUI apps can modify the `$PATH` as follows: -->

```sh
launchctl setenv PATH "/usr/local/bin:$PATH"
```

SIPが有効になっているシステムでは`/usr/local`が「安全な」場所と見なされ、Appleが提供するRubyのバージョンとの潜在的な競合を回避し、Jekyllとその依存関係をサンドボックス環境に保ちます。gemを追加または削除するときに`sudo`を必要としないという利点もあります。

<!-- Either of these approaches are useful because `/usr/local` is considered a
"safe" location on systems which have SIP enabled, they avoid potential
conflicts with the version of Ruby included by Apple, and it keeps Jekyll and
its dependencies in a sandboxed environment. This also has the added
benefit of not requiring `sudo` when you want to add or remove a gem. -->

### JavaScriptランタイムが見つけられない。(ExecJS::RuntimeUnavailable)
<!-- ### Could not find a JavaScript runtime. (ExecJS::RuntimeUnavailable) -->

適切なJavaScriptランタイムがない場合、`jekyll-coffeescript`のインストール中にこのエラーが発生する可能性があります。これを解決するには、`execjs`と`therubyracer` gemsをインストールするか、`nodejs`をインストールしてください。 詳細は[issue #2327](https://github.com/jekyll/jekyll/issues/2327){:target="_blank"}をご覧ください。

<!-- This error can occur during the installation of `jekyll-coffeescript` when
you don't have a proper JavaScript runtime. To solve this, either install
`execjs` and `therubyracer` gems, or install `nodejs`. Check out
[issue #2327](https://github.com/jekyll/jekyll/issues/2327) for more info. -->

## Jekyll実行の問題 {#problems-running-jekyll}
<!-- ## Problems running Jekyll -->

DebianやUbuntuでは、`jekyll`実行ファイルをターミナルで利用できるようにするために、パスに`/var/lib/gems/1.8/bin/`を追加する必要があります。

<!-- On Debian or Ubuntu, you may need to add `/var/lib/gems/1.8/bin/` to your path
in order to have the `jekyll` executable be available in your Terminal. -->

## Base-URLの問題 {#base-url-problems}
<!-- ## Base-URL Problems -->


<!-- If you are using base-url option like: -->

```sh
jekyll serve --baseurl '/blog'
```

上記のようにbase-urlオプションを使用している場合、サイトへのアクセスは以下を使用します。


<!-- … then make sure that you access the site at: -->

```
http://localhost:4000/blog/index.html
```

以下では上手く機能しません。

<!-- It won’t work to just access: -->

```
http://localhost:4000/blog
```

## 設定の問題 {#configuration-problems}
<!-- ## Configuration problems -->

[構成・設定]({{ "/docs/configuration/" | relative_url }})で矛盾がある場合の優先順位は以下の通りです。

<!-- The order of precedence for conflicting [configuration settings](/docs/configuration/)
is as follows: -->

1. コマンドラインのflags
2. 設定ファイルの設定
3. デフォルト

<!-- 1. Command-line flags
2. Configuration file settings
3. Defaults -->

これは、デフォルトは`_config.yml`のオプション設定で上書きされ、コマンドラインのflagsは他の設定を上書きするを意味しています。

<!-- That is: defaults are overridden by options specified in `_config.yml`,
and flags specified at the command-line will override all other settings
specified elsewhere. -->

**注：v3.3.0以降、Jekyllはデフォルトで`node_modules`と`vendor`内の特定のサブディレクトリを処理しません。ただし、設定ファイルで明示的に`exclude:`arrayを定義すると、このデフォルト設定が上書きされるため、一部のユーザーはサイトの構築時にエラーが発生し、次のエラーメッセージが表示されます。**

**Note: From v3.3.0 onward, Jekyll does not process `node_modules` and certain subdirectories within `vendor`, by default. But, by having an `exclude:` array defined explicitly in the config file overrides this default setting, which results in some users to encounter an error in building the site, with the following error message:**

```sh
    ERROR: YOUR SITE COULD NOT BE BUILT:
    ------------------------------------
    Invalid date '<%= Time.now.strftime('%Y-%m-%d %H:%M:%S %z') %>':
    Document 'vendor/bundle/gems/jekyll-3.4.3/lib/site_template/_posts/0000-00-00-welcome-to-jekyll.markdown.erb'
    does not have a valid date in front matter.
```

`vendor/bundle`を`exclude:`リストに追加することでこの問題は解決されますが、`/vendor/`（および`/node_modules/`下のサブディレクトリ）の下に他のサブディレクトリも宛先フォルダー`_site`に処理されることになります。

<!-- Adding `vendor/bundle` to the `exclude:` list will solve this problem but will lead to having other sub-directories under `/vendor/` (and also `/node_modules/`, if present) be processed to the destination folder `_site`. -->

適切な解決策は、完全に上書きするのではなく、`exclude:`のデフォルト設定を組み込むことです：

<!-- The proper solution is to incorporate the default setting for `exclude:` rather than override it completely: -->

`v3.4.3`以降のバージョンでは、`exclude:`設定は以下のようになります。

<!-- For versions up to `v3.4.3`, the `exclude:` setting must look like following: -->

```yaml
exclude:
  - Gemfile
  - Gemfile.lock
  - node_modules
  - vendor/bundle/
  - vendor/cache/
  - vendor/gems/
  - vendor/ruby/
  - any_additional_item # any user-specific listing goes at the end
```

`v3.5`以降では、`Gemfile`と`Gemfile.lock`もデフォルトで除外されています。そのため、ほとんどの場合、設定ファイルに別の`exclude:`arrayを定義する必要はありません。そのため、既存の定義を上記のように変更するか、完全に削除するか、コメントアウトして簡単に編集できるようにすることができます。

<!-- From `v3.5` onward, `Gemfile` and `Gemfile.lock` are also excluded by default. So, in most cases there is no need to define another `exclude:` array in the config file. So an existing definition can either be modified as above, or removed completely, or commented out to enable easy edits in future. -->

## マークアップの問題 {#markup-problems}
<!-- ## Markup Problems -->

Jekyllが使用している複数のマークアップエンジンにはいくつか問題があります。このページは同じ問題に直面している方への助けとなるでしょう。

<!-- The various markup engines that Jekyll uses may have some issues. This
page will document them to help others who may run into the same
problems. -->

### Liquid

Liquidバージョン2.0はテンプレートでの`{{ "{{" }}`の使用が壊れています。以前のバージョンとは異なり、2.0で`{{ "{{" }}`の使用は以下のエラーを発生させます。

<!-- Liquid version 2.0 seems to break the use of `{{ "{{" }}` in templates.
Unlike previous versions, using `{{ "{{" }}` in 2.0 triggers the following error: -->

```sh
'{{ "{{" }}' was not properly terminated with regexp: /\}\}/  (Liquid::SyntaxError)
```

### Excerpts（抜粋）
<!-- ### Excerpts -->

v1.0.0以降、Jekyllは自動的にポストの抜粋を生成しています。v1.1.0以降、Jekyllはこれらの抜粋をLiquidに渡していますが、参照が存在しない場合やタグが閉じられていない場合に、奇妙なエラーを引き起こす可能性があります。これらのエラーが発生した場合は、`_config.yml`に`excerpt_separator: ""`を設定するか、または無意味な文字列を設定してください。

<!-- Since v1.0.0, Jekyll has had automatically-generated post excerpts. Since
v1.1.0, Jekyll also passes these excerpts through Liquid, which can cause
strange errors where references don't exist or a tag hasn't been closed. If you
run into these errors, try setting `excerpt_separator: ""` in your
`_config.yml`, or set it to some nonsense string. -->

## productionの問題 {#production-problems}
<!-- ## Production Problems -->

v3.2.0以降のビルド中にproduction環境で静的ファイルが見つからないという問題が発生した場合は、[environmentを`production`]({{ "/docs/configuration/environments/" | relative_url }})に設定する必要があります。この問題は、存在しないシンボリックリンクをコピーしようとしたことが原因です。

<!-- If you run into an issue that a static file can't be found in your
production environment during build since v3.2.0 you should set your
[environment to `production`](/docs/configuration/environments/).
The issue is caused by trying to copy a non-existing symlink. -->

<div class="note">
  <h5>遭遇した問題を報告してください！</h5>
  <!-- <h5>Please report issues you encounter!</h5> -->
  <p>
  バグに遭遇した場合は、GitHubで問題とその回避策を説明した<a href="{{ site.repository }}/issues/new" target="_blank">issueを作成</a>してください。そうすればここで他の人のために文書化することができます。
  </p>
  <!-- <p>
  If you come across a bug, please <a href="{{ site.repository }}/issues/new">create an issue</a>
  on GitHub describing the problem and any work-arounds you find so we can
  document it here for others.
  </p> -->
</div>
