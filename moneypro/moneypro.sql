-- 支出

--- 年別支出
select to_char("日付", 'YYYY') as "年", "カテゴリー", sum("金額") as "合計金額"
from moneypro
where "トランザクションの種類" = '支出'
group by "年", "カテゴリー"
order by "年", "カテゴリー";

--- 月別支出
select to_char("日付", 'YYYYMM') as "年月", "カテゴリー", sum("金額") as "合計金額"
from moneypro
where "トランザクションの種類" = '支出'
group by "年月", "カテゴリー"
order by "年月", "カテゴリー";

--- カテゴリ別支出
select "カテゴリー", sum("金額") as "合計金額"
from moneypro
where "トランザクションの種類" = '支出'
group by "カテゴリー"
order by "合計金額" DESC;

--- 直近１ヶ月のカテゴリ別支出
select "カテゴリー", sum("金額") as "合計金額"
from moneypro
where "トランザクションの種類" = '支出' and "日付" > now() - cast('1 months' as INTERVAL)
group by "カテゴリー"
order by sum("金額") DESC;

-- 収入

--- 年別支出
select to_char("日付", 'YYYY') as "年", "カテゴリー", sum("金額") as "合計金額"
from moneypro
where "トランザクションの種類" = '収入'
group by "年", "カテゴリー"
order by "年", "カテゴリー";

--- 月別支出
select to_char("日付", 'YYYYMM') as "年月", "カテゴリー", sum("金額") as "合計金額"
from moneypro
where "トランザクションの種類" = '収入'
group by "年月", "カテゴリー"
order by "年月", "カテゴリー";
