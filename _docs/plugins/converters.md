---
title: Converters（コンバータ）
permalink: /docs/plugins/converters/
---
<!-- ---
title: Converters
permalink: /docs/plugins/converters/
--- -->

サイトで使用したい新しいマークアップ言語がある場合は、あなた自身のコンバータを実施することで含めることができます。Markdownと[Textile](https://github.com/jekyll/jekyll-textile-converter){:target="_blank"}のマークアップ言語は共にこのメソッドを実施しています。

<!-- If you have a new markup language you’d like to use with your site, you can
include it by implementing your own converter. Both the Markdown and
[Textile](https://github.com/jekyll/jekyll-textile-converter) markup
languages are implemented using this method. -->

<div class="note info">
  <h5>Front Matterを忘れないでください</h5>
  <!-- <h5>Remember your Front Matter</h5> -->
  <p>
    JekyllはYAMLヘッダ最初にあるファイルだけを変換します。それはプラグインで追加したコンバータの場合も同様です。
  </p>
  <!-- <p>
    Jekyll will only convert files that have a YAML header at the top, even for
    converters you add using a plugin.
  </p> -->
</div>

以下は`.upcase`で終わる全てのポストを取得して、`UpcaseConverter`を使用して変換するコンバータです。

<!-- Below is a converter that will take all posts ending in `.upcase` and process
them using the `UpcaseConverter`: -->

```ruby
module Jekyll
  class UpcaseConverter < Converter
    safe true
    priority :low

    def matches(ext)
      ext =~ /^\.upcase$/i
    end

    def output_ext(ext)
      ".html"
    end

    def convert(content)
      content.upcase
    end
  end
end
```

コンバータは最低3つのメソッドが必要です。

<!-- Converters should implement at a minimum 3 methods: -->

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
        <p><code>matches</code></p>
      </td>
      <td><p>
        このコンバータで使用する拡張子のリストと一致するかどうか。（ドットを含む）ファイルの拡張子の引数をとる。一致する場合は<code>true</code>、そうでなければ<code>false</code>を返す必要がある。
      </p>
      <!-- <p>
        Does the given extension match this converter’s list of acceptable
        extensions? Takes one argument: the file’s extension (including the
        dot). Must return <code>true</code> if it matches, <code>false</code>
        otherwise.
      </p> -->
      </td>
    </tr>
    <tr>
      <td>
        <p><code>output_ext</code></p>
      </td>
      <td><p>
        （ドットを含む）出力ファイルの拡張子。
        通常は<code>".html"</code>。
      </p>
      <!-- <p>
        The extension to be given to the output file (including the dot).
        Usually this will be <code>".html"</code>.
      </p> -->
      </td>
    </tr>
    <tr>
      <td>
        <p><code>convert</code></p>
      </td>
      <td><p>
        コンテンツの変換ロジック。（front matterを含まない）ファイルのコンテンツを引数としてとります。文字列を返す必要があります。
      </p>
      <!-- <p>
        Logic to do the content conversion. Takes one argument: the raw content
        of the file (without front matter). Must return a String.
      </p> -->
      </td>
    </tr>
  </tbody>
</table>
</div>

先ほどの例では、`UpcaseConverter#matches`でファイル名の拡張子が`.upcase`かを確認し、そうであるならコンバータでレンダリングします。コンテンツを処理するために`UpcaseConverter#convert`を呼ぶということです。先ほどのシンプルなコンバータは、単純にコンテンツの文字列を大文字に変換します。最後に、ページをして保存するときに`.html`拡張子を使用します。

<!-- In our example, `UpcaseConverter#matches` checks if our filename extension is
`.upcase`, and will render using the converter if it is. It will call
`UpcaseConverter#convert` to process the content. In our simple converter we’re
simply uppercasing the entire content string. Finally, when it saves the page,
it will do so with a `.html` extension. -->
