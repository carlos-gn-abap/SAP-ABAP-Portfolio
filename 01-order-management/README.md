# Order Management Application

## Project Overview

End-to-end order management application developed using Classic ABAP and Object-Oriented ABAP.

The application allows users to manage customer orders and their corresponding items through a custom SAP GUI interface.

## Main Features

- Order creation and management.
- Adding and deleting order items.
- Business validations to ensure data consistency.
- Navigation between screens using Module Pool and Dynpro programming.
- Display of complete order details.
- Data retrieval using Open SQL, including SELECT statements and JOINs.
- ALV reports for displaying order information.
- Custom database tables for order headers and items.

## Technical Concepts

- Classic ABAP and Object-Oriented ABAP.
- Module Pool programming and Dynpros.
- Custom database tables (Z tables).
- ABAP Dictionary (DDIC).
- Open SQL and database joins.
- ALV reports.
- Modularization using INCLUDE programs.
- Business logic and data validation.

## Source Code Structure

The source code is organized into five ABAP files:

1. **z_sgpv_ab1361.prog.abap** — Main program and INCLUDE declarations.
2. **z_sgpv_ab1361_lcl.abap** — Local class definition and implementation.
3. **z_sgpv_ab1361_top.abap** — Global data declarations and object references.
4. **z_sgpv_ab1361_pbo.abap** — Process Before Output modules.
5. **z_sgpv_ab1361_pai.abap** — Process After Input modules.

## Screenshots

Screenshots demonstrating the application's interface, program logic, and execution will be included here.

## Project Purpose

This project demonstrates practical experience in Classic ABAP development, SAP GUI application programming, database operations, and the implementation of a complete business application.
