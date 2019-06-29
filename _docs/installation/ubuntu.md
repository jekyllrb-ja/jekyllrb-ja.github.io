---
title: Jekyll on Ubuntu
permalink: /docs/installation/ubuntu/
---
Jekyllをインストールする前に、必須のrequiredを全て揃っていることを確認する必要があります。

<!-- Before we install Jekyll, we need to make sure we have all the required
dependencies. -->

```sh
sudo apt-get install ruby-full build-essential zlib1g-dev
```

rootユーザーとして、Ruby Gemsをインストールしないのがいいです。ですので、ユーザーアカウントをgemのインストールディレクトリとして設定する必要があります。以下のコマンドは、gemのインストールパスを設定するために、`~/.bashrc`に環境変数を追加します。

<!-- It is best to avoid installing Ruby Gems as the root user. Therefore, we need to
set up a gem installation directory for your user account. The following
commands will add environment variables to your `~/.bashrc` file to configure
the gem installation path. Run them now: -->

```sh
echo '# Install Ruby Gems to ~/gems' >> ~/.bashrc
echo 'export GEM_HOME="$HOME/gems"' >> ~/.bashrc
echo 'export PATH="$HOME/gems/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

最後に、Jekyllをインストールします。

<!-- Finally, install Jekyll: -->

```sh
gem install jekyll bundler
```

以上です。Jekyllを使い始める準備ができました。

<!-- That's it! You're ready to start using Jekyll. -->
