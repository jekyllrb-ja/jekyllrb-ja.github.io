---
title: CSVデータをテーブル化
author: MichaelCurrin
date: 2020-04-01 20:30:00 +0200
---
<!-- ---
title: Tabulate CSV Data
author: MichaelCurrin
date: 2020-04-01 20:30:00 +0200
--- -->

このチュートリアルでは、JekyllでCSVを読み込みデータをHTML tableにレンダリングする方法を示します。

<!-- This tutorial shows how to use Jekyll to read a CSV and render the data as an HTML table. -->

このアプローチは：

<!-- This approach will: -->

- CSVの最初の行をHTML tableのヘッダとして使用します。
- 残りの行をtableのボディにします。
- 元のCSVの列の順序を保持します。
- 参照される_任意_の有効なCSVを処理するのに十分な柔軟性を有します。

<!-- - use the CSV's first row as the HTML table header.
- use remaining rows for the body of the table.
- preserve the order of the columns from the original CSV.
- be flexible enough to work with _any_ valid CSV that is referenced. -->

列の名前は特定のものである必要はなく、何列あってもかまいません。  
このチュートリアルの秘訣は、行データを反復処理するときに、_最初の行_を取得して、ヘッダ名を取得できることです。

<!-- There is no need to specify what the names of the columns are, or how many columns there are.
The trick to this tutorial is that, when we iterate over the row data, we pick up the _first row_
and unpack that so we can get the header names. -->

以下の手順に従って、作成者のサンプルCSVをHTMLテーブルに変換します。

<!-- Follow the steps below to convert a sample CSV of authors into an HTML table. -->

## 1. CSVを作成
<!-- ## 1. Create a CSV -->

Jekyllがピックアップできるように、[Data files]({{ '/docs/datafiles/' | relative_url }})ディレクトリにCSVファイルを作成します。簡単なpathとCSVデータを以下に示します：

<!-- Create a CSV file in your [Data files]({{ '/docs/datafiles/' | relative_url }}) directory so
that Jekyll will pick it up. A sample path and CSV data are shown below: -->

`_data/authors.csv`

```
First name,Last name,Age,Location
John,Doe,35,United States
Jane,Doe,29,France
Jack,Hill,25,Australia
```

これでJekyllで以下のようにするとデータファイルが有効になります：

<!-- That data file will now be available in Jekyll like this: -->

{% raw %}
```liquid
{{ site.data.authors }}
```
{% endraw %}

## 2. テーブルを追加
<!-- ## 2. Add a table -->

テーブルを表示したいHTMlもしくはマークダウンファイルを選択します。

<!-- Choose an HTML or markdown file where you want your table to be shown. -->

例えば：`table_test.md`

<!-- For example: `table_test.md` -->

```yaml
---
title: Table test
---
```

### 行を調べる
<!-- ### Inspect a row -->

最初の行を取り出し、`inspect`フィルタを使用してどのように見えるかを確認します。

<!-- Grab the first row and see what it looks like using the `inspect` filter. -->

{% raw %}
```liquid
{% assign row = site.data.authors[0] %}
{{ row | inspect }}
```
{% endraw %}

結果は次のような_hash_ (キーと値のペアで構成されるオブジェクト)です。

<!-- The result will be a _hash_ (an object consisting of key-value pairs) which looks like this: -->

```ruby
{
  "First name"=>"John",
  "Last name"=>"Doe",
  "Age"=>"35",
  "Location"=>"United States"
}
```

Jekyllは、元のCSVに基づいて、実際にここで順序を_保持する_ことに注意してください。

<!-- Note that Jekyll _does_ in fact preserve the order here, based on the original CSV. -->

### 行の解凍
<!-- ### Unpack a row -->

簡単な解決策は、キーで行の値を検索するときにフィールド名をハードコードすることです。

<!-- A simple solution would be to hardcode the field names when looking up the row values by key. -->

{% raw %}
```liquid
{{ row["First name"] }}
{{ row["Last name"] }}
```
{% endraw %}

