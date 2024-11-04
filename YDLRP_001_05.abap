*&---------------------------------------------------------------------*
*& Report YDLRP_001_05
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT ydlrp_001_05.

" Definir o comportamento da Classe
CLASS lcl_first DEFINITION.

  " Public - Publico, pode ser acessado de fora da classe
  PUBLIC SECTION.
    "Atributos
    DATA: nome_pub TYPE string VALUE '__Nome Público__'.

    METHODS: write_nome_pro,
      write_nome_pri.

    " Protected - Protegido, só pode ser herdado e utilizado dentro da classe
  PROTECTED SECTION.
    "Atributos
    DATA: nome_pro TYPE string VALUE '__Nome Protegido__'.

    " Private - Privado, não pode ser usado de fora da classe nem ser herdado
  PRIVATE SECTION.
    "Atributos
    DATA: nome_pri TYPE string VALUE '__Nome Privado__'.

ENDCLASS.

" Implementaão dos Métodos
CLASS lcl_first IMPLEMENTATION.
  METHOD write_nome_pro.
    WRITE: /'Nome Protegido',me->nome_pro.
  ENDMETHOD.

  METHOD write_nome_pri.
    WRITE: /'Nome Privado',me->nome_pri.
  ENDMETHOD.

ENDCLASS.

"Variável 1

INITIALIZATION.
  DATA(lo_first) = NEW lcl_first( ).

  WRITE: /'Nome Público',lo_first->nome_pub.

  lo_first->write_nome_pri( ).
  lo_first->write_nome_pro( ).