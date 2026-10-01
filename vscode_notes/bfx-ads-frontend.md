# bfx-ads-frontend

# get db running
docker compose -f docker-compose.yml up
PGPASSWORD=postgres psql -h localhost -U postgres -p 5432 -d postgres -c "CREATE DATABASE tahoedb;"


# migrate data
make db-migrate

# run backend
cd backend
uvicorn main:app --reload

# run front end
cd frontend
npm run dev


dsf example
ASERV-680


https://pdx-uat-b-antibody-data-service.nonprod-v3-eks.twistbio.co/v1/instrument/nanotemper/plates



# how to deploy bfx-ads-frontend
jenkins
go to branch (main if merged in)
main auto builds, if not main target hit build now
copy build number
spinnaker > pipelines > deploy to non prod > start manual execution
search for branchname.build_number (main.30)
choose env (pdx-uat-b)
hit run
takes about 5 mins to deploy