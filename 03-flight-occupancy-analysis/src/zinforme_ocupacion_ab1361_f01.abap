*&---------------------------------------------------------------------*
*& Include          ZINFORME_OCUPACION_AB1361_F01
*&---------------------------------------------------------------------*

*&---------------------------------------------------------------------*
*& Form f_seleccion_datos
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM f_seleccion_datos.

  REFRESH gt_ocupacion_1.

  SELECT sflight~carrid
         sflight~connid
         sflight~fldate
         spfli~countryfr
         spfli~cityfrom
         spfli~airpfrom
         spfli~countryto
         spfli~cityto
         spfli~airpto
         spfli~fltime
         sflight~price
         sflight~currency
         sflight~planetype
         sflight~seatsmax
         sflight~seatsocc
         sflight~paymentsum
         sflight~seatsmax_b
         sflight~seatsocc_b
         sflight~seatsmax_f
         sflight~seatsocc_f
  FROM sflight
    INNER JOIN spfli ON sflight~carrid EQ spfli~carrid AND
                        sflight~connid EQ spfli~connid
  INTO TABLE gt_ocupacion_1
    WHERE sflight~carrid EQ p_comp
    AND   sflight~fldate IN so_date
    AND   sflight~connid IN so_num_v.

ENDFORM.
*&---------------------------------------------------------------------*
*& Form f_mostrar_alv
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM f_mostrar_alv.

