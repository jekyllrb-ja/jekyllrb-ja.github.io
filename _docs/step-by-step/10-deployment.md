---
layout: step
title: Deployment
position: 10
---

この最後のステップでは、サイトの公開準備をします。

<!-- In this final step we'll get the site ready for production. -->

## Gemfile

サイトの[Gemfile]({{ "/docs/ruby-101/#gemfile" | relative_url }})を用意することは、よい経験になります。これにより、Jekyllや他のgemのバージョンが異なる環境でも、一貫していることが保証されます。

<!-- It's good practice to have a [Gemfile](/docs/ruby-101/#gemfile) for your site.
This ensures the version of Jekyll and other gems remains consistent across
different environments. -->

rootに以下の`Gemfile`を作ります。

<!-- Create `Gemfile` in the root with the following: -->

```
source 'https://rubygems.org'

gem 'jekyll'
```

ターミナルで`bundle install`を実行します。これでgemをインストールし、後々`bundle install`時に現在のgemのバージョンをロックしておくための`Gemfile.lock`を作成します。gemのバージョンを更新したいときは、`bundle update`を実行してください。

<!-- Then run `bundle install` in your terminal. This installs the gems and
creates `Gemfile.lock` which locks the current gem versions for a future
`bundle install`. If you ever want to update your gem versions you can run
`bundle update`. -->

`Gemfile`を使用すると、`jekyll serve`の様なコマンドは`bundle exec`を前につけて実行します。ですので、フルコマンドは次のようになります。

<!-- When using a `Gemfile`, you'll run commands like `jekyll serve` with
`bundle exec` prefixed. So the full command is: -->

```bash
bundle exec jekyll serve
```

これは、`Gemfile`で設定されたgemだけを使用するようにRuby環境を制限します。

<!-- This restricts your Ruby environment to only use gems set in your `Gemfile`. -->

## プラグイン
<!-- ## Plugins -->

Jekyllプラグインは、サイトに固有のカスタムコンテンツを生成することができます。沢山の利用可能な[plugins]({{ "/docs/plugins/" | relative_url }})がありますし、自分自身で作ることもできます。

<!-- Jekyll plugins allow you to create custom generated content specific to your
site. There's many [plugins](/docs/plugins/) available or you can even
write your own. -->

多くのJekyllサイトで便利な公式のプラグイン3つを紹介します。

<!-- There's three official plugins which are useful on almost any Jekyll site: -->

