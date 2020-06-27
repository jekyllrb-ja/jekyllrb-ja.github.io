---
title: Ruby基礎
permalink: /docs/ruby-101/
---
<!-- ---
title: Ruby 101
permalink: /docs/ruby-101/
--- -->

JekyllはRubyで書かれています。Rubyが初めてでしたら、このページはいくつかの用語を理解するのを助けるものです。
<!-- Jekyll is written in Ruby. If you're new to Ruby, this page is to help you get
up to speed with some of the terminology. -->

## Gems

gemはRubyプロジェクトに含めることができるコードです。機能をパッケージにして、他のプロジェクトや他の人々と共有することを可能にします。
gemは次のような機能を実行できます。
<!-- A gem is code you can include in Ruby projects. It allows you to package up functionality and share it across other projects or with other people. Gems can perform functionality such as: -->

* RubyオブジェクトをJSONにコンバート
* ページ分け
* GitHubのようなAPIとの相互作用
* Jekyllはそれ自身が、[jekyll-feed](https://github.com/jekyll/jekyll-feed){:target="_blank"}、[jekyll-seo-tag](https://github.com/jekyll/jekyll-seo-tag){:target="_blank"}や[jekyll-archives](https://github.com/jekyll/jekyll-archives){:target="_blank"}を含む多くのJekyllプラグインと同様にgemです。

<!-- * Converting a Ruby object to JSON
* Pagination
* Interacting with APIs such as GitHub
* Jekyll itself is a gem as well as many Jekyll plugins including
[jekyll-feed](https://github.com/jekyll/jekyll-feed),
[jekyll-seo-tag](https://github.com/jekyll/jekyll-seo-tag) and
[jekyll-archives](https://github.com/jekyll/jekyll-archives). -->

## Gemfile

`Gemfile`はあなたのサイトに必要なgemのリストです。シンプルなJekyllサイトの場合、この様になります。
<!-- A `Gemfile` is a list of gems required for your site. For a simple Jekyll site it might look something like this: -->

```ruby
source "https://rubygems.org"

gem "jekyll"

group :jekyll_plugins do
  gem "jekyll-feed"
  gem "jekyll-seo-tag"
end
```

## Bundler

Bundlerは`Gemfile`のgemをインストールします。`Gemfile`や`bundler`の使用は必須ではありませんが、異なる環境で横断的に、JekyllやJekyllプラグインと同じバージョンを確保することを強くお勧めします。
<!-- Bundler installs the gems in your `Gemfile`. It's not a requirement for you to use a `Gemfile` and `bundler` however it's highly recommended as it ensures you're running the same version of Jekyll and Jekyll plugins across different environments. -->

`gem install bundler`で[Bundler](https://rubygems.org/gems/bundler){:target="_blank"}をインストールします。必要なのは1回だけです。 &mdash; 新しいJekyllプロジェクトを作成する度ではありません。
追加情報をいくつか以下に記載しています。
<!-- `gem install bundler` installs [Bundler](https://rubygems.org/gems/bundler). You only need to install it once &mdash; not every time you create a new Jekyll project. Here are some additional details: -->

`Gemfile`を使用している場合、最初に`bundle install`でgemをインストールし、`bundle exec jekyll serve`でサイトを構築します。これは`Gemfile`に設定されているgemバーションを使用することを保証します。
`Gemfile`を使用していない場合は、ただ`jekyll serve`で実行できます。
<!-- If you're using a `Gemfile` you would first run `bundle install` to install the gems, then `bundle exec jekyll serve` to build your site. This guarantees you're using the gem versions set in the `Gemfile`. If you're not using a `Gemfile` you can just run `jekyll serve`. -->

JekyllプロジェクトでのBundlerの使い方についてのさらなる情報は、この[チュートリアル]({{ "/tutorials/using-jekyll-with-bundler/" | relative_url }})に多くの共通の質問の回答と、すぐに起動して実行する方法があります。
<!-- For more information about how to use Bundler in your Jekyll project, this [tutorial](/tutorials/using-jekyll-with-bundler/) should provide answers to the most common questions and explain how to get up and running quickly. -->
