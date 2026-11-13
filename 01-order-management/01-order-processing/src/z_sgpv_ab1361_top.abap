*&---------------------------------------------------------------------*
*& Include          Z_SGPV_AB1361_TOP
*&---------------------------------------------------------------------*

TABLES: zvbak_ab1361,
        zvbap_ab1361.

DATA: ok_code TYPE sy-ucomm.

DATA: gt_posiciones TYPE STANDARD TABLE OF zvbap_ab1361.

*** OBJETOS:
DATA: go_alv_posiciones TYPE REF TO cl_salv_table,
      go_container      TYPE REF TO cl_gui_custom_container,
      go_pedido         TYPE REF TO lcl_pedido_ab1361,
      go_selections     TYPE REF TO cl_salv_selections.
