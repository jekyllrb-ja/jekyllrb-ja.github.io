---
layout: docs
title: ディレクトリ構成
prev_section: usage
next_section: configuration
permalink: /docs/structure/
---

<!--original
---
layout: docs
title: Directory structure
prev_section: usage
next_section: configuration
permalink: /docs/structure/
---
-->

Jekyll のコアは、テキスト変換エンジンです。
システムの背後のコンセプトはこれです: 
あなたが、 Markdown や Textile や ただのプレーン HTML のような
自分のお気に入りのマークアップ言語で書かれたテキストを
与えると、それはレイアウトや一連のレイアウトファイルを大量生産します。
そのプロセスを通して、あなたはどのようにサイト URL が見られるか、
取得データがレイアウトの中に表示されるかなどを微調整することができます
それはすべてのテキストファイル編集を通して行われ、
静的な Web サイトは最終的な成果物となります。

<!--original
Jekyll is, at its core, a text transformation engine. The concept behind the
system is this: you give it text written in your favorite markup language, be
that Markdown, Textile, or just plain HTML, and it churns that through a layout
or series of layout files. Throughout that process you can tweak how you want
the site URLs to look, what data gets displayed in the layout, and more. This is
all done through editing text files, and the static web site is the final
product.
-->

基本的な Jekyll サイトは、通常このようになります:

<!--original
A basic Jekyll site usually looks something like this:
-->

{% highlight bash %}
.
├── _config.yml
├── _drafts
|   ├── begin-with-the-crazy-ideas.textile
|   └── on-simplicity-in-technology.markdown
├── _includes
|   ├── footer.html
|   └── header.html
├── _layouts
|   ├── default.html
|   └── post.html
├── _posts
|   ├── 2007-10-29-why-every-programmer-should-play-nethack.textile
|   └── 2009-04-26-barcamp-boston-4-roundup.textile
├── _data
|   └── members.yml
├── _site
└── index.html
{% endhighlight %}

<!--original
{% highlight bash %}
.
├── _config.yml
├── _drafts
|   ├── begin-with-the-crazy-ideas.textile
|   └── on-simplicity-in-technology.markdown
├── _includes
|   ├── footer.html
|   └── header.html
├── _layouts
|   ├── default.html
|   └── post.html
├── _posts
|   ├── 2007-10-29-why-every-programmer-should-play-nethack.textile
|   └── 2009-04-26-barcamp-boston-4-roundup.textile
├── _data
|   └── members.yml
├── _site
└── index.html
{% endhighlight %}
-->

これらのファイルの概要はこのようになります:

<!--original
An overview of what each of these does:
-->

<div class="mobile-side-scroller">
<table>
  <thead>
    <tr>
      <th>ファイル / ディレクトリ</th>
      <th>説明</th>

<!--original
      <th>File / Directory</th>
      <th>Description</th>
-->
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <p><code>_config.yml</code></p>
      </td>
      <td>
        <p>

          <a href="../configuration/">設定項目</a> データを保管します。
          これらのオプションの多くはコマンドラインの実行から指定することもできます。
          しかし、オプションはここで指定する方が簡単です。オプションを覚えておく必要がありません。

<!--original
          Stores <a href="../configuration/">configuration</a> data. Many of
          these options can be specified from the command line executable but
          it’s easier to specify them here so you don’t have to remember them.
-->

        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>_drafts</code></p>
      </td>
      <td>
        <p>

          ドラフトは posts に出力しません。
          これらのファイルのフォーマットは日付がありません: <code>title.MARKUP</code> 。
          <a href="../drafts/">ドラフトの働き</a> で使い方を学んでください。

<!--original
          Drafts are unpublished posts. The format of these files is without a date: <code>title.MARKUP</code>. Learn how to <a href="../drafts/">work with drafts</a>.
-->

        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>_includes</code></p>
      </td>
      <td>
        <p>

          これらは部分的な再利用を容易にするために layouts ファイルと posts ファイルによって
          ミックス、マッチすることができます。
          liquid のタグ <code>{% raw %}{% include file.ext %}{% endraw %}</code> は
          ファイルの <code>_includes/file.ext</code> を含むために使用されます。

<!--original
          These are the partials that can be mixed and matched by your layouts
          and posts to facilitate reuse. The liquid tag
          <code>{% raw %}{% include file.ext %}{% endraw %}</code>
          can be used to include the partial in
          <code>_includes/file.ext</code>.
