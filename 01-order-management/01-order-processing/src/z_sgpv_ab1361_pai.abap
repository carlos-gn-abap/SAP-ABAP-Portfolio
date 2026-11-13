*&---------------------------------------------------------------------*
*& Include          Z_SGPV_AB1361_PAI
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  M_USER_COMMAND_9000  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE m_user_command_9000 INPUT.

  CASE ok_code.

    WHEN 'INICIAR'.
      IF go_pedido IS NOT BOUND.
        CREATE OBJECT go_pedido
          EXPORTING
            in_cabecera = zvbak_ab1361.
      ELSE.
        CLEAR go_pedido->cabecera.
        REFRESH go_pedido->posiciones.
        go_pedido->cabecera = zvbak_ab1361.
      ENDIF.

*** Aquí generamos el número automático.
      DATA: lv_numero TYPE n LENGTH 10.

      CALL FUNCTION 'NUMBER_GET_NEXT'
        EXPORTING
          nr_range_nr   = '01'
          object        = 'ZRN_VBELN_'
          quantity      = '1'
          ignore_buffer = 'X'
        IMPORTING
          number        = lv_numero
        EXCEPTIONS
          OTHERS        = 1.

      IF sy-subrc = 0.
        go_pedido->cabecera-vbeln = lv_numero. " Asignamos el número al pedido.
      ELSE.
        MESSAGE 'Error al generar el número de pedido' TYPE 'E'.
      ENDIF.

      MESSAGE 'Pedido iniciado.' TYPE 'I'.

    WHEN 'BACK'.
      LEAVE TO SCREEN 0.

    WHEN 'CANCEL'.
      LEAVE TO SCREEN 0.

    WHEN 'EXIT'.
      LEAVE PROGRAM.

    WHEN 'ADD'.
      CLEAR zvbap_ab1361.
      zvbap_ab1361-vbeln = zvbak_ab1361-vbeln.

      CALL SCREEN '9001' STARTING AT 20 1
                           ENDING AT 72 11.

    WHEN 'DEL'.
*** Habilitamos la selección de la línea haciendo click en el propio ALV.
      DATA: lt_selected_rows TYPE salv_t_row.

      go_alv_posiciones->get_metadata( ).

      lt_selected_rows = go_selections->get_selected_rows( ).

      LOOP AT lt_selected_rows INTO DATA(ls_selected_row).

        READ TABLE gt_posiciones INTO DATA(ls_posiciones) INDEX ls_selected_row.

        IF sy-subrc EQ 0.
          go_pedido->eliminar_art( EXPORTING in_posnt = ls_posiciones-posnt ).
        ENDIF.

      ENDLOOP.

    WHEN 'DELETE'.
      CALL METHOD go_pedido->eliminar
        EXPORTING
          in_vbeln = zvbak_ab1361-vbeln.

    WHEN 'DISPLAY'.
      IF go_pedido IS NOT BOUND.
        CREATE OBJECT go_pedido
          EXPORTING
            in_cabecera = zvbak_ab1361.
      ENDIF.

      CALL METHOD go_pedido->ver
        EXPORTING
          in_vbeln = zvbak_ab1361-vbeln.

    WHEN 'LIMPIAR'.
      go_pedido->refrescar( ).

    WHEN 'SAVE'.
      go_pedido->guardar( ).
      go_pedido->refrescar( ).

  ENDCASE.

  CLEAR ok_code.

ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  M_USER_COMMAND_9001  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE m_user_command_9001 INPUT.

  CASE ok_code.

    WHEN 'OK'.
      APPEND zvbap_ab1361 TO go_pedido->posiciones.
      go_pedido->cabecera = zvbak_ab1361.
      LEAVE TO SCREEN 0.

    WHEN 'CANCELAR'.
      LEAVE TO SCREEN 0.

  ENDCASE.

  CLEAR ok_code.

ENDMODULE.
