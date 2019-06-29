---
title: "Buddy"
---

[Buddy][buddy-homepage]は[Docker][docker-homepage]ベースのCIサーバーで、15〜20分でセットアップしてJekyll Webサイトを構築、テスト、および展開できます。[GitHub][github-homepage]、[Bitbucket][bitbucket-homepage]、および[GitLab][gitlab-homepage]リポジトリをサポートしており、オンプレミスでインストールすることも、クラウドで使用することもできます。以下のガイドでは、Jekyllプロジェクトをビルドしてテストするための無料の環境を設定する方法を説明しています。

<!-- [Buddy][buddy-homepage] is a [Docker][docker-homepage]-based CI server that you can set up in 15-20 minutes to build, test, and deploy your Jekyll websites. It supports [GitHub][github-homepage], [Bitbucket][bitbucket-homepage], and [GitLab][gitlab-homepage] repositories, and can be installed on-premises or used in cloud. The following guide will show you how to set up a free environment to build and test your Jekyll project. -->

[buddy-homepage]: https://buddy.works
[docker-homepage]: https://www.docker.com/
[github-homepage]: https://github.com
[bitbucket-homepage]: https://bitbucket.org/
[gitlab-homepage]: https://gitlab.com

## 1. 始める
<!-- ## 1. Getting started -->

1. [https://buddy.works][buddy-homepage]にGitHub/BitbucketアカウントかEメールでログインします。
2. Gitプロバイダーを選び、Jekyllプロジェクトを選択するかプッシュします。
3. 新しいパイプラインを作成し、'On every push'にトリガーをセットします。
4. Jekyllアクション設定を追加し、パイプラインを保存します。

<!-- 1. Log in at [https://buddy.works][buddy-homepage] with your GitHub/Bitbucket account or email
2. Choose your Git provider and select or push your Jekyll Project
3. Create a new pipeline and set the trigger mode to 'On every push'
4. Add and configure the Jekyll action and save the pipeline -->

## 2. 働き方
<!-- ## 2. How it works -->

選択したブランチにプッシュするたびに、Jekyllアクションは孤立した[Jekyll Dockerイメージ][jekyll-docker-image]で`jekyll build`を実行します。 出力は`/filesystem`ディレクトリに生成され、さらにFTP/SFTPおよびIaaSサービスにデプロイできます。あなた自身のコマンドを追加したり、追加のパッケージをインストールしたり、サービスをアタッチしたり、Seleniumテストを実行したり、そして他のアクション（Slack通知やサーバーを再起動するSSHスクリプトなど）をパイプラインの下に追加することができます。

<!-- Whenever you make a push to the selected branch, the Jekyll action runs `jekyll build` in an isolated [Jekyll Docker image][jekyll-docker-image]. The output is generated to the `/filesystem` directory, and can be further deployed to FTP/SFTP and IaaS services. You can add your own commands, install additional packages, attach services, and run Selenium tests, as well as add other actions down the pipeline, eg. a Slack notification or an SSH script that will restart your server. -->

[jekyll-docker-image]: https://hub.docker.com/r/jekyll/jekyll/

## 3. 設定にYAMLを使用する
<!-- ## 3. Using YAML for configuration -->

GUIよりもコードとして設定したい場合は、ターゲットブランチにプッシュするとJekyllアクションでパイプラインを作成する`buddy.yml`を生成できます。

<!-- If you prefer configuration as code over GUI, you can generate a `buddy.yml` that will create a pipeline with the Jekyll action once you push it to the target branch: -->

```yaml
- pipeline: "Build and Deploy Jekyll site"
  trigger_mode: "ON_EVERY_PUSH"
  ref_name: "master"
  actions:
  - action: "Execute: jekyll build"
    type: "BUILD"
    docker_image_name: "jekyll/jekyll"
    docker_image_tag: "latest"
    execute_commands:
    - "chown jekyll:jekyll $WORKING_DIR"
    - "jekyll build"
```

## 4. オンプレミスサーバーの設定
<!-- ## 4. Setting up on-premises server -->

セルフホスト版のBuddyは、[Linux][bw-linux]、[Mac][bw-mac]、 [AWS EC2][bw-aws-ec2]、[DigitalOcean][bw-digitalocean]、[Microsoft Azure][bw-azure]など、Dockerをサポートするあらゆる種類のサーバーにインストールできます。

<!-- The self-hosted version of Buddy can be installed on any type of server supporting Docker, including [Linux][bw-linux], [Mac][bw-mac], [AWS EC2][bw-aws-ec2], [DigitalOcean][bw-digitalocean], and [Microsoft Azure][bw-azure]. -->

[bw-linux]: https://buddy.works/knowledge/standalone/installation-linux
[bw-mac]: https://buddy.works/knowledge/standalone/installation-mac-osx
[bw-aws-ec2]: https://buddy.works/knowledge/standalone/installation-amazon-ec2
[bw-digitalocean]: https://buddy.works/knowledge/standalone/installation-digitalocean
[bw-azure]: https://buddy.works/knowledge/standalone/installation-azure

## 5. 疑問がありますか？
<!-- ## 5. Questions? -->

このガイドはオープンソースです。修正がある場合は[編集][jekyll-docs-ci-buddy]を、トラブルがあり助けが必要な場合は[助けを求めて][jekyll-help]ください。CircleCIには、助けになる[オンラインコミュニティー][buddy-forum]もあります。

<!-- This entire guide is open-source. Go ahead and [edit it][jekyll-docs-ci-buddy] if you want to expand it or have a fix or [ask for help][jekyll-help] if you run into trouble and need assistance. Buddy also has an [online community][buddy-forum] for help. -->

[jekyll-docs-ci-buddy]: https://github.com/jekyll/jekyll/edit/master/docs/_docs/continuous-integration/buddyworks.md
[jekyll-help]: https://jekyllrb.com/help/
[buddy-forum]: http://forum.buddy.works/
