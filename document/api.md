# Doubly Score API v1.00

## API一覧

### [ユーザー関連 ( /users/\* )](#users_api)

- [ユーザー登録](#register_user)
- [ユーザー削除](#delete_user)
- [ログイン](#login)
- [ログアウト](#logout)
- [自分の情報の取得](#get_self_info)
- [自分の情報の編集](#update_self_info)
- [特定ユーザーの情報の取得](#get_others_info)
- [特定ユーザーの対戦一覧の取得](#get_others_battles)
- [特定ユーザーの対局一覧の取得](#get_others_matches)

### [ルール関連 ( /rules/\* )](#rules_api)

- [ルールの登録](#register_rule)
- [ルール一覧の取得](#get_rules)

### [対戦関連 ( /battles/\* )](#battles_api)

- [対戦の追加](#register_battle)
- [対戦の編集](#update_battle)
- [対戦の削除](#delete_battle)
- [対戦一覧の取得](#get_battles)

### [対局関連 ( /matches/\* )](#matches_api)

- [対局の追加](#register_match)
- [対局の編集](#update_match)
- [対局の削除](#delete_match)
- [対局一覧の取得](#get_matches)

### [汎用API ( / )](#general_api)

- [スコアをポイントに換算](#score_to_point)

---

<div id="users_api">

## ユーザー関連

</div>

<div id="register_user">

### ユーザー登録
- URL: /v1/users
- メソッド: post 
- クエリパラメータ:
```json:
{
  "username": "ユーザー名",      // 入力値 
  "email"   : "メールアドレス",  // 入力値
  "password": "パスワード",      // 入力値
}
```

- レスポンス:
  - 成功時: 
  ```json:
  {
    "userId": "ユーザーID",
  }
  ```

  - 失敗時:
  ```json:
  {
  }
  ```

</div>

<div id="delete_user">

### ユーザー削除
- URL: /v1/users
- メソッド: delete 
- クエリパラメータ: 
```json:
{
  "userId": "ユーザーID",  // 自動
}
```

- レスポンス:
  - 成功時: 
  ```json:
  {
  }
  ```

  - 失敗時:
  ```json:
  {
  }
  ```

- 備考: 他のユーザーが勝手に削除できないように設定する必要がある

</div>

<div id="login">

### ログイン

- URL: /v1/users/login
- メソッド: get 
- クエリパラメータ:
```json:
{
  "email"   : "メールアドレス",  // 入力値
  "password": "パスワード",      // 入力値
}
```

- レスポンス:
  - 成功時: 
  ```json:
  {
    "userId": "ユーザーid",
  }
  ```

  - 失敗時:
  ```json:
  {
  }
  ```

</div>

<div id="logout">

### ログアウト

- URL: /v1/users/logout
- メソッド: get
- クエリパラメータ: なし

</div>

<div id="get_self_info">

### 自分の情報の取得

- URL: /v1/users/self
- メソッド: get
- クエリパラメータ:
```json:
{
  "userId": "ユーザーID", // 自動 
}
```

- レスポンス:
  - 成功時: 
  ```json:
  {
  }
  ```

  - 失敗時:
  ```json:
  {
  }
  ```

</div>

<div id="update_self_info">

### 自分の情報の編集

- URL: /v1/users/self
- メソッド: put 
- クエリパラメータ:
```json:
{
  "username": "ユーザー名",      // 入力値 
  "email"   : "メールアドレス",  // 入力値
  "password": "パスワード",      // 入力値
}
```

- レスポンス:
  - 成功時: 
  ```json:
  {
  }
  ```

  - 失敗時:
  ```json:
  {
  }
  ```

- 備考: 他のユーザーが勝手に編集できないように設定する必要がある

</div>

<div id="get_others_info">

### 特定ユーザーの情報の取得 

- URL: /v1/users/:userid
- メソッド: get 
- クエリパラメータ: なし

- レスポンス:
  - 成功時: 
  ```json:
  {
  }
  ```

  - 失敗時:
  ```json:
  {
  }
  ```

</div>

<div id="get_others_battles">

### 特定ユーザーの対戦一覧の取得 

- URL: /v1/users/:userid/battles
- メソッド: get 
- クエリパラメータ: 
```json:
{
  "maxItem": "最大取得アイテム数",  // 入力値 
}
```

- レスポンス:
  - 成功時: 
  ```json:
  {
  }
  ```

  - 失敗時:
  ```json:
  {
  }
  ```

</div>

<div id="get_others_matches">

### 特定ユーザーの対局一覧の取得

- URL: /v1/users/:userid/battles/:battleid
- メソッド: get 
- クエリパラメータ: 
```json:
{
  "maxItem": "最大取得アイテム数",  // 入力値 
}
```

- レスポンス:
  - 成功時: 
  ```json:
  {
  }
  ```

  - 失敗時:
  ```json:
  {
  }
  ```

</div>

---

<div id="rules_api">

## ルール関連

</div>

<div id="register_rule">

### ルールの登録

- URL: /v1/rules
- メソッド: post
- クエリパラメータ:
```json:
{
  "gameType"     : "対戦種別",          // 3 or 4
  "origin"       : "原点",              // 入力値
  "repayment"    : "返し点",            // 入力値
  "firstPrize"   : "1位ウマ",           // 入力値
  "secondPrize"  : "2位ウマ",           // 入力値
  "thirdPrize"   : "3位ウマ",           // 入力値
  "fourthPrize"  : "4位ウマ",           // 入力値
  "knockout"     : "トビ設定",          // 0, 1, 2
  "knockoutPoint": "トビポイント",      // 入力値
  "neverWon"     : "ヤキトリ設定",      // true or false
  "neverWonPoint": "ヤキトリポイント",  // 入力値
  "debt"         : "箱下精算設定",      // true or false
}
```

- レスポンス:
  - 成功時: 
  ```json:
  {
  }
  ```

  - 失敗時:
  ```json:
  {
  }
  ```

</div>

<div id="get_rules">

### ルール一覧の取得

- URL: /v1/rules
- メソッド: get
- クエリパラメータ:
```json:
{
  "userId": "ユーザーID",
}
```

- レスポンス:
  - 成功時: 
  ```json:
  {
  }
  ```

  - 失敗時:
  ```json:
  {
  }
  ```

</div>

--- 

<div id="battles_api">

## 対戦関連

</div>

<div id="register_battle">

### 対戦の追加

- URL: /v1/battles
- メソッド: post 
- クエリパラメータ:
```json:
{
  "ruleId": "ルールID", // 入力
  "players": [
    {
      "userId": "ユーザーID",
    },
    {
      "userId": "ユーザーID",
    },
    {
      "userId": "ユーザーID",
    },
    {
      "userId": "ユーザーID",
    },
    // ...
  ],
}
```

- レスポンス:
  - 成功時: 
  ```json:
  {
  }
  ```

  - 失敗時:
  ```json:
  {
  }
  ```

</div>

<div id="update_battle">

### 対戦の編集

- URL: /v1/battles/:battleid
- メソッド: put 
- クエリパラメータ:
```json:
{
  "userId": "ユーザーID", // 自動 
}
```

- レスポンス:
  - 成功時: 
  ```json:
  {
  }
  ```

  - 失敗時:
  ```json:
  {
  }
  ```

- 備考: 他のユーザーが勝手に編集できないように設定する必要がある

</div>

<div id="delete_battle">

### 対戦の削除

- URL: /v1/battles/:battleid
- メソッド: delete 
- クエリパラメータ:
```json:
{
  "userId": "ユーザーID", // 自動 
}
```

- レスポンス:
  - 成功時: 
  ```json:
  {
  }
  ```

  - 失敗時:
  ```json:
  {
  }
  ```

- 備考: 他のユーザーが勝手に削除できないように設定する必要がある

</div>

<div id="get_battles">

### 対戦一覧の取得

- URL: /v1/battles
- メソッド: get
- クエリパラメータ:
```json:
{
  "userId": "ユーザーID", // 自動 
}
```

- レスポンス:
  - 成功時: 
  ```json:
  {
  }
  ```

  - 失敗時:
  ```json:
  {
  }
  ```

</div>

---

<div id="matches_api">

## 対局関連

</div>

<div id="register_match">

### 対局の追加

- URL: /v1/battles/:battleid/matches
- メソッド: post
- クエリパラメータ:
```json:
{
  "userId": "ユーザーID", // 自動 
}
```

- レスポンス:
  - 成功時: 
  ```json:
  {
  }
  ```

  - 失敗時:
  ```json:
  {
  }
  ```

</div>

<div id="update_match">

### 対局の編集

- URL: /v1/battles/:battleid/matches/:matchid
- メソッド: put
- クエリパラメータ:
```json:
{
  "userId": "ユーザーID", // 自動 
}
```

- レスポンス:
  - 成功時: 
  ```json:
  {
  }
  ```

  - 失敗時:
  ```json:
  {
  }
  ```

- 備考: 他のユーザーが勝手に編集できないように設定する必要がある

</div>

<div id="delete_match">

### 対局の削除

- URL: /v1/battles/:battleid/matches/:matchid
- メソッド: delete
- クエリパラメータ:
```json:
{
  "userId": "ユーザーID", // 自動 
}
```

- レスポンス:
  - 成功時: 
  ```json:
  {
  }
  ```

  - 失敗時:
  ```json:
  {
  }
  ```

- 備考: 他のユーザーが勝手に削除できないように設定する必要がある

</div>

<div id="get_matches">

### 対局一覧の取得

- URL: /v1/battles/:battleid/matches
- メソッド: get
- クエリパラメータ:
```json:
{
  "userId": "ユーザーID", // 自動 
}
```

- レスポンス:
  - 成功時: 
  ```json:
  {
  }
  ```

  - 失敗時:
  ```json:
  {
  }
  ```

</div>

---

<div id="general_api">

## 汎用API 

</div>

<div id="score_to_point">

### スコアをポイントに換算 

- URL: /v1/hoge/fuga
- メソッド: get
- クエリパラメータ:
```json:
{
  "score": "スコア", // 入力 
}
```

- レスポンス:
  - 成功時: 
  ```json:
  {
  }
  ```

  - 失敗時:
  ```json:
  {
  }
  ```

</div>
