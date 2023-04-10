DROP TABLE `options_scrape_data`;

CREATE EXTERNAL TABLE IF NOT EXISTS `historical_data`.`options_scrape_data` (
  `strike_price` int,
  `puts_ltp` double,
  `calls_ltp` double,
  `puts_chng_in_oi` int,
  `calls_chng_in_oi` int,
  `puts_volume` int,
  `calls_volume` int,
  `puts_oi` int,
  `calls_oi` int,
  `puts_iv` double,
  `calls_iv` double,
  `puts_net_chng` double,
  `calls_net_chng` double,
  `puts_bid_price` double,
  `puts_ask_price` double,
  `calls_bid_price` double,
  `calls_ask_price` double,
  `puts_bid_qty` double,
  `puts_ask_qty` double,
  `calls_bid_qty` double,
  `calls_ask_qty` double,
  `execution_time` string
)
PARTITIONED BY (
  `Expiry_date` string,
  `Stock` string,
  `Expiry` string
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
LOCATION 's3://titania-options-data/options/'
TBLPROPERTIES ('classification' = 'csv');

MSCK REPAIR TABLE historical_data.options_scrape_data;

ALTER TABLE historical_data.options_scrape_data ADD PARTITION (Expiry_date='20-04-2023', Stock='Nifty', Expiry='20-04-2023') LOCATION 's3://titania-options-data/options/Nifty/20-04-2023/';