* Datos del fieldcat para el ALV

  CLEAR gs_fieldcat.
  gs_fieldcat-fieldname = 'CARRID'.
  gs_fieldcat-seltext_m = 'Compañía'.
  gs_fieldcat-seltext_s = 'Comp.'.
  APPEND gs_fieldcat TO gt_fieldcat.

  CLEAR gs_fieldcat.
  gs_fieldcat-fieldname = 'CONNID'.
  gs_fieldcat-seltext_m = 'Nº vuelo'.
  gs_fieldcat-seltext_s = 'Vuelo'.
  APPEND gs_fieldcat TO gt_fieldcat.

  CLEAR gs_fieldcat.
  gs_fieldcat-fieldname = 'FLDATE'.
  gs_fieldcat-seltext_m = 'Fecha de vuelo'.
  gs_fieldcat-seltext_s = 'Fecha'.
  APPEND gs_fieldcat TO gt_fieldcat.

  CLEAR gs_fieldcat.
  gs_fieldcat-fieldname = 'COUNTRYFR'.
  gs_fieldcat-seltext_m = 'País origen'.
  gs_fieldcat-seltext_s = 'P.Origen'.
  APPEND gs_fieldcat TO gt_fieldcat.

  CLEAR gs_fieldcat.
  gs_fieldcat-fieldname = 'CITYFROM'.
  gs_fieldcat-seltext_m = 'Ciudad origen'.
  gs_fieldcat-seltext_s = 'C.Origen'.
  APPEND gs_fieldcat TO gt_fieldcat.

  CLEAR gs_fieldcat.
  gs_fieldcat-fieldname = 'AIRPFROM'.
  gs_fieldcat-seltext_m = 'Aeropuerto origen'.
  gs_fieldcat-seltext_s = 'A.Origen'.
  APPEND gs_fieldcat TO gt_fieldcat.

  CLEAR gs_fieldcat.
  gs_fieldcat-fieldname = 'COUNTRYTO'.
  gs_fieldcat-seltext_m = 'País destino'.
  gs_fieldcat-seltext_s = 'P.Destino'.
  APPEND gs_fieldcat TO gt_fieldcat.

  CLEAR gs_fieldcat.
  gs_fieldcat-fieldname = 'CITYTO'.
  gs_fieldcat-seltext_m = 'Ciudad destino'.
  gs_fieldcat-seltext_s = 'C.Destino'.
  APPEND gs_fieldcat TO gt_fieldcat.

  CLEAR gs_fieldcat.
  gs_fieldcat-fieldname = 'AIRPTO'.
  gs_fieldcat-seltext_m = 'Aeropuerto destino'.
  gs_fieldcat-seltext_s = 'A.Destino'.
  APPEND gs_fieldcat TO gt_fieldcat.

  CLEAR gs_fieldcat.
  gs_fieldcat-fieldname = 'FLTIME'.
  gs_fieldcat-seltext_m = 'Duración vuelo'.
  gs_fieldcat-seltext_s = 'Duración'.
  APPEND gs_fieldcat TO gt_fieldcat.

  CLEAR gs_fieldcat.
  gs_fieldcat-fieldname = 'PRICE'.
  gs_fieldcat-seltext_m = 'Precio'.
  gs_fieldcat-seltext_s = 'Pre.'.
  APPEND gs_fieldcat TO gt_fieldcat.

  CLEAR gs_fieldcat.
  gs_fieldcat-fieldname = 'CURRENCY'.
  gs_fieldcat-seltext_m = 'Moneda'.
  gs_fieldcat-seltext_s = 'Mon.'.
  APPEND gs_fieldcat TO gt_fieldcat.

  CLEAR gs_fieldcat.
  gs_fieldcat-fieldname = 'PLANETYPE'.
  gs_fieldcat-seltext_m = 'Tipo de avión'.
  gs_fieldcat-seltext_s = 'Tipo av.'.
  APPEND gs_fieldcat TO gt_fieldcat.

  CLEAR gs_fieldcat.
  gs_fieldcat-fieldname = 'SEATSMAX'.
  gs_fieldcat-seltext_m = 'Capacidad turista'.
  gs_fieldcat-seltext_s = 'Capacidad T.'.
  APPEND gs_fieldcat TO gt_fieldcat.

  CLEAR gs_fieldcat.
  gs_fieldcat-fieldname = 'SEATSOCC'.
  gs_fieldcat-seltext_m = 'Ocupación turista'.
  gs_fieldcat-seltext_s = 'Ocupación T.'.
  APPEND gs_fieldcat TO gt_fieldcat.

  CLEAR gs_fieldcat.
  gs_fieldcat-fieldname = 'PAYMENTSUM'.
  gs_fieldcat-seltext_m = 'Total reservas'.
  gs_fieldcat-seltext_s = 'Total R.'.
  APPEND gs_fieldcat TO gt_fieldcat.

  CLEAR gs_fieldcat.
  gs_fieldcat-fieldname = 'SEATSMAX_B'.
  gs_fieldcat-seltext_m = 'Capacidad business'.
  gs_fieldcat-seltext_s = 'Capacidad B.'.
  APPEND gs_fieldcat TO gt_fieldcat.

  CLEAR gs_fieldcat.
  gs_fieldcat-fieldname = 'SEATSOCC_B'.
  gs_fieldcat-seltext_m = 'Ocupación business'.
  gs_fieldcat-seltext_s = 'Ocupación B.'.
  APPEND gs_fieldcat TO gt_fieldcat.

  CLEAR gs_fieldcat.
  gs_fieldcat-fieldname = 'SEATSMAX_F'.
  gs_fieldcat-seltext_m = 'Capacidad primera'.
  gs_fieldcat-seltext_s = 'Capacidad P.'.
  APPEND gs_fieldcat TO gt_fieldcat.

  CLEAR gs_fieldcat.
  gs_fieldcat-fieldname = 'SEATSOCC_F'.
  gs_fieldcat-seltext_m = 'Ocupación primera'.
  gs_fieldcat-seltext_s = 'Ocupación P.'.
  APPEND gs_fieldcat TO gt_fieldcat.

  CLEAR gs_fieldcat.
  gs_fieldcat-fieldname = 'OCUPACION'.
  gs_fieldcat-seltext_m = 'Porcentaje ocupación'.
  gs_fieldcat-seltext_s = 'Porcentaje O.'.
  APPEND gs_fieldcat TO gt_fieldcat.

* Layout

  gs_layout-zebra = 'X'.
  gs_layout-colwidth_optimize = 'X'.

