---
title: タグ
permalink: /docs/plugins/tags/
---
<!-- ---
title: Tags
permalink: /docs/plugins/tags/
--- -->

サイトでカスタムLiquidタグを使用したい場合は、タグシステムで行うことができます。組み込み例として、Jekyllには`highlight`や`include`タグがあります。以下は、ページがレンダリングされた時を出力するカスタムLiquidダグの例です。

<!-- If you’d like to include custom liquid tags in your site, you can do so by
hooking into the tagging system. Built-in examples added by Jekyll include the
`highlight` and `include` tags. Below is an example of a custom liquid tag that
will output the time the page was rendered: -->

```ruby
module Jekyll
  class RenderTimeTag < Liquid::Tag

    def initialize(tag_name, text, tokens)
      super
      @text = text
    end

    def render(context)
      "#{@text} #{Time.now}"
    end
  end
end

Liquid::Template.register_tag('render_time', Jekyll::RenderTimeTag)
```

最低、次のメソッドの実装が必要です。

<!-- At a minimum, liquid tags must implement: -->

<div class="mobile-side-scroller">
<table>
  <thead>
    <tr>
      <th>メソッド</th>
      <th>説明</th>
    </tr>
    <!-- <tr>
      <th>Method</th>
      <th>Description</th>
    </tr> -->
  </thead>
  <tbody>
    <tr>
      <td>
        <p><code>render</code></p>
      </td>
      <td>
        <p>タグの内容の出力</p>
        <!-- <p>Outputs the content of the tag.</p> -->
      </td>
    </tr>
  </tbody>
</table>
</div>

次のようにLiquidテンプレートエンジンにカスタムタグを登録する必要があります。

<!-- You must also register the custom tag with the Liquid template engine as
follows: -->

```ruby
Liquid::Template.register_tag('render_time', Jekyll::RenderTimeTag)
```

上記の例では、ページのどこにでもタグを設置することができます。

<!-- In the example above, we can place the following tag anywhere in one of our
pages: -->

{% raw %}
```ruby
<p>{% render_time page rendered at: %}</p>
```
{% endraw %}

ページには次のように出力されます。

<!-- And we would get something like this on the page: -->

```html
<p>page rendered at: Tue June 22 23:38:47 –0500 2010</p>
```

## タグブロック
<!-- ## Tag Blocks -->

上記の`render_time`タグは、`Liquid::Block`クラスを継承することでタグブロックとして書くこともできます。以下の例を見てください。

<!-- The `render_time` tag seen above can also be rewritten as a tag block by
inheriting the `Liquid::Block` class. Look at the example below: -->

```ruby
module Jekyll
  class RenderTimeTagBlock < Liquid::Block

    def render(context)
      text = super
      "<p>#{text} #{Time.now}</p>"
    end

  end
end

Liquid::Template.register_tag('render_time', Jekyll::RenderTimeTagBlock)
```

これで、タグブロックをどこでも使用できます。

<!-- We can now use the tag block anywhere: -->

{% raw %}
```liquid
{% render_time %}
page rendered at:
{% endrender_time %}
```
{% endraw %}

ページでは上の例と同じ出力を得ることができます。

<!-- And we would still get the same output as above on the page: -->

```html
<p>page rendered at: Tue June 22 23:38:47 –0500 2010</p>
```

<div class="note info">
  <p>上記の例では、タグとタグブロックを同じ名前<code>render_time</code>で登録しました。しかし、同じプロジェクトでタグとタグブロックに同じ名前を使用することは推奨しません。競合する可能性があります。</p>
  <!-- <p>In the above example, the tag block and the tag are both registered with
  the name <code>render_time</code> but to register a tag and a tag block using
  the same name in the same project is not recommended as this may lead to
  conflicts.</p> -->
</div>