-->

        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>_layouts</code></p>
      </td>
      <td>
        <p>

          これらは posts をラップするテンプレートです。
          layouts は次のセクションに記述されている <a href="../frontmatter/">YAML front matter</a>
          に基づいて post 毎に選択されます。
          liquid タグ <code>{% raw %}{{ content }}{% endraw %}</code> は
          ウェブページにコンテンツを挿入するために使用されます。

<!--original
          These are the templates that wrap posts. Layouts are chosen on a post-
          by-post basis in the <a href="../frontmatter/">YAML front matter</a>,
          which is described in the next section. The liquid tag
          <code>{% raw %}{{ content }}{% endraw %}</code>
          is used to inject content into the web page.
-->

        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>_posts</code></p>
      </td>
      <td>
        <p>

          言うならば、あなたの動的コンテンツです。
          これらのファイルのフォーマットは重要で、フォーマットに従う必要があります:
          <code>YEAR-MONTH-DAY-title.MARKUP</code> 。
          <a href="../permalinks/">パーマリンク</a> は、各 post のためにカスタマイズすることができます。
          しかし、日付とマークアップ言語はファイル名によってのみ決定されます。

<!--original
          Your dynamic content, so to speak. The naming convention of these files is
          important, and must follow the format:
          <code>YEAR-MONTH-DAY-title.MARKUP</code>.
          The <a href="../permalinks/">permalinks</a> can be customized for each
          post, but the date and markup language are determined solely by the
          file name.
-->

        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>_data</code></p>
      </td>
      <td>
        <p>

          よく整備されたサイトデータはここに置かれるべきです。
          Jekyll エンジンはこのディレクトリの全ての yaml ファイルをオートロードします。
          (<code>.yml</code> または <code>.yaml</code> で終わるもの)
          このディレクトリの下に member.yml がある場合、あなたは
          <code>site.data.members</code> を通してコンテンツにアクセスできます。

<!--original
          Well-formatted site data should be placed here. The jekyll engine will 
          autoload all yaml files (ends with <code>.yml</code> or <code>.yaml</code>) 
          in this directory. If there's a file <code>members.yml</code> under the directory, 
          then you can access contents of the file through <code>site.data.members</code>.
-->

        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>_site</code></p>
      </td>
      <td>
        <p>

          Jekyll がそれを変換すると、生成されたサイトは(デフォルトで)ここに置かれます。
          あなたの <code>.gitignore</code> ファイルにこれを追加するのは良い考えです。

<!--original
          This is where the generated site will be placed (by default) once
          Jekyll is done transforming it. It’s probably a good idea to add this
          to your <code>.gitignore</code> file.
-->

        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>index.html</code> や、他の HTML, Markdown, Textile ファイル</p>

<!--original
        <p><code>index.html</code> and other HTML, Markdown, Textile files</p>
-->
      </td>
      <td>
        <p>

          <a href="../frontmatter/">YAML Front Matter</a> セクションを持つという条件で、
          それは Jekyll によって変換されます。
          同様の事がどんな <code>.html</code> 、 <code>.markdown</code> 、
          <code>.md</code> 、または <code>.textile</code> ファイルにも
          サイトのルートディレクトリや、上記以外のディレクトリに起こります。

<!--original
          Provided that the file has a <a href="../frontmatter/">YAML Front
          Matter</a> section, it will be transformed by Jekyll. The same will
          happen for any <code>.html</code>, <code>.markdown</code>,
          <code>.md</code>, or <code>.textile</code> file in your site’s root
          directory or directories not listed above.
-->

        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p>他のファイル/フォルダ</p>

<!--original
        <p>Other Files/Folders</p>
-->
      </td>
      <td>
        <p>

          上記のリストで挙げたファイルやディレクトリを除く全てのもの
          ― <code>css</code> や <code>images</code> フォルダ、
          <code>favicon.ico</code> ファイルのような―
          そのまま生成したサイトにコピーされます。
          もし、あなたが彼らが展開したものに興味があれば、 <a href="../sites/">
          既に Jekyll を使用しているサイト</a>はたくさんあります。

<!--original
          Every other directory and file except for those listed above—such as
          <code>css</code> and <code>images</code> folders,
          <code>favicon.ico</code> files, and so forth—will be copied verbatim
          to the generated site. There are plenty of <a href="../sites/">sites
          already using Jekyll</a> if you’re curious to see how they’re laid
          out.
-->

        </p>
      </td>
    </tr>
  </tbody>
</table>
</div>
