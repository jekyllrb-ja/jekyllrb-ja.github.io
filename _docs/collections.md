---
layout: docs
title: Collection
prev_section: variables
next_section: datafiles
permalink: /docs/collections/
base_revision: 0fbdc6944041147c2d21b306751b078860b6603b[refs/heads/master]
---

<!--original
---
layout: docs
title: Collections
prev_section: variables
next_section: datafiles
permalink: /docs/collections/
---
-->

<div class="note warning">
  <h5>Collectionのサポートは確定しておらず、変更される可能性があります。</h5>
  <p>これは実験的な機能であり、APIはこの機能が安定するまでは変更される可能性が高いです。</p>
</div>

<!--original
<div class="note warning">
  <h5>Collections support is unstable and may change</h5>
  <p>
    This is an experimental feature and that the API may likely change until the feature stabilizes.
  </p>
</div>
-->

PostとPageですべてがまかなえるわけではありません。関わっているオープンソースプロジェクトにおける決めごとをまとめたり、チームメンバーの紹介をしたり、カンファレンスでの発表の記録を残したりしたくなることもあるでしょう。
Collectionを使えば、新しいタイプのドキュメント、つまり通常ではPageやPostのように振る舞い、しかし一方で、固有の属性と名前空間を持ったもの、を定義することができます。

<!--original
Not everything is a post or a page. Maybe you want to document the various methods in your open source project, members of a team, or talks at a conference. Collections allow you to define a new type of document that behave like Pages or Posts do normally, but also have their own unique properties and namespace.
-->

## Collectionの使い方

<!--original
## Using Collections
-->

### ステップ１：Jekyllにあなたのコレクションを読み込ませる

<!--original
### Step 1: Tell Jekyll to read in your collection
-->

サイトの`_config.yml`に以下を追加します(`my_collection`は自身のコレクション名に置き換えてください)。

<!--original
Add the following to your site's `_config.yml` file, replacing `my_collection` with the name of your collection:
-->

{% highlight yaml %}
collections:
- my_collection
{% endhighlight %}

<!--original
{% highlight yaml %}
collections:
- my_collection
{% endhighlight %}
-->

この設定でコレクションのメタデータを指定することもできます。

<!--original
You can optionally specify metadata for your collection in the configuration:
-->

{% highlight yaml %}
collections:
  my_collection:
    foo: bar
{% endhighlight %}

<!--original
{% highlight yaml %}
collections:
  my_collection:
    foo: bar
{% endhighlight %}
-->

### ステップ２：コンテンツを追加する

<!--original
### Step 2: Add your content
-->

対応するフォルダー(例えば、`<source>/_my_collection`)を作成し、ドキュメントを追加します。
YAML front-matterがある場合は、それはデータとして読み込まれ、無い場合は、すべてのものはそのままドキュメントの`content`属性に挿入されます。

<!--original
Create a corresponding folder (e.g. `<source>/_my_collection`) and add documents.
YAML front-matter is read in as data if it exists, if not, then everything is just stuck in the Document's `content` attribute.
-->

注：フォルダーの名前は、config.ymlファイルに定義したコレクション名に、`_`文字を前置したものと同じでなければなりません。

<!--original
Note: the folder must be named identical to the collection you defined in you config.yml file, with the addition of the preceding `_` character.
-->

### ステップ３：必要に応じてコレクションのドキュメントを個別ファイルに書き出す

<!--original
### Step 3: Optionally render your collection's documents into independent files
-->

コレクション内の各ドキュメントの公開用ファイル出力版をJekyllで生成したい場合は、`_config.yml`におけるcollectionメタデータの`output`キーを`true`に設定します。

<!--original
If you'd like Jekyll to create a public-facing, rendered version of each document in your collection, set the `output` key to `true` in your collection metadata in your `_config.yml`:
-->

{% highlight yaml %}
collections:
  my_collection:
    output: true
{% endhighlight %}

<!--original
{% highlight yaml %}
collections:
  my_collection:
    output: true
{% endhighlight %}
-->

この例では、コレクション内の各ドキュメントごとに１つのファイルが生成されます。
例えば、`_my_collection/some_subdir/some_doc.md`がある場合、それは、設定されたLiquidとMarkdownコンバータを使ってレンダリングされ、`<dest>/my_collection/some_subdir/some_doc.html`に書き出されます。

<!--original
This will produce a file for each document in the collection.
For example, if you have `_my_collection/some_subdir/some_doc.md`,
it will be rendered using Liquid and the Markdown converter of your
choice and written out to `<dest>/my_collection/some_subdir/some_doc.html`.
-->

[パーマリンク](../permalinks/)がある記事に関しては、ドキュメントのURLはコレクションの`permalink`メタデータを設定することでカスタマイズできます。

<!--original
As for posts with [Permalinks](../permalinks/), document URL can be customized by setting a `permalink` metadata to the collection:
-->

{% highlight yaml %}
collections:
  my_collection:
    output: true
    permalink: /awesome/:path/
{% endhighlight %}

<!--original
{% highlight yaml %}
collections:
  my_collection:
    output: true
    permalink: /awesome/:path/
{% endhighlight %}
-->

例えば、`_my_collection/some_subdir/some_doc.md`がある場合、それは`<dest>/awesome/some_subdir/some_doc/index.html`に書き出されることになります。

<!--original
For example, if you have `_my_collection/some_subdir/some_doc.md`, it will be written out to `<dest>/awesome/some_subdir/some_doc/index.html`.
-->

