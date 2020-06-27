---
title: Generators（ジェネレータ）
permalink: /docs/plugins/generators/
---
<!-- ---
title: Generators
permalink: /docs/plugins/generators/
--- -->

あなた自身のルールに基づいた追加コンテンツがJekyllに必要なら、ジェネレータを作ることができます。

<!-- You can create a generator when you need Jekyll to create additional content
based on your own rules. -->

ジェネレータは`generate`メソッドを定義する`Jekyll::Generator`のサブクラスです。[`Jekyll::Site`]({{ site.repository }}/blob/master/lib/jekyll/site.rb){:target="_blank"}のインスタンスを受け取ります。`generate`が返す値は無視されます。

<!-- A generator is a subclass of `Jekyll::Generator` that defines a `generate`
method, which receives an instance of
[`Jekyll::Site`]({{ site.repository }}/blob/master/lib/jekyll/site.rb). The
return value of `generate` is ignored. -->

ジェネレータは、Jekyllが既存のコンテンツのインベントリを作成した後、サイトが生成される前に実行されます。front matterのあるページは[`Jekyll::Page`]({{ site.repository }}/blob/master/lib/jekyll/page.rb){:target="_blank"}インスタンスとして保管され、`site.pages`で使用可能です。静的ファイルは[`Jekyll::StaticFile`]({{ site.repository }}/blob/master/lib/jekyll/static_file.rb){:target="_blank"}インスタンスになり、`site.static_files`で使用可能です。詳細は[ドキュメンテーションの変数ページ]({{ "/docs/variables/" | relative_url }})と[`Jekyll::Site`]({{ site.repository }}/blob/master/lib/jekyll/site.rb){:target="_blank"}を見てください。

<!-- Generators run after Jekyll has made an inventory of the existing content, and
before the site is generated. Pages with front matter are stored as
instances of
[`Jekyll::Page`]({{ site.repository }}/blob/master/lib/jekyll/page.rb)
and are available via `site.pages`. Static files become instances of
[`Jekyll::StaticFile`]({{ site.repository }}/blob/master/lib/jekyll/static_file.rb)
and are available via `site.static_files`. See
[the Variables documentation page](/docs/variables/) and
[`Jekyll::Site`]({{ site.repository }}/blob/master/lib/jekyll/site.rb)
for details. -->

例えば、ジェネレータはテンプレート変数に構築時に計算された値を代入することができます。以下の例では、`reading.html`テンプレートに`ongoing`と`done`の2つの変数をジェネレータから書き込んでいます。

<!-- For instance, a generator can inject values computed at build time for template
variables. In the following example, the template `reading.html` has two
variables `ongoing` and `done` that are filled in the generator: -->

```ruby
module Reading
  class Generator < Jekyll::Generator
    def generate(site)
      ongoing, done = Book.all.partition(&:ongoing?)

      reading = site.pages.detect {|page| page.name == 'reading.html'}
      reading.data['ongoing'] = ongoing
      reading.data['done'] = done
    end
  end
end
```

以下の例は新しいページを生成するより複雑なジェネレータです。この例は、`categories`ディレクトリにそのカテゴリのポスト一覧のカテゴリページを`category_index.html`レイアウトを使用して作成します。

<!-- The following example is a more complex generator that generates new pages. In this example, the generator will create a series of files under the `categories` directory for each category, listing the posts in each category using the `category_index.html` layout. -->

```ruby
module Jekyll
  class CategoryPageGenerator < Generator
    safe true

    def generate(site)
      if site.layouts.key? 'category_index'
        dir = site.config['category_dir'] || 'categories'
        site.categories.each_key do |category|
          site.pages << CategoryPage.new(site, site.source, File.join(dir, category), category)
        end
      end
    end
  end

  # A Page subclass used in the `CategoryPageGenerator`
  class CategoryPage < Page
    def initialize(site, base, dir, category)
      @site = site
      @base = base
      @dir  = dir
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'category_index.html')
      self.data['category'] = category

      category_title_prefix = site.config['category_title_prefix'] || 'Category: '
      self.data['title'] = "#{category_title_prefix}#{category}"
    end
  end
end
```

ジェネレータには一つだけのメソッドの実装が必要です。

<!-- Generators need to implement only one method: -->

<div class="mobile-side-scroller">
<table>
  <thead>
    <tr>
      <th>メソッド</th>
      <th>説明</th>
    </tr>
    <!-- <tr>
      <th>Method</th>
      <th>Description</th>
    </tr> -->
  </thead>
  <tbody>
    <tr>
      <td>
        <p><code>generate</code></p>
      </td>
      <td>
        <p>サイドエフェクトとしてコンテンツを生成する。</p>
        <!-- <p>Generates content as a side-effect.</p> -->
      </td>
    </tr>
  </tbody>
</table>
</div>

ジェネレータが単一のファイル内に収まっている場合、任意の名前を付けることができますが、拡張子は `.rb`にする必要があります。ジェネレータが複数のファイルに分割されている場合は、https：//rubygems.org/で公開するRubygemとしてパッケージ化する必要があります。この場合、2つのgemが同じ名前を持つことはできないため、gemの名前はそのサイトに基づく名前を設定する必要があります。

<!-- If your generator is contained within a single file, it can be named whatever you want but it should have an `.rb` extension. If your generator is split across multiple files, it should be packaged as a Rubygem to be published at https://rubygems.org/. In this case, the name of the gem depends on the availability of the name at that site because no two gems can have the same name. -->

デフォルトでは、Jekyllは`_plugins`ディレクトリでジェネレータを探します。しかし、設定ファイルで`plugins_dir`キーでプラグインのディレクトリを指定できます。

<!-- By default, Jekyll looks for generators in the `_plugins` directory. However, you can change the default directory by assigning the desired name to the key `plugins_dir` in the config file. -->