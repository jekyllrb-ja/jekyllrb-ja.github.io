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

せっかちな人のために、 Jekyll のひな形サイトを立ち上げる方法を説明します。

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

しかし、これは大したことではありません。
テンプレートとレイアウトを制御するために front-matter を使い、
Jekyll で使用可能なすべてのすばらしい設定オプションを利用し、
ブログの posts を作成し始めた時に、真の魔法は起こります。

<!--original
That's nothing, though. The real magic happens when you start creating blog
posts, using the front-matter to control templates and layouts, and taking
advantage of all the awesome configuration options Jekyll makes available.
-->

<div class="note info">
  <h5>Redcarpet は新しいサイトのデフォルトの Markdown エンジンです</h5>
  <p>Jekyll 1.1 から、 <code>jekyll new</code> で生成されるサイトの
     デフォルト Markdown エンジンが Redcarpet に切り替わりました。</p>
</div>

<!--original
<div class="note info">
  <h5>Redcarpet is the default Markdown engine for new sites</h5>
  <p>In Jekyll 1.1, we switched the default markdown engine for sites
     generated with <code>jekyll new</code> to Redcarpet</p>
</div>
-->

もし、問題に直面した時は、全ての [インストール必要条件][Installation]
を満たしている事を確認してください。

<!--original
If you're running into problems, ensure you have all the [requirements
installed][Installation].
-->

[Installation]: /docs/installation/

<!--original
[Installation]: /docs/installation/
-->
