# Employee Management Application

## Project Overview

This project consists of an employee management application developed using Classic ABAP and Module Pool programming in SAP GUI.

The application allows users to manage employee information, including personal details, company, department and salary, using custom database tables and Open SQL operations.

It also includes screen navigation and error handling to improve the user experience.

## Main Features

- Employee lookup by airline company and employee number.
- Employee registration and data management.
- Business validations to check employee existence.
- Navigation between screens using Module Pool and Dynpro programming.
- Display of employee information, including name, surname, department, area, salary, currency and agency.
- Data retrieval using Open SQL SELECT statements.
- Data insertion using Open SQL INSERT.
- Custom database table for employee information.
- Popup dialogs for handling employees that do not exist.

## Technical Concepts

- Classic ABAP.
- Module Pool programming and Dynpros.
- Custom database tables (Z tables).
- ABAP Dictionary (DDIC).
- Open SQL.
- Modularization using INCLUDE programs.
- Business logic and data validation.

## Source Code Structure

The source code is organized into four ABAP files:

1. **z_dynpro1_niv2_ab1361.prog.abap** — Main program and INCLUDE declarations.
2. **z_dynpro1_niv2_ab1361_top.abap** — Global data declarations and table structures.
3. **z_dynpro1_niv2_ab1361_pbo.abap** — Output modules and screen preparation.
4. **z_dynpro1_niv2_ab1361_pai.abap** — User command handling and application logic.

## Screenshots

Screenshots demonstrating the application's interface, employee management screens and program logic will be included here.

## Project Purpose

The purpose of this project is to strengthen practical knowledge of Classic ABAP development through the implementation of an employee management application.

It demonstrates the use of Module Pool programming, custom database tables, Open SQL and interactive SAP GUI screens in a practical business scenario.
