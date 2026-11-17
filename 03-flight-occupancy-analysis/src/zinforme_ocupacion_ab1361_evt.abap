*&---------------------------------------------------------------------*
*& Include          ZINFORME_OCUPACION_AB1361_EVT
*&---------------------------------------------------------------------*

************************************************************
*          INITIALIZATION
************************************************************
INITIALIZATION.

************************************************************
*         AT SELECTION-SCREEN
************************************************************
AT SELECTION-SCREEN.

************************************************************
*         START-OF-SELECTION
************************************************************
START-OF-SELECTION.

* Realizamos la selección de los datos necesarios mediante un INNER JOIN
* de sendas tablas del diccionario de datos.

  PERFORM f_seleccion_datos.

************************************************************
*          END-OF-SELECTION
************************************************************
END-OF-SELECTION.

  IF rb_vuelo IS NOT INITIAL.

* Si pulsamos el primer radiobutton, los datos se procesarán de la siguiente manera:

    PERFORM f_informe_1.

    PERFORM f_mostrar_alv.

  ELSE.

* Si pulsamos el segundo radiobutton, los datos se procesarán de la siguiente manera:
* necesitamos que la tabla interna gt_ocupacion_2 esté informada, por lo que tenemos
* que llamar antes a la subrutina con el primer procesamiento de los datos.

    PERFORM f_informe_1.

    PERFORM f_informe_2.

    PERFORM f_mostrar_alv_2.

  ENDIF.
