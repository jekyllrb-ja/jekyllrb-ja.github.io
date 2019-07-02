---
title: 自動デプロイ
permalink: /docs/deployment/automated/
---
<!-- ---
title: Automated Deployment
permalink: /docs/deployment/automated/
--- -->

Jekyllサイトは多くの簡単に自動でデプロイする方法があります。

<!-- There are a number of ways to easily automate the deployment of a Jekyll site. -->

## Continuous Integration Service

自動デプロイの最も簡単なセットアップのフローはCIを使用することです。

<!-- One of the easiest ways to set up an automated deployment flow is by using a
CI. -->

これらのサービスはGitリポジトリにコミットしたときにスクリプトを実行します。このスクリプトでサイトを構築し、出力に対してテストを実行してから、選択したサービスに配置することをお勧めします。

<!-- These services run a script when there's a commit on your Git repository.
You might want this script to build the site, run tests over the output then deploy it to the
service of your choice.  -->

以下のプロバイダのガイドを用意しています。

<!-- We have guides for the following providers: -->

* [Travis CI]({{ "/docs/continuous-integration/travis-ci/" | relative_url }})
* [CircleCI]({{ "/docs/continuous-integration/circleci/" | relative_url }})
* [Buddy]({{ "/docs/continuous-integration/buddyworks/" | relative_url }})

<!-- * [Travis CI](/docs/continuous-integration/travis-ci/)
* [CircleCI](/docs/continuous-integration/circleci/)
* [Buddy](/docs/continuous-integration/buddyworks/) -->

## Git post-receive hook

Gitを使用して変更をプッシュするたびにリモートサーバーが展開を処理するようにするには、その`authorized_keys`ファイルに展開が許可されている全ての公開鍵を持つユーザーアカウントを作成します。これを設定したら、受信後フックの設定は次のようセットアップします。

<!-- To have a remote server handle the deploy for you every time you push changes using Git, you can create a user account which has all the public keys that are authorized to deploy in its `authorized_keys` file. With that in place, setting up the post-receive hook is done as follows: -->

```sh
laptop$ ssh deployer@example.com
server$ mkdir myrepo.git
server$ cd myrepo.git
server$ git --bare init
server$ cp hooks/post-receive.sample hooks/post-receive
server$ mkdir /var/www/myrepo
```

次に、以下の行をhooks/post-receiveに追加し、Jekyllがサーバーにインストールされたことを確認します。

<!-- Next, add the following lines to hooks/post-receive and be sure Jekyll is
installed on the server: -->

```bash
#!/bin/bash -l

# Install Ruby Gems to ~/gems
export GEM_HOME=$HOME/gems
export PATH=$GEM_HOME/bin:$PATH

GIT_REPO=$HOME/myrepo.git
TMP_GIT_CLONE=$HOME/tmp/myrepo
GEMFILE=$TMP_GIT_CLONE/Gemfile
PUBLIC_WWW=/var/www/myrepo

git clone $GIT_REPO $TMP_GIT_CLONE
BUNDLE_GEMFILE=$GEMFILE bundle install
BUNDLE_GEMFILE=$GEMFILE bundle exec jekyll build -s $TMP_GIT_CLONE -d $PUBLIC_WWW
rm -Rf $TMP_GIT_CLONE
exit
```

最後に、このフックを使用して展開できるようにする必要がある全ユーザーのラップトップで、次のコマンドを実行します。

<!-- Finally, run the following command on any users laptop that needs to be able to
deploy using this hook: -->

```sh
laptops$ git remote add deploy deployer@example.com:~/myrepo.git
```

デプロイは、nginxやApacheに`/var/www/myrepo`を調べて次のコマンドを実行するように指示するのと同じくらい簡単です。

<!-- Deploying is now as easy as telling nginx or Apache to look at
`/var/www/myrepo` and running the following: -->

```sh
laptops$ git push deploy master
```
