---
title: 手動デプロイ
permalink: /docs/deployment/manual/
---
<!-- ---
title: Manual Deployment
permalink: /docs/deployment/manual/
--- -->

Jekyllはデフォルトで`_site`ディレクトリにサイトを生成します。このディレクトリのコンテンツをホスティングプロバイダのサイトディレクトリに転送することができます。いくつかの手動で行う方法を示します。

<!-- Jekyll generates your static site to the `_site` directory by default. You can
transfer the contents of this directory to almost any hosting provider to get
your site live. Here are some manual ways of achieving this: -->

## rsync

Rsyncはscpに似ていますが、ファイル全体ではなく変更されたファイルの部分だけを送信するので高速です。[Digital Oceanチュートリアル](https://www.digitalocean.com/community/tutorials/how-to-use-rsync-to-sync-local-and-remote-directories-on-a-vps){:target="_blank"}でrsyncの使い方についてもっと学ぶことができます。

<!-- Rsync is similar to scp except it can be faster as it will only send changed
parts of files as opposed to the entire file. You can learn more about using
rsync in the [Digital Ocean tutorial](https://www.digitalocean.com/community/tutorials/how-to-use-rsync-to-sync-local-and-remote-directories-on-a-vps). -->

## Amazon S3

サイトをAmazon S3でホストしたい場合は、[s3_website](https://github.com/laurilehmijoki/s3_website){:target="_blank"}アプリケーションを使用して実行できます。サイトをAmazon S3にプッシュします。Amazon S3はあらゆるウェブサーバーのようにサイトを提供でき、ほぼ無制限のトラフィックに動的に拡大します。このアプローチには、使用するだけを支払うので、少量のブログで利用可能な最も安いホスティングオプションがあるという利点があります。

<!-- If you want to host your site in Amazon S3, you can do so by
using the [s3_website](https://github.com/laurilehmijoki/s3_website)
application. It will push your site to Amazon S3 where it can be served like
any web server,
dynamically scaling to almost unlimited traffic. This approach has the
benefit of being about the cheapest hosting option available for
low-volume blogs as you only pay for what you use. -->

## FTP

最も伝統的なWebホスティングプロバイダは、FTPを介してサーバーにファイルをアップロードすることを可能にします。FTPを使用してJekyllサイトをWebホストにアップロードするには、`jekyll build`コマンドを実行して、生成された`_site`フォルダの内容をホスティングアカウントのrootフォルダにコピーします。多くのホスティングプロバイダでは`httpdocs`または`public_html`フォルダです。

<!-- Most traditional web hosting provider let you upload files to their servers over FTP. To upload a Jekyll site to a web host using FTP, run the `jekyll build` command and copy the contents of the generated `_site` folder to the root folder of your hosting account. This is most likely to be the `httpdocs` or `public_html` folder on most hosting providers. -->

## scp

デプロイメントWebサーバーに直接アクセスできる場合、ファイルを転送するために他の方法（`scp`、または直接ファイルシステムアクセスなど）を使用できる場合を除いて、プロセスは基本的に同じです。 生成された`_site`フォルダの内容が、Webサーバーの適切なWeb rootディレクトリに配置されるようにしてください。

<!-- If you have direct access to the deployment web server, the process is essentially the same, except you might have other methods available to you (such as `scp`, or even direct filesystem access) for transferring the files. Remember to make sure the contents of the generated `_site` folder get placed in the appropriate web root directory for your web server. -->

## Rack-Jekyll

[Rack-Jekyll](https://github.com/adaoraul/rack-jekyll/){:target="_blank"}を使用すると、Amazon EC2、Slicehost、Herokuなどのラックサーバにサイトをデプロイできます。また、[shotgun](https://github.com/rtomayko/shotgun/){:target="_blank"}、[rackup](https://github.com/rack/rack)、[mongrel](https://github.com/mongrel/mongrel){:target="_blank"}、[unicorn](https://github.com/defunkt/unicorn/){:target="_blank"}や[その他](https://github.com/adaoraul/rack-jekyll#readme){:target="_blank"}でも実行できます。

<!-- [Rack-Jekyll](https://github.com/adaoraul/rack-jekyll/) allows you to deploy your site on any Rack server such as Amazon EC2, Slicehost, Heroku, and so forth. It also can run with [shotgun](https://github.com/rtomayko/shotgun/), [rackup](https://github.com/rack/rack), [mongrel](https://github.com/mongrel/mongrel), [unicorn](https://github.com/defunkt/unicorn/), and [others](https://github.com/adaoraul/rack-jekyll#readme). -->
