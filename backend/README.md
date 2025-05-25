Run the containers:
```bash
docker compose up --build -d
```

If you need to seed the db:
```bash
docker compose exec vehicle_backend python ./data/seed_db.py
```

View the contents of the container:
```bash
docker exec -it vehicle_backend /bin/bash
```

Exec into the database
```bash
docker exec -it vehicle_db /bin/bash
psql -H postgresql://postgres:postgres@db:5432/vehicle_db
```