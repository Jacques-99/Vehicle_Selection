from flask import Blueprint, jsonify, request
from .models import Vehicle
from . import db

main = Blueprint('main', __name__)

@main.route("/")
def landing_page():
    return "<p>Hello, World!</p>"      

@main.route('/api/vehicles', methods=['GET'])
def get_vehicles():
    vehicles = Vehicle.query.all()
    return jsonify([{
        "id": v.id,
        "make": v.make,
        "model": v.model,
        "year": v.year,
        "price": v.price,
        "fuel_type": v.fuel_type,
        "transmission": v.transmission
    } for v in vehicles])

@main.route('/api/vehicle', methods=['POST'])
def add_vehicle():
    data = request.json
    vehicle = Vehicle(
        make=data['make'],
        model=data['model'],
        year=data['year'],
        price=data.get('price'),
        fuel_type=data.get('fuel_type'),
        transmission=data.get('transmission')
    )
    db.session.add(vehicle)
    db.session.commit()
    return jsonify({"message": "Vehicle added", "id": vehicle.id}), 201
