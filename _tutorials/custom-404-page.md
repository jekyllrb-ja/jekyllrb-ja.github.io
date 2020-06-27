---
title: カスタム404ページ
author: ashmaroli
date: 2017-03-11 17:23:24 +0530
---
<!-- ---
title: Custom 404 Page
author: ashmaroli
date: 2017-03-11 17:23:24 +0530
--- -->

壊れたリンクへアクセスしたときに表示されるデフォルトの**Error 404 -- File Not Found**ページを、Jekyllで簡単にカスタム404エラーページに置き換えることができます。

<!-- You can easily serve custom 404 error pages with Jekyll to replace the default **Error 404 -- File Not Found** page displayed when one tries to access a broken link on your site. -->

## GitHub Pagesの場合
<!-- ## On GitHub Pages -->

**`_site`ディレクトリのroot**に`404.html`がGitHub PagesとローカルWEBrick開発サーバーにより自動で提供されます。

<!-- Any `404.html` at the **root of your `_site` directory** will be served automatically by GitHub Pages and the local WEBrick development server. -->

簡単には、`404.md`か`404.html`をサイトのソースディレクトリのrootに追加し、テーマの基本レイアウトを使用するようfront matterを記載します。

<!-- Simply add a `404.md` or `404.html` at the root of your site's source directory and include front matter data to use the theme's base layout. -->

エラーページ用のファイルを細部ディレクトリに入れる場合は、以下のようにfront matterに`permalink: /404.html`を記載します。これで、コンパイル後の`404.html`はサイトのrootディレクトリに存在することになり、サーバーに認識されます。

<!-- If you plan to organize your files under subdirectories, the error page should have the following Front Matter Data, set: `permalink: /404.html`. This is to ensure that the compiled `404.html` resides at the root of your processed site, where it'll be picked by the server. -->

```markdown
---
# example 404.md

layout: default
permalink: /404.html
---

# 404

Page not found! :(
```

## Apache Webサーバーによるホスティングの場合
<!-- ## Hosting on Apache Web Servers -->

Apache Webサーバーはその機能に変化を加えるために、[`.htaccess`](http://www.htaccess-guide.com/){:target="_blank"}という設定ファイルを読み込みます。

<!-- Apache Web Servers load a configuration file named [`.htaccess`](http://www.htaccess-guide.com/) that modifies the functionality of these servers. -->

簡単には、以下の内容を`.htaccess`に追加します。

<!-- Simply add the following to your `.htaccess` file. -->

```apache
ErrorDocument 404 /404.html
```

`.htaccess`ファイルでは、サブディレクトリのエラーページも自由に指定できます。

<!-- With an `.htaccess` file, you have the freedom to place your error page within a subdirectory. -->

```apache
ErrorDocument 404 /error_pages/404.html
```

パスは、サイトのドメインからの相対パスです。

<!-- Where the path is relative to your site's domain. -->

Apache Errorページの設定に関する更なる情報は、[official documentation](https://httpd.apache.org/docs/current/mod/core.html#errordocument){:target="_blank"}をご覧ください。

<!-- More info on configuring Apache Error Pages can found in [official documentation](https://httpd.apache.org/docs/current/mod/core.html#errordocument). -->

## Nginxサーバーによるホスティングの場合
<!-- ## Hosting on Nginx server -->

Apacheサーバーの場合と同様に簡単ですが、少し異なります。

<!-- The procedure is just as simple as configuring Apache servers, but slightly different. -->

Nginxの設定ファイルは、インストールされているシステムに依存します。多くの場合は、`/etc/nginx/`か`/etc/nginx/conf/`にある`nginx.conf`です。しかし、Ubuntuの様な他のサーバーでは、サーバー関連の情報を含む`default`というNginx設定ファイルを探す必要があります。通常は`/etc/nginx/sites-available/`か`/etc/nginx/sites-enabled/`にあります。以下をNginx設定ファイル（`nginx.conf`ファイルや`default`ファイル）に追加します。

<!-- The nginx configuration file depends on the system in which it is installed. In most systems, it is the `nginx.conf` file, which is usually located inside `/etc/nginx/` or `/etc/nginx/conf/`. However, in other systems like Ubuntu, you would have to look for a `default` nginx configuration file, containing server related information, which is usually located inside `/etc/nginx/sites-available/` or `/etc/nginx/sites-enabled/`. Add the following to your nginx configuration file, _i.e._ either to `nginx.conf` file or to `default` file: -->

```nginx
server {
  error_page 404 /404.html;
  location = /404.html {
    internal;
  }
}
```

もし、`server`ブロックが既にあれば、上記の`server`ブロックに中身だけを追加してください。`location`はユーザーが直接404.htmlページを見ることを防ぎます。

<!-- If the `server` block already exists, only add the code inside the `server` block given above.
The `location` directive prevents users from directly browsing the 404.html page. -->

Nginxエラーページに関する更なる情報は、[nginx official documentation](http://nginx.org/en/docs/http/ngx_http_core_module.html#error_page){:target="_blank"}をご覧ください。

<!-- More info on nginx error page can be found on [nginx official documentation](http://nginx.org/en/docs/http/ngx_http_core_module.html#error_page). -->

<p class="note warning">
  設定ファイルの編集は注意して進めてください。
  <!-- Proceed with caution while editing the configuration file. -->
</p>
