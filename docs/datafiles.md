---
layout: docs
title: データファイル
prev_section: variables
next_section: assets
permalink: /docs/datafiles/
---

<!--original
---
layout: docs
title: Data Files
prev_section: variables
next_section: assets
permalink: /docs/datafiles/
---
-->

Jekyll から利用できる[組み込み変数](../variables/)に加えて、
[Liquid templating system](http://wiki.github.com/shopify/liquid/liquid-for-designers) を
介してアクセスすることができるように自分自身のカスタムデータを指定できます。

<!--original
In addition to the [built-in variables](../variables/) available from Jekyll,
you can specify your own custom data that can be accessed via the [Liquid
templating system](http://wiki.github.com/shopify/liquid/liquid-for-designers).
-->

Jekyll `_data` ディレクトリの中に位置している [YAML](http://yaml.org/) ファイルからの
データロードをサポートしています。

<!--original
Jekyll supports loading data from [YAML](http://yaml.org/) files located in the
`_data` directory.
-->

この強力な機能は、テンプレート内で繰り返しを避けることと、
`_config.yml` の変更なしにサイトの特定のオプションを設定することができます。

<!--original
This powerful feature allows you to avoid repetition in your templates and to
set site specific options without changing `_config.yml`.
-->

プラグイン/テーマも変数を設定するためにデータファイルを活用することができます。

<!--original
Plugins/themes can also leverage Data Files to set configuration variables.
-->

## データフォルダ

<!--original
## The Data Folder
-->

[ディレクトリ構成](../structure/)ページで説明した、
あなたのサイトを生成する時、 Jekyll が使用するためのデータを
格納できる場所が `_data` フォルダです。
これらのファイルは YAML ファイル( `.yml` または `.yaml` 拡張子のどちらかを使用して)
であるべきであり、そしてそれらは `site.data` 経由でアクセスできるようになります。

<!--original
As explained on the [directory structure](../structure/) page, the `_data`
folder is where you can store additional data for Jekyll to use when generating
your site. These files must be YAML files (using either the `.yml` or `.yaml`
extension) and they will be accessible via `site.data`.
-->

## 例: メンバーのリスト

<!--original
## Example: List of members
-->

Jekyll テンプレートのコードのコピーペーストの塊を避けるための
データファイルを使用する基本的な例は次の通りです:

<!--original
Here is a basic example of using Data Files to avoid copy-pasting large chunks of
code in your Jekyll templates:
-->

`_data/members.yml` の中:

<!--original
In `_data/members.yml`:
-->

{% highlight yaml %}
- name: Tom Preston-Werner
  github: mojombo

- name: Parker Moore
  github: parkr

- name: Liu Fengyun
  github: liufengyun
{% endhighlight %}

<!--original
{% highlight yaml %}
- name: Tom Preston-Werner
  github: mojombo

- name: Parker Moore
  github: parkr

- name: Liu Fengyun
  github: liufengyun
{% endhighlight %}
-->

このデータには `site.data.members` 経由でアクセスできます。
(ファイル名は変数名を決定していることに注意してください)

<!--original
This data can be accessed via `site.data.members` (notice that the filename
determines the variable name).
-->

あなたは今、テンプレート内のメンバーリストをレンダリングすることができます:

<!--original
You can now render the list of members in a template:
-->

{% highlight html %}
{% raw %}
<ul>
{% for member in site.data.members %}
  <li>
    <a href="https://github.com/{{ member.github }}">
      {{ member.name }}
    </a>
  </li>
{% endfor %}
</ul>
{% endraw %}
{% endhighlight %}

<!--original
{% highlight html %}
{% raw %}
<ul>
{% for member in site.data.members %}
  <li>
    <a href="https://github.com/{{ member.github }}">
      {{ member.name }}
    </a>
  </li>
{% endfor %}
</ul>
{% endraw %}
{% endhighlight %}
-->
