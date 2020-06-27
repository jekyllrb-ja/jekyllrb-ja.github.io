---
title: 環境
permalink: "/docs/configuration/environments/"
---
<!-- ---
title: Environments
permalink: "/docs/configuration/environments/"
--- -->

`build`（や`serve`）引数で、Jekyllの環境と値を指定できます。その後、ビルドはこの値をコンテンツの条件付きステートメントに適用します。

<!-- In the `build` (or `serve`) arguments, you can specify a Jekyll environment
and value. The build will then apply this value in any conditional statements
in your content. -->

例えば、コードで次の条件を設定したとします。

<!-- For example, suppose you set this conditional statement in your code: -->

{% raw %}
```liquid
{% if jekyll.environment == "production" %}
   {% include disqus.html %}
{% endif %}
```
{% endraw %}

Jekyllサイトを構築するとき、`if`内のコンテンツは、次のようにビルドコマンドで`production`environmentを指定しなければ実行されません。

<!-- When you build your Jekyll site, the content inside the `if` statement won't be
run unless you also specify a `production` environment in the build command,
like this: -->

```sh
JEKYLL_ENV=production jekyll build
```

environmentの値を指定することで、特定の場合のみコンテンツを利用可能にすることができます。

<!-- Specifying an environment value allows you to make certain content available
only within specific environments. -->

`JEKYLL_ENV`のデフォルト値は、`development`です。従って、ビルド引数から`JEKYLL_ENV`を省略すると、デフォルト値は`JEKYLL_ENV=development`になります。{% raw %}`{% if jekyll.environment == "development" %}`{% endraw %}タグ内の全てのコンテンツは自動的にビルド時に表示されます。

<!-- The default value for `JEKYLL_ENV` is `development`. Therefore if you omit
`JEKYLL_ENV` from the build arguments, the default value will be
`JEKYLL_ENV=development`. Any content inside
{% raw %}`{% if jekyll.environment == "development" %}`{% endraw %} tags will
automatically appear in the build. -->

environment値は（`development`と`production`以外は）好きなものを使用できます。DisqusコメントフォームやGoogle Analyticsを含む開発時には隠したい要素があるでしょう。"Edit me in GitHub"ボタンは開発環境では表示して、製品環境では含まないようにしたいのではないでしょうか。

<!-- Your environment values can be anything you want (not just `development` or
`production`). Some elements you might want to hide in development
environments include Disqus comment forms or Google Analytics. Conversely,
you might want to expose an "Edit me in GitHub" button in a development
environment but not include it in production environments. -->

ビルドコマンドのオプションでの指定で、ある環境から別の環境への変更時に、設定ファイル内の値を変更する必要がありません。

<!-- By specifying the option in the build command, you avoid having to change
values in your configuration files when moving from one environment to another. -->

{: .note}
環境に応じて設定の一部を切り替えるには、<a href="{{ "/docs/configuration/options/#build-command-options" | relative_url }}">ビルドコマンドオプション</a>を使用します。例えば<code>--config _config.yml、_config_development.yml</code>です。 後のファイルの設定は、前のファイルの設定を上書きします。

  <!-- {: .note}
To switch part of your config settings depending on the environment, use the
<a href="{{ '/docs/configuration/options/#build-command-options' | relative_url }}">build command option</a>,
for example <code>--config _config.yml,_config_development.yml</code>. Settings
in later files override settings in earlier files. -->
