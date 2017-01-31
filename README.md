# README

This is a trivial API-only app which lets clients create a new user account and lets users view other users info.

## API

### Creating users

`POST /api/users`


**Examples**

Successful account creation

```
curl -H "Content-Type: application/json" -X POST -d '{"user":{"email": "john@gmail.com","first_name": "John","password":"password","password_confirmation":"password","last_name": "Nash","zip_code": "46361","street": "Second street","country": "United States of America"}}' http://test-app.dev:3000/api/users/
```

Response

  ```
  {
    "id": 1,
    "email": "john@gmail.com",
    "first_name": "John",
    "last_name": "Nash",
    "zip_code": "46361",
    "street": "Second street",
    "country": "United States of America",
    "created_at": "2017-01-31T20:36:40.509Z",
    "updated_at": "2017-01-31T20:36:40.509Z"
  }
  ```

Unsuccessful acccount creation

  ```
  curl -H "Content-Type: application/json" -X POST -d '{"user":{"email": "","first_name": "John","password":"password","password_confirmation":"pass","last_name": "Nash","zip_code": "46361","street": "Second Street","country": ""}}' http://test-app.dev:3000/api/users/
  ```

Response

  ```
    {
      "errors":
        {
          "email": ["can't be blank"],
          "password_confirmation": ["doesn't match Password"],
          "country": ["can't be blank"]
        }
    }
  ```

### Display user

`GET /api/users/:id`

**Examples**

Request for an existent user

```
curl http://test-app.dev:3000/api/users/1
```

Response

  ```
  {
    "id": 1,
    "email": "john@gmail.com",
    "first_name": "John",
    "last_name": "Nash",
    "zip_code": "46361",
    "street": "Second street",
    "country": "United States of America",
    "created_at": "2017-01-31T20:36:40.509Z",
    "updated_at": "2017-01-31T20:36:40.509Z"
  }
  ```

Request for a non-existent user

```
curl http://test-app.dev:3000/api/users/nope
```

Response
  ```
  {
    "error": "User does not exist"
  }
  ```

**Note**: I am using [prax](https://github.com/ysbaddaden/prax) as a proxy server to perform the `curl` requests