* [jekyll-sitemap](https://github.com/jekyll/jekyll-sitemap){:target="_blank"} - 検索エンジンがコンテンツをインデックスに加えるのを助けるsitemapを作成します。
* [jekyll-feed](https://github.com/jekyll/jekyll-feed){:target="_blank"} - ポストのRSSフィードを作成します。
* [jekyll-seo-tag](https://github.com/jekyll/jekyll-seo-tag) {:target="_blank"}- SEO用のmetaタグを追加します。

<!-- * [jekyll-sitemap](https://github.com/jekyll/jekyll-sitemap) - Creates a sitemap
file to help search engines index content
* [jekyll-feed](https://github.com/jekyll/jekyll-feed) - Creates an RSS feed for
your posts
* [jekyll-seo-tag](https://github.com/jekyll/jekyll-seo-tag) - Adds meta tags to help
with SEO -->

これらを使用するには、まず`Gemfile`に追記します。`jekyll_plugins`に配置すれば、自動でJekyllに要求されます。

<!-- To use these first you need to add them to your `Gemfile`. If you put them
in a `jekyll_plugins` group they'll automatically be required into Jekyll: -->

```
source 'https://rubygems.org'

gem 'jekyll'

group :jekyll_plugins do
  gem 'jekyll-sitemap'
  gem 'jekyll-feed'
  gem 'jekyll-seo-tag'
end
```

次に以下の行を`_config.yml`に追加します。

<!-- Then add these lines to your `_config.yml`: -->

```
plugins:
  - jekyll-feed
  - jekyll-sitemap
  - jekyll-seo-tag
```

では、`bundle update`を実行して、これらをインストールしましょう。

<!-- Now install them by running a `bundle update`. -->

`jekyll-sitemap`はこれ以上のステップを必要とせず、構築時にsitemapを作成します。

<!-- `jekyll-sitemap` doesn't need any setup, it will create your sitemap on build. -->

`jekyll-feed`と`jekyll-seo-tag`は`_layouts/default.html`にタグの追加が必要です。

<!-- For `jekyll-feed` and `jekyll-seo-tag` you need to add tags to
`_layouts/default.html`: -->

{% raw %}
```liquid
<!doctype html>
<html>
  <head>
    <meta charset="utf-8">
    <title>{{ page.title }}</title>
    <link rel="stylesheet" href="/assets/css/styles.css">
    {% feed_meta %}
    {% seo %}
  </head>
  <body>
    {% include navigation.html %}
    {{ content }}
  </body>
</html>
```
{% endraw %}

Jekyll serverを再起動して、これらのタグが`<head>`に追加されていることを確認しましょう。

<!-- Restart your Jekyll server and check these tags are added to the `<head>`. -->

## Environments（環境）
<!-- ## Environments -->

作品に出力したいけれど、まだデプロイにないものに出会うこともあるでしょう。例としては、Analyticsスクリプトです。

<!-- Sometimes you might want to output something in production but not
in development. Analytics scripts are the most common example of this. -->

これを行うには、[environments]({{ "/docs/configuration/environments/" | relative_url }})を使用します。`JEKYLL_ENV`変数を使用して、コマンド実行時に環境を設定します。例えば、

<!-- To do this you can use [environments](/docs/configuration/environments/). You
can set the environment by using the `JEKYLL_ENV` environment variable when
running a command. For example: -->

```bash
JEKYLL_ENV=production bundle exec jekyll build
```

デフォルトでは`JEKYLL_ENV`はデプロイです。`JEKYLL_ENV`は`jekyll.environment`でLiquidで使用できます。

<!-- By default `JEKYLL_ENV` is development. The `JEKYLL_ENV` is available to you
in liquid using `jekyll.environment`. So to only output the analytics script
on production you would do the following: -->

{% raw %}
```liquid
{% if jekyll.environment == "production" %}
  <script src="my-analytics-script.js"></script>
{% endif %}
```
{% endraw %}

## デプロイ
<!-- ## Deployment -->

最後のステップではsiteをサーバーに上げます。最も基本的な方法は、production buildを実行することです。

<!-- The final step is to get the site onto a production server. The most basic way
to do this is to run a production build: -->

```bash
JEKYLL_ENV=production bundle exec jekyll build
```

そして、`_site`のコンテンツをサーバーにコピーします。

<!-- And copy the contents of `_site` to your server. -->

更によい方法は、このプロセスを[CI]({{ "/docs/deployment/automated/" | relative_url }})や[3rd party]({{ "/docs/deployment/third-party/" | relative_url }})の利用による自動化です。

<!-- A better way is to automate this process using a [CI](/docs/deployment/automated/)
or [3rd party](/docs/deployment/third-party/). -->

## 最後に
<!-- ## Wrap up -->

これで、このstep-by-stepちょーとリアルはお終いです。ですが、あなたのJekyllの旅は始まったばかりです！

<!-- That brings us to the end of this step-by-step tutorial and the beginning of
your Jekyll journey! -->

* [community forums](https://talk.jekyllrb.com){:target="_blank"}に行き挨拶しましょう。
* [貢献]({{ "/docs/contributing/" | relative_url }})でJekyllをより良くするのを手伝ってください。
* Jekyllサイトを作り続けてください。

<!-- * Come say hi to the [community forums](https://talk.jekyllrb.com)
* Help us make Jekyll better by [contributing](/docs/contributing/)
* Keep building Jekyll sites! -->
