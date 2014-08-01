---
layout: docs
title: 設定項目
prev_section: structure
next_section: frontmatter
permalink: /docs/configuration/
---

<!--original
---
layout: docs
title: Configuration
prev_section: structure
next_section: frontmatter
permalink: /docs/configuration/
---
-->

Jekyll はあなたが夢見る任意の方法でサイトを組むことができます、
それはパワフルで柔軟なコンフィグオプションのおかげで可能になります。
これらのオプションは、サイトのルートディレクトリに置かれる `_config.yml` ファイルか、
ターミナルから実行した `jekyll` のフラグとしてのどちらでも指定することができます。

<!--original
Jekyll allows you to concoct your sites in any way you can dream up, and it’s
thanks to the powerful and flexible configuration options that this is possible.
These options can either be specified in a `_config.yml` file placed in your
site’s root directory, or can be specified as flags for the `jekyll` executable
in the terminal.
-->

## コンフィグ設定

<!--original
## Configuration Settings
-->

### グローバルコンフィグ

<!--original
### Global Configuration
-->

以下のテーブルは、Jekyll で使用可能な設定と、
それらを制御するための<code class="option">オプション</code> (設定ファイルで指定します) と
<code class="flag">フラグ</code> (コマンドラインで指定します) の一覧です。

<!--original
The table below lists the available settings for Jekyll, and the various <code
class="option">options</code> (specified in the configuration file) and <code
class="flag">flags</code> (specified on the command-line) that control them.
-->

<div class="mobile-side-scroller">
<table>
  <thead>
    <tr>
      <th>設定</th>
      <th>
        <span class="option">オプション</span> と <span class="flag">フラグ</span>
      </th>
    </tr>
  </thead>
  <tbody>
    <tr class='setting'>
      <td>
        <p class='name'><strong>サイトソース</strong></p>
        <p class='description'>Jekyll がファイルを読み込むディレクトリを変更します。</p>
      </td>
      <td class="align-center">
        <p><code class="option">source: DIR</code></p>
        <p><code class="flag">-s, --source DIR</code></p>
      </td>
    </tr>
    <tr class='setting'>
      <td>
        <p class='name'><strong>サイト出力先</strong></p>
        <p class='description'>Jekyll がファイルを書き出すディレクトリを変更します。</p>
      </td>
      <td class="align-center">
        <p><code class="option">destination: DIR</code></p>
        <p><code class="flag">-d, --destination DIR</code></p>
      </td>
    </tr>
    <tr class='setting'>
      <td>
        <p class='name'><strong>セーフモード</strong></p>
        <p class='description'><a href="../plugins/">カスタムプラグイン</a>を無効化します。</p>
      </td>
      <td class="align-center">
        <p><code class="option">safe: BOOL</code></p>
        <p><code class="flag">--safe</code></p>
      </td>
    </tr>
    <tr class='setting'>
      <td>
        <p class='name'><strong>エクスクルード</strong></p>
        <p class="description">ディレクトリやファイルを変換対象から除外します。
          除外はサイトのソースディレクトリからの相対指定であり、
          ソースディレクトリ外のものは指定できません。
        </p>
      </td>
      <td class='align-center'>
        <p><code class="option">exclude: [DIR, FILE, ...]</code></p>
      </td>
    </tr>
    <tr class='setting'>
      <td>
        <p class='name'><strong>インクルード</strong></p>
        <p class="description">
          ディレクトリまたはファイルを強制的に変換対象に含めます。
          ドットファイルはデフォルトで除外されるため、 <code>.htaccess</code> を指定するのがよい例です。
        </p>
      </td>
      <td class='align-center'>
        <p><code class="option">include: [DIR, FILE, ...]</code></p>
      </td>
    </tr>
    <tr class='setting'>
      <td>
        <p class='name'><strong>タイムゾーン</strong></p>
        <p class="description">
            サイト生成のためにタイムゾーンを設定します。
            このオプションは、Ruby が日付の作成と操作を処理するために使用する環境変数 <code>TZ</code> を設定します。
            <a href="http://ja.wikipedia.org/wiki/Tz_database">IANA タイムゾーン データベース</a> からの
            任意のエントリが有効です、例えば <code>America/New_York</code> のような。
            デフォルトでは、あなたが使っているオペレーティングシステムのローカルタイムゾーンがセットされています。
        </p>
      </td>
      <td class='align-center'>
        <p><code class="option">timezone: TIMEZONE</code></p>
      </td>
    </tr>
    <tr class='setting'>
      <td>
        <p class='name'><strong>エンコーディング</strong></p>
        <p class="description">
            名前によってファイルのエンコーディングがセットされます。
            ( Ruby 1.9 またはそれ以降でのみ利用可能です。)
            デフォルトの値は、2.0.0以降では utf-8 、2.0.0より前では nil で、
            Rubyのデフォルト <code>ASCII-8BIT</code> を使います。
            Ruby で利用可能なエンコーディングは、コマンド
            <code>ruby -e 'puts Encoding::list.join("\n")'</code>
            によって一覧することができます。
        </p>
      </td>
      <td class='align-center'>
        <p><code class="option">encoding: ENCODING</code></p>
      </td>
    </tr>
  </tbody>
