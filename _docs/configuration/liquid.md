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
- `warn` --- 各エラーをコンソールに警告出力する
- `strict` --- エラーメッセージを出力し、ビルドを中止する

<!-- - `lax` --- Ignore all errors.
- `warn` --- Output a warning on the console for each error.
- `strict` --- Output an error message and stop the build. -->

また、`strict_variables`や`strict_filters`を`true`に設定することで、割り当てられていない変数や存在しないフィルタをキャッチするようにLiquidのレンダラを設定することもできます。{% include docs_version_badge.html version="3.8.0" %}

<!-- You can also configure Liquid's renderer to catch non-assigned variables and
non-existing filters by setting `strict_variables` and / or `strict_filters`
to `true` respectively. {% include docs_version_badge.html version="3.8.0" %} -->

`error_mode`はLiquidのパーサを設定しますが、`strict_variables`と`strict_filters`オプションはLiquidのレンダラを設定し、結果として、相互に排他的です。

<!-- Do note that while `error_mode` configures Liquid's parser, the `strict_variables`
and `strict_filters` options configure Liquid's renderer and are consequently,
mutually exclusive. -->
