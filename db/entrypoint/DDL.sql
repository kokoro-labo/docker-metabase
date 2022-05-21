-- Datalake
CREATE DATABASE datalake;
GRANT ALL PRIVILEGES ON DATABASE "datalake" TO metabase;
\c datalake;

-- MoneyPro
CREATE TABLE moneypro
(
    "日付" timestamp,
    "金額" int,
    "口座" varchar(50),
    "残高" int,
    "カテゴリー" varchar(100),
    "説明" varchar(255),
    "トランザクションの種類" varchar(100),
    "受取人" varchar(50),
    "チェック番号" int,
    "分類" varchar(50)
);
CREATE INDEX idx_day on moneypro("日付");
CREATE INDEX idx_category on moneypro("カテゴリー");
CREATE INDEX idx_description on moneypro("説明");
CREATE INDEX idx_transaction_type on moneypro("トランザクションの種類");