</table>
</div>

<!--original
<div class="mobile-side-scroller">
<table>
  <thead>
    <tr>
      <th>Setting</th>
      <th>
        <span class="option">Options</span> and <span class="flag">Flags</span>
      </th>
    </tr>
  </thead>
  <tbody>
    <tr class='setting'>
      <td>
        <p class='name'><strong>Site Source</strong></p>
        <p class='description'>Change the directory where Jekyll will read files</p>
      </td>
      <td class="align-center">
        <p><code class="option">source: DIR</code></p>
        <p><code class="flag">-s, --source DIR</code></p>
      </td>
    </tr>
    <tr class='setting'>
      <td>
        <p class='name'><strong>Site Destination</strong></p>
        <p class='description'>Change the directory where Jekyll will write files</p>
      </td>
      <td class="align-center">
        <p><code class="option">destination: DIR</code></p>
        <p><code class="flag">-d, --destination DIR</code></p>
      </td>
    </tr>
    <tr class='setting'>
      <td>
        <p class='name'><strong>Safe</strong></p>
        <p class='description'>Disable <a href="../plugins/">custom plugins</a>.</p>
      </td>
      <td class="align-center">
        <p><code class="option">safe: BOOL</code></p>
        <p><code class="flag">--safe</code></p>
      </td>
    </tr>
    <tr class='setting'>
      <td>
        <p class='name'><strong>Exclude</strong></p>
        <p class="description">
          Exclude directories and/or files from the
          conversion. These exclusions are relative to the site's
          source directory and cannot be outside the source directory.
        </p>
      </td>
      <td class='align-center'>
        <p><code class="option">exclude: [DIR, FILE, ...]</code></p>
      </td>
    </tr>
    <tr class='setting'>
      <td>
        <p class='name'><strong>Include</strong></p>
        <p class="description">
          Force inclusion of directories and/or files in the conversion.
          <code>.htaccess</code> is a good example since dotfiles are excluded
          by default.
        </p>
      </td>
      <td class='align-center'>
        <p><code class="option">include: [DIR, FILE, ...]</code></p>
      </td>
    </tr>
    <tr class='setting'>
      <td>
        <p class='name'><strong>Time Zone</strong></p>
        <p class="description">
            Set the time zone for site generation. This sets the <code>TZ</code>
            environment variable, which Ruby uses to handle time and date
            creation and manipulation. Any entry from the
            <a href="http://en.wikipedia.org/wiki/Tz_database">IANA Time Zone
            Database</a> is valid, e.g. <code>America/New_York</code>. The default
            is the local time zone, as set by your operating system.
        </p>
      </td>
      <td class='align-center'>
        <p><code class="option">timezone: TIMEZONE</code></p>
      </td>
    </tr>
    <tr class='setting'>
      <td>
        <p class='name'><strong>Encoding</strong></p>
        <p class="description">
            Set the encoding of files by name. Only available for Ruby
            1.9 or later).
            The default value is <code>utf-8</code> starting in 2.0.0,
            and <code>nil</code> before 2.0.0, which will yield the Ruby
            default of <code>ASCII-8BIT</code>.
            Available encodings can be shown by the
            command <code>ruby -e 'puts Encoding::list.join("\n")'</code>.
        </p>
      </td>
      <td class='align-center'>
        <p><code class="option">encoding: ENCODING</code></p>
      </td>
    </tr>
  </tbody>
