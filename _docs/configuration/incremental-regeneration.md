---
title: デフォルト設定
permalink: "/docs/configuration/incremental-regeneration/"
---
<!-- ---
title: Default Configuration
permalink: "/docs/configuration/incremental-regeneration/"
--- -->

## 増分の再生成
<!-- ## Incremental Regeneration -->
<div class="note warning">
  <h5>増分の再生成はまだ実験的な機能です</h5>
  <!-- <h5>Incremental regeneration is still an experimental feature</h5> -->
  <p>
    増分の再生成は多くの一般的な状況で働きますが、全てのシナリオで働くわけではありません。この機能を使用するときは細心の注意を払ってください。また、以下にない問題は<a href="https://github.com/jekyll/jekyll/issues/new" target="_blank">GitHubのissueを開いて</a>報告してください。
  </p>
  <!-- <p>
    While incremental regeneration will work for the most common cases, it will
    not work correctly in every scenario. Please be extremely cautious when
    using the feature, and report any problems not listed below by
    <a href="https://github.com/jekyll/jekyll/issues/new">opening an issue on GitHub</a>.
  </p> -->
</div>

増分の再生成は、以前の構築から更新されたドキュメントやページだけを生成することで、構築時間を短くします。これは、ファイルの更新時刻と`.jekyll-metadata`ファイル内の内部ファイルの依存関係両方の追跡を行うことで実行されます。

<!-- Incremental regeneration helps shorten build times by only generating documents
and pages that were updated since the previous build. It does this by keeping
track of both file modification times and inter-document dependencies in the
`.jekyll-metadata` file. -->

現在の実装では、ドキュメントかページ、またはその依存関係にあるもののいずれかが変更された場合にのみ増分の再生成を行います。現在は（{% raw %}`{% include %}`{% endraw %}タグを使用した）インクルードとレイアウトの依存関係のみ追跡しています。これは、他のドキュメントへの単純な参照（たとえば、投稿リストページで`site.posts`を反復処理する一般的なケース）は依存関係として検出されないことを意味します。

<!-- Under the current implementation, incremental regeneration will only generate a
document or page if either it, or one of its dependencies, is modified. Currently,
the only types of dependencies tracked are includes (using the
{% raw %}`{% include %}`{% endraw %} tag) and layouts. This means that plain
references to other documents (for example, the common case of iterating over
`site.posts` in a post listings page) will not be detected as a dependency. -->

この欠点を解決するために、ドキュメントのfront matterに`regenerate: true`を設定すると、変更されているかどうかにかかわらず、Jekyllは強制的に再生成します。これは指定されたドキュメントだけを生成することに注意してください。他のドキュメントのコンテンツへの参照は再レンダリングされないため機能しません。

<!-- To remedy some of these shortfalls, putting `regenerate: true` in the front-matter
of a document will force Jekyll to regenerate it regardless of whether it has been
modified. Note that this will generate the specified document only; references
to other documents' contents will not work since they won't be re-rendered. -->

増分の再生成は、コマンドラインで`--incremental`フラッグ（省略形は`-I`）を使用、もしくは設定ファイルで`incremental: true`を指定することで有効にできます。

<!-- Incremental regeneration can be enabled via the `--incremental` flag (`-I` for
short) from the command-line or by setting `incremental: true` in your
configuration file. -->
