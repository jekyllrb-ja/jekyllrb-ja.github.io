---
layout: docs
title: アップグレード
permalink: /docs/upgrading/
---
<!-- ---
layout: docs
title: Upgrading
permalink: /docs/upgrading/
--- -->

古いJekyllからのアップグレードですか？　新しいメジャーバージョンへのアップグレード（v2.xからv3.xなど）は頭痛の種のになるかもしれません。以下のガイドに従って、アップグレードを進めてください。

<!-- Upgrading from an older version of Jekyll? Upgrading to a new major version of
Jekyll (e.g. from v2.x to v3.x) may cause some headaches. Take the following
guides to aid your upgrade: -->

- [0.xから1.xや2.xへ]({{ "/docs/upgrading/0-to-2/" | relative_url }})
- [2.xから3.xへ]({{ "/docs/upgrading/2-to-3/" | relative_url }})
- [3.xから4.xへ]({{ "/docs/upgrading/3-to-4/" | relative_url }})

<!-- - [From 0.x to 1.x and 2.x](/docs/upgrading/0-to-2/)
- [From 2.x to 3.x](/docs/upgrading/2-to-3/)
- [From 3.x to 4.x](/docs/upgrading/3-to-4/) -->

## マイナーアップデート
<!-- ## Minor updates -->

<div class="note">
  <h5>最新版を維持してください</h5>
  <!-- <h5>Stay Up to Date</h5> -->
  <p>最新のバグの修正の恩恵を受けるために、できるだけ頻繁にJekyllをアップデートすることをお勧めします。
  </p>
  <!-- <p>We recommend you update Jekyll as often as possible to benefit from
  the latest bug fixes.
  </p> -->
</div>

セットアップ時の推奨に従って[Bundler](http://bundler.io/){:target="_blank"}をインストールした場合は、`bundle update jekyll`やもっとシンプルに`bundle update`を実行してください。全てのgemが最新版にアップデートされます。

<!-- If you followed our setup recommendations and installed [Bundler](http://bundler.io/), run `bundle update jekyll` or simply `bundle update` and all your gems will
update to the latest versions. -->

Bundlerをインストールしていなければ、`gem update jekyll`を実行してください。

<!-- If you don't have Bundler installed, run `gem update jekyll`. -->

[`github-pages`
gemを使用](https://help.github.com/articles/setting-up-your-github-pages-site-locally-with-jekyll/#keeping-your-site-up-to-date-with-the-github-pages-gem){:target="_blank"}している場合も同様です。

<!-- The procedure is similar [if you use the `github-pages`
gem](https://help.github.com/articles/setting-up-your-github-pages-site-locally-with-jekyll/#keeping-your-site-up-to-date-with-the-github-pages-gem). -->
