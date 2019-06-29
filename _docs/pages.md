---
title: Pages（ページ）
permalink: /docs/pages/
---

<!-- ---
title: Pages
permalink: /docs/pages/
--- -->

ページはコンテンツの最も基礎となる要素です。（日付に基づかず、スタッフメンバーやレシピのようなグループでも無い）独立したコンテンツに便利です。

<!-- Pages are the most basic building block for content. They're useful for standalone
content (content which is not date based or is not a group of content such as staff
members or recipes). -->

ページを追加する最もシンプルな方法は、rootディレクトリに適した名前のHTMLファイルを追加することです。ページを拡張子を`.md`にしてMarkdownで書くこともできます。ビルド時にHTMLに変換されます。  
サイトのホームページ、aboutページ、コンタクトページ、これらをrootディレクトリに配置する例とURLにどのように関連づけられるかを示します。

<!-- The simplest way of adding a page is to add an HTML file in the root
directory with a suitable filename. You can also write a page in Markdown using
a `.md` extension which converts to HTML on build. For a site with
a homepage, an about page, and a contact page, here’s what the root directory
and associated URLs might look like: -->

```sh
.
|-- about.md    # => http://example.com/about.html
|-- index.html    # => http://example.com/
└── contact.html  # => http://example.com/contact.html
```

多くのページがあるのでしたら、サブフォルダに配置することもできます。ページに使用したサブフォルダは、ビルドしたときも`_site`フォルダの中に同じサブフォルダとして配置されます。

<!-- If you have a lot of pages, you can organize them into subfolders. The same subfolders that are used to group your pages in our project's source will exist in the `_site` folder when your site builds. -->

## 出力するURLを変更する
<!-- ## Changing the output URL -->

ビルド後のソースファイルでは、特定のフォルダ構成にしたい場合もあるでしょう。[permalinks]({{ "/docs/permalinks" | relative_url }})を使用することで、出力するURLをコントロールできます。

<!-- You might want to have a particular folder structure for your source files that changes for the built site. With [permalinks](/docs/permalinks) you have full control of the output URL. -->
