-- Database setup for Inventory Docs users

CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    role ENUM('admin', 'receiving1', 'receiving2', 'docs', 'releasing') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


ALTER TABLE users ADD COLUMN last_seen TIMESTAMP NULL DEFAULT NULL;

-- Insert initial admin account
INSERT INTO users (username, password_hash, role)
VALUES ('admin', 'pbkdf2:sha256:600000$QWsJI2csblvgwyvZ$d8f5c9761be9e9cd7a667baf6711e7f4399a617163ab8d79bdb032eed108dcdf', 'admin')
ON DUPLICATE KEY UPDATE username=username;

-- Table for Receiving 1 Documents
CREATE TABLE IF NOT EXISTS receiving1_documents (
    id INT AUTO_INCREMENT PRIMARY KEY,
    date_received DATE NOT NULL,
    time_received TIME NOT NULL,
    control_no VARCHAR(100) NOT NULL,
    source VARCHAR(255) NOT NULL,
    particulars TEXT NOT NULL,
    received_by VARCHAR(100) NOT NULL,
    forwarded_to VARCHAR(100) NOT NULL,
    document_file VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
ALTER TABLE receiving1_documents ADD COLUMN document_blob LONGBLOB;
ALTER TABLE receiving1_documents ADD COLUMN IF NOT EXISTS date_accepted DATE NULL;
ALTER TABLE receiving1_documents ADD COLUMN IF NOT EXISTS time_accepted TIME NULL;
ALTER TABLE receiving1_documents ADD COLUMN IF NOT EXISTS document_receiver VARCHAR(100) NULL;

CREATE TABLE IF NOT EXISTS routing_transmittal_slips (
    id INT AUTO_INCREMENT PRIMARY KEY,
    doc_id INT NOT NULL,
    to_field VARCHAR(255),
    remarks TEXT,
    date DATE,
    purposes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (doc_id) REFERENCES receiving1_documents(id)
);

CREATE TABLE IF NOT EXISTS gso_documents (
    id INT AUTO_INCREMENT PRIMARY KEY,
    date DATE NOT NULL,
    supplier_name VARCHAR(255) NOT NULL,
    office VARCHAR(255) NOT NULL,
    amount DECIMAL(15,2) NOT NULL,
    forwarded_to VARCHAR(255) NOT NULL,
    document_file VARCHAR(255),
    document_blob LONGBLOB,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS travel_documents (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name_of_travelling VARCHAR(255) NOT NULL,
    date DATE NOT NULL,
    destination VARCHAR(255) NOT NULL,
    forwarded_to VARCHAR(255) NOT NULL,
    document_file VARCHAR(255),
    document_blob LONGBLOB,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS special_permit_documents (
    id INT AUTO_INCREMENT PRIMARY KEY,
    date DATE NOT NULL,
    name_of_applicant VARCHAR(255) NOT NULL,
    purpose VARCHAR(100) NOT NULL,
    duration VARCHAR(100) NOT NULL,
    forwarded_to VARCHAR(255) NOT NULL,
    document_file VARCHAR(255),
    document_blob LONGBLOB,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS application_leave_documents (
    id INT AUTO_INCREMENT PRIMARY KEY,
    control_no VARCHAR(100) NOT NULL,
    name_of_applicant VARCHAR(255) NOT NULL,
    type_of_leave VARCHAR(100) NOT NULL,
    inclusive_date VARCHAR(100) NOT NULL,
    forwarded_to VARCHAR(255) NOT NULL,
    document_file VARCHAR(255),
    document_blob LONGBLOB,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create other_documents table
CREATE TABLE IF NOT EXISTS other_documents (
    id INT AUTO_INCREMENT PRIMARY KEY,
    date_received DATE NOT NULL,
    time_received TIME NOT NULL,
    control_no VARCHAR(100),
    source VARCHAR(255),
    particulars TEXT,
    received_by VARCHAR(255),
    forwarded_to VARCHAR(255),
    document_file VARCHAR(255),
    document_blob LONGBLOB,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Add purpose/action column to other_documents table
ALTER TABLE other_documents ADD COLUMN IF NOT EXISTS purpose_action TEXT;



-- Table for Receiving 2 Documents
CREATE TABLE IF NOT EXISTS receiving2_documents (
    id INT AUTO_INCREMENT PRIMARY KEY,
    original_receiving1_id INT,
    date_received DATE,
    time_received TIME,
    control_no VARCHAR(255),
    source VARCHAR(255),
    particulars TEXT,
    received_by VARCHAR(255),
    forwarded_to VARCHAR(255),
    document_file VARCHAR(255),
    document_blob LONGBLOB,
    created_at DATETIME,
    edited_by VARCHAR(255),
    edit_reason TEXT,
    FOREIGN KEY (original_receiving1_id) REFERENCES receiving1_documents(id) ON DELETE SET NULL
);

ALTER TABLE receiving2_documents 
ADD COLUMN purposes TEXT,
ADD COLUMN remarks TEXT,
ADD COLUMN rts_date DATE,
ADD COLUMN attachment_file VARCHAR(255),
ADD COLUMN attachment_blob LONGBLOB;

-- Table for Outgoing Documents
CREATE TABLE IF NOT EXISTS outgoing_documents (
    id INT AUTO_INCREMENT PRIMARY KEY,
    date_sent DATE NOT NULL,
    time_sent TIME NOT NULL,
    control_no VARCHAR(100) NOT NULL,
    source VARCHAR(255) NOT NULL,
    particulars TEXT NOT NULL,
    forwarded_to VARCHAR(255) NOT NULL,
    document_file VARCHAR(255),
    document_blob LONGBLOB,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Table for Accepted Documents (Outgoing Docs from Receiving 1)
CREATE TABLE IF NOT EXISTS accepted_documents (
    id INT AUTO_INCREMENT PRIMARY KEY,
    original_receiving1_id INT,
    date_received DATE NOT NULL,
    time_received TIME NOT NULL,
    control_no VARCHAR(100) NOT NULL,
    source VARCHAR(255) NOT NULL,
    particulars TEXT NOT NULL,
    received_by VARCHAR(100) NOT NULL,
    forwarded_to VARCHAR(100) NOT NULL,
    document_file VARCHAR(255),
    document_blob LONGBLOB,
    date_accepted DATE NOT NULL,
    time_accepted TIME NOT NULL,
    accepted_by VARCHAR(100) NOT NULL,
    purposes TEXT,
    remarks TEXT,
    attachment_file VARCHAR(255),
    attachment_blob LONGBLOB,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (original_receiving1_id) REFERENCES receiving1_documents(id) ON DELETE SET NULL
);

