---
title: フィルタ
permalink: /docs/plugins/filters/
---
<!-- ---
title: Filters
permalink: /docs/plugins/filters/
--- -->

フィルタはメソッドをLiquidに書き出すモジュールです。すべてのメソッドは、フィルタの入力を表す少なくとも1つのパラメータを受け取る必要があります。戻り値はフィルタの出力になります。

<!-- Filters are modules that export their methods to liquid.
All methods will have to take at least one parameter which represents the input
of the filter. The return value will be the output of the filter. -->

```ruby
module Jekyll
  module AssetFilter
    def asset_url(input)
      "http://www.example.com/#{input}?#{Time.now.to_i}"
    end
  end
end

Liquid::Template.register_filter(Jekyll::AssetFilter)
```

<div class="note">
  <h5>ProTip™: Liquidを使用してサイトオブジェクトにアクセスする</h5>
  <!-- <h5>ProTip™: Access the site object using Liquid</h5> -->
  <p>
    Jekyllでは、<code>@context.registers[:site]</code>のLiquidの<code>@context.registers</code>機能を通じて、<code>site</code>オブジェクトにアクセスすることができます。例えば、 <code>@context.registers[:site].config</code>を使用してグローバル設定ファイルの<code>_config.yml</code>にアクセスできます。
  </p>
  <!-- <p>
    Jekyll lets you access the <code>site</code> object through the
    <code>@context.registers</code> feature of Liquid at <code>@context.registers[:site]</code>. For example, you can
    access the global configuration file <code>_config.yml</code> using
    <code>@context.registers[:site].config</code>.
  </p> -->
</div>
