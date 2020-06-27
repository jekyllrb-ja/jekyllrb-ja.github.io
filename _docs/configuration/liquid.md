---
title: Liquidオプション
permalink: "/docs/configuration/liquid/"
---
<!-- ---
title: Liquid Options
permalink: "/docs/configuration/liquid/"
--- -->

エラーに対するLiquidの応答は、`error_mode`を設定することで設定できます。オプションは、

<!-- Liquid's response to errors can be configured by setting `error_mode`. The
options are -->

- `lax` --- 全てのエラーを無視する
- `warn` --- 各エラーをコンソールに警告出力する (default)
- `strict` --- エラーメッセージを出力し、ビルドを中止する

<!-- - `lax` --- Ignore all errors.
- `warn` --- Output a warning on the console for each error. (default)
- `strict` --- Output an error message and stop the build. -->

_config.ymlのデフォルト設定は以下の通りです。
<!-- Within _config.yml, the default configuration is as follows: -->
```yaml
liquid:
  error_mode: warn
```

上記の例は"warn"値を設定する場合ですが、すでにデフォルトで`error_mode: warn`が設定されています。これにより、ビルドプロセス中にエラーが出力されますが、可能な限りビルドは継続されます。

<!-- The above example depicts the "warn" value, which is already set by default- `error_mode: warn`. This results in any issues being called out during the build process however will continue to build if possible. -->

また、`strict_variables`や`strict_filters`を`true`に設定することで、割り当てられていない変数や存在しないフィルタをキャッチするようにLiquidのレンダラを設定することもできます。{% include docs_version_badge.html version="3.8.0" %}

<!-- You can also configure Liquid's renderer to catch non-assigned variables and
non-existing filters by setting `strict_variables` and / or `strict_filters`
to `true` respectively. {% include docs_version_badge.html version="3.8.0" %} -->

`error_mode`はLiquidのパーサを設定しますが、`strict_variables`と`strict_filters`オプションはLiquidのレンダラを設定し、結果として、相互に排他的です。

<!-- Do note that while `error_mode` configures Liquid's parser, the `strict_variables`
and `strict_filters` options configure Liquid's renderer and are consequently,
mutually exclusive. -->

これらの値を_config.ymlで設定する例を示します。

<!-- An example of setting these variables within _config.yml is as follows: -->
```yaml
liquid:
  error_mode: strict
  strict_variables: true
  strict_filters: true
```

上記のように設定すると、ハプニングでビルド/サーブの発生を停止し、問題のあるエラーを出力します。これは、ビルドまたはサーブプロセスを停止して問題に対処できるようにすることで、Liquid関連の問題をキャッチしたい場合に役立ちます。

<!-- Configuring as described above will stop your build/serve from happening and call out the offending error and halt. This is helpful when desiring to catch liquid-related issues by stopping the build or serve process and allowing you to deal with any issues. -->