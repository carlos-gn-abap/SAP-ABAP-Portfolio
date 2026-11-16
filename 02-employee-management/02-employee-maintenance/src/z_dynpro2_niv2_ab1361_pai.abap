*&---------------------------------------------------------------------*
*& Include          Z_DYNPRO2_NIV2_AB1361_PAI
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  M_EXIT  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE m_exit INPUT.

  CASE ok_code.

    WHEN 'CANCEL'.
      LEAVE TO SCREEN 0.

    WHEN 'EXIT'.
      LEAVE PROGRAM.

  ENDCASE.

ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  M_USER_COMMAND_9000  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE m_user_command_9000 INPUT.

  CASE ok_code.

    WHEN 'MOSTRAR'.

      CLEAR: gs_znivel2_ab1361.

      SELECT SINGLE *
        FROM znivel2_ab1361
        INTO gs_znivel2_ab1361
        WHERE comp_aerea EQ znivel2_ab1361-comp_aerea
          AND num_emp    EQ znivel2_ab1361-num_emp.

      IF sy-subrc EQ 0.
        MOVE-CORRESPONDING gs_znivel2_ab1361 TO znivel2_ab1361.

      ELSE.
        MESSAGE 'El empleado NO existe.' TYPE 'I'.

      ENDIF.

      CLEAR: gs_scarr.

      SELECT SINGLE *
        FROM scarr
        INTO gs_scarr
        WHERE carrid EQ znivel2_ab1361-comp_aerea.

      IF sy-subrc EQ 0.
        MOVE-CORRESPONDING gs_scarr TO scarr.
      ENDIF.

    WHEN 'BACK'.
      LEAVE TO SCREEN 0.

    WHEN 'FC1' OR 'FC2' OR 'FC3'.
      ctrl_ficha1-activetab = ok_code.


    WHEN 'EDITAR'.

      CLEAR: gv_modificar.

      gv_modificar = 'X'.

    WHEN 'GUARDAR'.

      CLEAR: gs_znivel2_ab1361.

      SELECT SINGLE *
        FROM znivel2_ab1361
        INTO gs_znivel2_ab1361
        WHERE comp_aerea EQ znivel2_ab1361-comp_aerea
          AND num_emp    EQ znivel2_ab1361-num_emp.

      gs_znivel2_ab1361-nombre = znivel2_ab1361-nombre.
      gs_znivel2_ab1361-apellido = znivel2_ab1361-apellido.
      gs_znivel2_ab1361-departamento = znivel2_ab1361-departamento.
      gs_znivel2_ab1361-area = znivel2_ab1361-area.
      gs_znivel2_ab1361-salario = znivel2_ab1361-salario.
      gs_znivel2_ab1361-moneda = znivel2_ab1361-moneda.

      MODIFY znivel2_ab1361 FROM gs_znivel2_ab1361.

      IF sy-subrc EQ 0.
        MESSAGE 'Datos guardados correctamente.' TYPE 'I'.
      ENDIF.

    WHEN 'BORRAR'.

      DELETE FROM znivel2_ab1361 WHERE comp_aerea EQ znivel2_ab1361-comp_aerea
                                   AND num_emp    EQ znivel2_ab1361-num_emp.

      IF sy-subrc EQ 0.
        MESSAGE 'Datos borrados correctamente.' TYPE 'I'.
      ENDIF.

  ENDCASE.

ENDMODULE.
