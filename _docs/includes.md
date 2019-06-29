---
title: Includes（インクルード）
permalink: /docs/includes/
---
<!-- ---
title: Includes
permalink: /docs/includes/
--- -->

`include`タグは、`_includes`フォルダの他のファイルを入れ込む事を可能にします。

<!-- The `include` tag allows you to include the content from another file stored in the `_includes` folder: -->

{% raw %}
```liquid
{% include footer.html %}
```
{% endraw %}

Jekyllはソースディレクトリのrootにある`_includes`ディレクトリのファイル（この場合は`footer.html`）を探し、コンテンツに挿入します。

<!-- Jekyll will look for the referenced file (in this case, `footer.html`) in the `_includes` directory at the root of your source directory and insert its contents. -->

### 相対的な他のファイルをインクルードする
<!-- ### Including files relative to another file -->

`include_relative`タグを使用することで、現在のファイルから相対的な位置のファイルを挿入することもできます。

<!-- You can choose to include file fragments relative to the current file by using the `include_relative` tag: -->

{% raw %}
```liquid
{% include_relative somedir/footer.html %}
```
{% endraw %}

`_includes`ディレクトリに挿入するコンテンツを置いておく必要はありません。タグを使用するファイルから、挿入したいファイルを相対パスで指定します。例えば、`_posts/2014-09-03-my-file.markdown`で`include_relative`を使用すると、`_posts`ディレクトリのファイルやそのサブディレクトリのファイルを挿入できます。

<!-- You won't need to place your included content within the `_includes` directory. Instead,
the inclusion is specifically relative to the file where the tag is being used. For example,
if `_posts/2014-09-03-my-file.markdown` uses the `include_relative` tag, the included file
must be within the `_posts` directory or one of its subdirectories. -->

`../`は使用できませんので、上位のディレクトリのファイルは挿入できないことに注意してください。

<!-- Note that you cannot use the `../` syntax to specify an include location that refers to a higher-level directory. -->

`include`タグの変数など全ての機能は、`include_relative`でも使用できます。

<!-- All the other capabilities of the `include` tag are available to the `include_relative` tag,
such as variables. -->

### インクルードファイルを変数で指定する
<!-- ### Using variables names for the include file -->

埋め込むファイルの名前は、実際のファイル名の代わりに変数として指定できます。例えば、ページのfront matterに次のように変数を定義したとします。

<!-- The name of the file you want to embed can be specified as a variable instead of an actual file name. For example, suppose you defined a variable in your page's front matter like this: -->

```yaml
---
title: My page
my_variable: footer_company_a.html
---
```

そうすれば、その変数をincludeで参照できます。

<!-- You could then reference that variable in your include: -->

{% raw %}
```liquid
{% if page.my_variable %}
  {% include {{ page.my_variable }} %}
{% endif %}
```
{% endraw %}

この例では、`_includes`ディレクトリの`footer_company_a.html`ファイルが挿入されます。

<!-- In this example, the include would insert the file `footer_company_a.html` from the `_includes/footer_company_a.html` directory. -->

### インクルードにパラメータを渡す
<!-- ### Passing parameters to includes -->

インクルードにパラメータを渡すこともできます。例えば、`_includes`フォルダの`note.html`ファイルに次の記載があるとします。

<!-- You can also pass parameters to an include. For example, suppose you have a file called `note.html` in your `_includes` folder that contains this formatting: -->

{% raw %}
```liquid
<div markdown="span" class="alert alert-info" role="alert">
<i class="fa fa-info-circle"></i> <b>Note:</b>
{{ include.content }}
</div>
```
{% endraw %}

`{% raw %}{{ include.content }}{% endraw %}`はincludeでそのパラメータの値を指定した時に入力される変数です。指定は次のように行います。

<!-- The `{% raw %}{{ include.content }}{% endraw %}` is a parameter that gets populated when you call the include and specify a value for that parameter, like this: -->

{% raw %}
```liquid
{% include note.html content="This is my sample note." %}
```
{% endraw %}

`content`の値（今回は`This is my sample note`）が{% raw %}`{{ include.content }}`{% endraw %}に挿入されます。

<!-- The value of `content` (which is `This is my sample note`) will be inserted into the {% raw %}`{{ include.content }}`{% endraw %} parameter. -->

インクルードにパラメータを渡すのは、Markdownコンテンツから複雑な部分を隠したいときに役立ちます。

<!-- Passing parameters to includes is especially helpful when you want to hide away complex formatting from your Markdown content. -->

例えば、画像を特別なフォーマットで使用しようと思っていて、著者にこの複雑なフォーマットを覚えさせたくない場合です。一つの方法として、includeとパラメータを使用して、シンプルにします。以下にincludeを使用したいと思うようなフォーマットの例を示します。

