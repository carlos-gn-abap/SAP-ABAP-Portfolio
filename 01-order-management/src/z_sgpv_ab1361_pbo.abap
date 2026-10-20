*&---------------------------------------------------------------------*
*& Include          Z_SGPV_AB1361_PBO
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*& Module M_STATUS_9000 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE m_status_9000 OUTPUT.

  SET PF-STATUS 'STATUS_9000'.
  SET TITLEBAR  'TITLE_9000'.

ENDMODULE.
*&---------------------------------------------------------------------*
*& Module M_CARGAR_ALV OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE m_cargar_alv OUTPUT.

  IF go_pedido IS BOUND.

* Cargamos datos en pantalla.
    zvbak_ab1361 = go_pedido->cabecera.
    REFRESH gt_posiciones.
    gt_posiciones = go_pedido->posiciones.

  ENDIF.


  IF go_alv_posiciones IS NOT BOUND.

* Creamos un objeto para controlar el custom container de la pantalla 9000.
    CREATE OBJECT go_container
      EXPORTING
        container_name = 'CC1'.

* Creamos el ALV que vamos a mostrar en el custom container de la pantalla 9000.
    cl_salv_table=>factory(
    EXPORTING
      r_container  = go_container
    IMPORTING
      r_salv_table = go_alv_posiciones
    CHANGING
      t_table      = gt_posiciones ).


    go_selections = go_alv_posiciones->get_selections( ).
    go_selections->set_selection_mode( cl_salv_selections=>row_column ).


    go_alv_posiciones->display( ).

  ELSE.

    go_alv_posiciones->refresh( ).

  ENDIF.

ENDMODULE.
*&---------------------------------------------------------------------*
*& Module M_STATUS_9001 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE m_status_9001 OUTPUT.

  SET PF-STATUS 'STATUS_9001'.
  SET TITLEBAR  'TITLE_9001'.

ENDMODULE.
