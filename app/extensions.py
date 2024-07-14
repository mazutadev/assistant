from flask_sqlalchemy import SQLAlchemy
from flask_migrate import Migrate

from flask_admin import Admin
from flask_socketio import SocketIO


# SQLAlchemy for database management
db = SQLAlchemy()

# Flask-Migrate for database migrations
migrate = Migrate()

# Flask-Admin for creating an administrative interface
admin = Admin(name='APP', template_mode='bootstrap3')

# Flask-SocketIO for WebSocket support
socketio = SocketIO()

__all__ = ['db', 'migrate', 'admin', 'socketio']