</table>
</div>
-->

### ビルドコマンドオプション

<!--original
### Build Command Options
-->

<div class="mobile-side-scroller">
<table>
  <thead>
    <tr>
      <th>設定</th>
      <th><span class="option">オプション</span> と <span class="flag">フラグ</span></th>
    </tr>
  </thead>
  <tbody>
    <tr class='setting'>
      <td>
        <p class='name'><strong>再生成</strong></p>
        <p class='description'>ファイルが変更された場合の、サイトの自動再生成を有効にします。</p>
      </td>
      <td class="align-center">
        <p><code class="flag">-w, --watch</code></p>
      </td>
    </tr>
    <tr class='setting'>
      <td>
        <p class='name'><strong>設定</strong></p>
        <p class="description">
            自動的に読み込まれる <code>_config.yml</code> の代わりに
            設定ファイルを指定します。
            先に指定したファイルの設定は、後に指定したファイルの設定で上書きされます。
        </p>
      </td>
      <td class='align-center'>
        <p><code class="flag">--config FILE1[,FILE2,...]</code></p>
      </td>
    </tr>
    <tr class='setting'>
      <td>
        <p class='name'><strong>ドラフト</strong></p>
        <p class="description">ドラフトの posts を処理し、レンダリングします。</p>
      </td>
      <td class='align-center'>
        <p><code class="flag">--drafts</code></p>
      </td>
    </tr>
    <tr class='setting'>
      <td>
        <p class='name'><strong>未来日付の出力</strong></p>
        <p class="description">未来の日付の posts も出力します。</p>
      </td>
      <td class='align-center'>
        <p><code class="option">future: BOOL</code></p>
        <p><code class="flag">--future</code></p>
      </td>
    </tr>
    <tr class='setting'>
      <td>
        <p class='name'><strong>LSI</strong></p>
        <p class="description">関連 posts の索引を作成します。</p>
      </td>
      <td class='align-center'>
        <p><code class="option">lsi: BOOL</code></p>
        <p><code class="flag">--lsi</code></p>
      </td>
    </tr>
    <tr class='setting'>
      <td>
        <p class='name'><strong>Posts 制限</strong></p>
        <p class="description">解析、出力する posts の数を制限します。</p>
      </td>
      <td class='align-center'>
        <p><code class="option">limit_posts: NUM</code></p>
        <p><code class="flag">--limit_posts NUM</code></p>
      </td>
    </tr>
  </tbody>
</table>
</div>

