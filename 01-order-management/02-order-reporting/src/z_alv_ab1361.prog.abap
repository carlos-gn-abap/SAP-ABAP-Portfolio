*&---------------------------------------------------------------------*
*& Report Z_ALV_AB1361
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_alv_ab1361.

************************************************************
*Tablas SAP
************************************************************
TABLES: zvbak_ab1361,
        zvbap_ab1361.

************************************************************
*Types
************************************************************
TYPES: BEGIN OF ty_alv_join,

         vbeln     TYPE zvbak_ab1361-vbeln,
         erdat     TYPE zvbak_ab1361-erdat,
         zoferta   TYPE zvbak_ab1361-zoferta,
         bnddt     TYPE zvbak_ab1361-bnddt,
         waerk     TYPE zvbak_ab1361-waerk,
         kunnr     TYPE zvbak_ab1361-kunnr,
         zgenvio   TYPE zvbak_ab1361-zgenvio,
         ziva      TYPE zvbak_ab1361-ziva,
         zmjahr    TYPE zvbak_ab1361-zmjahr,
         posnt     TYPE zvbap_ab1361-posnt,
         matnr     TYPE zvbap_ab1361-matnr,
         charg     TYPE zvbap_ab1361-charg,
         meins     TYPE zvbap_ab1361-meins,
         zcantidad TYPE zvbap_ab1361-zcantidad,
         zprecio   TYPE zvbap_ab1361-zprecio,

       END OF ty_alv_join.

************************************************************
*Constantes
************************************************************
*CONSTANTS:

************************************************************
*Variables globales
************************************************************
DATA: go_alv_table TYPE REF TO cl_salv_table,
      go_functions TYPE REF TO cl_salv_functions,
      go_display   TYPE REF TO cl_salv_display_settings.

************************************************************
*Estructuras
************************************************************
*DATA:

************************************************************
*Declaración tablas internas
************************************************************
DATA: gt_alv_join TYPE STANDARD TABLE OF ty_alv_join.

************************************************************
*          SELECTION-SCREEN
************************************************************
SELECTION-SCREEN: BEGIN OF BLOCK b1 WITH FRAME TITLE TEXT-000.

  SELECTION-SCREEN: SKIP.

  SELECT-OPTIONS: so_ped   FOR zvbak_ab1361-vbeln   NO-EXTENSION,
                  so_fecha FOR zvbak_ab1361-erdat   NO-EXTENSION,
                  so_limit FOR zvbak_ab1361-bnddt   NO-EXTENSION,
                  so_clien FOR zvbak_ab1361-kunnr   NO-EXTENSION,
                  so_mater FOR zvbap_ab1361-matnr   NO-EXTENSION,
                  so_preci FOR zvbap_ab1361-zprecio NO-EXTENSION.

  SELECTION-SCREEN: SKIP.

SELECTION-SCREEN: END OF BLOCK b1.

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

  PERFORM f_seleccion_datos.

************************************************************
*          END-OF-SELECTION
************************************************************
END-OF-SELECTION.

  PERFORM f_mostrar_datos.

************************************************************
************************************************************
*                      SUBRUTINAS                          *
************************************************************
************************************************************
*&---------------------------------------------------------------------*
*& Form f_seleccion_datos
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM f_seleccion_datos.

  REFRESH gt_alv_join.

  SELECT zvbak_ab1361~vbeln
         zvbak_ab1361~erdat
         zvbak_ab1361~zoferta
         zvbak_ab1361~bnddt
         zvbak_ab1361~waerk
         zvbak_ab1361~kunnr
         zvbak_ab1361~zgenvio
         zvbak_ab1361~ziva
         zvbak_ab1361~zmjahr
         zvbap_ab1361~posnt
         zvbap_ab1361~matnr
         zvbap_ab1361~charg
         zvbap_ab1361~meins
         zvbap_ab1361~zcantidad
         zvbap_ab1361~zprecio
    FROM zvbap_ab1361
    INNER JOIN zvbak_ab1361 ON zvbap_ab1361~vbeln EQ zvbak_ab1361~vbeln
    INTO TABLE gt_alv_join
    WHERE zvbak_ab1361~vbeln   IN so_ped   AND
          zvbak_ab1361~erdat   IN so_fecha AND
          zvbak_ab1361~bnddt   IN so_limit AND
          zvbak_ab1361~kunnr   IN so_clien AND
          zvbap_ab1361~matnr   IN so_mater AND
          zvbap_ab1361~zprecio IN so_preci.

ENDFORM.
*&---------------------------------------------------------------------*
*& Form f_mostrar_datos
*&---------------------------------------------------------------------*
*& text
*&---------------------------------------------------------------------*
*& -->  p1        text
*& <--  p2        text
*&---------------------------------------------------------------------*
FORM f_mostrar_datos.

  cl_salv_table=>factory( IMPORTING r_salv_table = go_alv_table
                          CHANGING t_table       = gt_alv_join ).

  go_functions = go_alv_table->get_functions( ).
  go_functions->set_all( 'X' ).

  go_display = go_alv_table->get_display_settings( ).
  go_display->set_striped_pattern( cl_salv_display_settings=>true ).

  go_alv_table->display( ).

ENDFORM.
