---
title: Markdownオプション
permalink: "/docs/configuration/markdown/"
---
<!-- ---
title: Markdown Options
permalink: "/docs/configuration/markdown/"
--- -->

Jekyllでサポートされている様々なMarkdownレンダラーには、追加のオプションがある場合があります。

<!-- The various Markdown renderers supported by Jekyll sometimes have extra options
available. -->

### Kramdown

KramdownはJekyllのデフォルトMarkdownレンダラーです。以下は現在サポートされているオプションのリストです。

<!-- Kramdown is the default Markdown renderer for Jekyll. Below is a list of the
currently supported options: -->

* **auto_id_prefix** - 自動的に生成された見出しのIDのプレフィックス
* **auto_id_stripping** - 自動ID生成のために見出しテキストからすべてのフォーマットを削除
* **auto_ids** - 自動見出しID生成を使用
* **coderay_bold_every** - 行番号を太字にする頻度を定義
* **coderay_css** - 強調表示されたコードのスタイル設定方法の定義
* **coderay_default_lang** - ハイライトコードブロックのデフォルト言語を設定
* **coderay_line_number_start** - 行番号の開始番号
* **coderay_line_numbers** - 行番号を表示するかの定義
* **coderay_tab_width** - 強調表示されたコードのtabの長さ
* **coderay_wrap** - 強調表示されたコードをどのように折り返すかを定義
* **enable_coderay** - 構文の強調表示にcoderayを使う
* **entity_output** - エンティティの出力方法を定義
* **footnote_backlink** - 脚注のバックリンクに使用するテキストを定義
* **footnote_backlink_inline** - 脚注のバックリンクを常にインラインにするかどうかを指定
* **footnote_nr** - 最初の脚注の番号
* **gfm_quirks** - GFM特有の癖のセットを有効にします
* **hard_wrap** - 改行を文字通りに解釈する
* **header_offset** - ヘッダの出力オフセットを設定します
* **html_to_native** - HTML要素をネイティブ要素に変換する
* **line_width** - 文書を出力するときに使用される線の長さを定義
* **link_defs** - リンク定義を事前定義
* **math_engine** - mathエンジンの設定
* **math_engine_opts** - mathエンジンのオプションを設定
* **parse_block_html** - blockHTMLタグでkramdown構文を処理する
* **parse_span_html** - spanHTMLタグでkramdown構文を処理する
* **smart_quotes** - スマートクォート出力用のHTMLエンティティ名またはコードポイントを定義
* **syntax_highlighter** - シンタックスハイライトの設定
* **syntax_highlighter_opts** - シンタックスハイライトのオプションの設定
* **toc_levels** - 目次に使用されるレベルを定義
* **transliterated_header_ids** - IDを生成する前にヘッダテキストを音訳する
* **typographic_symbols** - 活版印刷シンボルから出力文字へのマッピングを定義

<!-- * **auto_id_prefix** - Prefix used for automatically generated header IDs
* **auto_id_stripping** - Strip all formatting from header text for automatic ID generation
* **auto_ids** - Use automatic header ID generation
* **coderay_bold_every** - Defines how often a line number should be made bold
* **coderay_css** - Defines how the highlighted code gets styled
* **coderay_default_lang** - Sets the default language for highlighting code blocks
* **coderay_line_number_start** - The start value for the line numbers
* **coderay_line_numbers** - Defines how and if line numbers should be shown
* **coderay_tab_width** - The tab width used in highlighted code
* **coderay_wrap** - Defines how the highlighted code should be wrapped
* **enable_coderay** - Use coderay for syntax highlighting
* **entity_output** - Defines how entities are output
* **footnote_backlink** - Defines the text that should be used for the footnote backlinks
* **footnote_backlink_inline** - Specifies whether the footnote backlink should always be inline
* **footnote_nr** - The number of the first footnote
* **gfm_quirks** - Enables a set of GFM specific quirks
* **hard_wrap** - Interprets line breaks literally
* **header_offset** - Sets the output offset for headers
* **html_to_native** - Convert HTML elements to native elements
* **line_width** - Defines the line width to be used when outputting a document
* **link_defs** - Pre-defines link definitions
* **math_engine** - Set the math engine
* **math_engine_opts** - Set the math engine options
* **parse_block_html** - Process kramdown syntax in block HTML tags
* **parse_span_html** - Process kramdown syntax in span HTML tags
* **smart_quotes** - Defines the HTML entity names or code points for smart quote output
* **syntax_highlighter** - Set the syntax highlighter
* **syntax_highlighter_opts** - Set the syntax highlighter options
* **toc_levels** - Defines the levels that are used for the table of contents
* **transliterated_header_ids** - Transliterate the header text before generating the ID
* **typographic_symbols** - Defines a mapping from typographical symbol to output characters -->


