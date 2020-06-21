---
title: インストール
description: macOS、GNU/Linux、WindowsへのJikyllインストールガイド
permalink: /docs/installation/
---
<!-- ---
title: Installation
description: Official guide to install Jekyll on macOS, GNU/Linux or Windows.
permalink: /docs/installation/
--- -->

Jekyllは多くのシステムにインストールできる[Ruby Gem]({{ "/docs/ruby-101/#gems" | relative_url }})です。
<!-- Jekyll is a [Ruby Gem](/docs/ruby-101/#gems) that can be installed on most systems. -->

{: #requirements}
## 必要条件
<!-- ## Requirements -->

* [Ruby](https://www.ruby-lang.org/en/downloads/){:target="_blank"}バージョン**{{ site.data.ruby.min_version }}**以上、全てのdevelopment headersを含む。（Rubyのバージョンは、`ruby -v`の実行で確認できます）
* [RubyGems](https://rubygems.org/pages/download){:target="_blank"}（`gem -v`の実行で確認できます）
* [GCC](https://gcc.gnu.org/install/){:target="_blank"}と[Make](https://www.gnu.org/software/make/){:target="_blank"}（あなたのシステムにこれらがインストールされていない場合は、システムのコマンドラインから`gcc -v`、`g++ -v`や`make -v`を実行することで確認できます）

<!-- * [Ruby](https://www.ruby-lang.org/en/downloads/) version **{{ site.data.ruby.min_version }}** or above, including all development headers (ruby version can be checked by running `ruby -v`)
* [RubyGems](https://rubygems.org/pages/download) (which you can check by running `gem -v`)
* [GCC](https://gcc.gnu.org/install/) and [Make](https://www.gnu.org/software/make/) (in case your system doesn't have them installed, which you can check by running `gcc -v`,`g++ -v`  and `make -v` in your system's command line interface) -->

{: #guides}
## ガイド
<!-- ## Guides -->

詳しいインストールの手順は、お使いのOSのガイドをご覧ください。

<!-- For detailed install instructions have a look at the guide for your operating system. -->

* [macOS]({{ "/docs/installation/macos/" | relative_url }})
* [Ubuntu Linux]({{ "/docs/installation/ubuntu/" | relative_url }})
* [Other Linux distros]({{ "/docs/installation/other-linux" | relative_url }})
* [Windows]({{'/docs/installation/windows/' | relative_url }})

<!-- * [macOS]({{ '/docs/installation/macos/' | relative_url }})
* [Ubuntu Linux]({{ '/docs/installation/ubuntu/' | relative_url }})
* [Other Linux distros]({{ '/docs/installation/other-linux/' | relative_url }})
* [Windows]({{ '/docs/installation/windows/' | relative_url }}) -->
