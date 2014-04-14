---
layout: docs
title: デプロイ方法
prev_section: github-pages
next_section: troubleshooting
permalink: /docs/deployment-methods/
---

<!--original
---
layout: docs
title: Deployment methods
prev_section: github-pages
next_section: troubleshooting
permalink: /docs/deployment-methods/
---
-->

Jekyllを使用して構築されたサイトは、生成される出力の静的コンテンツを様々な方法でデプロイすることができます。最も一般的なデプロイの方法をいくつか以下に説明します。

<!--original
Sites built using Jekyll can be deployed in a large number of ways due to the static nature of the generated output. A few of the most common deployment techniques are described below.
-->

## Web ホスティングプロバイダ (FTP)

<!--original
## Web hosting providers (FTP)
-->

従来のWebホスティングプロバイダについては、あなたは、FTP経由でそれらのサーバーにファイルをアップロードできます。 FTPを使用してWebホストにジキルサイトをアップロードするには、単に `jekyll` コマンドを実行し、生成された `_site` フォルダをホスティングアカウントのルートフォルダにコピーします。

<!--original
Just about any traditional web hosting provider will let you upload files to their servers over FTP. To upload a Jekyll site to a web host using FTP, simply run the `jekyll` command and copy the generated `_site` folder to the root folder of your hosting account. This is most likely to be the `httpdocs` or `public_html` folder on most hosting providers.
-->

### Glynn を利用したFTP

<!--original
### FTP using Glynn
-->

