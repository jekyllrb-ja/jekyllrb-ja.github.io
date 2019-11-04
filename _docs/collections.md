---
title: コレクション
permalink: /docs/collections/
---

<!-- ---
title: Collections
permalink: /docs/collections/
--- -->

コレクションは、チームのメンバーや会議でのトークなどの関連コンテンツをグループ化するのに最適な方法です。

<!-- Collections are a great way to group related content like members of a team or
talks at a conference. -->

## セットアップ
<!-- ## Setup -->

コレクションを使用するには、まず`_config.yml`で定義します。例として、staff membersのコレクションを作成します。

<!-- To use a Collection you first need to define it in your `_config.yml`. For
example here's a collection of staff members: -->

```yaml
collections:
  - staff_members
```

この場合、`collections`は、各コレクションに追加のメタデータが定義されていないシーケンス（配列）として定義されます。  
オプションでコレクションのメタデータを指定するには、`collections`をシーケンスではなくマッピング（ハッシュマップ）として定義し、その中に追加のフィールドを定義します。

<!-- In this case `collections` is defined as a sequence (i.e array) with no additional metadata defined for each collection.  
You can optionally specify metadata for your collection by defining `collections` as a mapping (i.e hashmap) instead of sequence, and then defining additional fields in it: -->

```yaml
collections:
  staff_members:
    people: true
```

<div class="note">
  <p>コレクションをシーケンスとして定義する場合、そのページはデフォルトではレンダリングされません。有効にするには、コレクションのマッピング定義で<code>output：true</code>を指定する必要があります。詳細については、<a href="#output">出力</a>セクションを参照してください</p>
  <!-- <p>When defining a collection as a sequence, its pages will not be rendered by default. To enable this, <code>output: true</code> must be specified on the collection, which requires defining the collection as a mapping. For more information, see the section <a href="#output">Output</a></p> -->
</div>

<div class="note">
  <h5>コレクションをまとめる {%- include docs_version_badge.html version="3.7.0" -%}</h5>
  <!-- <h5>Gather your collections {%- include docs_version_badge.html version="3.7.0" -%}</h5> -->

  <p><code>collections_dir: my_collections</code>で全てのコレクションをまとめるディレクトリを指定できます。</p>
  <!-- <p>You can optionally specify a directory to store all your collections in the same place with <code>collections_dir: my_collections</code>.</p> -->

  <p>するとJekyllは、<code>books</code>コレクションを<code>my_collections/_books</code>で、<code>recipes</code>コレクションを<code>my_collections/_recipes</code>で見つけるようになります。</p>
  <!-- <p>Then Jekyll will look in <code>my_collections/_books</code> for the <code>books</code> collection, and
  in <code>my_collections/_recipes</code> for the <code>recipes</code> collection.</p> -->
</div>

<div class="note warning">
  <h5>ドラフトとポストは必ずカスタムコレクションディレクトリに入れてください</h5>
  <!-- <h5>Be sure to move drafts and posts into custom collections directory</h5> -->
  <p><code>collections_dir: my_collections</code>でコレクションをひとまとめにしたなら、<code>_drafts</code>は<code>my_collections/_drafts</code>に、<code>_posts</code>は<code>my_collections/_posts</code>に移動してください。コレクションディレクトリの名前はアンダースコア("_")で始められないことに注意してください。</p>
  <!-- <p>If you specify a directory to store all your collections in the same place with <code>collections_dir: my_collections</code>, then you will need to move your <code>_drafts</code> and <code>_posts</code> directory to <code>my_collections/_drafts</code> and <code>my_collections/_posts</code>. Note that, the name of your collections directory cannot start with an underscore (`_`).</p> -->
</div>

## コンテンツの追加
<!-- ## Add content -->

対応するフォルダ（`<source>/_staff_members`など）を作成して、ドキュメントを追加します。front matterがある場合はfront matterが処理され、front matterより後の全部がドキュメントの`content`とされます。front matterが無い場合は、Jekyllは[静的ファイル]({{ "docs/static-files/" | relative_url }})としてそれ以上コンテンツを処理しません。front matterがある場合は、Jekyllはファイルの内容を処理して期待される出力にします。

<!-- Create a corresponding folder (e.g. `<source>/_staff_members`) and add
documents. Front matter is processed if the front matter exists, and everything
after the front matter is pushed into the document's `content` attribute. If no front
matter is provided, Jekyll will consider it to be a [static file](/docs/static-files/)
and the contents will not undergo further processing. If front matter is provided,
Jekyll will process the file contents into the expected output.-->

