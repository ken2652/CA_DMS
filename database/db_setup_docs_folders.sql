-- Database setup for Docs Document Folder System
-- This creates separate tables for the docs role's document folder functionality

-- Table for storing document folders in docs system
CREATE TABLE IF NOT EXISTS docs_document_folders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    folder_name VARCHAR(255) NOT NULL,
    folder_description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_by VARCHAR(100) NOT NULL,
    file_count INT DEFAULT 0
);

-- Table for storing files within folders in docs system
CREATE TABLE IF NOT EXISTS docs_folder_files (
    id INT AUTO_INCREMENT PRIMARY KEY,
    folder_id INT NOT NULL,
    file_name VARCHAR(255) NOT NULL,
    file_type VARCHAR(100),
    file_size INT,
    file_data LONGBLOB NOT NULL,
    uploaded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    uploaded_by VARCHAR(100) NOT NULL,
    FOREIGN KEY (folder_id) REFERENCES docs_document_folders(id) ON DELETE CASCADE
);

-- Index for better performance
CREATE INDEX idx_docs_folder_id ON docs_folder_files(folder_id);
CREATE INDEX idx_docs_folder_name ON docs_document_folders(folder_name);
CREATE INDEX idx_docs_created_at ON docs_document_folders(created_at); 