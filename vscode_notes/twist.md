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



Here is the link to some training videos on Maestro https://twistbio.atlassian.net/wiki/spaces/MES20/pages/489556353/Maestro+Training+3rd+Round

Here is the link to uat-pdx-b https://mes-laso.twistbioscience-pdx-uat-b.com/



# caliber testing
needs sample id



Nanodsf = thermostability
labchip = CE-SDS and is not on the characterization menu, but should be present once you select through the characterization assays and proceed



# NEXT STEPS to work on

finish nanoDSF with sam and then transition to bli and spr with adam

https://mes-laso.twistbioscience-pdx-uat-b.com/

and https://storage-mes.twistbioscience-pdx-uat-b.com/ which is used for viewing inventory
there's also https://mes.twistbioscience-pdx-uat-b.com/ which is Supervisor (used for viewing order info)






https://qa-test-ops-frontend.nonprod-v3-eks.twistbio.co/jobs/mes


next step for spr
Sure! It will be fairly simple, Koala UI just needs a link to the data file and we need to disable the approval until that link is clicked. We don't need to share any other data.


supervisor can be used to view different buckets
most items will be automatically moved from out buckets to in buckets unless a manual hold has been defined for that bucket


# PROD DB

--twistdb prod
hostname: twistdb-repl01.twistdna.com
db_name: twistdb251
db_user: tgreen_ro
db_password: MM1hXGBykjrM

--maestro prod
hostname: read.laso-cluster-1.prod.postgresql.twistdna.com
db_name: maestro
db_user: tgreen_ro
db_password: i8G3+j4m%FAh

--tropik prod
hostname: read.laso-cluster-1.prod.postgresql.twistdna.com
db_name: tropik
db_user: tgreen_ro
db_password: i8G3+j4m%FAh

--labdata prod
hostname: read.auxiliary.prod.postgresql.prod.twistbio.co
db_name: labdata_prod
db_user: tgreen_ro
db_password: A0M2f=Qh7oYE


# Branch and merge convention

1. branch off of main to work on feature branch
2. pr into pdx-uat-b branch and main separately
3. once merged and tested on pdx-uat-b we will merge feature branch into main
