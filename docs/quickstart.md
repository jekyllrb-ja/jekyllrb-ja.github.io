---
layout: docs
title: Quick-start ガイド
prev_section: home
next_section: installation
permalink: /docs/quickstart/
---

<!--original
---
layout: docs
title: Quick-start guide
prev_section: home
next_section: installation
permalink: /docs/quickstart/
---
-->

せっかちな人のために、 Jekyll サイトの起動と動作の例を得る方法です。

<!--original
For the impatient, here's how to get a boilerplate Jekyll site up and running.
-->

{% highlight bash %}
~ $ gem install jekyll
~ $ jekyll new myblog
~ $ cd myblog
~/myblog $ jekyll serve
# => http://localhost:4000 を見てください
{% endhighlight %}

<!--original
{% highlight bash %}
~ $ gem install jekyll
~ $ jekyll new myblog
~ $ cd myblog
~/myblog $ jekyll serve
# => Now browse to http://localhost:4000
{% endhighlight %}
-->

にもかかわらず、それは何も起こりません。
真の魔法は、あなたがブログの posts を作りはじめた時に起こります。
テンプレートとレイアウトを制御するために front-matter を使い、
すべてのすばらしい設定オプションを利用して Jekyll を使用できるようにします。

<!--original
That's nothing, though. The real magic happens when you start creating blog
posts, using the front-matter to control templates and layouts, and taking
advantage of all the awesome configuration options Jekyll makes available.
-->

<div class="note info">
  <h5>Redcarpet は新しいサイトのデフォルトの Markdown エンジンです</h5>
  <p>Jekyll 1.1 から私たちは <code>jekyll new</code> で生成されるサイトの
     デフォルトの Markdown エンジンを Redcarpet に切り替えました。</p>
</div>

<!--original
<div class="note info">
  <h5>Redcarpet is the default Markdown engine for new sites</h5>
  <p>In Jekyll 1.1, we switched the default markdown engine for sites
     generated with <code>jekyll new</code> to Redcarpet</p>
</div>
-->

もし、あなたが問題に出くわしたとき、全ての [インストール必要条件][Installation]
を満たしている事を確認してください。

<!--original
If you're running into problems, ensure you have all the [requirements
installed][Installation].
-->

[Installation]: /docs/installation/
