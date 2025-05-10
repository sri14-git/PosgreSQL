EXPLAIN (format JSON) SELECT * from users



[
  {
    "Plan": {
      "Node Type": "Seq Scan",
      "Parallel Aware": false,
      "Async Capable": false,
      "Relation Name": "users",
      "Alias": "users",
      "Startup Cost": 0.00,
      "Total Cost": 22.70,
      "Plan Rows": 1270,
      "Plan Width": 36
    }
  }
]