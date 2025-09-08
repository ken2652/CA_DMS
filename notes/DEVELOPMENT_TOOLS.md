### Programming Languages and Technologies

- **Python 3.x**: Backend application code and utility scripts.
- **Flask (Python)**: Web framework and request routing.
- **Jinja2 (Python)**: Server-side HTML templating used by files in `templates/`.
- **SQL (MySQL dialect)**: Database schema and queries (see `database/*.sql`).
- **HTML5**: Page structure for all templates in `templates/`.
- **CSS3**: Styling under `static/style.css`.
- **JavaScript (ES5/ES6)**: Client-side interactions embedded in templates.
- **Batch / PowerShell**: Windows scripts to launch the app and configure network/IP.

### Development Tools and What They’re Used For

- **Python 3.x**: Runtime for the application and scripts.
- **Flask**: Web framework for routing, request handling, and serving `templates/` and `static/` assets.
- **Jinja2 (via Flask)**: Templating engine used by HTML files in `templates/`.
- **Werkzeug**: WSGI utilities and server components used by Flask's server.
- **MySQL Server**: Primary database for application data (schema SQL in `database/`).
- **MySQL Python Driver**:
  - `mysql-connector-python` is referenced by `db.py` (imports `mysql.connector`).
  - `PyMySQL` is listed in `notes/requirements.txt`.
  - Use one driver consistently. If you keep `db.py` as-is, install `mysql-connector-python`. If you prefer `PyMySQL`, update `db.py` accordingly.
- **cryptography**: Used for security-related utilities (see `generate_hash.py`).
- **Windows PowerShell / Batch**: Helper scripts to start the app and set IPs:
  - `start_app.bat`, `start_app_with_ip.py`, `static_ip_setup.bat`, `set_static_ip.ps1`, `set_static_ip.bat`.
- **Network Utilities**: App can display network info (see `/network_info`, `start_app_with_ip.py`).
- **SQL Setup/Migration Scripts**: Database setup in `database/*.sql`.
- **IDE/Editor**: Any editor; this project works well with Cursor/VS Code.

### Install Dependencies

- Using the requirements file in `notes/requirements.txt`:
```bash
pip install -r notes/requirements.txt
```
- If you keep `db.py` unchanged, also install the connector it uses:
```bash
pip install mysql-connector-python
```

### Running the App

- Quick start (opens with network info):
```bash
python start_app_with_ip.py
```
- Or run directly (inside the project directory):
```bash
python -c "from app import app; app.run(host='0.0.0.0', port=5000, debug=False)"
```
- Windows batch helper:
```bash
./start_app.bat
```

### Database Setup

- Create the schema using scripts in `database/` (order depends on your environment):
  - `db_setup.sql`, `db_setup_docs_folders.sql`, `db_setup_folders.sql`, `db_setup_releasing_folders.sql`, etc.
- Update credentials/host in `db.py` to match your MySQL instance.

### Notes on the MySQL Driver

- Current code in `db.py` uses `mysql.connector` (from `mysql-connector-python`).
- `notes/requirements.txt` lists `PyMySQL`. Choose one path:
  - Keep `mysql-connector-python`: install it and leave `db.py` as-is.
  - Switch to `PyMySQL`: change `db.py` to import and use `pymysql.connect(...)`.

### Useful Scripts

- `generate_hash.py`: Utility for generating hashes (requires `cryptography`).
- `test_ip.py`: Helper for network/IP testing.

### Where Things Live

- `app.py`: Flask app entry and routes (server-side logic).
- `db.py`: Database connection helper.
- `templates/`: Jinja2 HTML templates (organized by feature areas like `receiving/`, `admin receiving/`, `releasing/`, `admin/`, `docs/`).
- `static/`: CSS, images, and other static assets.
- `database/`: SQL scripts for schema and migrations.
- `notes/`: Documentation, requirements, and this file.
