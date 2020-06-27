---
title: Hooks（フック）
permalink: /docs/plugins/hooks/
---
<!-- ---
title: Hooks
permalink: /docs/plugins/hooks/
--- -->

Hookを使用すると、プラグインはビルドプロセスのさまざまな側面をきめ細かく制御できます。プラグインが何らかのHookを定義している場合、Jekyllはそれらを事前定義された時点で呼び出します。

<!-- Using hooks, your plugin can exercise fine-grained control over various aspects
of the build process. If your plugin defines any hooks, Jekyll will call them
at pre-defined points. -->

Hookはコンテナとイベント名に登録されます。登録するには、Jekyll::Hooks.registerを呼び出し、フックがトリガーされるたびに呼び出すコンテナ、イベント名、およびコードを渡します。たとえば、Jekyllが投稿をレンダリングするたびにカスタム機能を実行したい場合は、次のようにフックを登録します。

<!-- Hooks are registered to a container and an event name. To register one, you
call Jekyll::Hooks.register, and pass the container, event name, and code to
call whenever the hook is triggered. For example, if you want to execute some
custom functionality every time Jekyll renders a post, you could register a
hook like this: -->

```ruby
Jekyll::Hooks.register :posts, :post_render do |post|
  # code to call after Jekyll renders a post
end
```

Jekyllは`:site`、`:pages`、`:posts`、`:documents`にHookを提供します。すべての場合において、Jekyllは最初のコールバックパラメータとしてのコンテナオブジェクトを使用してHookを呼び出します。 全ての`:pre_render` Hookと`:site, :post_render` Hookもペイロードハッシュを2番目のパラメータとして提供します。`:pre_render`の場合、ペイロードはレンダリング中に利用可能な変数を完全に制御します。`:site, :post_render`の場合、ペイロードにはすべてのサイトをレンダリングした後の最終値が含まれます（サイトマップ、フィードなどに役立ちます）。

<!-- Jekyll provides hooks for <code>:site</code>, <code>:pages</code>,
<code>:posts</code>, and <code>:documents</code>. In all cases, Jekyll calls
your hooks with the container object as the first callback parameter.
All `:pre_render` hooks and the`:site, :post_render` hook will also provide a
payload hash as a second parameter. In the case of `:pre_render`, the payload
gives you full control over the variables that are available while rendering.
In the case of `:site, :post_render`, the payload contains final values after
rendering all the site (useful for sitemaps, feeds, etc). -->

以下に利用可能なHookの完全なリストを示します。

<!-- The complete list of available hooks is below: -->

