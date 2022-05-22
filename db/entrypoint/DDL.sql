-- Datalake
CREATE DATABASE datalake;
GRANT ALL PRIVILEGES ON DATABASE "datalake" TO metabase;
\c datalake;

-- MoneyPro
CREATE TABLE moneypro
(
    "日付" timestamp not null,
    "金額" int,
    "口座" varchar(50),
    "残高" int,
    "カテゴリー" varchar(100),
    "説明" varchar(255),
    "トランザクションの種類" varchar(100),
    "受取人" varchar(50),
    "チェック番号" int,
    "分類" varchar(50)
) PARTITION BY RANGE ("日付");

CREATE TABLE moneypro_2016 PARTITION OF moneypro FOR VALUES FROM ('2016-01-01') TO ('2017-01-01');
CREATE TABLE moneypro_2017 PARTITION OF moneypro FOR VALUES FROM ('2017-01-01') TO ('2018-01-01');
CREATE TABLE moneypro_2018 PARTITION OF moneypro FOR VALUES FROM ('2018-01-01') TO ('2019-01-01');
CREATE TABLE moneypro_2019 PARTITION OF moneypro FOR VALUES FROM ('2019-01-01') TO ('2020-01-01');
CREATE TABLE moneypro_2020 PARTITION OF moneypro FOR VALUES FROM ('2020-01-01') TO ('2021-01-01');
CREATE TABLE moneypro_2021 PARTITION OF moneypro FOR VALUES FROM ('2021-01-01') TO ('2022-01-01');
CREATE TABLE moneypro_2022 PARTITION OF moneypro FOR VALUES FROM ('2022-01-01') TO ('2023-01-01');
CREATE TABLE moneypro_2023 PARTITION OF moneypro FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');
CREATE TABLE moneypro_2024 PARTITION OF moneypro FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');
CREATE TABLE moneypro_2025 PARTITION OF moneypro FOR VALUES FROM ('2025-01-01') TO ('2026-01-01');
CREATE TABLE moneypro_2026 PARTITION OF moneypro FOR VALUES FROM ('2026-01-01') TO ('2027-01-01');

CREATE INDEX idx_day on moneypro("日付");
CREATE INDEX idx_category on moneypro("カテゴリー");
CREATE INDEX idx_description on moneypro("説明");
CREATE INDEX idx_transaction_type on moneypro("トランザクションの種類");