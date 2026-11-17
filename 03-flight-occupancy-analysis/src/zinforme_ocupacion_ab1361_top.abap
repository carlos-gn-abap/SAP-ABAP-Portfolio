*&---------------------------------------------------------------------*
*& Include          ZINFORME_OCUPACION_AB1361_TOP
*&---------------------------------------------------------------------*

************************************************************
*Tablas SAP
************************************************************
TABLES: sflight, spfli.

************************************************************
*Types
************************************************************
TYPES: BEGIN OF ty_ocupacion_1,

         carrid     TYPE s_carr_id,
         connid     TYPE s_conn_id,
         fldate     TYPE s_date,
         countryfr  TYPE land1,
         cityfrom   TYPE s_from_cit,
         airpfrom   TYPE s_fromairp,
         countryto  TYPE land1,
         cityto     TYPE s_to_city,
         airpto     TYPE s_toairp,
         fltime     TYPE s_fltime,
         price      TYPE s_price,
         currency   TYPE s_currcode,
         planetype  TYPE s_planetye,
         seatsmax   TYPE s_seatsmax,
         seatsocc   TYPE s_seatsocc,
         paymentsum TYPE s_sum,
         seatsmax_b TYPE s_smax_b,
         seatsocc_b TYPE s_socc_b,
         seatsmax_f TYPE s_smax_f,
         seatsocc_f TYPE s_socc_f,

       END OF ty_ocupacion_1.

TYPES: BEGIN OF ty_ocupacion_2,

         carrid     TYPE s_carr_id,
         connid     TYPE s_conn_id,
         fldate     TYPE s_date,
         countryfr  TYPE land1,
         cityfrom   TYPE s_from_cit,
         airpfrom   TYPE s_fromairp,
         countryto  TYPE land1,
         cityto     TYPE s_to_city,
         airpto     TYPE s_toairp,
         fltime     TYPE s_fltime,
         price      TYPE s_price,
         currency   TYPE s_currcode,
         planetype  TYPE s_planetye,
         seatsmax   TYPE s_seatsmax,
         seatsocc   TYPE s_seatsocc,
         paymentsum TYPE s_sum,
         seatsmax_b TYPE s_smax_b,
         seatsocc_b TYPE s_socc_b,
         seatsmax_f TYPE s_smax_f,
         seatsocc_f TYPE s_socc_f,
         ocupacion  TYPE p DECIMALS 2,

       END OF ty_ocupacion_2.

TYPES: BEGIN OF ty_ocupacion_3,

         ocupacion TYPE c LENGTH 10,
         vuelos    TYPE i,

       END OF ty_ocupacion_3.

************************************************************
*Constantes
************************************************************
*CONSTANTS:

************************************************************
*Variables globales
************************************************************
*DATA:

************************************************************
*Estructuras
************************************************************
DATA: gs_ocupacion_1 TYPE ty_ocupacion_1,
      gs_ocupacion_2 TYPE ty_ocupacion_2,
      gs_ocupacion_3 TYPE ty_ocupacion_3,
      gs_fieldcat    TYPE slis_fieldcat_alv,
      gs_layout      TYPE slis_layout_alv.

************************************************************
*Declaración tablas internas
************************************************************
DATA: gt_ocupacion_1 TYPE STANDARD TABLE OF ty_ocupacion_1,
      gt_ocupacion_2 TYPE STANDARD TABLE OF ty_ocupacion_2,
      gt_ocupacion_3 TYPE STANDARD TABLE OF ty_ocupacion_3,
      gt_fieldcat    TYPE slis_t_fieldcat_alv.