* Función ALV

  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
      i_callback_program      = sy-repid
      i_callback_user_command = 'F_USER_COMMAND'
      is_layout               = gs_layout
      it_fieldcat             = gt_fieldcat[]
    TABLES
      t_outtab                = gt_ocupacion_2[]
    EXCEPTIONS
      program_error           = 1
      OTHERS                  = 2.

ENDFORM.
*&---------------------------------------------------------------------*
*& Form f_user_command
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& --> p1 text
*& <-- p2 text
*&---------------------------------------------------------------------*
FORM f_user_command USING r_ucomm     LIKE sy-ucomm                         " Llamamos a esta subrutina para que al hacer doble clic sobre alguna fila del
                          rs_selfield TYPE slis_selfield.                   " porcentaje de ocupación nos redirija a una tabla interna con los datos de la SBOOK.

  READ TABLE gt_ocupacion_2 INTO gs_ocupacion_2 INDEX rs_selfield-tabindex.

  IF sy-subrc EQ 0.
  ENDIF.

  DATA: lv_comp  TYPE s_carr_id,
        lv_num_v TYPE s_conn_id,                                            " Pasamos los datos de la estructura gs_ocupacion_2 a variables locales ya que, si lo dejamos
        lv_date  TYPE s_date.                                               " tal cual, nos da problemas a la hora de activar nuestro programa.

  lv_comp  = gs_ocupacion_2-carrid.
  lv_num_v = gs_ocupacion_2-connid.
  lv_date  = gs_ocupacion_2-fldate.

  SUBMIT z_reservas_vuelo_ab1361 AND RETURN                                 " Llamamos al programa del ejercicio anterior, donde se encuentra la tabla interna con
    WITH p_comp  = lv_comp                                                  " los datos de la tabla SBOOK. Le pasamos los parámetros sin usar pantalla de selección.
    WITH p_num_v = lv_num_v
    WITH p_date  = lv_date.

ENDFORM.
*&---------------------------------------------------------------------*
*& Form f_mostrar_alv_2
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& --> p1 text
*& <-- p2 text
*&---------------------------------------------------------------------*
FORM f_mostrar_alv_2.

* Datos del fieldcat para el ALV

  CLEAR gs_fieldcat.
  gs_fieldcat-fieldname = 'OCUPACION'.
  gs_fieldcat-seltext_m = 'Porcentaje ocupación'.
  gs_fieldcat-seltext_s = 'Porcentaje O.'.
  APPEND gs_fieldcat TO gt_fieldcat.

  CLEAR gs_fieldcat.
  gs_fieldcat-fieldname = 'VUELOS'.
  gs_fieldcat-seltext_m = 'Cantidad de Vuelos'.
  gs_fieldcat-seltext_s = 'Cant. Vuelos'.
  APPEND gs_fieldcat TO gt_fieldcat.

* Layout

  gs_layout-zebra = 'X'.
  gs_layout-colwidth_optimize = 'X'.

* Función ALV

  CALL FUNCTION 'REUSE_ALV_GRID_DISPLAY'
    EXPORTING
      is_layout     = gs_layout
      it_fieldcat   = gt_fieldcat[]
    TABLES
      t_outtab      = gt_ocupacion_3[]
    EXCEPTIONS
      program_error = 1
      OTHERS        = 2.

