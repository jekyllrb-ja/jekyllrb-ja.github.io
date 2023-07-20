---
title: ディレクトリ構成
permalink: /docs/structure/
---
<!-- ---
title: Directory Structure
permalink: /docs/structure/
--- -->

基本的なJekyllサイトは、通常この様になっています。

<!-- A basic Jekyll site usually looks something like this: -->

```
.
├── _config.yml
├── _data
│   └── members.yml
├── _drafts
│   ├── begin-with-the-crazy-ideas.md
│   └── on-simplicity-in-technology.md
├── _includes
│   ├── footer.html
│   └── header.html
├── _layouts
│   ├── default.html
│   └── post.html
├── _posts
│   ├── 2007-10-29-why-every-programmer-should-play-nethack.md
│   └── 2009-04-26-barcamp-boston-4-roundup.md
├── _sass
│   ├── _base.scss
│   └── _layout.scss
├── _site
├── .jekyll-metadata
└── index.html # can also be an 'index.md' with valid front matter
```

<div class="note">
  <h5>gemベーステーマを使ったJekyllサイトのディレクトリ構成</h5>
  <!-- <h5>Directory structure of Jekyll sites using gem-based themes</h5> -->
  <p>
    バージョン{% include docs_version_badge.html version="3.2"%}から、<code>jekyll new</code>の新しいJekyllプロジェクトは、<a href="/docs/themes/">gemベーステーマ</a>を使用してサイトの外観を決定します。その結果、デフォルトのディレクトリ構成は軽くます。<code>_layouts</code>、 <code>_includes</code>、<code>_sass</code>がテーマのgemに入っています。
  </p>
  <!-- <p>
    Since version {% include docs_version_badge.html version="3.2"%}, a new Jekyll project bootstrapped with <code>jekyll new</code> uses <a href="/docs/themes/">gem-based themes</a> to define the look of the site. This results in a lighter default directory structure : <code>_layouts</code>, <code>_includes</code> and <code>_sass</code> are stored in the theme-gem, by default.
  </p> -->
  <br />
  <p>
     <a href="https://github.com/jekyll/minima" target="_blank">minima</a>は現在のデフォルトテーマで、 <code>bundle info minima</code>でminimaのテーマファイルがコンピュータのどこに保存されているのかを見ることができます。
  </p>
  <!-- <p>
     <a href="https://github.com/jekyll/minima">minima</a> is the current default theme, and <code>bundle info minima</code> will show you where minima theme's files are stored on your computer.
  </p> -->
</div>

以下は、それぞれのファイルがなんなのかの概要です。

<!-- An overview of what each of these does: -->