front matterが存在するかどうかに関係なく、Jekyllは、コレクションのメタデータに`output: true`が設定されている場合にのみ、宛先ディレクトリ（例えば、`_site`）に書き込みます。

<!-- Regardless of whether front matter exists or not, Jekyll will write to the destination
directory (e.g. `_site`) only if `output: true` has been set in the collection's
metadata. -->

上記で設定したコレクションにstaff memberを追加する方法の例です。ファイル名は`./_staff_members/jane.md`で、内容は以下の通りです。

<!-- For example here's how you would add a staff member to the collection set above.
The filename is `./_staff_members/jane.md` with the following content: -->

```markdown
---
name: Jane Doe
position: Developer
---
Jane has worked on Jekyll for the past *five years*.
```

<em>
内部的にコレクションと見なされていますが、上記は[posts]({{ "/docs/posts/" | relative_url }})には適用されないことに注意してください。有効なファイル名形式の投稿は、front matterが含まれていない場合でも処理対象としてマークされます。
</ em>

<!-- <em>
  Do note that in spite of being considered as a collection internally, the above
  doesn't apply to [posts](/docs/posts/). Posts with a valid filename format will be
  marked for processing even if they do not contain front matter.
</em>  -->

<div class="note info">
  <h5>ディレクトリは正しい名前にしてください</h5>
  <!-- <h5>Be sure to name your directories correctly</h5> -->
  <p>
    フォルダは<code>_config.yml</code>ファイルで定義した名前で、前に<code>_</code>を追加します。
  </p>
  <!-- <p>
The folder must be named identically to the collection you defined in
your <code>_config.yml</code> file, with the addition of the preceding <code>_</code> character.
  </p> -->
</div>

