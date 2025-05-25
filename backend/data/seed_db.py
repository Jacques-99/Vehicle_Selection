import csv
from app import create_app, db
from app.models import Vehicle

app = create_app()

def seed_vehicles(csv_path):
    with app.app_context():
        with open(csv_path, newline='', encoding='utf-8') as csvfile:
            reader = csv.DictReader(csvfile)
            for row in reader:
                vehicle = Vehicle(
                    make=row.get('make'),
                    model=row.get('model'),
                    year=int(row.get('year', 0)),
                    price=float(row.get('price', 0)) if row.get('price') else None,
                    fuel_type=row.get('fuel_type'),
                    transmission=row.get('transmission')
                    # Add more fields as needed
                )
                db.session.add(vehicle)
            db.session.commit()
        print("Database seeded successfully.")

if __name__ == "__main__":
    seed_vehicles("./cars_dataset.csv")