<div class="mobile-side-scroller">
<table>
  <thead>
    <tr>
      <th>変数</th>
      <th>解説</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <p><code>collection</code></p>
      </td>
      <td>
        <p>コレクションのラベル</p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>path</code></p>
      </td>
      <td>
        <p>コレクションのディレクトリに対するドキュメントの相対パス</p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>output_ext</code></p>
      </td>
      <td>
        <p>出力ファイルの拡張子</p>
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
      <th>Variable</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <p><code>collection</code></p>
      </td>
      <td>
        <p>Label of the containing collection</p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>path</code></p>
      </td>
      <td>
        <p>Path to the document relative to the collection's directory</p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>output_ext</code></p>
      </td>
      <td>
        <p>Extension of the output file</p>
      </td>
    </tr>
  </tbody>
</table>
</div>
-->

## Liquid属性

<!--original
## Liquid Attributes
-->

### コレクション

<!--original
### Collections
-->

各コレクションには、Liquid変数`site`を通してアクセス可能です。例えば、`_albums`にある`albums`コレクションにアクセスしたい場合は、`site.albums`を使います。
各コレクションそれ自体は、ドキュメントの配列です(例えば、`site.albums`
は、`site.pages`や`site.posts`と同じようなドキュメントの配列です)。これらのドキュメントの属性にアクセスする方法については、以下を参照してください。

<!--original
Each collection is accessible via the `site` Liquid variable. For example, if you want to access the `albums` collection found in `_albums`, you'd use `site.albums`. Each collection is itself an array of documents (e.g. `site.albums` is an array of documents, much like `site.pages` and `site.posts`). See below for how to access attributes of those documents.
-->

また、コレクションには`site.collections`を通してアクセスできますが、これには、`_config.yml`で指定がなされているならそのメタデータと、次の情報とがあります。

<!--original
The collections are also available under `site.collections`, with the metadata you specified in your `_config.yml` (if present) and the following information:
-->

<div class="mobile-side-scroller">
<table>
  <thead>
    <tr>
      <th>変数</th>
      <th>解説</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <p><code>label</code></p>
      </td>
      <td>
        <p>
          コレクションの名前(例：<code>my_collection</code>)。
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>docs</code></p>
      </td>
      <td>
        <p>
          <a href="#documents">ドキュメント</a>の配列。
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>relative_directory</code></p>
      </td>
      <td>
        <p>
          コレクションのソースディレクトリのパス(サイトソースからの相対パス)。
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>directory</code></p>
      </td>
      <td>
        <p>
          コレクションのソースディレクトリのフルパス。
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>output</code></p>
      </td>
      <td>
        <p>
          個別ファイルとしてコレクションのドキュメントを出力するか否かの指定。
        </p>
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
      <th>Variable</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <p><code>label</code></p>
      </td>
      <td>
        <p>
          The name of your collection, e.g. <code>my_collection</code>.
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>docs</code></p>
      </td>
      <td>
        <p>
          An array of <a href="#documents">documents</a>.
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>relative_directory</code></p>
      </td>
      <td>
        <p>
          The path to the collections's source directory, relative to the site source.
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>directory</code></p>
      </td>
      <td>
        <p>
          The full path to the collections's source directory.
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>output</code></p>
      </td>
      <td>
        <p>
          Whether the collection's documents will be output as individual files.
        </p>
      </td>
    </tr>
  </tbody>
</table>
</div>
-->

### ドキュメント

<!--original

### Documents
-->

ドキュメントの対応するファイルに備えられたYAML front-matterのものに加えて、各ドキュメントは、次の属性を持っています。

<!--original
In addition to any YAML front-matter provided in the document's corresponding file, each document has the following attributes:
-->

<div class="mobile-side-scroller">
<table>
  <thead>
    <tr>
      <th>変数</th>
      <th>解説</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <p><code>content</code></p>
      </td>
      <td>
        <p>
          (出力前の)ドキュメントの内容。YAML front-matterを備えていない場合、ファイルにある内容のすべてがこれに該当する。YAML front-matterが使われている場合は、ファイルにおけるfront-matterの終端を示す`---`以降の内容がこれに該当する。
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>output</code></p>
      </td>
      <td>
        <p>
          <code>content</code>に基づくドキュメントのレンダリング出力。
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>path</code></p>
      </td>
      <td>
        <p>
          ドキュメントのソースファイルのフルパス。
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>relative_path</code></p>
      </td>
      <td>
        <p>
          ドキュメントのソースファイルのパス(サイトソースからの相対パス)。
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>url</code></p>
      </td>
      <td>
        <p>
          出力されたコレクションのURL。ファイルは、サイトの設定ファイルにおける<code>render</code>キーに、それが属するコレクションの名前が含まれているときに限り、出力先に書き出される。
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>collection</code></p>
      </td>
      <td>
        <p>
          ドキュメントのコレクションの名前。
        </p>
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
      <th>Variable</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <p><code>content</code></p>
      </td>
      <td>
        <p>
          The (unrendered) content of the document. If no YAML front-matter is provided,
          this is the entirety of the file contents. If YAML front-matter
          is used, then this is all the contents of the file after the terminating
          `---` of the front-matter.
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>output</code></p>
      </td>
      <td>
        <p>
          The rendered output of the document, based on the <code>content</code>.
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>path</code></p>
      </td>
      <td>
        <p>
          The full path to the document's source file.
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>relative_path</code></p>
      </td>
      <td>
        <p>
          The path to the document's source file relative to the site source.
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>url</code></p>
      </td>
      <td>
        <p>
          The URL of the rendered collection. The file is only written to the
          destination when the name of the collection to which it belongs is
          included in the <code>render</code> key in the site's configuration file.
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>collection</code></p>
      </td>
      <td>
        <p>
          The name of the document's collection.
        </p>
      </td>
    </tr>
  </tbody>
</table>
</div>
-->
