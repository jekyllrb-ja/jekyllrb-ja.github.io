---
title: 静的ファイル
permalink: /docs/static-files/
---
<!-- ---
title: Static Files
permalink: /docs/static-files/
--- -->

静的ファイルはfront matterの無いファイルです。画像やPDFなどレンダリングしないファイルも含みます。

<!-- A static file is a file that does not contain any front matter. These
include images, PDFs, and other un-rendered content. -->

`site.static_files`でLiquidからアクセスでき、以下のメタデータを含んでいます。

<!-- They're accessible in Liquid via `site.static_files` and contain the
following metadata: -->

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
      <td><p><code>file.path</code></p></td>
      <td><p>

        ファイルの相対パス。<code>/assets/img/image.jpg</code>など。
        <!-- The relative path to the file, e.g. <code>/assets/img/image.jpg</code> -->

      </p></td>
    </tr>
    <tr>
      <td><p><code>file.modified_time</code></p></td>
      <td><p>

        ファイルが最後に修正された`Time`。<code>2016-04-01 16:35:26 +0200</code>など。
        <!-- The `Time` the file was last modified, e.g. <code>2016-04-01 16:35:26 +0200</code> -->

      </p></td>
    </tr>
    <tr>
      <td><p><code>file.name</code></p></td>
      <td><p>

        ファイル名の文字列。 例：ファイルが<code>image.jpg</code>だと<code>image.jpg</code>。
        <!-- The string name of the file e.g. <code>image.jpg</code> for <code>image.jpg</code> -->

      </p></td>
    </tr>
    <tr>
      <td><p><code>file.basename</code></p></td>
      <td><p>

        ファイルのベースネーム。例：ファイルが<code>image.jpg</code>だと<code>image</code>。
        <!-- The string basename of the file e.g. <code>image</code> for <code>image.jpg</code> -->

      </p></td>
    </tr>
    <tr>
      <td><p><code>file.extname</code></p></td>
      <td><p>

        ファイルの拡張子。例：ファイルが<code>image.jpg</code>だと<code>.jpg</code>
        <!-- The extension name for the file, e.g.
        <code>.jpg</code> for <code>image.jpg</code> -->

      </p></td>
    </tr>
  </tbody>
</table>
</div>

上記の表で、`file`は何にでもなることに注意してください。（ループのような）処理で変数として使用するものです。グローバルなサイトやページの変数ではありません。

<!-- Note that in the above table, `file` can be anything. It's an arbitrarily set variable used in your own logic (such as in a for loop). It isn't a global site or page variable. -->

## 静的ファイルへのfront matterの追加
<!-- ## Add front matter to static files -->

静的ファイルに直接front matterを追加することはできませんが、設定ファイルの[デフォルトプロパティ]({{ "docs/configuration/front-matter-defaults/" | relative_url }})を通じてfront matterニア隊をセットできます。Jekyllが構築するときにセットしたfront matterを使用できます。

<!-- Although you can't directly add front matter values to static files, you can set front matter values through the [defaults property](/docs/configuration/front-matter-defaults/) in your configuration file. When Jekyll builds the site, it will use the front matter values you set. -->

例えば：
<!-- Here's an example: -->

`_config.yml`に`defaults`として以下の値を追加します。

<!-- In your `_config.yml` file, add the following values to the `defaults` property: -->

```yaml
defaults:
  - scope:
      path: "assets/img"
    values:
      image: true
```

Jekyllサイトの画像（静的ファイル）が全て`assets/img`にあると仮定します。すると、Jekyllがサイトを構築するとき、全ての画像ファイルにfront matterで`image: true`とされているかのように扱います。

<!-- This assumes that your Jekyll site has a folder path of `assets/img` where  you have images (static files) stored. When Jekyll builds the site, it will treat each image as if it had the front matter value of `image: true`. -->

`assets/img`にある画像ファイルのリストを作りたいとします。`static_files`を見るループ処理で、このfront matterを持つファイルを取得します。

<!-- Suppose you want to list all your image assets as contained in `assets/img`. You could use this for loop to look in the `static_files` object and get all static files that have this front matter property: -->

{% raw %}
```liquid
{% assign image_files = site.static_files | where: "image", true %}
{% for myimage in image_files %}
  {{ myimage.path }}
{% endfor %}
```
{% endraw %}

サイトを構築すると、このfront matterを持つファイルのパスのリストが出力されます。

<!-- When you build your site, the output will list the path to each file that meets this front matter condition. -->