ENDFORM.
*&---------------------------------------------------------------------*
*& Form f_informe_1
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& --> p1 text
*& <-- p2 text
*&---------------------------------------------------------------------*
FORM f_informe_1.

  CLEAR gs_ocupacion_1.

  DATA: lv_capacidad TYPE p,                                                " Iteramos sobre la tabla interna donde tenemos los datos de SFLIGHT y SPFLI
        lv_ocupado   TYPE p,                                                " para ir sumando la capacidad total y la ocupación total.
        lv_resultado TYPE ZDECIMAL.

  LOOP AT gt_ocupacion_1 INTO gs_ocupacion_1.

    lv_capacidad = gs_ocupacion_1-seatsmax + gs_ocupacion_1-seatsmax_b + gs_ocupacion_1-seatsmax_f.
    lv_ocupado   = gs_ocupacion_1-seatsocc + gs_ocupacion_1-seatsocc_b + gs_ocupacion_1-seatsocc_f.

    CALL FUNCTION 'ZFM_CALCULADORA_AB1361'
      EXPORTING
        in_num1        = lv_capacidad
        in_num2        = lv_ocupado
        in_signo       = 'P'                                                " Llamamos a este módulo de funciones para calcular el porcentaje de ocupación sobre
      IMPORTING                                                             " la capacidad total.
        out_resultado  = lv_resultado
      EXCEPTIONS
        div0           = 1
        signo_invalido = 2
        OTHERS         = 3.
    IF sy-subrc <> 0.
    ENDIF.

    MOVE-CORRESPONDING gs_ocupacion_1 TO gs_ocupacion_2.                    " Pasamos los datos a la segunda tabla interna, donde mostraremos
                                                                            " el resultado final.

    gs_ocupacion_2-ocupacion = lv_resultado.                                " Informamos la segunda tabla interna con el dato que hemos obtenido, y así
    APPEND gs_ocupacion_2 TO gt_ocupacion_2.                                " ya tendríamos todos los datos.

  ENDLOOP.

  IF p_vacios IS NOT INITIAL.
                                                                            " Si el checkbox está marcado, eliminamos de la tabla interna los vuelos que
    DELETE gt_ocupacion_2 WHERE ocupacion EQ '0.00'.                        " tengan un cero por ciento de ocupación.

  ENDIF.

ENDFORM.
*&---------------------------------------------------------------------*
*& Form f_informe_2
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& --> p1 text
*& <-- p2 text
*&---------------------------------------------------------------------*
FORM f_informe_2.

  DATA: lv_x TYPE i,
        lv_y TYPE i,
        lv_z TYPE i,
        lv_w TYPE i.                                                        " Iteramos sobre la tabla interna donde ya tenemos todos los datos del ejercicio,
                                                                            " para ir sumando cuantos vuelos hay en cada rango de porcentaje de ocupación.
  LOOP AT gt_ocupacion_2 INTO gs_ocupacion_2.

    IF gs_ocupacion_2-ocupacion BETWEEN '0.00' AND '25.00'.
      lv_x = lv_x + 1.

    ELSEIF gs_ocupacion_2-ocupacion BETWEEN '26.00' AND '50.00'.
      lv_y = lv_y + 1.

    ELSEIF gs_ocupacion_2-ocupacion BETWEEN '51.00' AND '75.00'.
      lv_z = lv_z + 1.

    ELSE.
      lv_w = lv_w + 1.

    ENDIF.

  ENDLOOP.
                                                                            " Una vez hemos obtenido los datos, informamos la tercera tabla interna donde mostraremos
  CLEAR gs_ocupacion_3.                                                     " el segundo tipo de informe.
  gs_ocupacion_3-ocupacion = TEXT-002.
  gs_ocupacion_3-vuelos    = lv_x.
  APPEND gs_ocupacion_3 TO gt_ocupacion_3.

  CLEAR gs_ocupacion_3.
  gs_ocupacion_3-ocupacion = TEXT-003.
  gs_ocupacion_3-vuelos    = lv_y.
  APPEND gs_ocupacion_3 TO gt_ocupacion_3.

  CLEAR gs_ocupacion_3.
  gs_ocupacion_3-ocupacion = TEXT-004.
  gs_ocupacion_3-vuelos    = lv_z.
  APPEND gs_ocupacion_3 TO gt_ocupacion_3.

  CLEAR gs_ocupacion_3.
  gs_ocupacion_3-ocupacion = TEXT-005.
  gs_ocupacion_3-vuelos    = lv_w.
  APPEND gs_ocupacion_3 TO gt_ocupacion_3.

ENDFORM.