しかし解決法は_いかなる_CSVでもできるよう特定の列名でない方が好ましいです。  
そこで`row`オブジェクトを`for`ループで反復処理します：

<!-- But we prefer a solution that will work for _any_ CSV, without specifying the column names upfront.
So we iterate over the `row` object using a `for` loop: -->

{% raw %}
```liquid
{% assign row = site.data.authors[0] %}
{% for pair in row %}
  {{ pair | inspect }}
{% endfor %}
```
{% endraw %}

これにより、以下が生成されます。各ペアの最初のアイテムは_key_、二つ目は_value_です。

<!-- This produces the following. Note the first item in each pair is the _key_ and the second will be
the _value_. -->

```
["First name", "John"]
["Last name", "Doe"]
["Age", "35"]
["Location", "United States"]
```

### テーブルヘッダ行を作成
<!-- ### Create a table header row -->

一つのテーブル行(`tr`)にテーブルヘッダ(`th`)タグのtableを作成しました。ヘッダ名は`pair`の最初のエレメント(at index `0`)で見つけています。まだ必要でないため、二つ目のエレメントは無視しました。

<!-- Here we make a table with a single table row (`tr`), made up of table header (`th`) tags. We find
the header name by getting the first element (at index `0`) from `pair`. We ignore the second
element as we don't need the value yet. -->

{% raw %}
```liquid
<table>
  {% for row in site.data.authors %}
    {% if forloop.first %}
    <tr>
      {% for pair in row %}
        <th>{{ pair[0] }}</th>
      {% endfor %}
    </tr>
    {% endif %}
  {% endfor %}
</table>
{% endraw %}
```

現時点では、2行目以降のコンテンツは表示されません。これは_first_行に対してtrueを返し、それ以外の場合はfalseを返す`forloop.first`を使用しているためです。

<!-- For now, we do not display any content from the second row onwards. We achieve this by using
`forloop.first`, since this will return true for the _first_ row and false otherwise. -->

### tableデータ行の追加
<!-- ### Add table data rows -->

このセクションではtableにデータ行を追加します。値を取得するために`pair`の二つ目のエレメントを使用します。

<!-- In this section we add the data rows to the table. Now, we use the second element of `pair`
to find the value. -->

便宜上、`tablerow`タグを使用してレンダリングします - これは` for`ループのように機能しますが、内部データは`tr`および`td`HTMLタグでレンダリングされます。残念ながら、ヘッダー行に相当するものはないため、前のセクションと同様に、完全に書き出す必要があります。

<!-- For convenience, we render using the `tablerow` tag - this works like a `for` loop, but the inner
data will be rendered with `tr` and `td` HTML tags for us. Unfortunately, there is no equivalent for
the header row, so we must write that out in full, as in the previous section. -->

{% raw %}
```liquid
---
title: Table test
---

<table>
  {% for row in site.data.authors %}
    {% if forloop.first %}
    <tr>
      {% for pair in row %}
        <th>{{ pair[0] }}</th>
      {% endfor %}
    </tr>
    {% endif %}

    {% tablerow pair in row %}
      {{ pair[1] }}
    {% endtablerow %}
  {% endfor %}
</table>
```
{% endraw %}

上記のコードで、次のようなTableが完成します。

<!-- With the code above, the complete table would look like this: -->

<table>
  <tr>
    <th>First name</th>
    <th>Last name</th>
    <th>Age</th>
    <th>Location</th>
  </tr>
  <tr>
    <td>John</td>
    <td>Doe</td>
    <td>35</td>
    <td>United States</td>
  </tr>
  <tr>
    <td>Jane</td>
    <td>Doe</td>
    <td>29</td>
    <td>France</td>
  </tr>
  <tr>
    <td>Jack</td>
    <td>Hill</td>
    <td>25</td>
    <td>Australia</td>
  </tr>
</table>

これでJekyllでCSVをHTML tableに変換できるようになりました。

<!-- That's it - you can now turn a CSV into an HTML table using Jekyll. -->

## Next steps

- Change the field names in the CSV.
- Choose a different CSV.
- Add CSS styling to your table.
- Render the table using a JSON or YAML input file.
