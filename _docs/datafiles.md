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
介してアクセス可能な独自のカスタムデータを指定できます。

<!--original
In addition to the [built-in variables](../variables/) available from Jekyll,
you can specify your own custom data that can be accessed via the [Liquid
templating system](http://wiki.github.com/shopify/liquid/liquid-for-designers).
-->

Jekyll は `_data` ディレクトリの中に配置された [YAML](http://yaml.org/) ファイルからの
データ読み込みをサポートしています。

<!--original
Jekyll supports loading data from [YAML](http://yaml.org/) files located in the
`_data` directory.
-->

この強力な機能を利用すれば、テンプレート内で繰り返しを避けることができ、また、
`_config.yml` を変更せずともサイト特有のオプションを設定することができます。

<!--original
This powerful feature allows you to avoid repetition in your templates and to
set site specific options without changing `_config.yml`.
-->

プラグイン/テーマも環境設定のためにデータファイルを活用することができます。

<!--original
Plugins/themes can also leverage Data Files to set configuration variables.
-->

## データフォルダ

<!--original
## The Data Folder
-->

[ディレクトリ構成](../structure/)ページで説明しているように、
あなたのサイトを生成する時に Jekyll が使用する追加的なデータを
格納できる場所が `_data` フォルダです。
これらのファイルは YAML ファイル(拡張子は `.yml` または `.yaml` を使用)
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

データファイルを使用すれば、 Jekyll テンプレートでたくさんのコードをコピー＆ペーストしなくて済むようになります。
基本的な例は下記の通りです。

<!--original
Here is a basic example of using Data Files to avoid copy-pasting large chunks of
code in your Jekyll templates:
-->

`_data/members.yml` に次のように記述します:

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

このデータには `site.data.members` 経由でアクセスできます
(ファイル名が変数名を決定していることに注意してください)。

<!--original
This data can be accessed via `site.data.members` (notice that the filename
determines the variable name).
-->

これで、テンプレート内のメンバーリストをレンダリングできるようになりました:

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
