import csv
from app import create_app, db
from app.models import Vehicle
import os

def seed_vehicles(csv_path):
    with open(csv_path, newline='', encoding='utf-8') as csvfile:
        reader = csv.DictReader(csvfile)
        for row in reader:
            vehicle = Vehicle(
                make=row.get('Make', '').strip(),
                model=row.get('model', '').strip(),
                year=int(row.get('year', 0)),
                price=float(row.get('price', 0)) if row.get('price') else None,
                fuel_type=row.get('fuelType', '').strip(),
                transmission=row.get('transmission', '').strip()
                # Add more fields as needed
            )
            db.session.add(vehicle)
        db.session.commit()
    print("Database seeded successfully.")

if __name__ == "__main__":
    app = create_app()
    with app.app_context():
        db.create_all()
        # Only seed if table is empty
        if Vehicle.query.first() is None:
            csv_path = os.path.join(os.path.dirname(__file__), 'data', 'cars_dataset.csv')
            seed_vehicles(csv_path)
        else:
            print("Database already seeded.")
