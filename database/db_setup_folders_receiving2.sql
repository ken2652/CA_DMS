-- Database setup for Receiving2 Document Folders
-- This creates separate tables for receiving2 document management

-- Create table for receiving2 document folders
CREATE TABLE IF NOT EXISTS receiving2_document_folders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    folder_name VARCHAR(255) NOT NULL,
    folder_description TEXT,
    created_by VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create table for receiving2 folder files
CREATE TABLE IF NOT EXISTS receiving2_folder_files (
    id INT AUTO_INCREMENT PRIMARY KEY,
    folder_id INT NOT NULL,
    file_name VARCHAR(255) NOT NULL,
    file_blob LONGBLOB,
    file_size INT,
    file_type VARCHAR(100),
    uploaded_by VARCHAR(255) NOT NULL,
    uploaded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (folder_id) REFERENCES receiving2_document_folders(id) ON DELETE CASCADE
);

-- Create indexes for better performance
CREATE INDEX idx_receiving2_folder_files_folder_id ON receiving2_folder_files(folder_id);
CREATE INDEX idx_receiving2_document_folders_created_at ON receiving2_document_folders(created_at); 