## usersテーブル

|Column                 |Type  |Options                 |
|-----------------------|------|------------------------|
|email                  |string|null:false, unique: true|
|encrypted_password     |string|null:false              |
|name                   |string|null:false              |
|nickname               |string|null:false              |
|birthday               |string|null:false              |


## itemsテーブル

|Column                 |Type  |Options                 ｜
|-----------------------|------|------------------------|
|product name           |string|null:false              |
|product image          |string|null:false              |
|description of item    |string|null:false              |
|category               |string|null:false              |
|product status         |string|null:false              |
|delivery charge        |string|null:false              |
|shipment source        |string|null:false              |
|price                  |string|null:false              |
|seller name            |string|null:false              |


## purchaseテーブル

|Column                 |Type  |Options                 ｜
|-----------------------|------|------------------------|
|buyer name             |string|null:false              |
|purchase history       |string|null:false              |


## shipping addressテーブル

|Column                 |Type  |Options                 |
|-----------------------|------|------------------------|
|postal code            |string|null:false              |
|prefectures            |string|null:false              |
|municipality           |string|null:false              |
|shipping days          |string|null:false              |
|buyer name             |string|null:false              |