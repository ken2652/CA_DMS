-- Create table for document folders
CREATE TABLE IF NOT EXISTS document_folders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    folder_name VARCHAR(255) NOT NULL,
    folder_description TEXT,
    created_by VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Create table for folder files
CREATE TABLE IF NOT EXISTS folder_files (
    id INT AUTO_INCREMENT PRIMARY KEY,
    folder_id INT NOT NULL,
    file_name VARCHAR(255) NOT NULL,
    file_blob LONGBLOB,
    file_size INT,
    file_type VARCHAR(100),
    uploaded_by VARCHAR(100) NOT NULL,
    uploaded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (folder_id) REFERENCES document_folders(id) ON DELETE CASCADE
);

-- Add indexes for better performance
CREATE INDEX idx_folder_files_folder_id ON folder_files(folder_id);
CREATE INDEX idx_document_folders_created_at ON document_folders(created_at); 