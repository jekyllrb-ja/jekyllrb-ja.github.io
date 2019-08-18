---
title: Jekyll on Windows
permalink: /docs/installation/windows/
redirect_from:
  - /docs/windows/
---

Windowsはまだ公式にサポートされたプラットフォームではありません。ですが、適切な調整を行ってJekyllを使用することができます。このページには、Windowsユーザーから掘り起こされた知識や教訓を集めています。

<!-- While Windows is not an officially-supported platform, it can be used to run Jekyll with the proper tweaks. This page aims to
collect some of the general knowledge and lessons that have been unearthed by Windows users. -->


## Jekyllのインストール
<!-- ## Installing Jekyll -->

### Rubyインストーラでインストール
<!-- ### Installation via RubyInstaller -->

JekyllをWindowsで実行する最も簡単な方法は、[Rubyインストーラ](https://rubyinstaller.org/){:target="_blank"}を使用することです。

<!-- The easiest way to run Jekyll is by using the [RubyInstaller](https://rubyinstaller.org/) for Windows. -->

RubyインストーラはRuby言語、実行環境、重要なドキュメンテーションなどを含むWindowsベースの自己完結型インストーラです。RubyInstaller-2.4以上のみをカバーしています。古いバージョンは手動で[Devkitをインストール](https://github.com/oneclick/rubyinstaller/wiki/Development-Kit){:target="_blank"}する必要があります。

<!-- RubyInstaller is a self-contained Windows-based installer that includes the Ruby language, an execution environment,
important documentation, and more.
We only cover RubyInstaller-2.4 and newer here, older versions need to
[install the Devkit](https://github.com/oneclick/rubyinstaller/wiki/Development-Kit) manually. -->

1. [RubyInstaller Downloads](https://rubyinstaller.org/downloads/){:target="_blank"}から**Ruby+Devkit**バージョンをダウンロードして、インストールしてください。インストールはデフォルトのオプションを使用してください。
2. インストールウィザードの最後の段階で、`ridk install`ステップを実行してください。これはネイティブ環境でgemsをインストールするためです。詳しくは[RubyInstaller Documentation](https://github.com/oneclick/rubyinstaller2#using-the-installer-on-a-target-system){:target="_blank"}を読んでください。
3. `PATH`環境変数への変更を有効にするため、スタートメニューから新しいコマンドプロンプトを開きます。`gem install jekyll bundler`でJekyllとBundlerをインストールします。
4. Jekyllがインストールされたか、`jekyll -v`で確認します。

<!-- 1. Download and Install a **Ruby+Devkit** version from [RubyInstaller Downloads](https://rubyinstaller.org/downloads/).
   Use default options for installation.
2. Run the `ridk install` step on the last stage of the installation wizard. This is needed for installing gems with native
   extensions. You can find additional information regarding this in the
   [RubyInstaller Documentation](https://github.com/oneclick/rubyinstaller2#using-the-installer-on-a-target-system)
3. Open a new command prompt window from the start menu, so that changes to the `PATH` environment variable becomes effective.
   Install Jekyll and Bundler via: `gem install jekyll bundler`
4. Check if Jekyll installed properly: `jekyll -v` -->

以上で、Jekyllを使用する準備ができました！

<!-- That's it, you're ready to use Jekyll! -->

### Windows 10でのBashによるインストール
<!-- ### Installation via Bash on Windows 10 -->

Windows10の1607以降を使用している場合、Linux用のWindowsサブシステムでJekyllを[インストール](https://msdn.microsoft.com/en-us/commandline/wsl/install_guide){:target="_blank"}するオプションがあります。

<!-- If you are using Windows 10 version 1607 or later, another option to run Jekyll is by
[installing](https://msdn.microsoft.com/en-us/commandline/wsl/install_guide) the Windows Subsystem for Linux. -->

*注：*[Windows Subsystem for Linux](https://msdn.microsoft.com/en-us/commandline/wsl/about){:target="_blank"}を有効にする必要があります。

<!-- *Note:* You must have [Windows Subsystem for Linux](https://msdn.microsoft.com/en-us/commandline/wsl/about) enabled. -->

まず、全てのパッケージとリポジトリを最新にします。新しいコマンドプロンプトを開き、以下の入力します。

<!-- First let's make sure all our packages / repositories are up to date. Open a new Command Prompt instance, and type the following: -->

```sh
bash
```

コマンドプロンプトインスタンスはBashインスタンスになります。今度はリポジトリリストとパッケージを更新しなければなりません

<!-- Your Command Prompt instance should now be a Bash instance. Now we must update our repo lists and packages. -->

```sh
sudo apt-get update -y && sudo apt-get upgrade -y
```

Rubyがインストールできます。それを行うために、Ruby for Ubuntuの最適化バージョンをホストする[BrightBox](https://www.brightbox.com/docs/ruby/ubuntu/){:target="_blank"}のリポジトリを使用します。

<!-- Now we can install Ruby. To do this we will use a repository from [BrightBox](https://www.brightbox.com/docs/ruby/ubuntu/),
which hosts optimized versions of Ruby for Ubuntu. -->

```sh
sudo apt-add-repository ppa:brightbox/ruby-ng
sudo apt-get update
sudo apt-get install ruby2.5 ruby2.5-dev build-essential dh-autoreconf
```

次はRuby gemsをアップデートしましょう。

<!-- Next let's update our Ruby gems: -->

```sh
gem update
```

後はJekyllのインストールを残すのみです。

<!-- Now all that is left to do is install Jekyll. -->

```sh
gem install jekyll bundler
```

（*注：ここでは`sudo`を使いません。*）

<!-- (*Note: no `sudo` here.*) -->

次を実行して、Jekyllが正しくインストールされているかを確認します。

<!-- Check if Jekyll installed properly by running: -->

```sh
jekyll -v
```

**以上です！**

<!-- **And that's it!** -->

`_posts`フォルダを調べることで、時間管理がきちんとできているかを確認することができます。現在の日付けがファイル名のmarkdownファイルがあるはずです。

<!-- You can make sure time management is working properly by inspecting your `_posts` folder. You should see a markdown file
with the current date in the filename. -->

<div class="note info">
  <h5>superuserでないアカウントの問題</h5>
  <!-- <h5>Non-superuser account issues</h5> -->
  <p>`jekyll new`コマンドで"Your user account isn't allowed to install to the system RubyGems"のエラーが表示されたら、 <a href="{{ "/docs/troubleshooting/#no-sudo" | relative_url }}">トラブルシューティング</a>の"SuperuserでなくJekyllを実行する"の項を見てください。</p>
  <!-- <p>If the `jekyll new` command prints the error "Your user account isn't allowed to install to the system RubyGems", see
  the "Running Jekyll as Non-Superuser" instructions in <a href="/docs/troubleshooting/#no-sudo">Troubleshooting</a>.</p> -->
</div>

**注：** Bash on Ubuntu on Windowsは、まだ開発中です。実行で問題が発生するかもしれません。

<!-- **Note:** Bash on Ubuntu on Windows is still under development, so you may run into issues. -->


## エンコード
<!-- ## Encoding -->

UTF-8を使用している場合、必ず`BOM`はつけないでください。Jekyllに非常に悪いことが起こります。これは、WindowsでJekyllを実行する場合に顕著です。

<!-- If you use UTF-8 encoding, make sure that no `BOM` header characters exist in your files or very, very bad things will happen to
Jekyll. This is especially relevant when you're running Jekyll on Windows. -->

さらに、サイト生成プロセス中に`Liquid Exception: Incompatible character encoding`エラーが発生した場合は、コンソールウィンドウのコードページをUTF-8に変更する必要があります。これは次のコマンドで実行できます。

<!-- Additionally, you might need to change the code page of the console window to UTF-8 in case you get a
`Liquid Exception: Incompatible character encoding` error during the site generation process. It can be done with the following
command: -->

```sh
chcp 65001
```

## タイムゾーンの管理
<!-- ## Time-Zone Management -->

Windowsはゾーン情報データのネイティブソースを持っていないので、RubyインタプリタはIANAタイムゾーンを理解しないでしょう。ですので、`TZ`環境変数ではデフォルトのUTC/GMT 00:00を使用します。

<!-- Since Windows doesn't have a native source of zoneinfo data, the Ruby Interpreter would not understand IANA Timezones and hence
using them had the `TZ` environment variable default to UTC/GMT 00:00. -->

Windowsユーザーは、タイムゾーンを定義するPOSIX形式を使用するようにキーを設定してブログのタイムゾーンを定義することもできます。ですが、DSTルールの変更に合わせて時計を変更することになると、それほどユーザーフレンドリーではありませんでした。

<!-- Though Windows users could alternatively define their blog's timezone by setting the key to use POSIX format of defining
timezones, it wasn't as user-friendly when it came to having the clock altered to changing DST-rules. -->

Jekyllは現在、確立された[IANAタイムゾーンデータベース](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones){:target="_blank"}に基づいてタイムゾーンを内部で設定するために、Rubygemを使用しています。 Jekyll v3.4以降で作成された「新しい」ブログでは、デフォルトで以下のものが`Gemfile`に追加されますが、既存のサイトではWindowsで開発できるように`Gemfile`を更新（およびインストール）する必要があります。

<!-- Jekyll now uses a rubygem to internally configure Timezone based on established
[IANA Timezone Database](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones).
While 'new' blogs created with Jekyll v3.4 and greater, will have the following added to their `Gemfile` by default, existing
sites *will* have to update their `Gemfile` (and installed) to enable development on Windows: -->

```ruby
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
```

<div class="note warning">
  <h5>TZInfo 2.0 不適合</h5>
  <!-- <h5>TZInfo 2.0 incompatibility</h5> -->
  <p>
    TZ情報ライブラリ<code>v2.0</code>はタイムゾーンオフセットの計算方法に変更を加えました。サイトがWindows上でJekyll 3.xでビルドされている場合、このことは投稿の日時を不正確にするでしょう。
  </p>
  <!-- <p>
    <code>v2.0</code> of the TZInfo library has introduced a change in how timezone offsets are calculated.
    This will result in incorrect date and time for your posts when the site is built with Jekyll 3.x on Windows.
  </p> -->
  <p>
    ですので、<code>Gemfile</code>に<code>gem 'tzinfo', '~> 1.2'</code>をリストして、タイムゾーンライブラリを<code>v1.2</code>以上にロックすることをお勧めします。
  </p>
  <!-- <p>
    We therefore recommend that you lock the Timezone library to <code>v1.2</code> and above by listing
    <code>gem 'tzinfo', '~> 1.2'</code> in your <code>Gemfile</code>.
  </p> -->
</div>

## 自動再作成
<!-- ## Auto Regeneration -->

Jekyllは構築またはサーブ中に`--watch`スイッチが指定された場合、`listen` gemを使用して変更を監視します。 `listen`はUNIXシステムを組み込みでサポートしていますが、Windowsとの互換性のために追加のgemが必要になるかもしれません。

<!-- Jekyll uses the `listen` gem to watch for changes when the `--watch` switch is specified during a build or serve.
While `listen` has built-in support for UNIX systems, it may require an extra gem for compatibility with Windows. -->

Windows上で自動再生成に問題があった場合は、サイトの`Gemfile`に以下を追加してください。

<!-- Add the following to the `Gemfile` for your site if you have issues with auto-regeneration on Windows alone: -->

```ruby
gem 'wdm', '~> 0.1.1', :install_if => Gem.win_platform?
```

Rubyインストーラのバージョンの[Ruby+Devkit](https://rubyinstaller.org/downloads/){:target="_blank"}を使用しなければなりませんし、`wdm`gemのインストールを成功させるためにMSYS2ビルドツールのインストールが必要です。

<!-- You have to use a [Ruby+Devkit](https://rubyinstaller.org/downloads/) version of the RubyInstaller and install
the MSYS2 build tools to successfully install the `wdm` gem. -->