<!-- For example, suppose you have a special image syntax with complex formatting, and you don't want your authors to remember the complex formatting. As a result, you decide to simplify the formatting by using an include with parameters. Here's an example of the special image syntax you might want to populate with an include: -->

```html
<figure>
   <a href="http://jekyllrb.com">
   <img src="logo.png" style="max-width: 200px;"
      alt="Jekyll logo" />
   </a>
   <figcaption>This is the Jekyll logo</figcaption>
</figure>
```

これを、インクルードとパラメータを使用して、次のようにテンプレート化することができます。

<!-- You could templatize this content in your include and make each value available as a parameter, like this: -->

{% raw %}
```liquid
<figure>
   <a href="{{ include.url }}">
   <img src="{{ include.file }}" style="max-width: {{ include.max-width }};"
      alt="{{ include.alt }}"/>
   </a>
   <figcaption>{{ include.caption }}</figcaption>
</figure>
```
{% endraw %}

このインクルードの内容には5つのパラメータがあります。

<!-- This include contains 5 parameters: -->

* `url`
* `max-width`
* `file`
* `alt`
* `caption`

このinclude（ファイル名は`image.html`とします）に全てのパラメータを渡す例です。

<!-- Here's an example that passes all the parameters to this include (the include file is named `image.html`): -->

{% raw %}
```liquid
{% include image.html url="http://jekyllrb.com"
max-width="200px" file="logo.png" alt="Jekyll logo"
caption="This is the Jekyll logo." %}
```
{% endraw %}

これで、出力されるHTMLは最初に示したものになります。

<!-- The result is the original HTML code shown earlier. -->

ユーザーがパラメータを指定しない状況への対策として、[Liquid's default filter](https://shopify.github.io/liquid/filters/default/){:target="_blank"}を使用できます。

<!-- To safeguard situations where users don't supply a value for the parameter, you can use [Liquid's default filter](https://shopify.github.io/liquid/filters/default/). -->

全体として、オーディオクリップやビデオクリップの挿入、アラート、特別なフォーマットなど、さまざまな用途のテンプレートとして機能するインクルードを作成できます。あまりにも多くのインクルードを使うことは避けるようにしてください。サイトの構築時間が遅くなります。例えば、画像を挿入する度にインクルードを使うのは避けるべきです。（上記のテクニックは特別な画像のための例です。）

<!-- Overall, you can create includes that act as templates for a variety of uses &mdash; inserting audio or video clips, alerts, special formatting, and more. Note that you should avoid using too many includes, as this will slow down the build time of your site. For example, don't use includes every time you insert an image. (The above technique shows a use case for special images.) -->

### インクルードにパラメータ変数を渡す
<!-- ### Passing parameter variables to includes -->

インクルードに渡したいパラメータが、文字列ではなく変数である場合もあるでしょう。例えば実際の製品の名前ではなく、{% raw %}`{{ site.product_name }}`{% endraw %}を使用して製品の全てのインスタンスを参照している場合です。（この場合、`_config.yml`ファイルで`product_name`キーに製品名が設定されています）

<!-- Suppose the parameter you want to pass to the include is a variable rather than a string. For example, you might be using {% raw %}`{{ site.product_name }}`{% endraw %} to refer to every instance of your product rather than the actual hard-coded name. (In this case, your `_config.yml` file would have a key called `product_name` with a value of your product's name.) -->

インクルードに渡すパラメータの値に中括弧は使用できません。例えば、{% raw %}`"The latest version of {{ site.product_name }} is now available."`{% endraw %}の値のパラメータは渡せません。

<!-- The string you pass to your include parameter can't contain curly braces. For example, you can't pass a parameter that contains this: {% raw %}`"The latest version of {{ site.product_name }} is now available."`{% endraw %} -->

インクルードに渡す値に変数を含める場合は、その前に全体を変数として格納する必要があります。`capture`タグを使用して変数を作成します。

<!-- If you want to include this variable in your parameter that you pass to an include, you need to store the entire parameter as a variable before passing it to the include. You can use `capture` tags to create the variable: -->

{% raw %}
```liquid
{% capture download_note %}
The latest version of {{ site.product_name }} is now available.
{% endcapture %}
```
{% endraw %}

captureした変数をインクルードのパラメータとして渡します。文字列ではなくなったので、変数名を引用符で囲まないでください。

<!-- Then pass this captured variable into the parameter for the include. Omit the quotation marks around the parameter content because it's no longer a string (it's a variable): -->

{% raw %}
```liquid
{% include note.html content=download_note %}
```
{% endraw %}
