# Order Management Transaction

## Project Overview

Order management project developed using Classic ABAP and Object-Oriented ABAP, consisting of two independent components:

- **Order Processing Transaction:** A custom SAP GUI transaction developed using Module Pool and Dynpro programming, allowing users to manage customer orders and their corresponding items.
- **Order Reporting:** A standalone executable ABAP report featuring a selection screen and an ALV output to display order information retrieved from custom database tables.

Both components use custom database tables and Open SQL to handle and retrieve order data.

## Main Features

### Order Processing Transaction

- Order creation and management.
- Adding and deleting order items.
- Business validations to ensure data consistency.
- Navigation between screens using Module Pool and Dynpro programming.
- Display of complete order details.
- Data retrieval using Open SQL, including SELECT statements and JOINs.
- Custom database tables for order headers and items.

### Order Reporting

- Selection screen with multiple filtering criteria.
- Order data retrieval using Open SQL.
- Data selection through INNER JOIN between order header and item tables.
- ALV output using CL_SALV_TABLE.
- ALV display configuration, including toolbar functions and striped rows.

## Technical Concepts

- Classic ABAP and Object-Oriented ABAP.
- Module Pool programming and Dynpros.
- Executable ABAP reports.
- Selection Screens and data filtering.
- Custom database tables (Z tables).
- ABAP Dictionary (DDIC).
- Open SQL and database joins.
- ALV reporting using CL_SALV_TABLE.
- Object-oriented ALV configuration.
- Modularization using INCLUDE programs and FORM routines.
- Business logic and data validation.

## Source Code Structure

The source code is organized into two independent components:

### 01 - Order Processing

The source code is organized into five ABAP files:

1. **z_sgpv_ab1361.prog.abap** — Main program and INCLUDE declarations.
2. **z_sgpv_ab1361_lcl.abap** — Local class definition and implementation.
3. **z_sgpv_ab1361_top.abap** — Global data declarations and object references.
4. **z_sgpv_ab1361_pbo.abap** — Process Before Output modules.
5. **z_sgpv_ab1361_pai.abap** — Process After Input modules.

### 02 - Order Reporting

The report is implemented in a single ABAP file:

1. **z_alv_ab1361.prog.abap** — Executable ABAP report containing the selection screen, Open SQL data retrieval and ALV display logic using CL_SALV_TABLE.

## Screenshots

## Project Purpose

This project demonstrates practical experience in Classic ABAP development, Object-Oriented ABAP, SAP GUI transaction programming, database operations and reporting. It showcases the development of two independent components covering both order processing and order data reporting.
