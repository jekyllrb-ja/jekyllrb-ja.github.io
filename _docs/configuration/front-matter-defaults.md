---
title: Front Matterのデフォルト
permalink: "/docs/configuration/front-matter-defaults/"
---
<!-- ---
title: Front Matter Defaults
permalink: "/docs/configuration/front-matter-defaults/"
--- -->

[front matter]({{ "/docs/front-matter/" | relative_url }})の使用は、サイトのページやポストに特別な設定行う方法の一つです。デフォルトのレイアウトやタイトルのカスタマイズ、ポストの正確な日時の指定のような設定は、ページやポストのfront matterで追加することができます。

<!-- Using [front matter](/docs/front-matter/) is one way that you can specify configuration in the pages and posts for your site. Setting things like a default layout, or customizing the title, or specifying a more precise date/time for the post can all be added to your page or post front matter. -->

度々、多くのオプション設定を繰り返す場合が出てくるでしょう。各ファイルへの同じレイアウトの指定、ポストへの同じカテゴリの指定等です。著者名といったカスタム変数の追加も、ブログの多数のポストで同じです。

<!-- Often times, you will find that you are repeating a lot of configuration options. Setting the same layout in each file, adding the same category - or categories - to a post, etc. You can even add custom variables like author names, which might be the same for the majority of posts on your blog. -->

新しいポストやページを作成する度に設定を繰り返す代わりに、Jekyllはサイト設定でこれらのデフォルトを設定する方法を提供しています。これを行うには、プロジェクトのrootディレクトリの`_config.yml`に`defaults`キーを使用してサイト全体のデフォルトを設定します。

<!-- Instead of repeating this configuration each time you create a new post or page, Jekyll provides a way to set these defaults in the site configuration. To do this, you can specify site-wide defaults using the `defaults` key in the `_config.yml` file in your project's root directory. -->

`defaults`キーはデフォルトを定義する特定のpathとscopeとvalueのペアの配列で指定します。オプションでパスのファイルの種類を指定することもできます。

<!-- The `defaults` key holds an array of scope/values pairs that define what defaults should be set for a particular file path, and optionally, a file type in that path. -->

サイトの全てのページとポストのデフォルトレイアウトを追加したい場合です。以下を`_config.yml`ファイルに追加します。

<!-- Let's say that you want to add a default layout to all pages and posts in your site. You would add this to your `_config.yml` file: -->

```yaml
defaults:
  -
    scope:
      path: "" # an empty string here means all files in the project
    values:
      layout: "default"
```

<div class="note info">
  <!-- <h5>Stop and rerun `jekyll serve` command.</h5> -->
  <h5>一度止めて`jekyll serve`コマンドを再実行します</h5>
  <p>
    グローバル設定と変数定義が含まれているマスター設定ファイルの<code>_config.yml</code>は、実行時に一度だけ読み込まれます。自動再生成をしている時に<code>_config.yml</code>に変更を加えても、次の実行まで読み込まれません。
  </p>
  <!-- <p>
    The <code>_config.yml</code> master configuration file contains global configurations
    and variable definitions that are read once at execution time. Changes made to <code>_config.yml</code>
    during automatic regeneration are not loaded until the next execution.
  </p> -->
  <p>
    <a href="{{ '/docs/datafiles' | relative_url }}">Dataファイル</a>は自動再生成時も再読込されます。
  </p>
  <!-- <p>
    Note <a href="{{ '/docs/datafiles' | relative_url }}">Data Files</a> are included and reloaded during automatic regeneration.
  </p> -->
</div>

ここでは、`scope`パスの中に存在するファイルに`values`に当てはめています。pathに空の文字列が指定されているので、プロジェクトの**全ファイル**に適用されます。例えばcssファイルのように、全てのファイルにはレイアウトを設定したくないでしょう。`scope`キーに`type`を指定することができます。

<!-- Here, we are scoping the `values` to any file that exists in the path `scope`. Since the path is set as an empty string, it will apply to **all files** in your project. You probably don't want to set a layout on every file in your project - like css files, for example - so you can also specify a `type` value under the `scope` key. -->

```yaml
defaults:
  -
    scope:
      path: "" # an empty string here means all files in the project
      type: "posts" # previously `post` in Jekyll 2.2.
    values:
      layout: "default"
```

これで、`posts`タイプのファイルにのみレイアウトが設定されます。`pages`や`posts`、`drafts`、サイトのコレクションをtypeで使用することができます。`type`はオプションですが、`scope/values`ペアを指定するときは`path`を指定する必要があります。

<!-- Now, this will only set the layout for files where the type is `posts`.
The different types that are available to you are `pages`, `posts`, `drafts` or any collection in your site. While `type` is optional, you must specify a value for `path` when creating a `scope/values` pair. -->

前述のように、`defaults`には複数のscope/valuesペアを指定することができます。

