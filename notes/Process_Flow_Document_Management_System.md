# Document Management System - Process Flow

## System Overview
The Document Management System (DMS) is a comprehensive web-based application designed to manage document workflows across multiple departments. The system supports five distinct user roles with specific permissions and workflows.

## User Roles and Access Levels

### 1. Admin
- **Access**: Full system access
- **Responsibilities**: 
  - User management (create, edit, delete users)
  - System monitoring and reporting
  - Document upload and management
  - Access to all modules and functions

### 2. Receiving
- **Access**: Receiving module, document folders
- **Responsibilities**:
  - Initial document receipt and registration
  - Document routing to Receiving2
  - Folder management and file organization

### 3. ADMIN Receiving
- **Access**: Admin Receiving module, RTS (Routing Transmittal Slips)
- **Responsibilities**:
  - Document acceptance and processing
  - RTS management
  - Email document handling
  - Outgoing document preparation

### 4. Docs
- **Access**: Documentation module
- **Responsibilities**:
  - GSO document management
  - Travel document processing
  - Application leave document handling
  - Special permit document management

### 5. Releasing
- **Access**: Releasing module
- **Responsibilities**:
  - Outgoing document management
  - Document release and tracking
  - Final document processing

## Document Workflow Process Flow

### 1. Document Entry Process (Receiving1)

```
START
  ↓
User Login (Receiving Role)
  ↓
Access Receiving Dashboard
  ↓
Add New Document
  ↓
Fill Document Details:
  - Date/Time Received
  - Control Number
  - Source
  - Particulars
  - Received By
  - Document Receiver
  - Forwarded To
  - Upload Document File
  ↓
Route to Admin Receiving? (Yes/No)
  ↓
IF Yes → Document routed to Admin Receiving
IF No → Document stays in Receiving
  ↓
Document Saved to Database
  ↓
END
```

### 2. Document Processing (Admin Receiving)

```
START
  ↓
User Login (Admin Receiving Role)
  ↓
Access Admin Receiving Dashboard
  ↓
View Pending Documents (RTS)
  ↓
Select Document for Processing
  ↓
Review Document Details
  ↓
Accept Document
  ↓
Fill Processing Details:
  - Purposes/Actions
  - Remarks
  - RTS Date
  - Additional Attachments
  ↓
Document Status: Accepted
  ↓
Document moved to Accepted Documents
  ↓
Available for Outgoing Processing
  ↓
END
```

### 3. Email Document Processing (Receiving2)

```
START
  ↓
User Login (Admin Receiving Role)
  ↓
Access Email Documents Module
  ↓
Add Email Document
  ↓
Fill Email Document Details:
  - Date/Time Received
  - Control Number
  - Source
  - Particulars
  - Forwarded To
  - Purpose/Action
  - Upload Document File
  - Upload Additional Attachment
  ↓
Document Saved to Other Documents Table
  ↓
Process via RTS (if needed)
  ↓
END
```

### 4. Documentation Management (Docs)

```
START
  ↓
User Login (Docs Role)
  ↓
Access Docs Dashboard
  ↓
Select Document Type:
  ├─ GSO Documents
  ├─ Travel Documents
  ├─ Application Leave Documents
  └─ Special Permit Documents
  ↓
Add New Document
  ↓
Fill Document Details:
  - Date/Time Received
  - Control Number
  - Source
  - Particulars
  - Received By
  - Forwarded To
  - Upload Document File
  ↓
Document Saved to Respective Table
  ↓
END
```

### 5. Outgoing Document Process (Releasing)

```
START
  ↓
User Login (Releasing Role)
  ↓
Access Releasing Dashboard
  ↓
View Accepted Documents (from Receiving2)
  ↓
Select Document for Release
  ↓
Fill Release Details:
  - Date/Time Sent
  - Control Number
  - Source
  - Particulars
  - Forwarded To
  - Upload Document File
  ↓
Document Saved to Outgoing Documents
  ↓
Document Status: Released
  ↓
END
```

### 6. Folder Management Process

```
START
  ↓
User Login (Admin/Receiving1 Role)
  ↓
Access Document Folders
  ↓
Create New Folder
  ↓
Fill Folder Details:
  - Folder Name
  - Folder Description
  - Upload Multiple Files
  ↓
Files Organized in Folder Structure
  ↓
Files Available for Download/Preview
  ↓
END
```

## Database Structure and Relationships

### Primary Tables:
1. **users** - User accounts and roles
2. **receiving1_documents** - Initial document entries
3. **receiving2_documents** - Processed documents from Receiving2
4. **other_documents** - Email and additional documents
5. **accepted_documents** - Documents accepted by Receiving2
6. **outgoing_documents** - Released documents
7. **document_folders** - Folder organization
8. **folder_files** - Files within folders

### Specialized Document Tables:
- **gso_documents** - GSO-specific documents
- **travel_documents** - Travel-related documents
- **application_leave_documents** - Leave application documents
- **special_permit_documents** - Special permit documents

## Key Features and Functions

### 1. Document Tracking
- Control number assignment
- Date/time stamping
- Status tracking (received, processed, accepted, released)
- Audit trail maintenance

### 2. File Management
- Document upload and storage
- File preview capabilities
- Download functionality
- Attachment support

### 3. Reporting and Analytics
- Document counts by type
- Daily/monthly statistics
- User activity tracking
- Comprehensive reporting system

### 4. Security Features
- Role-based access control
- Session management
- Password hashing
- User authentication

### 5. Search and Filter
- Document search functionality
- Date range filtering
- Status-based filtering
- Pagination support

## System Integration Points

### 1. Document Flow Integration
- Receiving1 → Receiving2 → Releasing
- Email documents → Receiving2 processing
- Folder management → All modules

### 2. User Management Integration
- Admin controls all user access
- Role-based dashboard access
- User activity monitoring

### 3. Reporting Integration
- Cross-module reporting
- Statistical aggregation
- Export capabilities

## Error Handling and Validation

### 1. Input Validation
- Required field validation
- File type validation
- Date/time format validation
- Control number uniqueness

### 2. Error Recovery
- Database transaction rollback
- File upload error handling
- Session timeout handling
- Connection error recovery

## Performance Considerations

### 1. Database Optimization
- Indexed queries
- Efficient data retrieval
- Connection pooling
- Query optimization

### 2. File Handling
- Binary large object (BLOB) storage
- File size limitations
- Upload progress tracking
- Memory management

## Maintenance and Support

### 1. System Maintenance
- Regular database backups
- Log file management
- Performance monitoring
- Security updates

### 2. User Support
- User training documentation
- Help system integration
- Error message clarity
- Support contact information

## Future Enhancement Opportunities

### 1. Advanced Features
- Workflow automation
- Email integration
- Mobile application
- API development

### 2. Integration Capabilities
- Third-party system integration
- Cloud storage options
- Advanced reporting tools
- Document versioning

---

*This process flow document provides a comprehensive overview of the Document Management System's workflows, user roles, and operational procedures. The system is designed to streamline document processing across multiple departments while maintaining security, accountability, and efficiency.*
