-- Add document_receiver column to receiving1_documents table
-- This column will identify who received the documents in receiving1

ALTER TABLE receiving1_documents ADD COLUMN IF NOT EXISTS document_receiver VARCHAR(100) NULL; 