<!--original
<div class="mobile-side-scroller">
<table>
  <thead>
    <tr>
      <th>Setting</th>
      <th><span class="option">Options</span> and <span class="flag">Flags</span></th>
    </tr>
  </thead>
  <tbody>
    <tr class='setting'>
      <td>
        <p class='name'><strong>Regeneration</strong></p>
        <p class='description'>Enable auto-regeneration of the site when files are modified.</p>
      </td>
      <td class="align-center">
        <p><code class="flag">-w, --watch</code></p>
      </td>
    </tr>
    <tr class='setting'>
      <td>
        <p class='name'><strong>Configuration</strong></p>
        <p class="description">Specify config files instead of using <code>_config.yml</code> automatically. Settings in later files override settings in earlier files.</p>
      </td>
      <td class='align-center'>
        <p><code class="flag">--config FILE1[,FILE2,...]</code></p>
      </td>
    </tr>
    <tr class='setting'>
      <td>
        <p class='name'><strong>Drafts</strong></p>
        <p class="description">Process and render draft posts.</p>
      </td>
      <td class='align-center'>
        <p><code class="flag">--drafts</code></p>
      </td>
    </tr>
    <tr class='setting'>
      <td>
        <p class='name'><strong>Future</strong></p>
        <p class="description">Publish posts with a future date.</p>
      </td>
      <td class='align-center'>
        <p><code class="option">future: BOOL</code></p>
        <p><code class="flag">--future</code></p>
      </td>
    </tr>
    <tr class='setting'>
      <td>
        <p class='name'><strong>LSI</strong></p>
        <p class="description">Produce an index for related posts.</p>
      </td>
      <td class='align-center'>
        <p><code class="option">lsi: BOOL</code></p>
        <p><code class="flag">--lsi</code></p>
      </td>
    </tr>
    <tr class='setting'>
      <td>
        <p class='name'><strong>Limit Posts</strong></p>
        <p class="description">Limit the number of posts to parse and publish.</p>
      </td>
      <td class='align-center'>
        <p><code class="option">limit_posts: NUM</code></p>
        <p><code class="flag">--limit_posts NUM</code></p>
      </td>
    </tr>
  </tbody>
</table>
</div>
-->

### Serve コマンドオプション

<!--original
### Serve Command Options
-->

以下のオプションに加え、 `serve` サブコマンドは `build` サブコマンドの
オプションすべてを受け入れることができます。
それらのオプションを使用してサイトをビルドしたうえで、サイトを serve します。

<!--original
In addition to the options below, the `serve` sub-command can accept any of the options
for the `build` sub-command, which are then applied to the site build which occurs right
before your site is served.
-->

<div class="mobile-side-scroller">
<table>
  <thead>
    <tr>
      <th>設定</th>
      <th><span class="option">オプション</span> と <span class="flag">フラグ</span></th>
    </tr>
  </thead>
  <tbody>
    <tr class='setting'>
      <td>
        <p class='name'><strong>ローカルサーバのポート</strong></p>
        <p class='description'>与えられたポートを Listen します。</p>
      </td>
      <td class="align-center">
        <p><code class="option">port: PORT</code></p>
        <p><code class="flag">--port PORT</code></p>
      </td>
    </tr>
    <tr class='setting'>
      <td>
        <p class='name'><strong>ローカルサーバのホスト名</strong></p>
        <p class='description'>与えられたホスト名を Listen します。</p>
      </td>
      <td class="align-center">
        <p><code class="option">host: HOSTNAME</code></p>
        <p><code class="flag">--host HOSTNAME</code></p>
      </td>
    </tr>
    <tr class='setting'>
      <td>
        <p class='name'><strong>ベース URL</strong></p>
        <p class='description'>与えられたベース URL から Web サイトを提供します。</p>
      </td>
      <td class="align-center">
        <p><code class="option">baseurl: URL</code></p>
        <p><code class="flag">--baseurl URL</code></p>
      </td>
    </tr>
    <tr class='setting'>
      <td>
        <p class='name'><strong>切り離し</strong></p>
        <p class='description'>ターミナルからサーバを切り離します。</p>
      </td>
      <td class="align-center">
        <p><code class="option">detach: BOOL</code></p>
        <p><code class="flag">-B, --detach</code></p>
      </td>
    </tr>
  </tbody>
</table>
</div>