Jekyllを利用したサイトの静的ファイルを簡単に生成し、それをあなたのホストにFTP送信する [Glynn](https://github.com/dmathieu/glynn) というプロジェクトがあります。

<!--original
There is a project called [Glynn](https://github.com/dmathieu/glynn), which lets you easily generate your Jekyll powered website’s static files and
send them to your host through FTP.
-->

## 自分で管理してる web サーバの場合

<!--original
## Self-managed web server
-->

デプロイ対象のWebサーバへの直接アクセスを自分で持っている場合は、ファイルを転送するため（例えば`scp`、あるいはファイルシステムへの直接アクセスなど）使用できる他の方法があるかもしれませんが、それらを除き、デプロイの方法は基本的に同じです。ちょうど生成された `_site`フォルダの内容が、Webサーバーの適切なWebルートディレクトリに置くことができることを確認することを忘れないでください。

<!--original
If you have direct access yourself to the deployment web server yourself, the process is essentially the same, except you might have other methods available to you (such as `scp`, or even direct filesystem access) for transferring the files. Just remember to make sure the contents of the generated `_site` folder get placed in the appropriate web root directory for your web server.
-->

## 自動化された方法

<!--original
## Automated methods
-->

Jekyllサイトのデプロイを簡単に自動化する方法はいくつもあります。あなたが下の一覧に表示されていない別の方法を持っているならば誰もが恩恵を受けることができるように、あなたが[貢献](../contributing/)することを期待します。

<!--original
There are also a number of ways to easily automate the deployment of a Jekyll site. If you’ve got another method that isn’t listed below, we’d love it if you [contributed](../contributing/) so that everyone else can benefit too.
-->

### Git post-update フック

<!--original
### Git post-update hook
-->

あなたが自身のjekyllサイトを[Git](http://git-scm.com/) に保存している場合（あなたは正しいバージョン管理をしていますか？）、
あなたのGitリポジトリにpost-update フックを設定することでデプロイ手順を自動化するのは簡単です。
[やり方はこちらです](http://web.archive.org/web/20091223025644/http://www.taknado.com/en/2009/03/26/deploying-a-jekyll-generated-site/)

<!--original
If you store your jekyll site in [Git](http://git-scm.com/) (you are using version control, right?), it’s pretty easy to automate the
deployment process by setting up a post-update hook in your Git
repository, [like
this](http://web.archive.org/web/20091223025644/http://www.taknado.com/en/2009/03/26/deploying-a-jekyll-generated-site/).
-->

### Git post-receive フック

<!--original
### Git post-receive hook
-->

リモートサーバがあなたのためにGitで変更をpushするたびにデプロイするを行うようにするには、あなたはデプロイするのに必要な許可を与えられたすべての公開鍵を`authorized_keys` ファイルに追加したアカウントを作ります。次のように所定の場所に post-receive フックを設定することでできます：

<!--original
To have a remote server handle the deploy for you every time you push changes using Git, you can create a user account which has all the public keys that are authorized to deploy in its `authorized_keys` file. With that in place, setting up the post-receive hook is done as follows:
-->

{% highlight bash %}
laptop$ ssh deployer@example.com
server$ mkdir myrepo.git
server$ cd myrepo.git
server$ git --bare init
server$ cp hooks/post-receive.sample hooks/post-receive
server$ mkdir /var/www/myrepo
{% endhighlight %}

<!--original
{% highlight bash %}
laptop$ ssh deployer@example.com
server$ mkdir myrepo.git
server$ cd myrepo.git
server$ git --bare init
server$ cp hooks/post-receive.sample hooks/post-receive
server$ mkdir /var/www/myrepo
{% endhighlight %}
-->

次に、hooks/post-receive に次の行を追加して、そしてJekyllがサーバにインストールされていることを
確認してください：

<!--original
Next, add the following lines to hooks/post-receive and be sure Jekyll is
installed on the server:
-->

{% highlight bash %}
GIT_REPO=$HOME/myrepo.git
TMP_GIT_CLONE=$HOME/tmp/myrepo
PUBLIC_WWW=/var/www/myrepo

git clone $GIT_REPO $TMP_GIT_CLONE
jekyll build -s $TMP_GIT_CLONE -d $PUBLIC_WWW
rm -Rf $TMP_GIT_CLONE
exit
{% endhighlight %}

<!--original
{% highlight bash %}
GIT_REPO=$HOME/myrepo.git
TMP_GIT_CLONE=$HOME/tmp/myrepo
PUBLIC_WWW=/var/www/myrepo

git clone $GIT_REPO $TMP_GIT_CLONE
jekyll build -s $TMP_GIT_CLONE -d $PUBLIC_WWW
rm -Rf $TMP_GIT_CLONE
exit
{% endhighlight %}
-->

最後に、このフックを使用してデプロイできる必要のあるユーザのラップトップから次のコマンドを実行してください：

<!--original
Finally, run the following command on any users laptop that needs to be able to
deploy using this hook:
-->

{% highlight bash %}
laptops$ git remote add deploy deployer@example.com:~/myrepo.git
{% endhighlight %}

<!--original
{% highlight bash %}
laptops$ git remote add deploy deployer@example.com:~/myrepo.git
{% endhighlight %}
-->

デプロイはnginx や Apache が `/var/www/myrepo` を見るのと同じくらいに簡単です。
そして次のコマンドを実行します：

<!--original
Deploying is now as easy as telling nginx or Apache to look at
`/var/www/myrepo` and running the following:
-->

{% highlight bash %}
laptops$ git push deploy master
{% endhighlight %}

<!--original
{% highlight bash %}
laptops$ git push deploy master
{% endhighlight %}
-->

### Rake

<!--original
### Rake
-->

Jekyllサイトをデプロイする別の方法は[Rake](https://github.com/jimweirich/rake)、[HighLine](https://github.com/JEG2/highline)、[Net::SSH](http://net-ssh.rubyforge.org/) を利用することです。
複数のブランチをRakeで扱い、Jekyllをデプロイするより複雑な例は[Git Ready](https://github.com/gitready/gitready/blob/cdfbc4ec5321ff8d18c3ce936e9c749dbbc4f190/Rakefile) に記載されています。

<!--original
Another way to deploy your Jekyll site is to use [Rake](https://github.com/jimweirich/rake), [HighLine](https://github.com/JEG2/highline), and
[Net::SSH](http://net-ssh.rubyforge.org/). A more complex example of deploying Jekyll with Rake that deals with multiple branches can be found in [Git Ready](https://github.com/gitready/gitready/blob/cdfbc4ec5321ff8d18c3ce936e9c749dbbc4f190/Rakefile).
-->

### rsync

<!--original
### rsync
-->

一度、 `_site` ディレクトリを生成したら、あなたは右記のような `tasks/deploy` シェルスクリプトを用いて簡単にrsyncできます。
[デプロイスクリプトはこちら](http://github.com/henrik/henrik.nyh.se/blob/master/tasks/deploy)
あなたは明らかにあなたのサイトの詳細を反映するように値を変更する必要があります。
しかし、それをするのに役立つTextMateの中から実行するスクリプト [TextMate のマッチングコマンド](http://gist.github.com/214959) があります。

<!--original
Once you’ve generated the `_site` directory, you can easily rsync it using a `tasks/deploy` shell script similar to [this deploy script here](http://github.com/henrik/henrik.nyh.se/blob/master/tasks/deploy). You’d obviously need to change the values to reflect your site’s details. There is even [a matching TextMate command](http://gist.github.com/214959) that will help you run
this script from within Textmate.
-->

## Rack-Jekyll

<!--original
## Rack-Jekyll
-->
[Rack-Jekyll](http://github.com/adaoraul/rack-jekyll/)は、Amazon EC2、Slicehost、Herokuの、そして、任意のRackサーバ上などでサイトをデプロイするための簡単な方法です。
それらは [shotgun](http://github.com/rtomakyo/shotgun/)、 [rackup](http://github.com/rack/rack)、 [mongrel](http://github.com/mongrel/mongrel)、 [unicorn](http://github.com/defunkt/unicorn/)、 [その他](https://github.com/adaoraul/rack-jekyll#readme) にて実行することができます。

<!--original
[Rack-Jekyll](http://github.com/adaoraul/rack-jekyll/) is an easy way to deploy your site on any Rack server such as Amazon EC2, Slicehost, Heroku, and so forth. It also can run with [shotgun](http://github.com/rtomakyo/shotgun/), [rackup](http://github.com/rack/rack), [mongrel](http://github.com/mongrel/mongrel), [unicorn](http://github.com/defunkt/unicorn/), and [others](https://github.com/adaoraul/rack-jekyll#readme).
-->

Rack-Jekyllを用いたHerokuへのデプロイの仕方については[この記事](http://blog.crowdint.com/2010/08/02/instant-blog-using-jekyll-and-heroku.html) を読んでください。

<!--original
Read [this post](http://blog.crowdint.com/2010/08/02/instant-blog-using-jekyll-and-heroku.html) on how to deploy to Heroku using Rack-Jekyll.
-->

## Rails用のJekyll-Admin

<!--original
## Jekyll-Admin for Rails
-->

もし、あなたが既存のRailsアプリの内部でJekyllを利用したい場合は、[Jekyll-Admin](http://github.com/zkarpinski/Jekyll-Admin)がこれを可能にするためのコードにドロップします。
より詳細はJekyll-Adminの[README](http://github.com/zkarpinski/Jekyll-Admin/blob/master/README) 参照してください。

<!--original
If you want to maintain Jekyll inside your existing Rails app, [Jekyll-Admin](http://github.com/zkarpinski/Jekyll-Admin) contains drop in code to make this possible. See Jekyll-Admin’s [README](http://github.com/zkarpinski/Jekyll-Admin/blob/master/README) for more details.
-->

## Amazon S3

<!--original
## Amazon S3
-->

あなたがAmazon S3の中であなたのサイトをホストしたい場合は、
[s3_website](https://github.com/laurilehmijoki/s3_website) アプリケーションで実現することができます。
Amazon S3にあなたのサイトをpushし、任意のWebサーバのように提供できます。ほぼ無制限のトラフィックに動的にスケーリングします。
この手段はあなたが使っただけの代金を払うだけで容量の少ないブログが利用できる最も安いホスティング・オプションであるという利点があります。

<!--original
If you want to host your site in Amazon S3, you can do so with
[s3_website](https://github.com/laurilehmijoki/s3_website) application. It will
push your site to Amazon S3 where it can be served like any web server,
dynamically scaling to almost unlimited traffic. This approach has the
benefit of being about the cheapest hosting option available for
low-volume blogs as you only pay for what you use.
-->

## OpenShift

<!--original
## OpenShift
-->

あなたのサイトをOpenShift gearにデプロイしたい場合は、[そのためのカートリッジ](https://github.com/openshift-cartridges/openshift-jekyll-cartridge)があります。

<!--original
If you'd like to deploy your site to an OpenShift gear, there's [a cartridge
for that](https://github.com/openshift-cartridges/openshift-jekyll-cartridge).
-->

<div class="note">
  <h5>ProTip™: 面倒ゼロのJekyllホスティングのためにGitHub Pagesを使う</h5>
  <p>GitHub Pages は裏側でJekyllが動いています。そして、あなたが面倒ゼロでコストがゼロなソリューションをさがしているなら、GitHub Pages は <a href="../github-pages/">無料でJekyll利用のウェブサイトをホストする</a>優れた方法です。</p>
</div>

<!--original
<div class="note">
  <h5>ProTip™: Use GitHub Pages for zero-hassle Jekyll hosting</h5>
  <p>GitHub Pages are powered by Jekyll behind the scenes, so if you’re looking for a zero-hassle, zero-cost solution, GitHub Pages are a great way to <a href="../github-pages/">host your Jekyll-powered website for free</a>.</p>
</div>
-->
