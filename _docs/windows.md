---
layout: docs
title: WindowsでJekyllを動かす
prev_section: configuration
next_section: posts
permalink: /docs/windows/
---

<!--original
---
layout: docs
title: Jekyll on Windows
prev_section: configuration
next_section: posts
permalink: /docs/windows/
---
-->

Windowsは公式にサポートされたプラットフォームではありませんが、
適切に微調整することで、Jekyllを動かすことができます。
このページはWindowsユーザの皆さんによって発掘された一般的な知識・知恵を
集約することを目的としています。

<!--original
While Windows is not an officially-supported platform, it can be used to run
Jekyll with the proper tweaks. This page aims to collect some of the general
knowledge and lessons that have been unearthed by Windows users.
-->

## インストール

<!--original
## Installation
-->

Madhur Ahujaが、[WindowsでJekyllを動かす][windows-installation]手順を書いています。
これはおおよそ、うまくいっているようです。

<!--original
Madhur Ahuja has written up instructions to get
[Jekyll running on Windows][windows-installation] and it seems to work for most.
-->

## エンコード

<!--original
## Encoding
-->

UTF-8をお使いであれば、`BOM` ヘッダキャラクタが各ファイルに付いていないことを確認してください。
もし付いていると、Jekyllにおそろしく悲惨なことが起こります。
これは、JekyllをWindowsで動かす際に特に関係してくる内容です。

<!--original
If you use UTF-8 encoding, make sure that no `BOM` header
characters exist in your files or very, very bad things will happen to
Jekyll. This is especially relevant if you're running Jekyll on Windows.
-->

また、サイト生成の際に "Liquid Exception: Incompatible character encoding" が発生しないようにするため、
コンソールウィンドウの文字コードをUTF-8に変更する必要があるかもしれません。
これは下記のコマンドによって可能です。

<!--original
Additionally, you might need to change the code page of the console window to UTF-8
in case you get a "Liquid Exception: Incompatible character encoding" error during
the site generation process. It can be done with the following command:
-->

{% highlight bash %}
$ chcp 65001
{% endhighlight %}

<!--original
{% highlight bash %}
$ chcp 65001
{% endhighlight %}
-->

[windows-installation]: http://www.madhur.co.in/blog/2011/09/01/runningjekyllwindows.html

<!--original
[windows-installation]: http://www.madhur.co.in/blog/2011/09/01/runningjekyllwindows.html
-->

## 自動再生成

<!--original
## Auto-regeneration
-->

v1.3.0時点で、Jekyllはbuildまたはserveにおいて `--watch` スイッチが指定された場合、
`listen` gemを使用して変更を監視します。
`listen` はUNIXシステムにおいては組み込みでサポートされていますが、
Windowsにおいては互換性のために追加のgemを必要とします。
サイトのGemfileに下記を追加してください。

<!--original
As of v1.3.0, Jekyll uses the `listen` gem to watch for changes when the
`--watch` switch is specified during a build or serve. While `listen` has
built-in support for UNIX systems, it requires an extra gem for compatibility
with Windows. Add the following to the Gemfile for your site:
-->

{% highlight ruby %}
require 'rbconfig'
gem 'wdm', '~> 0.1.0' if RbConfig::CONFIG['target_os'] =~ /mswin|mingw/i
{% endhighlight %}

<!--original
{% highlight ruby %}
require 'rbconfig'
gem 'wdm', '~> 0.1.0' if RbConfig::CONFIG['target_os'] =~ /mswin|mingw/i
{% endhighlight %}
-->
