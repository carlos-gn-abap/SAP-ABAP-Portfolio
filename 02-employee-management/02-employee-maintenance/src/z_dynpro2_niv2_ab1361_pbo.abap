*&---------------------------------------------------------------------*
*& Include          Z_DYNPRO2_NIV2_AB1361_PBO
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*& Module M_STATUS_9000 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE m_status_9000 OUTPUT.

  SET PF-STATUS 'STATUS_9000'.
  SET TITLEBAR 'TITLE_9000'.

ENDMODULE.
*&---------------------------------------------------------------------*
*& Module M_LLENAR_SUBSCREEN OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE m_llenar_subscreen OUTPUT.

  CLEAR: gv_ctrlscreen.

  CASE ctrl_ficha1-activetab.

    WHEN 'FC1'.
      gv_ctrlscreen = 9001.

    WHEN 'FC2'.
      gv_ctrlscreen = 9002.

    WHEN OTHERS.
      ctrl_ficha1-activetab = 'FC1'.
      gv_ctrlscreen = 9001.

  ENDCASE.

ENDMODULE.
*&---------------------------------------------------------------------*
*& Module M_GET_ZNIVEL2_AB1361 OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE m_get_znivel2_ab1361 OUTPUT.

  CLEAR: gs_znivel2_ab1361.

  SELECT SINGLE *
    FROM znivel2_ab1361
    INTO gs_znivel2_ab1361
    WHERE comp_aerea EQ znivel2_ab1361-comp_aerea
      AND num_emp    EQ znivel2_ab1361-num_emp.

  IF sy-subrc EQ 0.
    MOVE-CORRESPONDING gs_znivel2_ab1361 TO znivel2_ab1361.
  ENDIF.

ENDMODULE.
*&---------------------------------------------------------------------*
*& Module M_GET_SCARR OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE m_get_scarr OUTPUT.

  CLEAR: gs_scarr.

  SELECT SINGLE *
    FROM scarr
    INTO gs_scarr
    WHERE carrid EQ znivel2_ab1361-comp_aerea.

  IF sy-subrc EQ 0.
    MOVE-CORRESPONDING gs_scarr TO scarr.
  ENDIF.

ENDMODULE.
*&---------------------------------------------------------------------*
*& Module M_MODIFICAR_PANTALLA OUTPUT
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
MODULE m_modificar_pantalla OUTPUT.

  LOOP AT SCREEN.

    IF screen-name EQ 'ZNIVEL2_AB1361-NOMBRE'.

      IF gv_modificar EQ 'X'.
        screen-input = 1.

      ELSE.
        screen-input = 0.

      ENDIF.
      MODIFY SCREEN.

    ENDIF.

    IF screen-name EQ 'ZNIVEL2_AB1361-APELLIDO'.

      IF gv_modificar EQ 'X'.
        screen-input = 1.

      ELSE.
        screen-input = 0.

      ENDIF.
      MODIFY SCREEN.

    ENDIF.

    IF screen-name EQ 'ZNIVEL2_AB1361-DEPARTAMENTO'.

      IF gv_modificar EQ 'X'.
        screen-input = 1.

      ELSE.
        screen-input = 0.

      ENDIF.
      MODIFY SCREEN.

    ENDIF.

    IF screen-name EQ 'ZNIVEL2_AB1361-AREA'.

      IF gv_modificar EQ 'X'.
        screen-input = 1.

      ELSE.
        screen-input = 0.

      ENDIF.
      MODIFY SCREEN.

    ENDIF.

    IF screen-name EQ 'ZNIVEL2_AB1361-SALARIO'.

      IF gv_modificar EQ 'X'.
        screen-input = 1.

      ELSE.
        screen-input = 0.

      ENDIF.
      MODIFY SCREEN.

    ENDIF.

    IF screen-name EQ 'ZNIVEL2_AB1361-MONEDA'.

      IF gv_modificar EQ 'X'.
        screen-input = 1.

      ELSE.
        screen-input = 0.

      ENDIF.
      MODIFY SCREEN.

    ENDIF.

  ENDLOOP.

ENDMODULE.
