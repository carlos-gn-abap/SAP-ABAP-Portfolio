# Employee Management Transaction

## Project Overview

Employee management project developed using Classic ABAP, consisting of two independent components:

- **Employee Registration Transaction:** A custom SAP GUI transaction developed using Module Pool and Dynpro programming, allowing users to search for existing employees and register new employee records.
- **Employee Maintenance Transaction:** A custom SAP GUI transaction developed using Module Pool and Dynpro programming, allowing users to retrieve, display, modify and delete existing employee records.

Both components use a custom database table and Open SQL to manage employee information. The maintenance transaction also retrieves airline information from the standard SAP table SCARR.

## Main Features

### Employee Registration Transaction

- Employee lookup by airline company and employee number.
- Automatic employee existence check before registration.
- Conditional registration workflow with popup confirmation when an employee is not found.
- Navigation between employee search, registration and employee data screens.
- Employee data insertion into a custom Z table using Open SQL INSERT.
- Display of employee information, including personal details, department, area, salary, currency and agency.

### Employee Maintenance Transaction

- Employee lookup by airline company and employee number.
- Retrieval of airline information from the standard SAP table SCARR.
- Tabstrip-based navigation between employee information screens.
- Dynamic control of editable fields depending on the selected operation.
- Employee data modification and database updates using Open SQL MODIFY.
- Employee record deletion using Open SQL DELETE.

## Technical Concepts

- Classic ABAP and Module Pool programming.
- Dynpro screen processing using PBO and PAI modules.
- Custom database tables (Z tables) and ABAP Dictionary (DDIC).
- Open SQL operations (SELECT, INSERT, MODIFY and DELETE).
- Standard SAP table integration (SCARR).
- Tabstrip controls and dynamic screen modification using LOOP AT SCREEN.
- Modularization using INCLUDE programs.
- Internal structures and work areas for database data handling.

## Source Code Structure

The source code is organized into two independent components:

### 01 - Employee Registration

The source code is organized into four ABAP files:

1. **z_dynpro1_niv2_ab1361.prog.abap** — Main program and INCLUDE declarations.
2. **z_dynpro1_niv2_ab1361_top.abap** — Global data declarations and table structures.
3. **z_dynpro1_niv2_ab1361_pbo.abap** — Output modules and screen preparation.
4. **z_dynpro1_niv2_ab1361_pai.abap** — User command handling and application logic.

### 02 - Employee Maintenance

The source code is organized into four ABAP files:

1. **z_dynpro2_niv2_ab1361.prog.abap** — Main program and INCLUDE declarations.
2. **z_dynpro2_niv2_ab1361_top.abap** — Global data declarations and table structures.
3. **z_dynpro2_niv2_ab1361_pbo.abap** — Output modules and screen preparation.
4. **z_dynpro2_niv2_ab1361_pai.abap** — User command handling and application logic.

## Screenshots

### 01 - Employee Registration Transaction

*Screenshots to be added.*

### 02 - Employee Maintenance Transaction

*Screenshots to be added.*

## Project Purpose

This project demonstrates practical experience in Classic ABAP development, SAP GUI transaction programming, database operations and interactive screen management. It showcases the development of two independent components covering both employee registration and subsequent employee data maintenance.