<!-- As mentioned earlier, you can set multiple scope/values pairs for `defaults`. -->

```yaml
defaults:
  -
    scope:
      path: ""
      type: "pages"
    values:
      layout: "my-site"
  -
    scope:
      path: "projects"
      type: "pages" # previously `page` in Jekyll 2.2.
    values:
      layout: "project" # overrides previous default layout
      author: "Mr. Hyde"
```

このdefaultsで、全てのページは`my-site`レイアウトを使用します。`projects/`フォルダのhtmlファイルは`project`レイアウトを使用し、`page.author` [liquid変数]({{ "/docs/variables/" | relative_url }})に`Mr. Hyde`を指定します。

<!-- With these defaults, all pages would use the `my-site` layout. Any html files that exist in the `projects/`
folder will use the `project` layout, if it exists. Those files will also have the `page.author`
[liquid variable]({{ '/docs/variables/' | relative_url }}) set to `Mr. Hyde`. -->

```yaml
collections:
  my_collection:
    output: true

defaults:
  -
    scope:
      path: ""
      type: "my_collection" # a collection in your site, in plural form
    values:
      layout: "default"
```

この例では、`my_collection`という[コレクション]({{ '/docs/collections/' | relative_url }})に`layout`は`default`だと設定します。

<!-- In this example, the `layout` is set to `default` inside the
[collection]({{ '/docs/collections/' | relative_url }}) with the name `my_collection`. -->

### Front MatterデフォルトでのGlobパターン
<!-- ### Glob patterns in Front Matter defaults -->

デフォルトをマッチさせるために、Globpパターンを使用することもできます（現在は、`*`を含むパター限定です）。例えば、`section`フォルダのサブフォルダにある各`special-page.html`に特定のレイアウトを設定することができます。{%- include docs_version_badge.html version="3.7.0" -%}

<!-- It is also possible to use glob patterns (currently limited to patterns that contain `*`) when matching defaults. For example, it is possible to set specific layout for each `special-page.html` in any subfolder of `section` folder. {%- include docs_version_badge.html version="3.7.0" -%} -->

```yaml
collections:
  my_collection:
    output: true

defaults:
  -
    scope:
      path: "section/*/special-page.html"
    values:
      layout: "specific-layout"
```

<div class="note warning">
  <h5>Globとパフォーマンス</h5>
  <!-- <h5>Globbing and Performance</h5> -->
  <p>
    パスをGlobで指定するとパフォーマンスへの悪影響があることが知られており、特にWindowsでは最適化されていません。パスをGlobで指定すると、コレクションディレクトリの大きさに応じて構築時間が長くなります。
  </p>
  <!-- <p>
    Please note that globbing a path is known to have a negative effect on
    performance and is currently not optimized, especially on Windows.
    Globbing a path will increase your build times in proportion to the size
    of the associated collection directory.
  </p> -->
</div>

### 優先順位
<!-- ### Precedence -->

Jekyllは`_config.yml`の`defaults`セクションで指定された設定を全て適用します。他の特定のパスへのscope/valuesペアを設定することで、上書きすることができます。

<!-- Jekyll will apply all of the configuration settings you specify in the `defaults` section of your `_config.yml` file. You can choose to override settings from other scope/values pair by specifying a more specific path for the scope. -->

上に戻って下から3つ目の例を見てください。まず、`my-site`へのデフォルトページレイアウトを設定しています。そして、`project`用の`projects/`パスのページへのデフォルトを設定しています。ページやポストのfront matterに設定する任意の値で実行可能です。

<!-- You can see that in the second to last example above. First, we set the default page layout to `my-site`. Then, using a more specific path, we set the default layout for pages in the `projects/` path to `project`. This can be done with any value that you would set in the page or post front matter. -->

最後に、`_config.yml`ファイルに`defaults`セクションを追加してサイト設定のデフォルトを設定した場合、それらの設定はページやポストで上書きできます。ページやポストのfront matterで設定を行うだけです。例えば、

<!-- Finally, if you set defaults in the site configuration by adding a `defaults` section to your `_config.yml` file, you can override those settings in a post or page file. All you need to do is specify the settings in the post or page front matter. For example: -->

```yaml
# In _config.yml
...
defaults:
  -
    scope:
      path: "projects"
      type: "pages"
    values:
      layout: "project"
      author: "Mr. Hyde"
      category: "project"
...
```

```yaml
# In projects/foo_project.md
---
author: "John Smith"
layout: "foobar"
---
The post text goes here...
```

`projects/foo_project.md`は、`layout`には`project`の代わりに`foobar`が、`author`には`Mr. Hyde`の代わりに`John Smith`がサイト構築時に設定されます。

<!-- The `projects/foo_project.md` would have the `layout` set to `foobar` instead
of `project` and the `author` set to `John Smith` instead of `Mr. Hyde` when
the site is built. -->
