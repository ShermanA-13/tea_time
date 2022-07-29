## [Endpoints](#endpoints)
   - [POST Tea](#tea-post)
   - [POST Customer](#customer-post)
   - [GET Subscription](#sub-get)
   - [POST Subscription](#sub-post)
   - [PATCH Subscription](#sub-patch)
---
<br>

<a id="tea-post">**POST Tea**</a><br>
*Will create a `Tea` in the database*

```
    post "/api/v1/teas"
```
Request:
```json
 {
      "title": "Green Tea",
      "description": "Organic Japanese Green Tea",
      "temperature": 167,
      "brew_time": "Between 1 to 4 minutes"
    }
```
Response:
```json
{
    "data": {
        "id": "1",
        "type": "tea",
        "attributes": {
            "title": "Green Tea",
            "description": "Organic Japanese Green Tea",
            "temperature": 167,
            "brew_time": "Between 1 to 4 minutes"
        }
    }
}
```
---
<br>

<a id="customer-post">**POST Customer**</a><br>
*Will create a `Customer` in the database*
```
    post "/api/v1/customers"
```

Request:
```json
{
      "first_name": "Shernman",
      "last_name": "Au",
      "email": "sherman@email.com",
      "address": "1234 Somewhere St."
    }
```
Response:
```json
{
    "data": {
        "id": "1",
        "type": "customer",
        "attributes": {
            "id": 1,
            "first_name": "Shernman",
            "last_name": "Au",
            "email": "sherman@email.com",
            "address": "1234 Somewhere St."
        }
    }
}
```
---
<br>

<a id="sub-get">**GET Subscription**</a><br>
*Will get all `Customer's Subscriptions` in the database*
```
    post "/api/v1/customers/:customer_id/subscriptions"
```

Response:
```json
{
    "data": [
        {
            "id": "1",
            "type": "subscription",
            "attributes": {
                "customer_id": 1,
                "tea_id": 1,
                "title": "Green Tea Fix",
                "price": 12.5,
                "frequency": "monthly",
                "status": "active"
            }
        },
        {
            "id": "2",
            "type": "subscription",
            "attributes": {
                "customer_id": 1,
                "tea_id": 2,
                "title": "Uncle Iroh 4 Lyfe",
                "price": 16.5,
                "frequency": "weekly",
                "status": "cancelled"
            }
        }
    ]
}
```
---
<br>

<a id="sub-post">**POST Subscription**</a><br>
*Will create a new `Customer's Subscription` in the database*
```
    post "/api/v1/customers/:customer_id/subscriptions"
```

Request:
```json
{
  "customer_id": 1,
  "tea_id": 3,
  "title": "Breakfast Time",
  "price": 16.50,
  "frequency": 1,
  "status": 0
 }
```
Response:
```json
{
    "data": {
        "id": "4",
        "type": "subscription",
        "attributes": {
            "customer_id": 1,
            "tea_id": 3,
            "title": "Breakfast Time",
            "price": 16.5,
            "frequency": "monthly",
            "status": "active"
        }
    }
}
```
---
<br>

<a id="sub-post">**PATCH Subscription**</a><br>
*Will update the status of a `Customer's Subscription` in the database*
```
    post "api/v1/customers/:customer_id/subscriptions/:id"
```

Request:
```json
{
  "customer_id": 1,
  "tea_id": 3,
  "title": "Breakfast Time",
  "price": 16.50,
  "frequency": 1,
  "status": "cancelled"
 }
```
Response:
```json
{
    "data": {
        "id": "1",
        "type": "subscription",
        "attributes": {
            "customer_id": 1,
            "tea_id": 3,
            "title": "Breakfast Time",
            "price": 16.5,
            "frequency": "monthly",
            "status": "cancelled"
        }
    }
}
```
---
<br>
