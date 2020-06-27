---
title: Liquid
permalink: /docs/liquid/
redirect_from: "/docs/templates/"
---

Jekyllでは、テンプレートのためにテンプレート用言語の<a href="https://shopify.github.io/liquid/" target="_blank">Liquid</a>を使用しています。
<!-- Jekyll uses the [Liquid](https://shopify.github.io/liquid/) templating language
to process templates.  -->

一般的に、Liquidで内容を出力するのに2つの中括弧を使用します（例えば、{% raw %}`{{ variable }}`{% endraw %}）。また、論理文の実行には、中括弧とパーセントで囲みます（例えば、{% raw %}`{% if statement %}`{% endraw %}）。  
Liquidについて更に学びたい場合は、<a href="https://shopify.github.io/liquid/" target="_blank">official Liquid Documentation</a>をチェックしてください。
<!-- Generally in Liquid you output content using two curly braces e.g.
{% raw %}`{{ variable }}`{% endraw %} and perform logic statements by
surrounding them in a curly brace percentage sign e.g.
{% raw %}`{% if statement %}`{% endraw %}. To learn more about Liquid, check
out the [official Liquid Documentation](https://shopify.github.io/liquid/). -->

Jekyllではサイトの構築を助けるため、多くの便利なLiquidの追加機能を提供しています。
<!-- Jekyll provides a number of useful Liquid additions to help you build your site: -->

* [フィルタ]({{ "/docs/liquid/filters/" | relative_url }})
* [タグ]({{ "/docs/liquid/tags/" | relative_url }})

<!-- * [Filters]({{ '/docs/liquid/filters/' | relative_url }})
* [Tags]({{ '/docs/liquid/tags/' | relative_url }}) -->