<div class="mobile-side-scroller">
<table>
  <thead>
    <tr>
      <th>コンテナ</th>
      <th>イベント</th>
      <th>読み込み</th>
    </tr>
    <!-- <tr>
      <th>Container</th>
      <th>Event</th>
      <th>Called</th>
    </tr> -->
  </thead>
  <tbody>
    <tr>
      <td>
        <p><code>:site</code></p>
      </td>
      <td>
        <p><code>:after_init</code></p>
      </td>
      <td>
        <p>サイト初期化直後でセットアップやレンダリングの前。サイトの構成の修正によい。</p>
        <!-- <p>Just after the site initializes, but before setup & render. Good
        for modifying the configuration of the site.</p> -->
      </td>
    </tr>
    <tr>
      <td>
        <p><code>:site</code></p>
      </td>
      <td>
        <p><code>:after_reset</code></p>
      </td>
      <td>
        <p>サイトのリセット直後</p>
        <!-- <p>Just after site reset</p> -->
      </td>
    </tr>
    <tr>
      <td>
        <p><code>:site</code></p>
      </td>
      <td>
        <p><code>:post_read</code></p>
      </td>
      <td>
        <p>サイトのデータがディスクに読み書きされた後</p>
        <!-- <p>After site data has been read and loaded from disk</p> -->
      </td>
    </tr>
    <tr>
      <td>
        <p><code>:site</code></p>
      </td>
      <td>
        <p><code>:pre_render</code></p>
      </td>
      <td>
        <p>サイトのレンダリング直前</p>
        <!-- <p>Just before rendering the whole site</p> -->
      </td>
    </tr>
    <tr>
      <td>
        <p><code>:site</code></p>
      </td>
      <td>
        <p><code>:post_render</code></p>
      </td>
      <td>
        <p>サイトレンダリング後、ファイルを書き込む前</p>
        <!-- <p>After rendering the whole site, but before writing any files</p> -->
      </td>
    </tr>
    <tr>
      <td>
        <p><code>:site</code></p>
      </td>
      <td>
        <p><code>:post_write</code></p>
      </td>
      <td>
        <p>サイトをディスクに書き込んだ後</p>
        <!-- <p>After writing the whole site to disk</p> -->
      </td>
    </tr>
    <tr>
      <td>
        <p><code>:pages</code></p>
      </td>
      <td>
        <p><code>:post_init</code></p>
      </td>
      <td>
        <p>ページが初期化される度</p>
        <!-- <p>Whenever a page is initialized</p> -->
      </td>
    </tr>
    <tr>
      <td>
        <p><code>:pages</code></p>
      </td>
      <td>
        <p><code>:pre_render</code></p>
      </td>
      <td>
        <p>ページがレンダリングされる直前</p>
        <!-- <p>Just before rendering a page</p> -->
      </td>
    </tr>
    <tr>
      <td>
        <p><code>:pages</code></p>
      </td>
      <td>
        <p><code>:post_render</code></p>
      </td>
      <td>
        <p>ページレンダリング後、ディスクへの書き込み前</p>
        <!-- <p>After rendering a page, but before writing it to disk</p> -->
      </td>
    </tr>
    <tr>
      <td>
        <p><code>:pages</code></p>
      </td>
      <td>
        <p><code>:post_write</code></p>
      </td>
      <td>
        <p>ページをディスクに書き込んだ後</p>
        <!-- <p>After writing a page to disk</p> -->
      </td>
    </tr>
    <tr>
      <td>
        <p><code>:posts</code></p>
      </td>
      <td>
        <p><code>:post_init</code></p>
      </td>
      <td>
        <p>ポストが初期化される度</p>
        <!-- <p>Whenever a post is initialized</p> -->
      </td>
    </tr>
    <tr>
      <td>
        <p><code>:posts</code></p>
      </td>
      <td>
        <p><code>:pre_render</code></p>
      </td>
      <td>
        <p>ポストのレンダリング直前</p>
        <!-- <p>Just before rendering a post</p> -->
      </td>
    </tr>
    <tr>
      <td>
        <p><code>:posts</code></p>
      </td>
      <td>
        <p><code>:post_render</code></p>
      </td>
      <td>
        <p>ポストレンダリング後、ディスクに書き込む前</p>
        <!-- <p>After rendering a post, but before writing it to disk</p> -->
      </td>
    </tr>
    <tr>
      <td>
        <p><code>:posts</code></p>
      </td>
      <td>
        <p><code>:post_write</code></p>
      </td>
      <td>
        <p>ポストをディスクに書き込んだ後</p>
        <!-- <p>After writing a post to disk</p> -->
      </td>
    </tr>
    <tr>
      <td>
        <p><code>:documents</code></p>
      </td>
      <td>
        <p><code>:post_init</code></p>
      </td>
      <td>
        <p>ドキュメントが初期化される度</p>
        <!-- <p>Whenever a document is initialized</p> -->
      </td>
    </tr>
    <tr>
      <td>
        <p><code>:documents</code></p>
      </td>
      <td>
        <p><code>:pre_render</code></p>
      </td>
      <td>
        <p>ドキュメントのレンダリング直前</p>
        <!-- <p>Just before rendering a document</p> -->
      </td>
    </tr>
    <tr>
      <td>
        <p><code>:documents</code></p>
      </td>
      <td>
        <p><code>:post_render</code></p>
      </td>
      <td>
        <p>ドキュメントのレンダリング後、ディスクに書き込む前</p>
        <!-- <p>After rendering a document, but before writing it to disk</p> -->
      </td>
    </tr>
    <tr>
      <td>
        <p><code>:documents</code></p>
      </td>
      <td>
        <p><code>:post_write</code></p>
      </td>
      <td>
        <p>ドキュメントをディスクに書き込んだ後</p>
        <!-- <p>After writing a document to disk</p> -->
      </td>
    </tr>
    <tr>
      <td>
        <p><code>:clean</code></p>
      </td>
      <td>
        <p><code>:on_obsolete</code></p>
      </td>
      <td>
        <p>構築前のサイトの出力先のクリーンアップ中</p>
      </td>
    </tr>
  </tbody>
</table>
</div>
