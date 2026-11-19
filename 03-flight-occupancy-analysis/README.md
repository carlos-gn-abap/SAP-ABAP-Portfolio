# Flight Occupancy Analysis

## Project Overview

Flight occupancy analysis project developed using Classic ABAP, consisting of an executable ABAP report featuring a selection screen and two ALV outputs to analyze flight occupancy data retrieved from standard SAP database tables.

The report uses data from SFLIGHT and SPFLI to calculate occupancy percentages across Economy, Business and First Class, allowing users to analyze individual flights or obtain a summary of occupancy distribution.

## Main Features

### Flight Occupancy Analysis

- Selection screen with airline, flight date and flight number filtering criteria.
- Flight data retrieval using Open SQL.
- Data selection through INNER JOIN between SFLIGHT and SPFLI tables.
- Calculation of total aircraft capacity and occupied seats across Economy, Business and First Class.
- Occupancy percentage calculation using a custom function module.
- Option to exclude flights with 0% occupancy.
- ALV output displaying detailed flight information, routes, aircraft, capacity, occupied seats and occupancy percentages.
- Interactive ALV navigation to the flight booking report from the previous exercise using SUBMIT AND RETURN.

### Occupancy Summary Report

- Summary of the number of flights grouped by occupancy percentage ranges.
- Occupancy distribution across four categories.
- ALV output displaying occupancy ranges and corresponding flight counts.

## Technical Concepts

- Classic ABAP.
- Executable ABAP reports.
- Selection Screens and data filtering.
- Standard SAP database tables (SFLIGHT and SPFLI).
- Open SQL and database joins.
- Internal Tables and structured data types.
- ALV reporting using REUSE_ALV_GRID_DISPLAY.
- ALV field catalog and layout configuration.
- Modularization using INCLUDE programs and FORM routines.
- Custom Function Modules.
- SUBMIT AND RETURN.
- Data processing and calculations.

## Source Code Structure

The report is implemented using five ABAP files:

1. **zinforme_ocupacion_ab1361.prog.abap** — Main program and INCLUDE declarations.
2. **zinforme_ocupacion_ab1361_top.abap** — Global data declarations, structures, internal tables and type definitions.
3. **zinforme_ocupacion_ab1361_sel.abap** — Selection screen parameters, filtering criteria and radio buttons.
4. **zinforme_ocupacion_ab1361_evt.abap** — Report events and execution flow.
5. **zinforme_ocupacion_ab1361_f01.abap** — FORM routines containing data retrieval, occupancy calculations, ALV display and summary processing.

## Screenshots

### Flight Occupancy Analysis

#### 01 - Flight Occupancy Analysis - Selection Screen
<img src="03-flight-occupancy-analysis/screenshots/01-Flight%20Occupancy%20Analysis%20-%20Selection%20Screen.jpg" width="600" alt="Flight Occupancy Analysis - Selection Screen">

#### 02 - Flight Occupancy Analysis - ALV Output 1
<img src="03-flight-occupancy-analysis/screenshots/02-Flight%20Occupancy%20Analysis%20-%20ALV%20Output%201.jpg" width="600" alt="Flight Occupancy Analysis - ALV Output 1">

#### 03 - Flight Occupancy Analysis - ALV Output 2
<img src="03-flight-occupancy-analysis/screenshots/03-Flight%20Occupancy%20Analysis%20-%20ALV%20Output%202.jpg" width="600" alt="Flight Occupancy Analysis - ALV Output 2">

## Project Purpose

This project demonstrates practical experience in Classic ABAP development, report programming, database operations, data processing, calculations and ALV reporting. It showcases the development of a flight occupancy analysis report with individual flight analysis and an aggregated occupancy summary.