<div class="mobile-side-scroller">
<table>
  <thead>
    <tr>
      <th>ファイル・<br />ディレクトリ</th>
      <th>説明</th>
      <!-- <th>File / Directory</th>
      <th>Description</th> -->
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <p><code>_config.yml</code></p>
      </td>
      <td>
        <p>
          <a href="{{ "/docs/configuration/" | relative_url }}">構成</a>データの保管場所です。多くのオプションはコマンドラインから実行するときに指定できますが、ここで設定する方が簡単です。ですので、覚えておく必要がありません。
        </p>
        <!-- <p>
          Stores <a href="/docs/configuration/">configuration</a> data. Many of
          these options can be specified from the command line executable but
          it’s easier to specify them here so you don’t have to remember them.
        </p> -->
      </td>
    </tr>
    <tr>
      <td>
        <p><code>_drafts</code></p>
      </td>
      <td>
        <p>
          ドラフトは未公開のポストです。これらのファイルのフォーマットは、日付を含めません： <code>title.MARKUP</code>。 <a href="{{ "/docs/posts/#drafts" | relative_url }}">ドラフトの働き</a>で方法を学んでください。
        </p>
        <!-- <p>
          Drafts are unpublished posts. The format of these files is without a
          date: <code>title.MARKUP</code>. Learn how to <a href="/docs/posts/#drafts">
          work with drafts</a>.
        </p> -->
      </td>
    </tr>
    <tr>
      <td>
        <p><code>_includes</code></p>
      </td>
      <td>
        <p>
          レイアウトやポストに入れ込んで使う部品です。Liquidタグの<code>{% raw %}{% include file.ext %}{% endraw %}</code>で<code>_includes/file.ext</code>のファイルを読み込んで使用できます。
        </p>
        <!-- <p>
          These are the partials that can be mixed and matched by your layouts
          and posts to facilitate reuse. The liquid tag
          <code>{% raw %}{% include file.ext %}{% endraw %}</code>
          can be used to include the partial in
          <code>_includes/file.ext</code>.
        </p> -->
      </td>
    </tr>
    <tr>
      <td>
        <p><code>_layouts</code></p>
      </td>
      <td>
        <p>
          ポストを包むテンプレートです。レイアウトはポスト毎に<a href="{{ "/docs/front-matter/" | relative_url }}">front matter</a>で設定できます。Liqudタグ<code>{% raw %}{{ content }}{% endraw %}</code>をページにコンテンツを挿入するために使用します。
        </p>
        <!-- <p>
          These are the templates that wrap posts. Layouts are chosen on a
          post-by-post basis in the
          <a href="/docs/front-matter/">front matter</a>,
          which is described in the next section. The liquid tag
          <code>{% raw %}{{ content }}{% endraw %}</code>
          is used to inject content into the web page.
        </p> -->
      </td>
    </tr>
    <tr>
      <td>
        <p><code>_posts</code></p>
      </td>
      <td>
        <p>
          言うなれば、あなたの動的コンテンツです。ファイルの命名規則が重要で、<code>YEAR-MONTH-DAY-title.MARKUP</code>のフォーマットでなければなりません。ポスト毎に<a href="{{ "/docs/permalinks/" | relative_url }}">パーマリンク</a>をカスタマイズできますが、日付とマークアップの言語はファイル名によってのみ決まります。
        </p>
        <!-- <p>
          Your dynamic content, so to speak. The naming convention of these
          files is important, and must follow the format:
          <code>YEAR-MONTH-DAY-title.MARKUP</code>.
          The <a href="/docs/permalinks/">permalinks</a> can be customized for
          each post, but the date and markup language are determined solely by
          the file name.
        </p> -->
      </td>
    </tr>
    <tr>
      <td>
        <p><code>_data</code></p>
      </td>
      <td>
        <p>
          形式に則ったサイトのデータはここに配置します。Jekyllエンジンはこのディレクトリのデータファイル(<code>.yml</code>, <code>.yaml</code>, <code>.json</code>, <code>.csv</code>, <code>.tsv</code>のフォーマット)を自動で読み込み、`site.data`で使用可能にします。このディレクトリの<code>members.yml</code>ファイルの場合、<code>site.data.members</code>でファイルの内容にアクセスできます。
        </p>
        <!-- <p>
          Well-formatted site data should be placed here. The Jekyll engine
          will autoload all data files (using either the <code>.yml</code>,
          <code>.yaml</code>, <code>.json</code>, <code>.csv</code> or
          <code>.tsv</code> formats and extensions) in this directory,
          and they will be accessible via `site.data`. If there's a file
          <code>members.yml</code> under the directory, then you can access
          contents of the file through <code>site.data.members</code>.
        </p> -->
      </td>
    </tr>
    <tr>
      <td>
        <p><code>_sass</code></p>
      </td>
      <td>
        <p>
          <code>main.scss</code>にインポートするためのsassの部品ファイルです。変換する過程で一つのスタイルシート<code>main.css</code>になり、サイトのスタイルとして使用できます。
        </p>
        <!-- <p>
          These are sass partials that can be imported into your <code>main.scss</code>
          which will then be processed into a single stylesheet
          <code>main.css</code> that defines the styles to be used by your site.
        </p> -->
      </td>
    </tr>
    <tr>
      <td>
        <p><code>_site</code></p>
      </td>
      <td>
        <p>
          生成されたサイトがJekyllが変換した際に配置される（デフォルトの）場所です。これを<code> .gitignore </code>ファイルに追加することをお勧めします。
        </p>
        <!-- <p>
          This is where the generated site will be placed (by default) once
          Jekyll is done transforming it. It’s probably a good idea to add this
          to your <code>.gitignore</code> file.
        </p> -->
      </td>
    </tr>
    <tr>
      <td>
        <p><code>.jekyll-metadata</code></p>
      </td>
      <td>
        <p>
          これにより、Jekyllは、サイトが最後に構築されてから変更されていないファイル、および次回の構築時にどのファイルを再生成する必要があるかを追跡できます。このファイルは生成されたサイトには含まれません。これをあなたの<code>.gitignore</code>ファイルに追加するのはおそらく良い考えです。
        </p>
        <!-- <p>
          This helps Jekyll keep track of which files have not been modified
          since the site was last built, and which files will need to be
          regenerated on the next build. This file will not be included in the
          generated site. It’s probably a good idea to add this to your
          <code>.gitignore</code> file.
        </p> -->
      </td>
    </tr>
    <tr>
      <td>
        <p><code>index.html</code>か<code>index.md</code>と他のHTML、Markdownファイル</p>
        <!-- <p><code>index.html</code> or <code>index.md</code> and other HTML,
        Markdown files</p> -->
      </td>
      <td>
        <p>
          ファイルに<a href="{{ "/docs/front-matter/" | relative_url }}">front matter</a>がある場合、Jekyllによって変換されます。サイトのルートディレクトリまたは上記以外のディレクトリにある<code>.html</code>、<code>.markdown</code>、<code>.md</code>または<code>.textile</code>ファイルについても同様です。
        </p>
        <!-- <p>
          Provided that the file has a <a href="/docs/front-matter/">front
          matter</a> section, it will be transformed by Jekyll. The same will
          happen for any <code>.html</code>, <code>.markdown</code>,
          <code>.md</code>, or <code>.textile</code> file in your site’s root
          directory or directories not listed above.
        </p> -->
      </td>
    </tr>
    <tr>
      <td>
        <p>他のファイルやフォルダ</p>
        <!-- <p>Other Files/Folders</p> -->
      </td>
      <td>
        <p>
          <code>css</code>や<code>images</code>フォルダ、<code>favicon.ico</code>ファイルなど、上記以外のすべてのディレクトリとファイルは、生成されたサイトにそのままコピーされます。レイアウトがどのように行われているかを知りたい場合は、<a href="https://jekyllrb.com/showcase/" target="_blank">既にJekyllを使用しているサイト</a>がたくさんあります。
        </p>
        <!-- <p>
          Every other directory and file except for those listed above—such as
          <code>css</code> and <code>images</code> folders,
          <code>favicon.ico</code> files, and so forth—will be copied verbatim
          to the generated site. There are plenty of <a href="/showcase/">sites
          already using Jekyll</a> if you’re curious to see how they’re laid
          out.
        </p> -->
      </td>
    </tr>
  </tbody>
</table>
</div>

`.`, `_ `, `#` もしくは `~`から始まる`source`ディレクトリの全てのファイルやディレクトリは、`destination`フォルダには含まれません。これらのパスを特別にコピーしたい場合には、設定ファイルの`include`に書き込まなければなりません。

<!-- Every file or directory beginning with the following characters: `.`, `_ `, `#` or `~` in the `source` directory will not be included in the `destination` folder. Such paths will have to be explicitly specified via the config file in the `include` directive to make sure they're copied over: -->

```yaml
include:
 - _pages
 - .htaccess
 ```
