*&---------------------------------------------------------------------*
*& Include          ZINFORME_OCUPACION_AB1361_SEL
*&---------------------------------------------------------------------*

************************************************************
*          SELECTION-SCREEN
************************************************************
SELECTION-SCREEN:BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-000.

  PARAMETERS:     p_comp   TYPE  s_carr_id.
  SELECT-OPTIONS: so_date   FOR  sy-datum.
  SELECT-OPTIONS: so_num_v  FOR  (s_conn_id).

  SELECTION-SCREEN: SKIP.

  PARAMETERS: p_vacios   AS CHECKBOX.

SELECTION-SCREEN: END OF BLOCK b1.

SELECTION-SCREEN: BEGIN OF BLOCK b2 WITH FRAME TITLE TEXT-001.

  PARAMETERS: rb_vuelo   RADIOBUTTON GROUP g1.
  PARAMETERS: rb_total   RADIOBUTTON GROUP g1.

SELECTION-SCREEN: END OF BLOCK b2.