<!--original
<div class="mobile-side-scroller">
<table>
  <thead>
    <tr>
      <th>Setting</th>
      <th><span class="option">Options</span> and <span class="flag">Flags</span></th>
    </tr>
  </thead>
  <tbody>
    <tr class='setting'>
      <td>
        <p class='name'><strong>Local Server Port</strong></p>
        <p class='description'>Listen on the given port.</p>
      </td>
      <td class="align-center">
        <p><code class="option">port: PORT</code></p>
        <p><code class="flag">--port PORT</code></p>
      </td>
    </tr>
    <tr class='setting'>
      <td>
        <p class='name'><strong>Local Server Hostname</strong></p>
        <p class='description'>Listen at the given hostname.</p>
      </td>
      <td class="align-center">
        <p><code class="option">host: HOSTNAME</code></p>
        <p><code class="flag">--host HOSTNAME</code></p>
      </td>
    </tr>
    <tr class='setting'>
      <td>
        <p class='name'><strong>Base URL</strong></p>
        <p class='description'>Serve the website from the given base URL</p>
      </td>
      <td class="align-center">
        <p><code class="option">baseurl: URL</code></p>
        <p><code class="flag">--baseurl URL</code></p>
      </td>
    </tr>
    <tr class='setting'>
      <td>
        <p class='name'><strong>Detach</strong></p>
        <p class='description'>Detach the server from the terminal</p>
      </td>
      <td class="align-center">
        <p><code class="option">detach: BOOL</code></p>
        <p><code class="flag">-B, --detach</code></p>
      </td>
    </tr>
  </tbody>
</table>
</div>
-->

<div class="note warning">
  <h5>設定ファイルにタブは使わないでください</h5>
  <p>
    パースエラーにつながるか、 Jekyll のデフォルト設定に戻るかのどちらかになるでしょう。
    代わりにスペースを使用してください。
  </p>
</div>

<!--original
<div class="note warning">
  <h5>Do not use tabs in configuration files</h5>
  <p>
    This will either lead to parsing errors, or Jekyll will revert to the
    default settings. Use spaces instead.
  </p>
</div>
-->

## デフォルト設定

<!--original
## Default Configuration
-->

Jekyll はデフォルトでは以下のオプションで実行されます。
代わりのオプションが設定ファイルまたはコマンドラインから明示的に指定されない限り、
Jekyll はこれらのオプションを使用して起動します。

<!--original
Jekyll runs with the following configuration options by default. Unless
alternative settings for these options are explicitly specified in the
configuration file or on the command-line, Jekyll will run using these options.
-->

<div class="note warning">
  <h5>サポートしていない kramdown のオプションが 2 つあります</h5>
  <p>
    <code>remove_block_html_tags</code> と <code>remove_span_html_tags</code> の両方が
    kramdown HTML コンバータに含まれていないので、現在 Jekyll でもそれらをサポートしていません。
    ご注意ください。
  </p>
</div>

<!--original
<div class="note warning">
  <h5>There are two unsupported kramdown options</h5>
  <p>
    Please note that both <code>remove_block_html_tags</code> and
    <code>remove_span_html_tags</code> are currently unsupported in Jekyll due to the
    fact that they are not included within the kramdown HTML converter.
  </p>
</div>
-->

{% highlight yaml %}
source:      .
destination: ./_site
plugins:     ./_plugins
layouts:     ./_layouts
include:     ['.htaccess']
exclude:     []
keep_files:  ['.git','.svn']
gems:        []
timezone:    nil
encoding:    nil

future:      true
show_drafts: nil
limit_posts: 0
pygments:    true

relative_permalinks: true

permalink:     date
paginate_path: 'page:num'

markdown:      maruku
markdown_ext:  markdown,mkd,mkdn,md
textile_ext:   textile

excerpt_separator: "\n\n"

safe:        false
watch:       false    # deprecated
server:      false    # deprecated
host:        0.0.0.0
port:        4000
baseurl:     /
url:         http://localhost:4000
lsi:         false

maruku:
  use_tex:    false
  use_divs:   false
  png_engine: blahtex
  png_dir:    images/latex
  png_url:    /images/latex
  fenced_code_blocks: true

