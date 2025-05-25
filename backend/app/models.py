from . import db

class Vehicle(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    make = db.Column(db.String(64), nullable=False)
    model = db.Column(db.String(64), nullable=False)
    year = db.Column(db.Integer, nullable=False)
    price = db.Column(db.Float)
    fuel_type = db.Column(db.String(32))
    transmission = db.Column(db.String(32))
    # Add more fields as needed