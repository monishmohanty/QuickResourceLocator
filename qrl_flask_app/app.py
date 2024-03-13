from flask import Flask
from extensions import db
from models import QRLLanguage, QRLProductCategory, QRLProduct, QRLVideo, QRLDocument
from routes import initialize_routes
from flask_cors import CORS


def create_app():
    app = Flask(__name__)
    app.config['SQLALCHEMY_DATABASE_URI'] = 'mssql+pyodbc://sa:pwd4sa@MONISH-LAPTOP/master?driver=ODBC+Driver+17+for+SQL+Server'
    app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

    CORS(app)
    db.init_app(app)

    with app.app_context():
        db.create_all() 
        initialize_routes(app)

    return app

if __name__ == '__main__':
    app = create_app()
    app.run(debug=True)