{:#output}
## 出力
<!-- ## Output -->

これで`site.staff_members`をページで繰り返し処理して、各staff memberの内容を出力できます。ポストと同様、ドキュメント本文には`content` 変数を使用してアクセスします。

<!-- Now you can iterate over `site.staff_members` on a page and output the content
for each staff member. Similar to posts, the body of the document is accessed
using the `content` variable: -->

{% raw %}
```liquid
{% for staff_member in site.staff_members %}
  <h2>{{ staff_member.name }} - {{ staff_member.position }}</h2>
  <p>{{ staff_member.content | markdownify }}</p>
{% endfor %}
```
{% endraw %}

コレクションの各ページをJekyllで作成したい場合は、`_config.yml`のコレクションのメタデータで`output`キーを`true`に設定します。

<!-- If you'd like Jekyll to create a rendered page for each document in your
collection, you can set the `output` key to `true` in your collection
metadata in `_config.yml`: -->

```yaml
collections:
  staff_members:
    output: true
```

`url`属性を使用して、ページにリンクを生成できます。

<!-- You can link to the generated page using the `url` attribute: -->

{% raw %}
```liquid
{% for staff_member in site.staff_members %}
  <h2>
    <a href="{{ staff_member.url }}">
      {{ staff_member.name }} - {{ staff_member.position }}
    </a>
  </h2>
  <p>{{ staff_member.content | markdownify }}</p>
{% endfor %}
```
{% endraw %}

## パーマリンク
<!-- ## Permalinks -->

コレクション全体のURLの出力をコントロールするのに役立つ、特別な[コレクションのパーマリンク変数]({{ "docs/permalinks/" | relative_url }})があります。

<!-- There are special [permalink variables for collections](/docs/permalinks/) to
help you control the output url for the entire collection. -->

## ドキュメントのカスタムソート
<!-- ## Custom Sorting of Documents -->

デフォルトでは、コレクション内のドキュメントはパスでソートされます。ですが、コレクションのメタデータでソート順を制御することができます。

<!-- By default, documents in a collection are sorted by their paths. But you can control this sorting via the collection's metadata. -->

### Front Matterキーでソート
<!-- ### Sort By Front Matter Key -->

ドキュメントはfront matterキーでソートすることができます。そのためには、メタデータの`sort_by`にfront matterキーを指定します。tutorialsコレクションを`lesson`キーでソートする例を、次に示します。

<!-- Documents can be sorted based on a front matter key by setting a `sort_by` metadata to the front matter key string. For example,
to sort a collection of tutorials based on key `lesson`, the configuration would be: -->

```yaml
collections:
  tutorials:
    sort_by: lesson
```

ドキュメントはキーの値で昇順に並べられます。front matterキーが設定されていない場合は、そのドキュメントはソートの最後に配置されます。複数のドキュメントにfront matterキーが設定されていない場合は、設定されているドキュメントの後に、設定されていないドキュメントが日付やパスでソートされて配置されます。

<!-- The documents are arranged in the increasing order of the key's value. If a document does not have the front matter key defined
then that document is placed immediately after sorted documents. When multiple documents do not have the front matter key defined,
those documents are sorted by their dates or paths and then placed immediately after the sorted documents. -->

### ドキュメントの手動並び替え
<!-- ### Manually Ordering Documents -->

`order`メタデータに**ファイル名のリスト**を並べたい順に設定することで、好きな順序で配置できます。tutorialsコレクションの設定の例を、次に示します。

<!-- You can also manually order the documents by setting an `order` metadata with **the filenames listed** in the desired order.
For example, a collection of tutorials would be configured as: -->

```yaml
collections:
  tutorials:
    order:
      - hello-world.md
      - introduction.md
      - basic-concepts.md
      - advanced-concepts.md
```

リストにないファイル名のドキュメントは、指定されたものの後に配置されます。
サブカテゴリのドキュメントも、次のようにして含めることができます。

<!-- Any documents with filenames that do not match the list entry simply gets placed after the rearranged documents. If a document is
nested under subdirectories, include them in entries as well: -->

```yaml
collections:
  tutorials:
    order:
      - hello-world.md
      - introduction.md
      - concepts/basics.md
      - concepts/advanced.md
```

どちらのメタデータキーも設定されている場合、`order`のリストが優先されます。

<!-- If both metadata keys have been defined properly, `order` list takes precedence. -->

## Liquid属性
<!-- ## Liquid Attributes -->

### コレクション
<!-- ### Collections -->

コレクションは、`site.collections`下に`_config.yml`で指定したメタデータを付加することで使用できます。情報を以下に示します。

<!-- Collections are also available under `site.collections`, with the metadata
you specified in your `_config.yml` (if present) and the following information: -->

<div class="mobile-side-scroller">
<table>
  <thead>
    <tr>
      <th>変数</th>
      <th>説明</th>
      <!-- <th>Variable</th>
      <th>Description</th> -->
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <p><code>label</code></p>
      </td>
      <td>
        <p>
          コレクションの名前。<code>my_collection</code>など。
        </p>
        <!-- <p>
          The name of your collection, e.g. <code>my_collection</code>.
        </p> -->
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
        <!-- <p>
          An array of <a href="#documents">documents</a>.
        </p> -->
      </td>
    </tr>
    <tr>
      <td>
        <p><code>files</code></p>
      </td>
      <td>
        <p>
          コレクションの静的ファイルの配列。
        </p>
        <!-- <p>
          An array of static files in the collection.
        </p> -->
      </td>
    </tr>
    <tr>
      <td>
        <p><code>relative_directory</code></p>
      </td>
      <td>
        <p>
          コレクションのディレクトリへの、サイトからの相対パス。
        </p>
        <!-- <p>
          The path to the collection's source directory, relative to the site
          source.
        </p> -->
      </td>
    </tr>
    <tr>
      <td>
        <p><code>directory</code></p>
      </td>
      <td>
        <p>
          コレクションのディレクトリへのフルパス。
        </p>
        <!-- <p>
          The full path to the collections's source directory.
        </p> -->
      </td>
    </tr>
    <tr>
      <td>
        <p><code>output</code></p>
      </td>
      <td>
        <p>
          コレクションのドキュメントを個別のファイルとして出力するかどうか。
        </p>
        <!-- <p>
          Whether the collection's documents will be output as individual
          files.
        </p> -->
      </td>
    </tr>
  </tbody>
</table>
</div>

<div class="note info">
  <h5>強制コレクション</h5>
  <!-- <h5>A Hard-Coded Collection</h5> -->
  <p>あなたが作成したコレクションに加え、Jekyllは<code>posts</code>コレクションを強制的に保持しています。<code>_posts</code>ディレクトリがあるかどうかは、関係ありません。<code>site.collections</code>の反復処理を行う場合は注意してください。フィルタで除外する必要があるかもしれません。</p>
  <!-- <p>In addition to any collections you create yourself, the
  <code>posts</code> collection is hard-coded into Jekyll. It exists whether
  you have a <code>_posts</code> directory or not. This is something to note
  when iterating through <code>site.collections</code> as you may need to
  filter it out.</p> -->
  <p>コレクションを見つけるには、フィルタを使用するのがよいでしょう。
  <code>{% raw %}{{ site.collections | where: "label", "myCollection" | first }}{% endraw %}</code></p>
  <!-- <p>You may wish to use filters to find your collection:
  <code>{% raw %}{{ site.collections | where: "label", "myCollection" | first }}{% endraw %}</code></p> -->
</div>

<div class="note info">
  <h5>コレクションと日時</h5>
  <!-- <h5>Collections and Time</h5> -->
  <p><code>posts</code>コレクションのドキュメントを除き、作成した全てのコレクションのドキュメントは、割り当てられた日付の有無に関係なくLiquidでアクセス可能ですので、レンダリング可能です。
  </p>
  <!-- <p>Except for documents in hard-coded default collection <code>posts</code>, all documents in collections
    you create, are accessible via Liquid irrespective of their assigned date, if any, and therefore renderable.
  </p> -->
  <p>関連するコレクションのメタデータで<code>output: true</code>が指定されている場合のみ、ドキュメントがディスクに書き込まれます。加えて、未来の日付のドキュメントは<code>site.future</code><em>がtrue</em>の場合だけです。
  </p>
  <!-- <p>Documents are attempted to be written to disk only if the concerned collection
    metadata has <code>output: true</code>. Additionally, future-dated documents are only written if
    <code>site.future</code> <em>is also true</em>.
  </p> -->
  <p>ドキュメントをディスクに書き込むかの更に細かい設定は、front matterで    <code>published: false</code> (デフォルトは<em><code>true</code></em>)を設定することで可能です。
  </p>
  <!-- <p>More fine-grained control over documents being written to disk can be exercised by setting
    <code>published: false</code> (<em><code>true</code> by default</em>) in the document's front matter.
  </p> -->
</div>


### ドキュメント<span id="documents"></span>
<!-- ### Documents -->

各ドキュメントのfront matterで記載されたものに加えて、次の属性を持っています。

<!-- In addition to any front matter provided in the document's corresponding
file, each document has the following attributes: -->

<div class="mobile-side-scroller">
<table>
  <thead>
    <tr>
    <th>変数</th>
    <th>説明</th>
    <!-- <th>Variable</th>
    <th>Description</th> -->
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <p><code>content</code></p>
      </td>
      <td>
        <p>
          ドキュメントの（レンダリングされていない）コンテンツ。front matterが無い場合、Jekyllはコレクション内のファイルを生成しません。front matterがある場合は、front matter終了の`---`以降の全てです。
        </p>
        <!-- <p>
          The (unrendered) content of the document. If no front matter is
          provided, Jekyll will not generate the file in your collection. If
          front matter is used, then this is all the contents of the file
          after the terminating
          `---` of the front matter.
        </p> -->
      </td>
    </tr>
    <tr>
      <td>
        <p><code>output</code></p>
      </td>
      <td>
        <p>
          <code>content</code>の出力。
        </p>
        <!-- <p>
          The rendered output of the document, based on the
          <code>content</code>.
        </p> -->
      </td>
    </tr>
    <tr>
      <td>
        <p><code>path</code></p>
      </td>
      <td>
        <p>
          ドキュメントのソースファイルへのフルパス。
        </p>
        <!-- <p>
          The full path to the document's source file.
        </p> -->
      </td>
    </tr>
    <tr>
      <td>
        <p><code>relative_path</code></p>
      </td>
      <td>
        <p>
          サイトからのドキュメントのソースへの相対パス。
        </p>
        <!-- <p>
          The path to the document's source file relative to the site source.
        </p> -->
      </td>
    </tr>
    <tr>
      <td>
        <p><code>url</code></p>
      </td>
      <td>
        <p>
          出力されたコレクションのURL。サイトの設定で<code>output: true</code>が指定されている場合のみファイルが出力されます。
          </p>
          <!-- <p>
            The URL of the rendered collection. The file is only written to the destination when the collection to which it belongs has <code>output: true</code> in the site's configuration.
            </p> -->
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
        <!-- <p>
          The name of the document's collection.
        </p> -->
      </td>
    </tr>
    <tr>
      <td>
        <p><code>date</code></p>
      </td>
      <td>
        <p>
          ドキュメントのコレクションの日付
        </p>
        <!-- <p>
          The date of the document's collection.
        </p> -->
      </td>
    </tr>
  </tbody>
</table>
</div>
