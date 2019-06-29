---
title: "CircleCI"
---

Jekyllによって生成されたWebサイトの構築、テスト、およびデプロイは、継続的な統合および配信ツールである[CircleCI][0]を使用して素早く実行できます。CircleCIは[GitHub][1]と[Bitbucket][2]をサポートしており、オープンソースまたはプライベートのリポジトリを使って無料で始めることができます。

<!-- Building, testing, and deploying your Jekyll-generated website can quickly be done with [CircleCI][0], a continuous integration & delivery tool. CircleCI supports [GitHub][1] and [Bitbucket][2], and you can get started for free using an open-source or private repository. -->

[0]: https://circleci.com/
[1]: https://github.com/
[2]: https://bitbucket.org/

## 1. CircleCIでプロジェクトをフォローする
<!-- ## 1. Follow Your Project on CircleCI -->

CircleCIでプロジェクトの構築を開始するには、CircleCIのWebサイトからプロジェクトを'follow'するだけです。

<!-- To start building your project on CircleCI, all you need to do is 'follow' your project from CircleCI's website: -->

1. 'Add Projects'ページへ行きます
2. 左のGitHubかBitbucketタブから、ユーザーか組織を選択します。
3. リストからプロジェクトを見つけ出し、右の'Build project'をクリックします。
4. 最初のビルドはそれ自身で始まります。リポジトリのrootに[circle.yml][3]ファイルを作成することで、CircleCIにプロジェクトのビルド方法を指示することができます。

<!-- 1. Visit the 'Add Projects' page
1. From the GitHub or Bitbucket tab on the left, choose a user or organization.
1. Find your project in the list and click 'Build project' on the right.
1. The first build will start on its own. You can start telling CircleCI how to build your project by creating a [circle.yml][3] file in the root of your repository. -->

[3]: https://circleci.com/docs/configuration/

## 2. 依存関係
<!-- ## 2. Dependencies -->

