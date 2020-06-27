---
layout: step
title: Front Matter
position: 3
---
front matterは、ファイル冒頭の3つのダッシュのライン2つの間の[YAML](http://yaml.org/){:target="_blank"}の断片です。front matterは、例えば次のようにしてページに変数をセットするために使います。

<!-- Front matter is a snippet of [YAML](http://yaml.org/) which sits between two
triple-dashed lines at the top of a file. Front matter is used to set variables
for the page, for example: -->

```yaml
---
my_number: 5
---
```

front matterの変数は、`page`変数としてLiquidで使用できます。例えば、上記の変数を出力する場合は、次のように使用します。

<!-- Front matter variables are available in Liquid under the `page` variable. For
example to output the variable above you would use: -->

{% raw %}
```liquid
{{ page.my_number }}
```
{% endraw %}

## front matterを使う
<!-- ## Use front matter -->

front matterを使って、サイトの`<title>`を変更してみましょう。

<!-- Let's change the `<title>` on your site to populate using front matter: -->

{% raw %}
```liquid
---
title: Home
---
<!doctype html>
<html>
  <head>
    <meta charset="utf-8">
    <title>{{ page.title }}</title>
  </head>
  <body>
    <h1>{{ "Hello World!" | downcase }}</h1>
  </body>
</html>
```
{% endraw %}

Jekyllがページのliqudタグを処理するには、front matterが_必要_です。最も短いfront matterは次のものです。

<!-- Note that in order for Jekyll to process any liquid tags on your page,
you _must_ include front matter on it. The most minimal snippet of front matter
you can include is: -->

```yaml
---
---
```

普通のHTMLよりもソースコードを多く書かなければいけないのに、どうしてこの様にするのか不思議に思っているのではないでしょうか。次のステップへ進むと、理由が分かります。

<!-- You may still be wondering why you'd output it this way as it takes
more source code than raw HTML. In this next step, you'll see why we've
been doing this. -->
