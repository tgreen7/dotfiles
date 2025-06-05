# twist

# how to run api with postman

open app-proxy/ssh-tunnel-server/index.js
and add these consoles (can use s + enter to fast refresh ssh server)

```js
console.log(`TWIST_PROXY_URL:`, process.env.TWIST_PROXY_URL)
console.log(`process.env.TWIST_API_CLIENT_TOKEN:`, process.env.TWIST_API_CLIENT_TOKEN)
console.log(`process.env.TWIST_END_USER_TOKEN:`, process.env.TWIST_END_USER_TOKEN)
```

- use the url for postman (with whatever route you want to hit. ex. `http://localhost:52651/v1/users/eduardo@teselagen.com/vectors`)
- TWIST_API_CLIENT_TOKEN prepended with JWT for `Authorization` header
- TWIST_END_USER_TOKEN for `x-end-user-token` header