（CircleCIの利用に関係なく）Jekyllプロジェクトの依存関係管理の最も簡単な方法は、[Gemfile][4]の利用です。`Gemfile`でJekyll、Jekyllプラグイン、[HTML Proofer](#html-proofer)、その他のgemを使用することをお勧めします。`Gemfile.lock`のバージョンも忘れないでください。こちらが`Gemfile`の例です。

<!-- The easiest way to manage dependencies for a Jekyll project (with or without CircleCI) is via a [Gemfile][4]. You'd want to have Jekyll, any Jekyll plugins, [HTML Proofer](#html-proofer), and any other gems that you are using in the `Gemfile`. Don't forget to version `Gemfile.lock` as well. Here's an example `Gemfile`: -->

[4]: http://bundler.io/gemfile.html

```ruby
source 'https://rubygems.org'

ruby '2.4.0'

gem 'jekyll'
gem 'html-proofer'
```

CircleCIは、`Gemfile`が存在することを検出し、`dependencies`フェーズで自動的に`bundle install`を実行します。

<!-- CircleCI detects when `Gemfile` is present and will automatically run `bundle install` for you in the `dependencies` phase. -->

## 3. テスト
<!-- ## 3. Testing -->

最も基本的なテストは、`jekyll build`がきちんと動くかを確認することです。これは、生成されたサイトで他のテストを実行するためのブロッカーであり、あなたがそうするなら依存関係です。そのため、`dependencies`フェーズでBundler経由でJekyllを実行します。

<!-- The most basic test that can be run is seeing if `jekyll build` actually works. This is a blocker, a dependency if you will, for other tests you might run on the generate site. So we'll run Jekyll, via Bundler, in the `dependencies` phase. -->

```yaml
dependencies:
  post:
    - bundle exec jekyll build
```

### HTML Proofer

サイトを構築したら、有効なHTML、リンク切れなどを確認するためのテストを実行すると便利です。それにはいくつかのツールがありますが、[HTML Proofer][5]はJekyllユーザーの間で人気があります。いくつかの優先フラグを付けて`test`フェーズで実行します。利用可能な全フラグについては、`html-proofer` [README][6]をチェックするか、または`htmlproofer --help`をローカルで実行してください。

<!-- With your site built, it's useful to run tests to check for valid HTML, broken links, etc. There's a few tools out there but [HTML Proofer][5] is popular amongst Jekyll users. We'll run it in the `test` phase with a few preferred flags. Check out the `html-proofer` [README][6] for all available flags, or run `htmlproofer --help` locally. -->

[5]: https://github.com/gjtorikian/html-proofer
[6]: https://github.com/gjtorikian/html-proofer/blob/master/README.md#configuration

```yaml
test:
  post:
    - bundle exec htmlproofer ./_site --check-html --disable-external
```

## circle.ymlファイルの例
<!-- ## Complete Example circle.yml File -->

まとめると、こちらは`circle.yml`ファイルがv1でどのように見えるかの例です。

<!-- When you put it all together, here's an example of what that `circle.yml` file could look like in v1: -->

```yaml
machine:
  environment:
    NOKOGIRI_USE_SYSTEM_LIBRARIES: true # speeds up installation of html-proofer

dependencies:
  post:
    - bundle exec jekyll build

test:
  post:
    - bundle exec htmlproofer ./_site --allow-hash-href --check-favicon --check-html --disable-external

deployment:
  prod:
    branch: master
    commands:
      - rsync -va --delete ./_site username@my-website:/var/html
```

新しいプロジェクトが従うDockerベースのシステムであるCircleCI v2の場合は、`S3_BUCKET_NAME`環境変数を設定します（必要な設定ファイルの例を以下に示します）。

<!-- for CircleCI v2, a Docker-based system which new projects will follow, set the `S3_BUCKET_NAME` environment variable (an example of the required config file is shown below). -->

```yaml
defaults: &defaults
  working_directory: ~/repo
version: 2
jobs:
  build:
    <<: *defaults
    docker:
      - image: circleci/ruby:2.5
    environment:
      BUNDLE_PATH: ~/repo/vendor/bundle
    steps:
      - checkout
      - restore_cache:
          keys:
            - rubygems-v1-{% raw %}{{ checksum "Gemfile.lock" }}{% endraw %}
            - rubygems-v1-fallback
      - run:
          name: Bundle Install
          command: bundle check || bundle install
      - save_cache:
          key: rubygems-v1-{% raw %}{{ checksum "Gemfile.lock" }}{% endraw %}
          paths:
            - vendor/bundle
      - run:
          name: Jekyll build
          command: bundle exec jekyll build
      - run:
          name: HTMLProofer tests
          command: |
            bundle exec htmlproofer ./_site \
              --allow-hash-href \
              --check-favicon  \
              --check-html \
              --disable-external
      - persist_to_workspace:
          root: ./
          paths:
            - _site
  deploy:
    <<: *defaults
    docker:
      - image: circleci/python:3.6.3
    environment:
      S3_BUCKET_NAME: <<YOUR BUCKET NAME HERE>>
    steps:
      - attach_workspace:
          at: ./
      - run:
          name: Install AWS CLI
          command: pip install awscli --upgrade --user
      - run:
          name: Upload to s3
          command: ~/.local/bin/aws s3 sync ./_site s3://$S3_BUCKET_NAME/ --delete --acl public-read
workflows:
  version: 2
  test-deploy:
    jobs:
      - build
      - deploy:
          requires:
            - build
          filters:
            branches:
              only: master
```

## 疑問がありますか？
<!-- ## Questions? -->

このガイドはオープンソースです。修正がある場合は[編集][7]を、トラブルがあり助けが必要な場合は[助けを求めて][8]ください。CircleCIには、助けになる[オンラインコミュニティー][9]もあります。

<!-- This entire guide is open-source. Go ahead and [edit it][7] if you have a fix or [ask for help][8] if you run into trouble and need some help. CircleCI also has an [online community][9] for help. -->

[7]: https://github.com/jekyll/jekyll/edit/master/docs/_docs/continuous-integration/circleci.md
[8]: https://jekyllrb.com/help/
[9]: https://discuss.circleci.com
