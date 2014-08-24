---
layout: docs
title: Quick-start ガイド
prev_section: home
next_section: installation
permalink: /docs/quickstart/
base_revision: 0fbdc6944041147c2d21b306751b078860b6603b[refs/heads/master]
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
