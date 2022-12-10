page 50104 "Vista Epsilon"
{
    PageType = List;
    Permissions = TableData Employee = rimd;
    /* TableData "Employee Epsilon" = rimd;*/
    SourceTable = Employee;
    SourceTableView = SORTING("No.")
                      ORDER(Ascending);
    /*
    WHERE("ID Empresa" = FILTER(1 | 4 | 6 | 14 | 16 | 17 | 30 | 40 | 44 | 106 | 109 | 112 | 114 | 115 | 117 | 118 | 119 | 120 | 121 | 122 | 123 | 124 | 125 | 127 | 128 | 500 | 501 | 502 | 503 | 508 | 512 | 515 | 519 | 520 | 522 | 523 | 525 | 526 | 527 | 529 | 530 | 531 | 540),
          "Termination Date" = FILTER(0D),
          "Area Negocio" = FILTER(<> ''));
  */

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                Editable = false;
                /*IndentationColumn = NameIndent;
                ShowAsTree = true;
                IndentationControls = "Nombre";
                */

                field("No."; rec."No.")
                {
                    Caption = 'Nº';
                    StyleExpr = styletxt;
                }
                field("Primer Apellido"; rec."First Family Name")
                {
                    Caption = 'Primer Apellido';
                    StyleExpr = styletxt;
                }

                field("Segundo Apellido"; rec."Second Family Name")
                {
                    Caption = 'Segundo Apellido';
                    StyleExpr = styletxt;
                }

                field("Nombre"; rec."Name")
                {
                    Caption = 'Nombre';
                    StyleExpr = styletxt;
                }


                /*
                field(Departamento; Departamento)
                {
                }
                field("Nombre Completo"; "Nombre Completo")
                {
                }
                field("Coste 2022"; "Coste 2022")
                {
                }
                field("Bonus 2022"; "Bonus 2022")
                {
                }
                field("Num. Empleados"; "Num. Empleados")
                {
                }
                field("Grupo Profesional GEOGRA"; "Grupo Profesional GEOGRA")
                {
                }
                field("Grupo Profesional AREA"; "Grupo Profesional AREA")
                {
                }
                field("Edad."; "Edad.")
                {
                }
                field("Antigüedad"; Antigüedad)
                {
                }
                field("<antiguedad>"; "Empresa Nomina")
                {
                    Visible = false;
                }
                field("Porcentaje jornada"; "Porcentaje jornada")
                {
                }
                field(Puesto; Puesto)
                {
                }
                field("Sección"; Sección)
                {
                }
                field("País Auditoría"; "País Auditoría")
                {
                }
                field(Responsable; Responsable)
                {
                }
                field("Nombre Responsable"; "Nombre Responsable")
                {
                }
                field(Expatriado; Expatriado)
                {
                }
                field("Tramo Edad"; "Tramo Edad")
                {
                }
                field(Subrogado; Subrogado)
                {
                }
                */
            }
            cuegroup("Estadísticas")
            {
                Caption = 'Estadísticas';

                /*CueGroupLayout = Columns;*/
                field(Sumasal; Sumasal)
                {
                    Caption = 'Suma de Coste Salarios';
                    Image = Cash;
                }
                /*
                field(bonu; bonu)
                {
                    Caption = 'Suma Bonus 2022';
                }
                field(NumReg; NumReg)
                {
                    Caption = 'Total Empleados';
                    Image = "None";
                    Importance = Promoted;
                    Numeric = true;
                }
                field(infra; infra)
                {
                    Caption = 'Nº Infraestructura';
                    Image = "None";
                }
                field(ener; ener)
                {
                    Caption = 'Nº Energía';
                    Image = "None";
                }
                field(conce; conce)
                {
                    Caption = 'Nº Concesiones';
                    Image = "None";
                }
                field(Enblanco; Enblanco)
                {
                    Caption = 'Nº En blanco';
                    Image = "None";
                }
                field(jubilados; jubilados)
                {
                    Caption = 'Prejubilados';
                    Image = "None";
                }
                field(menos30; menos30)
                {
                    Caption = 'Menos de 30';
                    Image = "None";
                }
                field(mas60; mas60)
                {
                    Caption = 'Mas de 60';
                    Image = "None";
                }
                */
            }
        }
        area(factboxes)
        {
            part(Control1000000018; "Employee Picture")
            {
                ApplicationArea = BasicHR;
                SubPageLink = "No." = FIELD("No.");
            }

            /*
            part(Control1000000037; "Obras Empleado")
            {
                SubPageLink = "Reason Code" = FIELD("No.");
                SubPageView = SORTING("Entry No.")
                              ORDER(Descending);
            }
            part("Personas al cargo"; "Employee List")
            {
                Caption = 'Personas al cargo';
                SubPageLink = Responsable = FIELD("No."),
                              "Termination Date" = FILTER(0D);
                SubPageView = SORTING("No.")
                              ORDER(Ascending);
            }
            */
        }
    }

    actions
    {
        area(processing)
        {
            action(Fotos)
            {
                Caption = 'Fotos';
            }
            action(reclar)
            {
                Caption = 'reclar';

                trigger OnAction()
                begin

                    Message('reclar');
                end;
            }
            action(Clasifica)
            {
                Caption = 'Clasifica';

                trigger OnAction()
                begin
                    Message('Clasifica');
                end;
            }
            action(TreeView)
            {
                Caption = 'TreeView';

                trigger OnAction()
                begin
                    Message('TreeView');
                end;
            }
            action(tree)
            {
                Caption = 'tree';

                trigger OnAction()
                begin
                    Message('TreeView');
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin

        /* Message(' OnAfterGetRecord %1', rec."No.");*/

        NameIndent := 0; /* Indentacion;*/

        if NameIndent = 0 then
            styletxt := 'Strong'
        else
            styletxt := 'Standard';
    end;

    trigger OnOpenPage()
    begin

        /*Message('OnOpenPage');
        if ((UserId = 'GRUPOORTIZ\IVAN.ARCHILLA') and (UserId = 'GRUPOORTIZ\SARA.CARPINTERO') and (UserId = 'GRUPOORTIZ\JAVIER.GOMEZ') and (UserId = 'GRUPOORTIZ\GONZALO.DELATORRE')) then
            Error('Usuario NO Autorizado');
        */

        /* t5200.Reset;
         t5200.SetFilter(Indentacion, '%1', 0);
         if t5200.FindFirst then
             repeat
                 t5200."Coste 2022" := 0;
                 t5200."Bonus 2022" := 0;
                 t5200.Modify;
             until t5200.Next = 0;
         Commit;
         */

        Sumasal := 0;
        bonu := 0;
        /*
        t5200.Reset;
        t5200.CopyFilters(Rec);
        t5200.SetFilter(Indentacion, '<>%1', 0);
        t5200.CalcSums("Coste 2022");
        t5200.CalcSums("Bonus 2022");
        Sumasal := t5200."Coste 2022";
        NumReg := t5200.Count;
        bonu := t5200."Bonus 2022";

        t5200.Reset;
        t5200.CopyFilters(Rec);
        t5200.SetRange("Tramo Edad", "Tramo Edad"::"<30");
        menos30 := t5200.Count;

        t5200.Reset;
        t5200.CopyFilters(Rec);
        t5200.SetRange("Tramo Edad", "Tramo Edad"::">60");
        mas60 := t5200.Count;

        jubilados := 31;

        t5200.Reset;
        t5200.CopyFilters(Rec);
        t5200.SetFilter("Area Negocio", 'CONCESIONES');
        t5200.SetFilter(Indentacion, '<>%1', 0);
        t5200.CalcSums("Coste 2022");
        t5200.CalcSums("Bonus 2022");
        sue := t5200."Coste 2022";
        bon := t5200."Bonus 2022";
        numemp := t5200.Count;
        t5200.SetFilter(Indentacion, '%1', 0);
        if t5200.FindFirst then begin
            t5200."Coste 2022" := sue;
            t5200."Bonus 2022" := bon;
            t5200."Num. Empleados" := numemp;
            t5200.Modify;
        end;
        conce := t5200.Count;

        t5200.Reset;
        t5200.CopyFilters(Rec);
        t5200.SetFilter("Area Negocio", 'ENERGÍA');
        t5200.SetFilter(Indentacion, '<>%1', 0);
        t5200.CalcSums("Coste 2022");
        t5200.CalcSums("Bonus 2022");
        sue := t5200."Coste 2022";
        bon := t5200."Bonus 2022";
        numemp := t5200.Count;
        t5200.SetFilter(Indentacion, '%1', 0);
        if t5200.FindFirst then begin
            t5200."Coste 2022" := sue;
            t5200."Bonus 2022" := bon;
            t5200."Num. Empleados" := numemp;
            t5200.Modify;
        end;
        ener := t5200.Count;

        t5200.Reset;
        t5200.CopyFilters(Rec);
        t5200.SetFilter("Area Negocio", 'INFRAESTRUCTURAS');
        t5200.SetFilter(Indentacion, '<>%1', 0);
        t5200.CalcSums("Coste 2022");
        t5200.CalcSums("Bonus 2022");
        sue := t5200."Coste 2022";
        bon := t5200."Bonus 2022";
        numemp := t5200.Count;
        t5200.SetFilter(Indentacion, '%1', 0);
        if t5200.FindFirst then begin
            t5200."Coste 2022" := sue;
            t5200."Bonus 2022" := bon;
            t5200."Num. Empleados" := numemp;
            t5200.Modify;
        end;
        infra := t5200.Count;


        t5200.Reset;
        t5200.CopyFilters(Rec);
        t5200.SetFilter("Area Negocio", 'OTROS NEGOCIOS');
        t5200.SetFilter(Indentacion, '<>%1', 0);
        t5200.CalcSums("Coste 2022");
        t5200.CalcSums("Bonus 2022");
        sue := t5200."Coste 2022";
        bon := t5200."Bonus 2022";
        numemp := t5200.Count;
        t5200.SetFilter(Indentacion, '%1', 0);
        if t5200.FindFirst then begin
            t5200."Coste 2022" := sue;
            t5200."Bonus 2022" := bon;
            t5200."Num. Empleados" := numemp;
            t5200.Modify;
        end;
        infra := t5200.Count;

        t5200.Reset;
        t5200.CopyFilters(Rec);
        t5200.SetFilter("Area Negocio", 'SERVICIOS CORPORATIVOS');
        t5200.SetFilter(Indentacion, '<>%1', 0);
        t5200.CalcSums("Coste 2022");
        t5200.CalcSums("Bonus 2022");
        sue := t5200."Coste 2022";
        bon := t5200."Bonus 2022";
        numemp := t5200.Count;
        t5200.SetFilter(Indentacion, '%1', 0);
        if t5200.FindFirst then begin
            t5200."Coste 2022" := sue;
            t5200."Bonus 2022" := bon;
            t5200."Num. Empleados" := numemp;
            t5200.Modify;
        end;
        infra := t5200.Count;

        t5200.Reset;
        t5200.CopyFilters(Rec);
        t5200.SetFilter("Area Negocio", '%1', '');
        t5200.CalcSums("Coste 2022");
        t5200.CalcSums("Bonus 2022");
        Enblanco := t5200.Count;
    */


    end;

    var
        us: Record "User Setup";
        t5200: Record Employee;
        Edadt: Text;
        i: Integer;
        NumReg: Integer;
        Salario2020: Decimal;
        Salario2019: Decimal;
        Coste2020: Decimal;
        Coste2019: Decimal;
        Salario2018: Decimal;
        Coste2018: Decimal;
        DiferenciaCoste: Decimal;
        Porcentaje: Decimal;
        DiferenciaSalario: Decimal;
        PorcentajeCoste: Decimal;
        Mujeres: Integer;
        Hombres: Integer;
        DiferenciaTramo: Decimal;
        DiferenciaTramoCoste: Decimal;
        TramoSalario: Decimal;
        TramoCoste: Decimal;
        PorcentajeTramo: Decimal;
        Porcentajetramocoste: Decimal;
        tc: Record "Cost Center";
        te: Record Employee;
        NObra: Text[250];
        T167: Record Job;
        pro: Decimal;
        d: Decimal;
        tem: Record Employee;
        /*smtp: Codeunit "SMTP Mail";*/
        mail: Codeunit "Mail Management";
        /*t: Record "QuoSync Send";*/
        cm: Codeunit Mail;
        ccc: Text;
        j: Integer;
        /*pa: Page "QuoSync Send";*/
        r: Integer;
        paso: Boolean;
        subida2020: Decimal;
        "años": Decimal;
        Salario2021: Decimal;
        Coste2021: Decimal;
        Subida2021: Decimal;
        Salario2022: Decimal;
        Coste2022: Decimal;
        lastObra: Code[20];
        /*edp2: Record NominasVSEpsilonvsContabilidad;*/
        antiguedad: Text;
        an: Integer;
        jubilados: Integer;
        menos30: Integer;
        c30a45: Integer;
        c45a65: Integer;
        mas60: Integer;
        infra: Integer;
        ener: Integer;
        conce: Integer;
        Enblanco: Integer;
        NombreObra: Text;
        t52002: Record Employee;
        NameIndent: Integer;
        Sumasal: Decimal;
        bonu: Decimal;
        sue: Decimal;
        bon: Decimal;
        styletxt: Text;
        numemp: Integer;
}

