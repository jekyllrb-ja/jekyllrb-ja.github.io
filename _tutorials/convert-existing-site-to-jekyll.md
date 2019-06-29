---
layout: tutorials
permalink: /tutorials/convert-site-to-jekyll/
title: HTMLサイトをJekyllに変換
---
<!-- ---
layout: tutorials
permalink: /tutorials/convert-site-to-jekyll/
title: Convert an HTML site to Jekyll
--- -->

Jekyllサイトのテーマをお探しでしたら、既存のJekyllテーマにこだわる必要はありません。様々な静的HTMLファイルをJekyll Webサイトに変換するのは簡単です。

<!-- If you're looking for themes for your Jekyll site, you don't have to restrict yourself to existing Jekyll themes. It's pretty easy to convert almost any static HTML files into a Jekyll website. -->

色々な意味で、現在の静的サイトは*既に*Jekyll Webサイトです。Jekyllを使うと、ファイルを処理するときに、サイトの一部（テンプレートへのページの挿入、ナビゲーション用のリストのレンダリング、フィードとサイトマップの生成など）を自動化できます。

<!-- In many ways, any site that is currently a static site is *already* a Jekyll website. Jekyll just allows you to automate parts of the site (like inserting pages into templates, rendering lists for navigation, generating feeds and sitemaps, and more) as it processes the files. -->

