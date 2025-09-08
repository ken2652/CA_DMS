-- Drop upload document related tables
-- This script removes the admin upload functionality tables

-- Drop folder_files table first (due to foreign key constraint)
DROP TABLE IF EXISTS folder_files;

-- Drop admin_folders table
DROP TABLE IF EXISTS admin_folders;

-- Drop admin_uploads table
DROP TABLE IF EXISTS admin_uploads;

-- Verify tables are dropped
SHOW TABLES LIKE '%admin%';
SHOW TABLES LIKE '%folder%'; 