rdiscount:
  extensions: []

redcarpet:
  extensions: []

kramdown:
  auto_ids: true
  footnote_nr: 1
  entity_output: as_char
  toc_levels: 1..6
  smart_quotes: lsquo,rsquo,ldquo,rdquo
  use_coderay: false

  coderay:
    coderay_wrap: div
    coderay_line_numbers: inline
    coderay_line_numbers_start: 1
    coderay_tab_width: 4
    coderay_bold_every: 10
    coderay_css: style

redcloth:
  hard_breaks: true
{% endhighlight %}

<!--original
{% highlight yaml %}
source:      .
destination: ./_site
plugins:     ./_plugins
layouts:     ./_layouts
include:     ['.htaccess']
exclude:     []
keep_files:  ['.git','.svn']
gems:        []
timezone:    nil
encoding:    nil

future:      true
show_drafts: nil
limit_posts: 0
highlighter: pygments

relative_permalinks: true

permalink:     date
paginate_path: 'page:num'
paginate:      nil

markdown:      kramdown
markdown_ext:  markdown,mkd,mkdn,md
textile_ext:   textile

excerpt_separator: "\n\n"

safe:        false
watch:       false    # deprecated
server:      false    # deprecated
host:        0.0.0.0
port:        4000
baseurl:     /
url:         http://localhost:4000
lsi:         false

maruku:
  use_tex:    false
  use_divs:   false
  png_engine: blahtex
  png_dir:    images/latex
  png_url:    /images/latex
  fenced_code_blocks: true

rdiscount:
  extensions: []

redcarpet:
  extensions: []

kramdown:
  auto_ids: true
  footnote_nr: 1
  entity_output: as_char
  toc_levels: 1..6
  smart_quotes: lsquo,rsquo,ldquo,rdquo
  use_coderay: false

  coderay:
    coderay_wrap: div
    coderay_line_numbers: inline
    coderay_line_numbers_start: 1
    coderay_tab_width: 4
    coderay_bold_every: 10
    coderay_css: style

redcloth:
  hard_breaks: true
{% endhighlight %}
-->

<div class="note unreleased">
  <h5>Kramdown をデフォルトに設定したバージョンは、まだリリースされていません。</h5>
  <p>
    最新の開発版リリースにおいて、私たちは Maruku を非推奨としました。代わりに Kramdown がデフォルトになる予定です。
    それより前のバージョンでは Maruku をデフォルトで使用しています。
  </p>
</div>

<!--original
<div class="note unreleased">
  <h5>Kramdown as the default is currently unreleased.</h5>
  <p>
    In the latest development releases, we've deprecated Maruku and will default to
    Kramdown instead of Maruku. All versions below this will use Maruku as the
    default.
  </p>
</div>
-->

## Markdown オプション

<!--original
## Markdown Options
-->

Jekyll でサポートしているさまざまな Markdown レンダラでは、
追加のオプションを利用できる場合があります。

<!--original
The various Markdown renderers supported by Jekyll sometimes have extra options available.
-->

### Redcarpet

<!--original
### Redcarpet
-->

Redcarpet は `extensions` サブセッティングを設けることで設定が可能です。
値は文字列の配列である必要があります。
各々の文字列は `Redcarpet::Markdown` クラスの拡張の
いずれかの名前であるべきです。
配列に名前が存在する場合、当該の拡張を `true` にセットします。

<!--original
Redcarpet can be configured by providing an `extensions` sub-setting, whose value should be an array of strings. Each string should be the name of one of the `Redcarpet::Markdown` class's extensions; if present in the array, it will set the corresponding extension to `true`.
-->

Jekyll は Redcarpet の 2 つの特別な拡張を処理します:

<!--original
Jekyll handles two special Redcarpet extensions:
-->

