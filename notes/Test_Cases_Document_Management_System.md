# Document Management System - Test Cases
**Application: Inventory Document Management System**  
**Version: 1.0**  
**Date: December 2024**

---

## Table of Contents
1. [User Authentication & Authorization](#user-authentication--authorization)
2. [Admin Dashboard](#admin-dashboard)
3. [Receiving1 Module](#receiving1-module)
4. [Receiving2 Module](#receiving2-module)
5. [Document Management (Docs) Module](#document-management-docs-module)
6. [Releasing Module](#releasing-module)
7. [User Management](#user-management)
8. [Document Folder Management](#document-folder-management)
9. [File Upload & Preview](#file-upload--preview)
10. [Search & Filter Functionality](#search--filter-functionality)

---

## 1. User Authentication & Authorization

### TC001: User Login - Valid Credentials
**Objective:** Verify successful login with valid credentials  
**Precondition:** User has valid account  
**Test Steps:**
1. Navigate to login page
2. Enter valid username
3. Enter valid password
4. Click "Login" button
**Expected Result:** User should be redirected to appropriate dashboard based on role

### TC002: User Login - Invalid Credentials
**Objective:** Verify login fails with invalid credentials  
**Test Steps:**
1. Navigate to login page
2. Enter invalid username
3. Enter invalid password
4. Click "Login" button
**Expected Result:** Error message displayed, user remains on login page

### TC003: Role-Based Access Control
**Objective:** Verify users can only access modules based on their role  
**Test Steps:**
1. Login as different user roles (admin, receiving1, receiving2, docs, releasing)
2. Try to access modules not assigned to user's role
**Expected Result:** Users should only see and access modules assigned to their role

### TC004: Session Management
**Objective:** Verify session timeout and logout functionality  
**Test Steps:**
1. Login to system
2. Leave system idle for 5+ minutes
3. Try to access protected pages
4. Test logout functionality
**Expected Result:** Session should timeout, logout should clear session

---

## 2. Admin Dashboard

### TC005: Admin Dashboard Statistics
**Objective:** Verify dashboard displays correct statistics  
**Test Steps:**
1. Login as admin
2. View admin dashboard
3. Check all statistics cards
**Expected Result:** Should display accurate counts for:
- Total users
- Total documents
- Daily documents
- Other documents
- GSO documents
- Travel documents
- Special permit documents
- Application leave documents

### TC006: Recent Documents Display
**Objective:** Verify recent documents are displayed correctly  
**Test Steps:**
1. Login as admin
2. View recent documents section
3. Check document details
**Expected Result:** Should show documents added today with correct information

### TC007: Admin Document Browser
**Objective:** Verify document browser functionality  
**Test Steps:**
1. Access admin document browser
2. View folders grouped by source
3. Check file counts
**Expected Result:** Should display folders with correct file counts and dates

---

## 3. Receiving1 Module

### TC008: Add New Document
**Objective:** Verify adding new document functionality  
**Precondition:** Login as receiving1 user or admin  
**Test Steps:**
1. Navigate to Receiving1 → Add Document
2. Fill in all required fields:
   - Date Received
   - Time
   - Control #
   - Source
   - Particulars
   - Received By
   - Document Receiver
   - Forwarded To
3. Upload document file
4. Check "Route to Admin Receiving" if needed
5. Click "Add Document"
**Expected Result:** Document should be added successfully, success message displayed

### TC009: Document Validation
**Objective:** Verify form validation  
**Test Steps:**
1. Try to submit form with missing required fields
2. Try to submit without file upload
3. Try invalid date/time formats
**Expected Result:** Appropriate error messages should be displayed

### TC010: Edit Document
**Objective:** Verify document editing functionality  
**Test Steps:**
1. View existing document
2. Click "Edit" button
3. Modify document details
4. Upload new file (optional)
5. Submit changes
**Expected Result:** Document should be updated successfully

### TC011: View Document Details
**Objective:** Verify document details modal  
**Test Steps:**
1. Click "View Details" on any document
2. Check all displayed information
**Expected Result:** Should show complete document information including new Document Receiver field

### TC012: Document Search
**Objective:** Verify search functionality  
**Test Steps:**
1. Use search box to search by source or control number
2. Test with partial matches
3. Test with exact matches
**Expected Result:** Should filter results correctly

### TC013: Document Records
**Objective:** Verify document records page  
**Test Steps:**
1. Navigate to Document Records
2. View all documents
3. Check monthly statistics
**Expected Result:** Should display all documents with correct statistics

### TC014: Document Folder Management
**Objective:** Verify folder creation and management  
**Test Steps:**
1. Navigate to Document Folder
2. Create new folder with multiple files
3. View folder contents
4. Download files
5. Preview files
**Expected Result:** Folders should be created and managed correctly

---

## 4. Receiving2 Module

### TC015: Receiving2 Dashboard
**Objective:** Verify receiving2 dashboard functionality  
**Test Steps:**
1. Login as receiving2 user
2. View dashboard statistics
3. Check document groupings by date
**Expected Result:** Should display correct statistics and grouped documents

### TC016: RTS (Routing Transmittal Slips)
**Objective:** Verify RTS functionality  
**Test Steps:**
1. View RTS page
2. Check unaccepted documents
3. Accept document from receiving1
4. Fill in acceptance details
5. Submit acceptance
**Expected Result:** Document should be accepted and moved to accepted documents

### TC017: Email Documents Management
**Objective:** Verify email documents functionality  
**Test Steps:**
1. Add email document
2. Fill in all fields including purpose/action checkboxes
3. Upload document
4. View email documents list
**Expected Result:** Email documents should be added and managed correctly

### TC018: Outgoing Documents
**Objective:** Verify outgoing documents functionality  
**Test Steps:**
1. View outgoing documents
2. Check accepted documents
3. Verify statistics
**Expected Result:** Should display correct outgoing document information

### TC019: Receiving2 Document Folder
**Objective:** Verify receiving2 folder management  
**Test Steps:**
1. Create folder in receiving2
2. Upload multiple files
3. Search folders
4. Download and preview files
**Expected Result:** Folder management should work correctly

---

## 5. Document Management (Docs) Module

### TC020: GSO Documents
**Objective:** Verify GSO document management  
**Test Steps:**
1. Add GSO document
2. Fill in supplier, office, amount details
3. Upload document
4. View GSO documents list
5. Check statistics (today, month, all time)
**Expected Result:** GSO documents should be managed correctly

### TC021: Travel Documents
**Objective:** Verify travel document management  
**Test Steps:**
1. Add travel document
2. Fill in traveler name, destination, date
3. Upload document
4. View travel documents
**Expected Result:** Travel documents should be managed correctly

### TC022: Special Permit Documents
**Objective:** Verify special permit management  
**Test Steps:**
1. Add special permit
2. Fill in applicant, purpose, duration
3. Upload document
4. View special permits
**Expected Result:** Special permits should be managed correctly

### TC023: Application Leave Documents
**Objective:** Verify application leave management  
**Test Steps:**
1. Add application leave
2. Fill in control number, applicant, leave type
3. Upload document
4. View application leaves
**Expected Result:** Application leaves should be managed correctly

### TC024: Docs Document Folder
**Objective:** Verify docs folder management  
**Test Steps:**
1. Create folder in docs module
2. Upload multiple files
3. Search folders and files
4. Download and preview files
**Expected Result:** Docs folder management should work correctly

---

## 6. Releasing Module

### TC025: Add Outgoing Document
**Objective:** Verify outgoing document creation  
**Test Steps:**
1. Add outgoing document
2. Fill in date sent, control number, source, particulars
3. Upload document
4. Submit
**Expected Result:** Outgoing document should be created successfully

### TC026: Outgoing Records
**Objective:** Verify outgoing records functionality  
**Test Steps:**
1. View outgoing records
2. Filter by month/day
3. Check statistics
**Expected Result:** Should display correct outgoing records and statistics

### TC027: Releasing Document Folder
**Objective:** Verify releasing folder management  
**Test Steps:**
1. Create folder in releasing module
2. Upload multiple files
3. Search folders
4. Download and preview files
**Expected Result:** Releasing folder management should work correctly

---

## 7. User Management

### TC028: Create New User
**Objective:** Verify user creation functionality  
**Precondition:** Login as admin  
**Test Steps:**
1. Navigate to User Management
2. Click "Create User"
3. Fill in username, password, role
4. Submit
**Expected Result:** New user should be created successfully

### TC029: User Role Assignment
**Objective:** Verify role assignment works correctly  
**Test Steps:**
1. Create users with different roles
2. Login with each user
3. Verify access permissions
**Expected Result:** Users should have correct access based on assigned role

### TC030: User Online Status
**Objective:** Verify online status tracking  
**Test Steps:**
1. Login multiple users
2. Check user management page
3. Verify online/offline status
**Expected Result:** Should show correct online status for users

---

## 8. Document Folder Management

### TC031: Folder Creation
**Objective:** Verify folder creation across all modules  
**Test Steps:**
1. Create folders in each module (receiving1, receiving2, docs, releasing)
2. Upload multiple files to each folder
3. Verify folder information
**Expected Result:** Folders should be created with correct information

### TC032: File Upload
**Objective:** Verify file upload functionality  
**Test Steps:**
1. Upload different file types (PDF, images, documents)
2. Check file size limits
3. Verify file names are preserved
**Expected Result:** Files should upload correctly with preserved names

### TC033: File Download
**Objective:** Verify file download functionality  
**Test Steps:**
1. Download files from folders
2. Check file integrity
3. Verify correct file names
**Expected Result:** Files should download correctly

### TC034: File Preview
**Objective:** Verify file preview functionality  
**Test Steps:**
1. Preview different file types
2. Check PDF preview
3. Check image preview
**Expected Result:** Files should preview correctly in browser

### TC035: Folder Search
**Objective:** Verify folder and file search  
**Test Steps:**
1. Search for folders by name
2. Search for files by name
3. Test partial matches
**Expected Result:** Search should return relevant results

---

## 9. File Upload & Preview

### TC036: Document File Upload
**Objective:** Verify document upload in all modules  
**Test Steps:**
1. Upload documents in receiving1, receiving2, docs, releasing
2. Check file storage
3. Verify file retrieval
**Expected Result:** Documents should upload and store correctly

### TC037: File Preview Functionality
**Objective:** Verify file preview works for all document types  
**Test Steps:**
1. Preview PDF files
2. Preview image files
3. Preview other document types
**Expected Result:** Files should preview correctly based on type

### TC038: File Download Functionality
**Objective:** Verify file download works for all modules  
**Test Steps:**
1. Download files from all modules
2. Check file integrity
3. Verify correct file names
**Expected Result:** Files should download correctly

---

## 10. Search & Filter Functionality

### TC039: Document Search
**Objective:** Verify search functionality across modules  
**Test Steps:**
1. Search documents by control number
2. Search by source
3. Search by date
**Expected Result:** Search should return relevant results

### TC040: Folder Search
**Objective:** Verify folder search functionality  
**Test Steps:**
1. Search folders by name
2. Search files within folders
3. Test partial and exact matches
**Expected Result:** Folder search should work correctly

### TC041: Date Filtering
**Objective:** Verify date-based filtering  
**Test Steps:**
1. Filter documents by today's date
2. Filter by specific month
3. Filter by date range
**Expected Result:** Date filtering should work correctly

---

## Test Environment Requirements

### Browser Compatibility
- Chrome (latest version)
- Firefox (latest version)
- Safari (latest version)
- Edge (latest version)

### Database Requirements
- MySQL 5.7 or higher
- Proper database setup with all tables

### File Upload Requirements
- Maximum file size: 50MB
- Supported formats: PDF, DOC, DOCX, JPG, PNG, GIF

### Network Requirements
- Stable internet connection
- Proper server configuration

---

## Test Data Requirements

### Test Users
- Admin user
- Receiving1 user
- Receiving2 user
- Docs user
- Releasing user

### Test Documents
- Sample PDF files
- Sample image files
- Sample document files
- Various file sizes

### Test Folders
- Sample folder structures
- Multiple files per folder
- Various folder names

---

## Defect Reporting Template

**Defect ID:** TC-XXX  
**Module:** [Module Name]  
**Severity:** [High/Medium/Low]  
**Priority:** [High/Medium/Low]  
**Description:** [Detailed description]  
**Steps to Reproduce:** [Step-by-step instructions]  
**Expected Result:** [What should happen]  
**Actual Result:** [What actually happened]  
**Environment:** [Browser, OS, etc.]  
**Screenshots:** [If applicable]

---

## Test Execution Checklist

- [ ] All test cases executed
- [ ] Defects logged and tracked
- [ ] Test results documented
- [ ] Performance testing completed
- [ ] Security testing completed
- [ ] User acceptance testing completed

---

**Document Prepared By:** [Tester Name]  
**Date:** [Date]  
**Version:** 1.0 