HTMLサイトにJekyllテンプレートを適用する方法を理解すると、Jekyllテーマの様々なオプションであなたの世界が開けるでしょう。[オンラインで*Jekyll themes*を探す](https://duckduckgo.com/?q=Jekyll+themes){:target="_blank"}代わりに、サイトのための多種多様なHTMLテンプレートから選ぶことができます。HTMLテンプレートを必要に応じて素早くJekyll化し、Jekyllの出力用に構築しましょう。

<!-- Understanding how to convert any HTML site into Jekyll templates will open your world to many more options for Jekyll themes. Instead of [searching online for  *Jekyll themes*](https://duckduckgo.com/?q=Jekyll+themes), you can choose from the large variety of HTML templates for your site, quickly Jekyll-ize the HTML templates as you need to, and build the output with Jekyll. -->

Webサイトは洗練された機能とコントロールを持つことができますが、このチュートリアルでは単純化して説明します。

<!-- Although websites can have sophisticated features and controls, we'll keep things simple in this tutorial. -->

## Jekyll Webサイトとは
<!-- ## What is a Jekyll Website? -->

まずは、基礎から始めましょう。Jekyllサイトを基本レベルまで削除すると、何が起こっているのか分かりやすくなります。Jekyll gemをまだインストールしていないなら、[インストールしましょう]({{ "/docs/installation/" | relative_url }})。

<!-- First, let's start with a grounding in the basics. Stripping a Jekyll site down to an extremely basic level will help clarify what happens in a Jekyll site. If you haven't already installed the jekyll gem, [install it]({% link _docs/installation.md %}). -->

3つのファイルからなる*基本のJekyllサイト*からスタートします。

<!-- We'll start with a *basic Jekyll site* consisting of three files: -->

```
├── _config.yml
├── _layouts
│   └── default.html
└── index.md
```

`my_jekyll_site`かあなたの好きなフォルダにこれらの3つのファイルを手動で作成します。`default.html`は`_layouts`フォルダに入れます。

<!-- Manually create these three files in a folder called `my_jekyll_site` or whatever suits you the most, and place `default.html` inside a folder named `_layouts`. -->

```sh
$ touch _config.yml index.md default.html
$ mkdir _layouts && mv default.html _layouts
```

好きなエディタを起動し、`default.html`と`index.md`、`_config.yml`ファイルに以下のような基本の内容を書き込みます。

<!-- Fire up your favorite editor, and populate the contents of the `default.html` and `index.md` files as follows: -->

**_config.yml**

```yaml
name: My Jekyll Website
```

**_layouts/default.html**

```html
<!DOCTYPE html>
<html>
  <body>
     {% raw %}{{ content }}{% endraw %}
  </body>
</html>
```

**index.md**

```yaml
---
title: My page
layout: default
---

# {% raw %}{{ page.title }}{% endraw %}

Content is written in [Markdown](https://learnxinyminutes.com/docs/markdown/). Plain text format allows you to focus on your **content**.

<!--
You can use HTML elements in Markdown, such as the comment element, and they won't be affected by a markdown parser. However, if you create an HTML element in your markdown file, you cannot use markdown syntax within that element's contents.
-->
```

`cd`で`my_jekyll_site`に移動し、serveでサイトをサーバーに構築します。

<!-- Now `cd` to `my_jekyll_site` and serve the site with the built-in server: -->

```
cd my_jekyll_site
jekyll serve
```

Gemfileがあるのなら、代わりに`bundle exec jekyll serve`と入力して[Bundlerを使用]({{ "/docs/ruby-101/#bundler" | relative_url }})してください。
{: .note .info}

<!-- If you have a Gemfile, [use Bundler](/docs/ruby-101/#bundler) by typing `bundle exec jekyll serve` instead.
{: .note .info} -->

サイトをサーブしたら、`http://127.0.0.1:4000/`（`http://localhost:4000/`と同じ）でプレビューを見ることができます。サイトのファイルはデフォルトでは`_site`に構築されます。

<!-- When you serve the site, you get a preview URL such as `http://127.0.0.1:4000/` (which is the same as `http://localhost:4000/`). The site's files are built into the `_site` folder by default. -->

これは最も基本的な機能レベルのJekyllのサイトです。以下が起こっていることです。

<!-- This is a Jekyll site at the most basic functional level. Here's what is happening: -->

  * `_config.yml`ファイルは、Jekyllがサイトを変換するときに使用する設定が書かれています。空の設定ファイルなら、Jekyllサイト構築時にデフォルトの値が使用されます。例えば、[Markdown](https://learnxinyminutes.com/docs/markdown/){:target="_blank"}をHTMLに変換するのに、Jekyllはその他の指定が無ければ、自動で[kramdown Markdown filter](https://rubygems.org/gems/kramdown/){:target="_blank"}を使用します。
  * Jekyllは[front matterタグ]({{ "/docs/front-matter/" | relative_url }})（`index.md`のような2行の`---`のセット）のあるファイルを探し、そのファイルで作業を行います（サイト変数の処理、[Liquid](https://shopify.github.io/liquid/){:target="_blank"}のレンダリング、MarkdownからHTMLへの変換）。
  * Jekyllは全てのページとポストをfront matterで指定されたレイアウト（`default`）の`{% raw %}{{ content }}{% endraw %}`変数に押し出します。
  * 処理の終わったファイルを`_site`ディレクトリに`.html`で書き出します。

<!-- * The `_config.yml` file contains settings that Jekyll uses as it processes your site. An empty config file will use default values for building a Jekyll site. For example, to convert [Markdown](https://learnxinyminutes.com/docs/markdown/) to HTML, Jekyll will automatically use the [kramdown Markdown filter](https://rubygems.org/gems/kramdown/), without any need to specify it.
  * Jekyll looks for files with [front matter tags]({% link _docs/front-matter.md %}) (the two sets of dashed lines `---` like those in `index.md`) and processes the files (populating site variables, rendering any [Liquid](https://shopify.github.io/liquid/), and converting Markdown to HTML).
  * Jekyll pushes the content from all pages and posts into the `{% raw %}{{ content }}{% endraw %}` variable in the layout specified (`default`) in the front matter tags.
  * The processed files get written as `.html` files in the `_site` directory. -->

Jekyllのファイル処理については[解釈の順番]({{ "/tutorials/orderofinterpretation/" | relative_url }})にも情報があります。

<!-- You can read more about how Jekyll processes the files in [order of Interpretation]({% link _tutorials/orderofinterpretation.md %}). -->

Jekyllサイトの働きの基本的な理解で、多くのHTMLテーマをJekyll用に変換することができます。以降のセクションでは、その手順を順を追って説明します。

<!-- With this basic understanding of how a Jekyll site works, you can convert almost any HTML theme for Jekyll. The following sections will take you through a step-by-step tutorial to do so. -->

## 1. デフォルトレイアウトのテンプレートを作る
<!-- ## 1. Create a template for your default layout -->

HTMLテーマを見つけ、`default`レイアウトとして保存します。既存のサイトを変換・複製している場合は、ページを右クリックしてソースコードを表示できます。

<!-- Find your HTML theme and save it as a `default` layout. If you're converting or cloning an existing site, you can right-click the page and view the source code. -->

例えば、同じブランドのドキュメントサイトを作るために、会社のサイトを複製している場合。HTMLで構築した個人サイトをJekyllで作ろうとしている場合。その様なときは、HTMLソースコードを取得しましょう。

<!-- For example, suppose you're cloning your company site to create a documentation site with the same branding. Or suppose you have a personal site that you built with HTML and now want to make it a Jekyll site. Get the HTML source code for your site. -->

{: .note .info}
サイトに関係なく、ライセンスを確認し、コードをコピーして使用する権利があることを確認してください。

<!-- {: .note .info}
Regardless of the site, do check the license and make sure you have permission to copy and use the code. -->

ソースコードを`default.html`にコピー&ペーストします。`default.html`ファイルは`_layouts`フォルダに入れます。これがページやポストのデフォルトレイアウトになります &mdash; Jekyllがサイトを構築するときに各ページやポストにこのレイアウトを使用します。

<!-- Copy and paste the source code into a file called `default.html`. Put the `default.html` file inside the `_layouts` folder. This will be the default layout template for your pages and posts &mdash; that is, each page or post will use this layout when Jekyll builds the site. -->

テンプレートを探す際には、HTML出力されたテンプレートが必要です。テンプレートにPHPタグやその他ダイナミックスクリプトがある場合は、それらをHTMLや[Liquid](https://shopify.github.io/liquid/){:target="_blank"}に変換する必要があります。Liquidは動的コンテンツを取得するための[Jekyllテンプレートシステム]({{ "/docs/liquid/" | relative_url }})です。

<!-- Note that in looking for templates, you want the HTML output of the template. If the template has PHP tags or other dynamic scripts, these dynamic elements will need to be converted to HTML or to [Liquid](https://shopify.github.io/liquid/). Liquid is [Jekyll templating system](/docs/liquid/) to retrieve dynamic content. -->

`default.html`をローカルでブラウザで開き、オンライン時とサイトの見た目が変わらないかを確認します。おそらく、CSS, JSやイメージへのパスを調整する必要があるでしょう。

<!-- Open `default.html` into your browser locally to ensure the site looks and behaves like it does online. You will likely need to adjust CSS, JS, and image paths so they work. -->

例えば、相対パスで指定されていれば、同じアセットをJekyllサイトにダウンロードするか、クラウドのアセットに絶対パスで指定（`src =" // `のような構文がローカルブラウザで動作するためには`src = "http：//`のように接頭辞が必要です）する必要があります。

<!-- For example, if the paths were relative on the site you copied, you'll need to either download the same assets into your Jekyll site or use absolute paths to the same assets in the cloud. (Syntax such as `src="//` requires a prefix such as `src="http://` to work in your local browser.) -->

Jekyllはパスの前にサイトURLを追加するためのいくつかの[フィルタ]({{ "/docs/liquid/filters" | relative_url }})を提供しています。例えば、スタイルシートを次のようにします。

<!-- Jekyll provides some [filters](/docs/liquid/filters) to prepend a site URL before path. For example, you could preface your stylesheet like this: -->

```liquid
{% raw %}{{ "/assets/style.css" | relative_url }}{% endraw %}
```

`relative_url`フィルタは設定ファイルから[`baseurl`](https://byparker.com/blog/2014/clearing-up-confusion-around-baseurl/){:target="_blank"}の値（例えば`blog`）を取得します。これは、ドメインのrootよりサブパスでホストしているとき（例えば`http://mysite.com/blog/`）に便利です。

<!-- The `relative_url` filter will prepend the [`baseurl`](https://byparker.com/blog/2014/clearing-up-confusion-around-baseurl/) value from your config file (as`blog` for instance) to the input. This is useful if your site is hosted at a subpath rather than at the root of the domain (for example, `http://mysite.com/blog/`). -->

`absolute_url`フィルタを使用することもできます。これは、`url`*と*`baseurl`の値を取得します。

<!-- You can also use an `absolute_url` filter. This filter will prepend the `url` *and* `baseurl` value to the input: -->

```liquid
{% raw %}{{ "/assets/style.css" | absolute_url }}{% endraw %}
```

`url`と`baseurl`は次のように設定ファイルで定義することができます。

<!-- Again, both `url` and `baseurl` can be defined in your site's config file, like this: -->

```
url: http://mysite.com
baseurl: /blog
```

出力される結果は、`http://mysite.com/blog/assets/style.css`となります。

<!-- The result in the output will be `http://mysite.com/blog/assets/style.css`. -->

スラッシュ(`/`)から始まるページの`url`プロパティは、`url`や`baseurl`の最後のスラッシュが省略されるためです。

<!-- Note that the `url` property of any page begins with a forward slash (`/`), so omit this at the end of your `url` or `baseurl` property. -->

必ずしもリンクパスにフィルタを追加する必要はありません。サイト全体に相対リンクを使用することもできます。ただし、アセットへのパスをコーディングすることにした場合は、それらが正しくレンダリングされるようにします。

<!-- You don't have to prepend filters to link paths like this. You could also use relative links across your entire site. However you decide to code the paths to your assets, make sure they render correctly. -->

ローカルの`default.html`はブラウザできちんと表示されていますか？　全ての画像、スタイルや他の要素は表示されていますか？　できていれば、OKです。そのまま進めていきましょう。このテンプレートをレイアウトとして全てのページやポストに使うことも、必要に応じて多くのテンプレートを作ることもできます。

<!-- Does your local `default.html` page look good in your browser? Are all images, styles, and other elements showing up correctly? If so, great. Keep going. You can use this template as the layout for all your pages and posts or create as many templates as you need. -->

次のセクションでは、レイアウトのコンテンツ部を空白にして、Jekyllページに動的に取り込まれるプレースホルダタグに置き換えます。

<!-- In the next section, you'll blank out the content of the layout and replace it with placeholder tags that get populated dynamically with your Jekyll pages. -->

## 2. レイアウトのコンテンツ部を識別する
<!-- ## 2. Identify the content part of the layout -->

`default.html`でページコンテンツの開始部（通常は`h1`や`h2`タグ）を見つけます。表示されるタイトルを`{% raw %}{{ page.title }}{% endraw %}`で置き換えます。

<!-- In `default.html`, find where the page content begins (usually at `h1` or `h2` tags). Replace the title that appears inside these tags with `{% raw %}{{ page.title }}{% endraw %}`. -->

コンテンツ部を取り除き（ナビゲーションメニューやサイドバーフッターは残します）、`{% raw %}{{ content }}{% endraw %}`に変えます。

<!-- Remove the content part (keep everything else: navigation menu, sidebar, footer, etc.) and replace it with `{% raw %}{{ content }}{% endraw %}`. -->

ブラウザで再度レイアウトをチェックし、重要な`div`や他の要素を誤って削除していないか確認します。タイトルとページコンテンツだけが変更されてる状態です。この段階では内容はブランクで、プレースホルダタグがそのまま表示されています。

<!-- Check the layout again in your browser and make sure you didn't corrupt or alter it up by inadvertently removing a crucial `div` tag or other element. The only change should be to the title and page content, which are now blanked out or showing the placeholder tag. -->

## 3. front matterタグのある2つのファイルを作成する。
<!-- ## 3. Create a couple of files with front matter tags -->

rootディレクトリに2つのファイル（`index.md`と`about.md`）をさくせいします。

<!-- Create a couple of files (`index.md` and `about.md`) in your root directory. -->

`index.md`ファイルには以下のように、`title`と`layout`プロパティのあるfront matterタグを追加します。

<!-- In your `index.md` file, add some front matter tags containing a `title` and `layout` property, like this: -->

```yaml
---
title: Home
layout: default
---

Some page content here...
```

テスト用に同様のfront matterタグのある`about.md`も作成します。

<!-- Create another page for testing called `about.md` with similar front matter tags. -->

{: .note .info}
ページでレイアウトを指定しない場合、Jekyllは単にスタイルの内ベーシックなHTMLページとしてレンダリングします。

<!-- {: .note .info}
If you don't specify a layout in your pages, Jekyll will simply render that page as an unstyled basic HTML page. -->

## 4. 設定ファイルを追加する
<!-- ## 4. Add a configuration file -->

rootディレクトリに`_config.yml`を追加します。`_config.yml`では、オプションで好きなMarkdownフィルタを指定することができます。デフォルトは[kramdown](https://kramdown.gettalong.org/){:target="_blank"}です（指定する必要はありません）。他のフィルタが指定されていなければ、設定ファイルは自動でデフォルトの設定を使用します。

<!-- Add a `_config.yml` file in your root directory. In `_config.yml`, you can optionally specify the markdown filter you want. By default, [kramdown](https://kramdown.gettalong.org/) is used (without the need to specify it). If no other filter is specified, your config file will automatically apply the following as a default setting: -->

```
markdown: kramdown
```

[GitHub Flavored Markdown (GFM)](https://github.github.com/gfm/){:target="_blank"}の様に振る舞うようkramdownの[オプション](https://kramdown.gettalong.org/converter/html.html){:target="_blank"}を指定することもできます。

<!-- You can also specify [some options](https://kramdown.gettalong.org/converter/html.html) for kramdown to make it behave more like [GitHub Flavored Markdown (GFM)](https://github.github.com/gfm/): -->

```
kramdown:
 input: GFM
 auto_ids: true
 hard_wrap: false
 syntax_highlighter: rouge
```

## 5. ページのテスト
<!-- ## 5. Test your pages -->

`jekyll serve`を実行し`index.html`と`about.html`ページを切り替えます。どちらのページもdefaultレーアウトが読み込まれているはずです。

<!-- Now run `jekyll serve` and toggle between your `index.html` and `about.html` pages. The default layout should load for both pages. -->

コンテンツを別々のファイルに出力し、同じレイアウトを定義することができました。

<!-- You've now extracted your content out into separate files and defined a common layout for pages. -->

必要なだけページのレイアウトを定義できます。特定のページで使用したいレイアウトを指定するだけです。例えば：

<!-- You could define any number of layouts you want for pages. Then just identify the layout you want that particular page to use. For example: -->

```
---
title: Sample page
layout: homepage
---
```

このページは、`_layouts`フォルダの`homepage.html`テンプレートを使用します。

<!-- This page would then use the `homepage.html` template in the `_layouts` folder. -->

front matter変数でレイアウトを指定する必要がないように、ページやポスト、[コレクション]({{ "/docs/collections/" | relative_url }})の[デフォルトfront matterタグ]({{ "/docs/configuration/front-matter-defaults/" | relative_url }})を、`_config.yml`ファイルでセットすることもできます。デフォルトの設定に関しては、このチュートリアルの範囲外ですので、作業に戻ります。

<!-- You can even set [default front matter tags](/docs/configuration/front-matter-defaults/) for pages, posts, or [collections]({% link _docs/collections.md %}) in your `_config.yml` file so that you don't have to specify the layout in the front matter variables. Anyways, setting defaults is beyond the scope of this tutorial, let's get back to work. -->

## 6. サイト変数の設定
<!-- ## 6. Configure site variables -->

ページタイトルを`{% raw %}{{ page.title }}{% endraw %}`タグを使用することで既に指定しました。しかし、使用する`title`タグは他にもあります。ブラウザのタブやウィンドウに表示する[`title`](https://moz.com/learn/seo/title-tag){:target="_blank"}タグもあります。通常はページのタイトルとサイトのタイトルをここに表示します。

<!-- You already configured the page title using `{% raw %}{{ page.title }}{% endraw %}` tags. But there are more `title` tags to populate. Pages also have a [`title`](https://moz.com/learn/seo/title-tag) tag that appears in the browser tab or window. Typically you put the page title followed by the site title here. -->

`default.html`レイアウトの`head`タグの間にある`title`タグを探します。

<!-- In your `default.html` layout, look for the `title` tags below your `head` tags: -->

```
<title>ACME Website</title>
```

以下のサイト変数を挿入します。

<!-- Insert the following site variables: -->

```
{% raw %}<title>{{ page.title }} | {{ site.title }}</title>{% endraw %}
```

`_config.yml`を開き、`title`プロパティにサイト名を追加します。

<!-- Open `_config.yml` and add a `title` property for your site's name. -->

```
title: ACME Website
```

`_config.yml`ファイルに追加したプロパティには、`site`ネームスペースでアクセスできます。同様にページのfront matterのプロパティには`page`ネームスペースでアクセスできます。変数にアクセスするには、`site`や`page`の後にドットをつけます。

<!-- Any properties you add in your `_config.yml` file are accessible through the `site` namespace. Similarly, any properties in your page's front matter are accessible through the `page` namespace. Use dot notation after `site` or `page` to access the value. -->

<kbd>Ctrl</kbd> + <kbd>C</kbd>でJekyllサーバーを停止し、リスタートします。`title`タグがきちんと表示されることを確認します。

<!-- Stop your Jekyll server with <kbd>Ctrl</kbd> + <kbd>C</kbd> and restart it. Verify that the `title` tags are populating correctly. -->

{: .note .info}
設定ファイルを修正する度に、変更を反映させるにはJekyllを再起動します。他のファイルを修正したときは、Jekyllが自動で変更をピックアップし再構築します。

<!-- {: .note .info}
Every time you modify your config file, you have to restart Jekyll for the changes to take effect. When you modify other files, Jekyll automatically picks up the changes when it rebuilds. -->

サイトに使用する他の変数があれば、同様の操作を繰り返します。

<!-- If you have other variables to populate in your site, rinse and repeat. -->

## 7. ポストとページを表示する
<!-- ## 7. Show posts on a page -->

ホームページにポストのリストを表示します。まずは、いくつかのポストを作成します。

<!-- It's common to show a list of posts on the homepage. First, let's create some posts so that we have something to showcase. -->

`_posts`フォルダに基本の`YYYY-MM-DD-title.md`ポストフォーマットでいくつかのポストを追加します。

<!-- Add some posts in a `_posts` folder following the standard `YYYY-MM-DD-title.md` post format: -->

  * `2017-01-02-my-first-post.md`
  * `2017-01-15-my-second-post.md`
  * `2017-02-08-my-third-post.md`

各ポストには、基本の内容を追加します。

<!-- In each post, add some basic content: -->

```
---
title: My First Post
layout: default
---

Some sample content...
```

では、ポストを並べるレイアウトを作成しましょう。`_layouts`に以下の内容の`home.html`を作成します。

<!-- Now let's create a layout that will display the posts. Create a new file in `_layouts` called `home.html` and add the following logic: -->

```
---
layout: default
---

{% raw %}{{ content }}
<ul class="myposts">
{% for post in site.posts %}
    <li><a href="{{ post.url }}">{{ post.title}}</a>
    <span class="postDate">{{ post.date | date: "%b %-d, %Y" }}</span>
    </li>
{% endfor %}
</ul>{% endraw %}
```

rootディレクトリに`blog.md`を、`home`レイアウトを指定して作成します。

<!-- Create a file called `blog.md` in your root directory and specify the `home` layout: -->

```
---
title: Blog
layout: home
---
```

今回の場合、`blog.md`のコンテンツは`home`レイアウトの`{% raw %}{{ content }}{% endraw %}`タグに入ります。そして、その`home`レイアウトが`default`レイアウトの`{% raw %}{{ content }}{% endraw %}`タグに入ります。

<!-- In this case, contents of `blog.md` will be pushed into the `{% raw %}{{ content }}{% endraw %}` tag in the `home` layout. Then the `home` layout will be pushed into the `{% raw %}{{ content }}{% endraw %}` tag of the `default` layout. -->


### レイアウトの働き方
<!-- ### How layouts work -->

レイアウトに他のレイアウトが指定されていたら、最初のレイアウトのコンテンツが2つ目のレイアウトの`{% raw %}{{ content }}{% endraw %}`に取り込まれることを意味します。アナログで言えば、ロシアのマトリョーシカのように一方をその中に取り込みます。各レイアウトは指定したレイアウトに入ります。

<!-- When a layout specifies another layout, it means the content of the first layout will be stuffed into the `{% raw %}{{ content }}{% endraw %}` tag of the second layout. As an analogy, think of Russian dolls that fit into each other. Each layout fits into another layout that it specifies. -->

以下の図はJekyllでレイアウトがどのように働くかを示しています。

<!-- The following diagram shows how layouts work in Jekyll: -->

<img src="../../img/jekylllayoutconcept.png" alt="Concept of Jekyll layouts" />

{: .image-description}
この例では、`document.md`で`layout: docs`が指定されており、そのコンテンツは`docs.html`の`{% raw %}{{ content }}{% endraw %}`に入ります。`docs`レイアウトが`layout: page`を指定しているので、`docs.html`のコンテンツは`page.html`の`{% raw %}{{ content }}{% endraw %}`に入ります。最後に`page`レイアウトで`layout: default`を指定しているので、`page.html`のコンテンツが`default.html`の`{% raw %}{{ content }}{% endraw %}`に入ります。

<!-- {: .image-description}
In this example, the content from a Markdown document `document.md` that specifies `layout: docs` gets pushed into the `{% raw %}{{ content }}{% endraw %}` tag of the layout file `docs.html`. Because the `docs` layout itself specifies `layout: page`, the content from `docs.html` gets pushed into the `{% raw %}{{ content }}{% endraw %}` tag in the layout file `page.html`. Finally because the `page` layout specifies `layout: default`, the content from `page.html` gets pushed into the `{% raw %}{{ content }}{% endraw %}` tag of the layout file `default.html`. -->

複数のレイアウトが必要なければ、`default`だけを使用すればいいです。サイトのデザインの選択権はあなたにあります。通常はポスト用とページ用のレイアウトを用意しますが、`default`テンプレート（通常はサイトの最初と最後を定義します）を継承するようにします。

<!-- You don't need multiple layouts. You could just use one: `default`. You have options for how you design your site. In general, it's common to define one layout for pages and another layout for posts, but for both of these layouts to inherit the `default` template (which usually defines the top and bottom parts of the site). -->

ブラウザで`blog.html`に行き、ポストのリストを確認します。
ここで説明した方法を使用する必要はありません。これらの投稿を表示するために `index.md`のようなページに`for`ループを単に追加することもできます。ただし、他の機能に対してより複雑なロジックがある場合があるので、頻繁にコンテンツを入力するページ領域とは別のテンプレートにロジックを格納すると便利です。

<!-- In your browser, go to `blog.html` and see the list of posts.
Note that you don't have to use the method described here. You could have simply added the `for` loop to any page, such as `index.md`, to display these posts. But given that you may have more complex logic for other features, it can be helpful to store your logic in templates separate from the page area where you frequently type your content. -->

{: .note .info}
最低限、レイアウトにはレンダリング時に*content*を受け取る`{% raw %}{{ content }}{% endraw %}`が必要です。

<!-- {: .note .info}
At minimum, a layout should contain `{% raw %}{{ content }}{% endraw %}`, which acts as a receiver for the *content* to be rendered. -->

### Forループ
<!-- ### For loops -->

ここで少し立ち止まって、`for`ループのロジックをもう少し詳しく見てみましょう。[LiquidのForループ](https://shopify.github.io/liquid/tags/iteration/){:target="_blank"}は最も一般的なLiquidタグの一つです。*Forループ*はJekyllサイトのコンテンツを反復して、その結果を構築することができます。`for`ループは、ループ中の場所に基づく（繰り返しの最初や最後といった）[利用可能なプロパティ](https://help.shopify.com/themes/liquid/objects/for-loops){:target="_blank"}があります。

<!-- By the way, let's pause here to look at the `for` loop logic a little more closely. [For loops in Liquid](https://shopify.github.io/liquid/tags/iteration/) are one of the most commonly used Liquid tags. *For loops* let you iterate through content in your Jekyll site and build out a result. The `for` loop also has [certain properties available](https://help.shopify.com/themes/liquid/objects/for-loops) (like first or last iteration) based on the loop's position in the loop as well. -->

ポストを取得するのは、`for`ループでできることのほんの一部に過ぎません。例えば、特定のカテゴリのポストを表示したい場合は、`categories`プロパティをポストのfront matterに追加し、そのカテゴリで見つけます。`limit`プロパティを使用して、結果の数を制限することもできます。以下がその例です。

<!-- We've only scratched the surface of what you can do with `for` loops in retrieving posts. For example, if you wanted to display posts from a specific category, you could do so by adding a `categories` property to your post's front matter and then look in those categories. Further, you could limit the number of results by adding a `limit` property. Here's an example: -->

```liquid
{% raw %}<ul class="myposts">
{% for post in site.categories.podcasts limit:3 %}
    <li><a href="{{ post.url }}">{{ post.title}}</a>
    <span class="postDate">{{ post.date | date: "%b %-d, %Y" }}</span>
    </li>
{% endfor %}
</ul>{% endraw %}
```

このループは、front matterにカテゴリが`podcasts`という指定がある、最近の3ポストを取得します。

<!-- This loop would get the latest three posts that have a category called `podcasts` in the front matter. -->

## 8. ナビゲーションの設定
<!-- ## 8. Configure navigation -->

ポストを設定しましたので、ページナビゲーションの設定を行いましょう。多くのWebサイトはサイドバーやヘッダーエリアにナビゲーションがあります。

<!-- Now that you've configured posts, let's configure page navigation. Most websites have some navigation either in the sidebar or header area. -->

このチュートリアルでは、生成したページのシンプルなリストを取得します。手で数えられるようなページだけなら、`site.pages`オブジェクトに`for`ループを使用して、front matterで並び順を指定しリストを作ることができます。

<!-- In this tutorial, we'll assume you've got a simple list of pages you want to generate. If you only have a handful of pages, you could list them by using a `for` loop to iterate through the `site.pages` object and then order them by a front matter property. -->

ページのリストが表示されているコード部分を識別します。通常これはさまざまな子要素`<li>`を持つ`<ul>`要素です。そのコードを次のコードに置き換えます。

<!-- Identify the part of your code where the list of pages appears. Usually this is a `<ul>` element with various child `<li>` elements. Replace the code with the following: -->

```html
{% raw %}<ul>
  {% assign mypages = site.pages | sort: "order" %}
    {% for page in mypages %}
    <li><a href="{{ page.url | absolute_url }}">{{ page.title }}</a></li>
    {% endfor %}
  </ul>{% endraw %}
```

この例では、次のように各ページのfront matterに`title`と`order`が指定されていると仮定しています。

<!-- This example assumes each page would have front matter containing both a `title` and `order` property like this: -->

```
---
title: My page
order: 2
---
```

`order`プロパティはページのソートで取得され、リストの最初に`1`が表示されます

<!-- Here the `order` property will define how the pages get sorted, with `1` appearing first in the list. -->

別のデータファイルで管理しているページのリストを繰り返すこともできます。これは、たくさんのページがある場合や、保存したいページに関する他のプロパティがある場合に適しています。

<!-- You could also iterate through a list of pages that you maintain in a separate data file. This might be more appropriate if you have a lot of pages, or you have other properties about the pages you want to store. -->

この方法でリンクを管理するために、jekyllプロジェクトに`_data`フォルダを作成します。このフォルダに、次の内容の`navigation.yml`を作成します。

<!-- To manage page links this way, create a folder in your Jekyll project called `_data`. In this folder, create a file called e.g. `navigation.yml` with this content: -->

```yaml
- title: Sample page 1
  url: /page-1-permalink/

- title: Sample page 2
  url: /page-2-permalink/

- title: Sample page 3
  url: /page-3-permalink/
```

{: .note .info}
YAMLをこれまで書いたことが無くても、すぐに慣れることができるでしょう。[YAMLでできること](https://learnxinyminutes.com/docs/yaml/){:target="_blank"}を見てください。

<!-- {: .note .info}
If you never wrote any YAML before, you'll get quickly familiar with it. Take a look at [what you can do with YAML](https://learnxinyminutes.com/docs/yaml/). -->

必要に応じて、このデータファイルに各項目の追加のプロパティを保存できます。リスト項目は、表示したい順序に並べます。

<!-- You can store additional properties for each item in this data file as desired. Arrange the list items in the order you want them to appear. -->

データファイルからページのリストを表示するには、次のようなコードを使用します。

<!-- To print the list of pages from the data file, use code like this: -->

```html
{% raw %}<ul>
    {% for link in site.data.navigation %}
    <li><a href="{{ link.url }}">{{ link.title }}</a></li>
    {% endfor %}
</ul>{% endraw %}
```

ドキュメンテーションを構築するときなど、ナビゲーションに対してより高度な要件がある場合は、[ナビゲーションの詳細なチュートリアル]({{ "/tutorials/navigation/" | relative_url }})をご覧ください。

<!-- If you have more sophisticated requirements around navigation, such as when building a documentation site, see the [detailed tutorial on navigation](/tutorials/navigation/). -->

## 9. サイトをインクルードで単純化する
<!-- ## 9. Simplify your site with includes -->

`default.html`ファイルが大規模で作業が困難だとします。HTMLコードを*include*ファイルとして配置することで、レイアウトを分割することができます。

<!-- Let's suppose your `default.html` file is massive and hard to work with. You can break up your layout by putting some of the HTML code in *include* files. -->

rootディレクトリに`_includes`フォルダを追加します。そのフォルダに`sidebar.html`を追加します。

<!-- Add a folder called `_includes` in your root directory. In that folder, add a file there called `sidebar.html`. -->

`default.html`レイアウトからサイドバーを取り除き、`sidebar.html`に挿入します。

<!-- Remove your sidebar code from your `default.html` layout and insert it into the `sidebar.html` file. -->

`default.html`のサイドバーがあったところには、"include"を配置します。

<!-- Where the sidebar code previously existed in `default.html`, pull in your "include" like this: -->

```liquid
{% raw %}{% include sidebar.html %}{% endraw %}
```

ヘッダーやフッターなどテーマの他の要素も同様にして分割することができます。同じ要素は他のレイアウトファイルに適用することもできます。この方法なら、コードを複製せずに済みます。

<!-- You can break up other elements of your theme like this, such as your header or footer. Then you can apply these common elements to other layout files. This way you won't have duplicate code. -->

## 10. RSS feed

JekyllサイトにRSS feedが必要です。[こちら](http://www.w3schools.com/xml/xml_rss.asp){:target="_blank"}は基本のRSS feed構文です。RSSファイルをJekyllに作成するために、rootディレクトリに`feed.xml`を作成し、以下を追加します。

<!-- Your Jekyll site needs an RSS feed. Here's the [basic RSS feed syntax](http://www.w3schools.com/xml/xml_rss.asp). To create an RSS file in Jekyll, create a file called `feed.xml` in your root directory and add the following: -->

```xml
---
layout: null
---

{% raw %}<?xml version="1.0" encoding="UTF-8" ?>
<rss version="2.0">

    <channel>
        <title>{{ site.title }}</title>
        <link>{{ site.url }}</link>
        <description>{{ site.description }}</description>
        <lastBuildDate>{{ site.time | date_to_rfc822 }}</lastBuildDate>
        {% for post in site.posts %}
        <item>
            <title>{{ post.title }}</title>
            <link>
                {{ post.url | prepend: site.url }}
            </link>
            <description>
                {{ post.content | escape | truncate: '400' }}
            </description>
            <pubDate>{{ post.date | date_to_rfc822 }}</pubDate>
            <guid>
                {{ post.url | prepend: site.url }}
            </guid>
        </item>
        {% endfor %}
    </channel>
</rss>{% endraw %}
```

`_config.yml`ファイルに`title`と`url`、`description`のプロパティを忘れないでください。

<!-- Make sure your `_config.yml` file has properties for `title`, `url`, and `description`. -->

このコードは最近の20ポストを探すために`for`ループを使用しています。[Liquid filters](https://help.shopify.com/themes/liquid/filters){:target="_blank"}を使用して、ポストのコンテントから400時以降を切り捨てています。

<!-- This code uses a `for` loop to look through your last 20 posts. The content from the posts gets escaped and truncated to the last 400 characters using [Liquid filters](https://help.shopify.com/themes/liquid/filters). -->

`default.html`レイアウトのヘッダからRSSやAtom feedへの参照を探し、先ほど作成したファイルへの参照に書き換えます。

<!-- In your `default.html` layout, look for a reference to the RSS or Atom feed in your header, and replace it with a reference to the file you just created. For example: -->

```html
<link rel="alternate" type="application/rss+xml"  href="{% raw %}{{ site.url }}{% endraw %}/feed.xml" title="{% raw %}{{ site.title }}{% endraw %}">
```

[`jekyll-feed`](https://help.github.com/articles/atom-rss-feeds-for-github-pages/){:target="_blank"}というgemを追加することで、自動でfeedを生成することもできます。このGemは、GitHub Pagesでも動きます。

<!-- You can also auto-generate your posts feed by adding a gem called [`jekyll-feed`](https://help.github.com/articles/atom-rss-feeds-for-github-pages/). This gem will also work on GitHub Pages. -->

## 11. sitemapを追加する
<!-- ## 11. Add a sitemap -->

最後に、[site map](https://www.sitemaps.org/protocol.html){:target="_blank"}を追加します。rootディレクトリに`sitemap.xml`を作成し、次のコードを追加します。

<!-- Finally, add a [site map](https://www.sitemaps.org/protocol.html). Create a `sitemap.xml` file in your root directory and add this code: -->

```xml
---
layout: null
search: exclude
---

{% raw %}<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">

    {% for page in site.pages %}
    <url>
        <loc>{{page.url}}</loc>
        <lastmod>{{site.time | date: '%Y-%m-%d' }}</lastmod>
        <changefreq>daily</changefreq>
        <priority>0.5</priority>
    </url>
    {% endfor %}

    {% for post in site.posts %}
    <url>
        <loc>{{post.url}}</loc>
        <lastmod>{{site.time | date: '%Y-%m-%d' }}</lastmod>
        <changefreq>daily</changefreq>
        <priority>0.5</priority>
    </url>
    {% endfor %}

</urlset>{% endraw %}
```

全てのページとポストをsitemapに追加するために、再び`for`ループを使用しています。

<!-- Again, we're using a `for` loop here to iterate through all posts and pages to add them to the sitemap. -->

[`jekyll-sitemap`](https://help.github.com/articles/sitemaps-for-github-pages/){:target="_blank"}というgemを追加することで、自動でsitemapを生成することもできます。このGemは、GitHub Pagesでも動きます。

<!-- You can also auto-generate your sitemap by adding a gem called [`jekyll-sitemap`](https://help.github.com/articles/sitemaps-for-github-pages/). This gem will also work on GitHub Pages. -->

## 12. 外部サービスを追加する
<!-- ## 12. Add external services -->

（コンタクトフォームや検索、コメントなど）他のサービスが必要になったら、サードパーティーサービスを探してください。例えば、以下のサービスを使用できます。

<!-- For other services you might need (such as contact forms, search, comments, and more), look for third-party services. For example, you might use the following: -->

  * コメント: [Disqus](https://disqus.com/){:target="_blank"}
  * ニュースレター: [Tinyletter](https://tinyletter.com/){:target="_blank"}
  * コンタクトフォーム: [Wufoo](https://www.wufoo.com/){:target="_blank"}
  * 検索: [Algolia Docsearch](https://community.algolia.com/docsearch/){:target="_blank"}

  <!-- * For comments: [Disqus](https://disqus.com/)
  * For a newsletter: [Tinyletter](https://tinyletter.com/)
  * For contact forms: [Wufoo](https://www.wufoo.com/)
  * For search: [Algolia Docsearch](https://community.algolia.com/docsearch/) -->

静的サイトのサービスの詳細は、[Third Parties](https://learn.cloudcannon.com/jekyll-third-parties/){:target="_blank"}リストとCloudCannonのチュートリアルを見てください。

<!-- For more details on services for static sites, see the [Third Parties](https://learn.cloudcannon.com/jekyll-third-parties/) list and tutorials from CloudCannon. -->

JekyllのページはHTML、CSS、JavaScriptで構成されており、埋め込みコードはほとんど問題なく動作します。

<!-- Your Jekyll pages consist of HTML, CSS, and JavaScript, so pretty much any code you need to embed will work without a problem. -->

これらのサービスのコードを統合するとき、**Jekyllサイトのページにfront matterが無ければ、Jekyll八草のページの内容に手を加えない**ことを覚えておいてください。サイト構築時に`_site`フォルダにページが渡されるだけです。

<!-- As you integrate code for these services, note that **if a page in your Jekyll site doesn't have front matter tags, Jekyll won't process any of the content in that page.** The page will just be passed to the `_site` folder when you build your site. -->

（設定ファイルで定義した変数を有効にするなど）Jekyllのプロセスを経たい場合は、front matterタグを追加してください。ページにレイアウトを適用したくない場合は、次のように`layout: null`を指定します。

<!-- If you do want Jekyll to process some page content (for example, to populate a variable that you define in your site's config file), just add front matter tags to the page. If you don't want any layout applied to the page, specify `layout: null` like this: -->

```
---
layout: null
---
```

## 13.最後に
<!--## 13. Conclusion-->

Webサイトはさらに見た目をよくしたり機能を実装することができますが、このチュートリアルでは基本部分をカバーしました。Jekyllサイトの沢山の機能を使えるようになったはずです。

<!-- Although websites can implement more sophisticated features and functionality, we've covered the basics in this tutorial. You now have a fully functional Jekyll site. -->

[GitHub Pages](https://pages.github.com/){:target="_blank"}、[Netlify](https://www.netlify.com/){:target="_blank"}を使って、[s3_website plugin](https://github.com/laurilehmijoki/s3_website){:target="_blank"}を使用して[Amazon AWS S3](https://aws.amazon.com/s3/){:target="_blank"}、もしくはFTPでWebサーバーにファイルを転送して、あなたのサイトを公開しましょう。

<!-- To deploy your site, consider using [GitHub Pages](https://pages.github.com/), [Netlify](https://www.netlify.com/), [Amazon AWS S3](https://aws.amazon.com/s3/) using the [s3_website plugin](https://github.com/laurilehmijoki/s3_website), or just FTP your files to your web server. -->

アセットを含めたレイアウトをRuby `gem`にパッケージして、[Jekyllのテーマを作る]({{ "/docs/themes/" | relative_url }})こともできます。

<!-- You can also package your layouts, includes and assets into a Ruby `gem` and [make it a Jekyll theme](/docs/themes/). -->

## 追加情報
<!-- ## Additional resources -->

こちらは、Jekyllサイトを作るための追加のチュートリアルです。

<!-- Here are some additional tutorials on creating Jekyll sites: -->

  * [Convert a static site to Jekyll](http://jekyll.tips/jekyll-casts/converting-a-static-site-to-jekyll/){:target="_blank"}
  * [Building a Jekyll Site – Part 1 of 3: Converting a Static Website To Jekyll](https://css-tricks.com/building-a-jekyll-site-part-1-of-3/){:target="_blank"}