- `no_fenced_code_blocks` --- デフォルトでは、
  Jekyll は `fenced_code_blocks` 拡張(トリプルチルダまたはトリプルバッククォートで
  コードブロックを区切るための拡張)を `true` に設定しています。
  おそらく、GitHub がこれを積極的に採用しているので、避けられなくなりつつある、という理由からです。
  Jekyll で使用するときには、 Redcarpet の通常の `fenced_code_blocks` 拡張は不活性です。
  代わりに、この逆バージョンの拡張を使って fenced code を無効化できます。
  最初の区切りのあとに、ハイライトする言語の指定もできることに注目:

        ```ruby
        # ...ruby code
        ```

    fenced code block と highlighter を両方有効にすると、静的にコードをハイライトします。
    highlighter なしの場合、`<code>` 要素に `class="LANGUAGE"` を追加し、
    様々な JavaScript のコードハイライトライブラリがこれをヒントとして使用できるようにします。
- `smart` --- この擬似拡張は SmartyPants をオンにし、
   straight quotes を curly quotes に、
   ハイフンの連打を em (`---`) ダッシュ、 en (`--`) ダッシュに変換します。

<!--original
- `no_fenced_code_blocks` --- By default, Jekyll sets the `fenced_code_blocks` extension (for delimiting code blocks with triple tildes or triple backticks) to `true`, probably because GitHub's eager adoption of them is starting to make them inescapable. Redcarpet's normal `fenced_code_blocks` extension is inert when used with Jekyll; instead, you can use this inverted version of the extension for disabling fenced code.

    Note that you can also specify a language for highlighting after the first delimiter:

        ```ruby
        # ...ruby code
        ```

    With both fenced code blocks and highlighter enabled, this will statically highlight the code; without any syntax highlighter, it will add a `class="LANGUAGE"` attribute to the `<code>` element, which can be used as a hint by various JavaScript code highlighting libraries.
- `smart` --- This pseudo-extension turns on SmartyPants, which converts straight quotes to curly quotes and runs of hyphens to em (`---`) and en (`--`) dashes.
-->

その他の拡張はすべて Redcarpet における本来の名前を維持しており、
`smart` 以外のレンダリングオプションは Jekyll によって指定されることはありません。
[利用可能な拡張のリストは Redcarpet の README から見つけられます。][redcarpet_extensions]
Redcarpet の正しいバージョンの README を見ていることを確認してください。
Jekyll は現在 v2.2.x を使用しています。 `footnotes` や `highlight` のような拡張は
バージョン 3.0.0 以降まで追加されません。
もっとも一般的に使用される拡張は以下の通りです:

<!--original
All other extensions retain their usual names from Redcarpet, and no renderer options aside from `smart` can be specified in Jekyll. [A list of available extensions can be found in the Redcarpet README file.][redcarpet_extensions] Make sure you're looking at the README for the right version of Redcarpet: Jekyll currently uses v2.2.x, and extensions like `footnotes` and `highlight` weren't added until after version 3.0.0. The most commonly used extensions are:
-->

- `tables`
- `no_intra_emphasis`
- `autolink`

<!--original
- `tables`
- `no_intra_emphasis`
- `autolink`
-->

[redcarpet_extensions]: https://github.com/vmg/redcarpet/blob/v2.2.2/README.markdown#and-its-like-really-simple-to-use

<!--original
[redcarpet_extensions]: https://github.com/vmg/redcarpet/blob/v2.2.2/README.markdown#and-its-like-really-simple-to-use
-->

### Kramdown

<!--original
### Kramdown
-->

上記のデフォルトに加えて、 `input` オプションに `GFM` 値を渡すことで、
GitHub Flavored Markdown の認識を有効にすることができます。

<!--original
In addition to the defaults mentioned above, you can also turn on recognition of Github Flavored Markdown by passing an `input` option with a value of "GFM".
-->

例えば、あなたの `_config.yml` にこう書きます:

<!--original
For example, in your `_config.yml`:
-->

    kramdown:
      input: GFM

<!--original
    kramdown:
      input: GFM
-->
