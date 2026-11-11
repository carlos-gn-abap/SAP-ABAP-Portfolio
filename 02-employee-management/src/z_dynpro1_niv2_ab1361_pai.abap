*&---------------------------------------------------------------------*
*& Include          Z_DYNPRO1_NIV2_AB1361_PAI
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  M_USER_COMMAND_9000  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE m_user_command_9000 INPUT.

  CASE ok_code.

    WHEN 'EJECUTAR'.

      CLEAR: gs_znivel2_ab1361.

      SELECT SINGLE *
        FROM znivel2_ab1361
        INTO gs_znivel2_ab1361
        WHERE comp_aerea EQ znivel2_ab1361-comp_aerea
          AND num_emp    EQ znivel2_ab1361-num_emp.

      IF sy-subrc EQ 0.
        MOVE-CORRESPONDING gs_znivel2_ab1361 TO znivel2_ab1361.

      ELSE.
        CALL SCREEN '9002' STARTING AT 67 5
                             ENDING AT 113 18.
      ENDIF.

    WHEN 'BACK'.
      LEAVE TO SCREEN 0.

  ENDCASE.

ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  M_USER_COMMAND_9002  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE m_user_command_9002 INPUT.

  CASE ok_code.

    WHEN 'SÍ'.
      CALL SCREEN '9003' STARTING AT 67 5
                           ENDING AT 113 18.

    WHEN 'NO'.
      LEAVE TO SCREEN 0.

  ENDCASE.

ENDMODULE.
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
*&      Module  M_USER_COMMAND_9003  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE m_user_command_9003 INPUT.

  CASE ok_code.

    WHEN 'GUARDAR'.

      CLEAR: gs_znivel2_ab1361.
      gs_znivel2_ab1361-comp_aerea = znivel2_ab1361-comp_aerea.
      gs_znivel2_ab1361-num_emp = znivel2_ab1361-num_emp.
      gs_znivel2_ab1361-nombre = znivel2_ab1361-nombre.
      gs_znivel2_ab1361-apellido = znivel2_ab1361-apellido.
      gs_znivel2_ab1361-departamento = znivel2_ab1361-departamento.
      gs_znivel2_ab1361-area = znivel2_ab1361-area.
      gs_znivel2_ab1361-salario = znivel2_ab1361-salario.
      gs_znivel2_ab1361-moneda = znivel2_ab1361-moneda.
      gs_znivel2_ab1361-agencia = znivel2_ab1361-agencia.
      INSERT znivel2_ab1361 FROM gs_znivel2_ab1361.

      IF sy-subrc EQ 0.
        MESSAGE 'Datos guardados correctamente.' TYPE 'I'.
      ENDIF.

      LEAVE TO SCREEN 0.

    WHEN 'CANCELAR'.
      LEAVE TO SCREEN 0.

  ENDCASE.

ENDMODULE.
