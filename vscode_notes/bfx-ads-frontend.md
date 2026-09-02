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