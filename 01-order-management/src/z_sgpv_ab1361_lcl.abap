*&---------------------------------------------------------------------*
*& Include          Z_SGPV_AB1361_LCL
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*& Class lcl_pedido_ab1361
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
CLASS lcl_pedido_ab1361 DEFINITION FINAL.

  PUBLIC SECTION.
    DATA: cabecera   TYPE zvbak_ab1361.
    DATA: posiciones TYPE STANDARD TABLE OF zvbap_ab1361.

    METHODS: constructor   IMPORTING in_cabecera TYPE zvbak_ab1361.
    METHODS: ver           IMPORTING in_vbeln    TYPE zvbeln_ab1361.
    METHODS: eliminar      IMPORTING in_vbeln    TYPE zvbeln_ab1361.
    METHODS: eliminar_art  IMPORTING in_posnt    TYPE zposnt_ab1361.
    METHODS: refrescar.
    METHODS: guardar.

ENDCLASS.
*&---------------------------------------------------------------------*
*& Class (Implementation) lcl_pedido_ab1361
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
CLASS lcl_pedido_ab1361 IMPLEMENTATION.

  METHOD constructor.

    CLEAR cabecera.
    REFRESH posiciones.

    cabecera = in_cabecera.

  ENDMETHOD.
*&---------------------------------------------------------------------*

  METHOD ver.

    CLEAR cabecera.

* Seleccionamos datos de cabecera.
    SELECT SINGLE *
      FROM zvbak_ab1361
      INTO cabecera
      WHERE vbeln EQ in_vbeln.

    IF sy-subrc EQ 0.

      REFRESH posiciones.

*   Seleccionamos líneas de pedido.
      SELECT *
        FROM zvbap_ab1361
        INTO TABLE posiciones
        WHERE vbeln EQ in_vbeln.

    ENDIF.

  ENDMETHOD.
*&---------------------------------------------------------------------*

  METHOD eliminar.

* Eliminamos la cabecera.
    DELETE FROM zvbak_ab1361 WHERE vbeln EQ in_vbeln.

    IF sy-subrc EQ 0.
      COMMIT WORK AND WAIT.

*   Eliminamos las líneas.
      DELETE FROM zvbap_ab1361 WHERE vbeln EQ in_vbeln.

      IF sy-subrc EQ 0.
        COMMIT WORK AND WAIT.
      ENDIF.

      MESSAGE 'Pedido eliminado con éxito.' TYPE 'I'.

    ENDIF.

* Borramos atributos del objeto.
    CLEAR cabecera.
    REFRESH posiciones.

  ENDMETHOD.
*&---------------------------------------------------------------------*

  METHOD eliminar_art.

    DELETE posiciones WHERE posnt EQ in_posnt.

  ENDMETHOD.
*&---------------------------------------------------------------------*

  METHOD refrescar.

    CLEAR cabecera.
    REFRESH posiciones.

  ENDMETHOD.
*&---------------------------------------------------------------------*

  METHOD guardar.

* Eliminamos la cabecera.
    DELETE FROM zvbak_ab1361 WHERE vbeln EQ cabecera-vbeln.

* Eliminamos las líneas.
    DELETE FROM zvbap_ab1361 WHERE vbeln EQ cabecera-vbeln.

* Guardamos cabecera.
    INSERT INTO zvbak_ab1361 VALUES cabecera.
    IF sy-subrc EQ 0.

      COMMIT WORK AND WAIT.

* Guardamos posiciones.
      INSERT zvbap_ab1361 FROM TABLE posiciones.
      IF sy-subrc EQ 0.

        COMMIT WORK AND WAIT.

        MESSAGE 'Pedido guardado con éxito.' TYPE 'S'.

      ENDIF.

    ENDIF.

  ENDMETHOD.
*&---------------------------------------------------------------------*

ENDCLASS.
