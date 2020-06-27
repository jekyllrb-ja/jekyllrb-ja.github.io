---
title: 3rd Party
permalink: /docs/deployment/third-party/
---

## Aerobatic

[Aerobatic](https://www.aerobatic.com){:target="_blank"}には、カスタムドメイン、グローバルCDN配布、基本認証、CORSプロキシ、そして増え続けるプラグインのリストが含まれています。

<!-- [Aerobatic](https://www.aerobatic.com) has custom domains, global CDN distribution, basic auth, CORS proxying, and a growing list of plugins all included. -->

自動でのJekyllサイトのデプロイはシンプルです。詳細は[Jekyll docs](https://www.aerobatic.com/docs/static-site-generators/#jekyll){:target="_blank"}をご覧ください。ビルドした`_site`フォルダを高可用性のグローバルに分散されたホスティングサービスにデプロイします。

<!-- Automating the deployment of a Jekyll site is simple. See their [Jekyll docs](https://www.aerobatic.com/docs/static-site-generators/#jekyll) for more details. Your built `_site` folder is deployed to their highly-available, globally distributed hosting service. -->

## AWS Amplify

[AWS Amplify Console](https://console.amplify.aws){:target="_blank"}は、最新のウェブアプリ（シングルページアプリと静的サイトジェネレータ）の継続的なデプロイとホスティングを提供します。継続的な展開により、開発者はGitリポジトリへのコードコミットごとにWebアプリケーションの更新を展開することができます。ホスティングには、グローバルに利用可能なCDN、ワンクリックカスタムドメイン設定 + HTTPS、機能ブランチの展開、リダイレクト、末尾のスラッシュ、パスワード保護などの機能が含まれています。

<!-- The [AWS Amplify Console](https://console.amplify.aws) provides continuous deployment and hosting for modern web apps (single page apps and static site generators). Continuous deployment allows developers to deploy updates to their web app on every code commit to their Git repository. Hosting includes features such as globally available CDNs, 1-click custom domain setup + HTTPS, feature branch deployments, redirects, trailing slashes, and password protection. -->

JekyllサイトをAWS Amplifyでデプロイとホストするために[step-by-step guide](https://medium.com/@jameshamann/deploy-your-jekyll-site-using-aws-amplify-with-only-a-few-clicks-8f3dd8f26112){:target="_blank"}を読んでください。

<!-- Read this [step-by-step guide](https://medium.com/@jameshamann/deploy-your-jekyll-site-using-aws-amplify-with-only-a-few-clicks-8f3dd8f26112) to deploy and host your Jekyll site on AWS Amplify. -->

## CloudCannon

[CloudCannon](https://cloudcannon.com){:target="_blank"}にはJekyllサイトをビルド、ホスト、更新するのに必要な物が全てあります。グローバルCDN、自動SSL、継続的導入[など](https://cloudcannon.com/features/)を{:target="_blank"}活用してください。

<!-- [CloudCannon](https://cloudcannon.com) has everything you need to build, host
and update Jekyll websites. Take advantage of our global CDN, automated SSL,
continuous deployment and [more](https://cloudcannon.com/features/). -->

## GitHub Pages

GitHub Pagesのサイトは、舞台裏でJekyllによって提供されています。ですので、手間のかからない、コストのかからないソリューションを探しているのであれば、GitHub Pagesは[Jekyllで運営されているWebサイトを無料でホスト]({{ "/docs/github-pages/" | relative_url }})するのに最適な方法です。

<!-- Sites on GitHub Pages are powered by Jekyll behind the scenes, so if you’re looking for a zero-hassle, zero-cost solution, GitHub Pages are a great way to [host your Jekyll-powered website for free](/docs/github-pages/). -->

## Kickster

GitHub Pagesでサポートされていないプラグインを使用する場合は、GitHub Pagesへの自動デプロイに[Kickster](http://kickster.nielsenramon.com/){:target="_blank"}を使用してください。

<!-- Use [Kickster](http://kickster.nielsenramon.com/) for automated deploys to GitHub Pages when using unsupported plugins on GitHub Pages. -->

Kicksterは、Webのベストプラクティスと、プロジェクト全体の品質を向上させる便利な最適化ツールが満載の基本的なJekyllプロジェクト設定を提供します。Kicksterには、GitHub Pages用の自動化された、心配のないデプロイスクリプトが付属しています。

<!-- Kickster provides a basic Jekyll project setup packed with web best practises and useful optimization tools increasing your overall project quality. Kickster ships with automated and worry-free deployment scripts for GitHub Pages. -->

Kickster gemをインストールしてください。より多くのドキュメンテーションは[こちら](https://github.com/nielsenramon/kickster#kickster){:target="_blank"}で見つけることができます。gemを使用したくない、または新しいプロジェクトを開始したくない場合は、[Travis CI](https://github.com/nielsenramon/kickster/tree/master/snippets/travis){:target="_blank"}や[Circle CI](https://github.com/nielsenramon/kickster#automated-deployment-with-circle-ci){:target="_blank"}用のデプロイスクリプトをコピー＆ペーストするだけです。

<!-- Install the Kickster gem and you are good to go. More documentation can here found [here](https://github.com/nielsenramon/kickster#kickster). If you do not want to use the gem or start a new project you can just copy paste the deployment scripts for [Travis CI](https://github.com/nielsenramon/kickster/tree/master/snippets/travis) or [Circle CI](https://github.com/nielsenramon/kickster#automated-deployment-with-circle-ci). -->

## Netlify

Netlifyは、グローバルCDN、継続的導入、ワンクリックHTTPS[など](https://www.netlify.com/features/){:target="_blank"}を提供し、複雑さを増すことなく、最新のWebプロジェクトで利用可能な堅牢なツールセットを開発者に提供します。NetlifyはJekyll用のカスタムプラグインをサポートし、オープンソースプロジェクトのための無料プランを持っています。

<!-- Netlify provides Global CDN, Continuous Deployment, one click HTTPS and [much more](https://www.netlify.com/features/), providing developers a robust toolset for modern web projects, without added complexity. Netlify supports custom plugins for Jekyll and has a free plan for open source projects. -->

JekyllサイトをNetlifyでセットアップするには、[Jekyll step-by-step guide](https://www.netlify.com/blog/2015/10/28/a-step-by-step-guide-jekyll-3.0-on-netlify/){:target="_blank"}をご覧ください。

<!-- Read this [Jekyll step-by-step guide](https://www.netlify.com/blog/2015/10/28/a-step-by-step-guide-jekyll-3.0-on-netlify/) to setup your Jekyll site on Netlify. -->

## Render

[Render](https://render.com){:target="_blank"}は、静的サイトに構成なしの継続的な展開を提供します。このサービスは毎月100GBの帯域幅で無料です。

<!-- [Render](https://render.com) provides zero config continuous deployment for static sites. The service is free under 100GB monthly bandwith. -->

## Static Publisher

[Static Publisher](https://github.com/static-publisher/static-publisher){:target="_blank"}は、ウェブフックの投稿を待機しているサーバーを使用したもう1つの自動導入オプションです。ただし、GitHubとは特に関係ありません。Herokuにワンクリックでデプロイでき、1つのサーバーから複数のプロジェクトを見ることができ、ユーザー管理が簡単なインターフェースを備え、S3またはgitリポジトリ（gh-pagesなど）にパブリッシュできます。

<!-- [Static Publisher](https://github.com/static-publisher/static-publisher) is another automated deployment option with a server listening for webhook posts, though it's not tied to GitHub specifically. It has a one-click deploy to Heroku, it can watch multiple projects from one server, it has an easy to user admin interface and can publish to either S3 or to a git repository (e.g. gh-pages). -->

## ZEIT

[ZEIT](https://zeit.co/){:target="_blank"}は、ゼロ構成の継続的デプロイメント、HTTPSカスタムドメイン、高性能スマートCDNを提供し、無料のインスタント静的デプロイメントを取得します。

<!-- [ZEIT](https://zeit.co/) provides zero config continuous deployment, HTTPS Custom domains, high performance smart CDN, you get instant static deploy for free. -->