<div class="note warning">
  <h5>サポートされていないkramdownオプションが2つあります</h5>
  <!-- <h5>There are two unsupported kramdown options</h5> -->
  <p>
    <code>remove_block_html_tags</code>と<code>remove_span_html_tags</code>は、kramdown HTMLコンバータに含まれていないため、現在Jekyllではサポートされていません。
  </p>
  <!-- <p>
    Please note that both <code>remove_block_html_tags</code> and
    <code>remove_span_html_tags</code> are currently unsupported in Jekyll due
    to the fact that they are not included within the kramdown HTML converter.
  </p> -->
</div>

これらのオプションの詳細は、[Kramdown configuration documentation](https://kramdown.gettalong.org/options.html){:target="_blank"}をご覧ください。

<!-- For more details about these options have a look at the [Kramdown configuration documentation](https://kramdown.gettalong.org/options.html). -->

### CommonMark

[CommonMark](https://commonmark.org/){:target="_blank"}はMarkdown構文の合理化バージョンであり、Cで実装されているため、Rubyで実装されているデフォルトのKramdownよりも高速です。元のMarkdownとは[少し異なり](https://github.com/commonmark/CommonMark#differences-from-original-markdown){:target="_blank"}、[Block Inline Attribute Lists](https://kramdown.gettalong.org/syntax.html#block-ials){:target="_blank"}のようにKramdownで実装されているすべての構文要素をサポートするわけではありません。

<!-- [CommonMark](https://commonmark.org/) is a rationalized version of Markdown syntax, implemented in C and thus faster than default Kramdown implemented in Ruby. It [slightly differs](https://github.com/commonmark/CommonMark#differences-from-original-markdown) from original Markdown and does not support all the syntax elements implemented in Kramdown, like [Block Inline Attribute Lists](https://kramdown.gettalong.org/syntax.html#block-ials). -->

[jekyll-commonmark](https://github.com/jekyll/jekyll-commonmark){:target="_blank"}プラグインを使った基本CommonMarkとGitHub Pagesでサポートされている[GitHub Flavored Markdown](https://github.com/github/jekyll-commonmark-ghpages){:target="_blank"}の2種類があります。

<!-- It comes in two flavors: basic CommonMark with [jekyll-commonmark](https://github.com/jekyll/jekyll-commonmark) plugin and [GitHub Flavored Markdown supported by GitHub Pages](https://github.com/github/jekyll-commonmark-ghpages). -->

### Redcarpet

Redcarpetは、文字列の配列の`extensions`サブ設定を提供することによって、設定することができます。 各文字列は、`Redcarpet::Markdown`クラスの拡張の名前でなければなりません。配列内に存在する場合は、対応する拡張子を`true`に設定します。

<!-- Redcarpet can be configured by providing an `extensions` sub-setting, whose
value should be an array of strings. Each string should be the name of one of
the `Redcarpet::Markdown` class's extensions; if present in the array, it will
set the corresponding extension to `true`. -->

Jekyllは2つの特別なRedcarpet拡張を扱えます。

<!-- Jekyll handles two special Redcarpet extensions: -->

- `no_fenced_code_blocks` --- デフォルトで、Jekyllは（チルダ3つまたはバッククォート3つでコードブロックを区切るため）`fenced_code_blocks`拡張を`true`に設定しています。おそらく、GitHubが積極的に採用しており、不可避の設定になってきています。Redcarpetの通常の`fenced_code_blocks`はJekyllで使用するときは無効です。——言い換えれば、区切られたコードを無効にするためにこの反転の拡張を使用できます。

<!-- - `no_fenced_code_blocks` --- By default, Jekyll sets the `fenced_code_blocks`
extension (for delimiting code blocks with triple tildes or triple backticks)
to `true`, probably because GitHub's eager adoption of them is starting to make
them inescapable. Redcarpet's normal `fenced_code_blocks` extension is inert
when used with Jekyll; instead, you can use this inverted version of the
extension for disabling fenced code. -->

最初の区切り文字の後に言語のハイライトを設定できます。

<!-- Note that you can also specify a language for highlighting after the first
delimiter: -->

        ```ruby
        # ...ruby code
        ```

コードブロックとハイライトは共に有効にできます。これはコードを静的にハイライトします。シンタックスハイライトがない場合は、`<code>`要素に `class =" LANGUAGE "`属性を追加します。これは様々なJavaScriptコードハイライトライブラリでヒントとして使用できます。

<!-- With both fenced code blocks and highlighter enabled, this will statically
highlight the code; without any syntax highlighter, it will add a
`class="LANGUAGE"` attribute to the `<code>` element, which can be used as a
hint by various JavaScript code highlighting libraries. -->

- `smart` --- この擬似拡張はSmartyPantsを有効にします。これは、ストレート引用符を中引用符に変換し、ハイフンをem（`---`）とen（`--`）ダッシュとします。

<!-- - `smart` --- This pseudo-extension turns on SmartyPants, which converts
  straight quotes to curly quotes and runs of hyphens to em (`---`) and en (`--`) dashes. -->

他のすべての拡張はRedcarpetからの通常の名前を保持しており、Jekyllでは`smart`以外のレンダラオプションは指定できません。利用可能な拡張のリストは[RedcarpetのREADMEファイル](https://github.com/vmg/redcarpet/blob/v3.2.2/README.markdown#and-its-like-really-simple-to-use){:target="_blank"}にあります。Redcarpetの正しいバージョンのREADMEを見ていることを確認してください：Jekyllは現在v3.2.xを使っています。 最も一般的に使用されている拡張は次のとおりです。

<!-- All other extensions retain their usual names from Redcarpet, and no renderer
options aside from `smart` can be specified in Jekyll. [A list of available
extensions can be found in the Redcarpet README file.](https://github.com/vmg/redcarpet/blob/v3.2.2/README.markdown#and-its-like-really-simple-to-use)
Make sure you're looking at the README for the right version of
Redcarpet: Jekyll currently uses v3.2.x. The most commonly used
extensions are: -->

- `tables`
- `no_intra_emphasis`
- `autolink`

### カスタムMarkdownプロセス
<!-- ### Custom Markdown Processors -->

カスタムmarkdownプロセッサの作成に興味があるなら、あなたは運がいいです！　`Jekyll::Converters::Markdown`ネームスペースに新しいクラスを作成します。

<!-- If you're interested in creating a custom markdown processor, you're in luck! Create a new class in the `Jekyll::Converters::Markdown` namespace: -->

```ruby
class Jekyll::Converters::Markdown::MyCustomProcessor
  def initialize(config)
    require 'funky_markdown'
    @config = config
  rescue LoadError
    STDERR.puts 'You are missing a library required for Markdown. Please run:'
    STDERR.puts '  $ [sudo] gem install funky_markdown'
    raise FatalException.new("Missing dependency: funky_markdown")
  end

  def convert(content)
    ::FunkyMarkdown.new(content).convert
  end
end
```

一度クラスを作成し、`_plugins`フォルダのプラグインかgemとして適切に設定したら、`_config.yml`で指定します。

<!-- Once you've created your class and have it properly set up either as a plugin
in the `_plugins` folder or as a gem, specify it in your `_config.yml`: -->

```yaml
markdown: MyCustomProcessor
```
