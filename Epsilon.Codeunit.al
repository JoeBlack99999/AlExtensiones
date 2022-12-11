codeunit 50103 Epsilon
{
    Permissions = TableData "G/L Entry" = rimd,
                  TableData "Cust. Ledger Entry" = rimd,
                  TableData "Vendor Ledger Entry" = rimd,
                  TableData "Job Ledger Entry" = rimd,
                  TableData "Bank Acc. Reconciliation Line" = rimd;

    trigger OnRun()
    var
        fecharr: Date;
    begin



        /* if UserId <> 'GRUPOORTIZ\IVAN.ARCHILLA' then
            Error('NO ESTAS AUTORIZADO A REALIZAR ESTA OPERACIÓN.');

         
           Create(aa, false, true);
           aa.Open('Provider=OraOLEDB.Oracle;Data Source=EPSILON;User Id=navuser;Password=navuser;');
           Create(aaa, false, true);
           aaa.Open('Select * from ORGANIZACION_ORTIZ', aa, 2, 3);
           aaa.MoveFirst;
           VENT.Open('Epsilon : ##########1#######');
           epsilon.DeleteAll;
           Commit;
           i := 0;
           repeat
               i += 1;
               Clear(vari);
               epsilon.Init;
               epsilon."No." := aaa.Fields.Item('ID_TRABAJADOR').Value;
               epsilon."Nombre Completo" := aaa.Fields.Item('NOMBRE_COMPLETO').Value;
               vari := aaa.Fields.Item('F_BAJA_TRABAJADOR').Value;
               if vari.IsDateTime then begin
                   vari := DT2Date(vari);
                   if vari.IsDate then
                       epsilon."Termination Date" := vari;
               end;
               vari := aaa.Fields.Item('F_ALTA_TRABAJADOR').Value;
               if ((epsilon."No." = '004807') and (i = 5314)) then begin
                   epsilon."Employment Date" := 20160801D;
               end else
                   if ((epsilon."No." = '070410') and (i = 5423)) then begin
                       epsilon."Employment Date" := 20070417D;
                   end else
                       if ((epsilon."No." = '070410') and (i = 5556)) then begin
                           epsilon."Employment Date" := 20070417D;
                       end else
                           if ((epsilon."No." = '070410') and (i = 5563)) then begin
                               epsilon."Employment Date" := 20070417D;
                           end else
                               if ((epsilon."No." = '018763') and (i = 8792)) then begin
                                   epsilon."Employment Date" := 20190921D;
                               end else
                                   if ((epsilon."No." = '018763') and (i = 8529)) then begin
                                       epsilon."Employment Date" := 20190921D;
                                   end else
                                       if ((epsilon."No." = '018763') and (i = 8803)) then begin
                                           epsilon."Employment Date" := 20190921D;
                                       end else
                                           if ((epsilon."No." = '004807') and (i = 5442)) then begin
                                               epsilon."Employment Date" := 20160801D;
                                           end else
                                               if ((epsilon."No." = '004807') and (i = 5449)) then begin
                                                   epsilon."Employment Date" := 20160801D;
                                               end else
                                                   if ((epsilon."No." = '071700') and (i = 5733)) then begin
                                                       epsilon."Employment Date" := 20210913D;
                                                   end else begin
                                                       if vari.IsDateTime then begin
                                                           vari := DT2Date(vari);
                                                           if vari.IsDate then
                                                               epsilon."Employment Date" := vari;
                                                       end;
                                                   end;
               epsilon.Clave := i;
               vari := aaa.Fields.Item('SEXO').Value;
               if vari.IsText then begin
                   C := vari;
                   if C = 'V' then
                       epsilon.Gender := epsilon.Gender::Male;
                   if C = 'M' then
                       epsilon.Gender := epsilon.Gender::Female;
               end;
               vari := aaa.Fields.Item('EMAIL2').Value;
               if vari.IsText then begin
                   if StrPos(vari, 'grupoortiz.com') > 0 then
                       epsilon."Email Ortiz" := vari;
               end;
               vari := aaa.Fields.Item('NIF').Value;
               if vari.IsText then
                   epsilon."VAT Registration No." := vari;
               epsilon.Name := aaa.Fields.Item('NOMBRE').Value;
               epsilon."First Family Name" := aaa.Fields.Item('APELLIDO1').Value;
               vari := aaa.Fields.Item('APELLIDO2').Value;
               if vari.IsText then
                   epsilon."Second Family Name" := vari;
               vari := aaa.Fields.Item('CP_CENTRO').Value;
               if vari.IsText then
                   epsilon."Post Code" := vari;
               vari := aaa.Fields.Item('CENTRO').Value;
               if vari.IsText then
                   epsilon."Centro de Trabajo" := vari;
               tt := '';
               vari := aaa.Fields.Item('PAIS_EMP').Value;
               if vari.IsText then begin
                   tt := vari;
                   if tt = 'ESPAÑA' then
                       epsilon."Area Geografica" := 'NACIONAL'
                   else
                       epsilon."Area Geografica" := 'INTERNACIONAL'
               end;
               vari := aaa.Fields.Item('AREA_NEGOCIO').Value;
               if vari.IsText then begin
                   epsilon."Area Negocio" := vari;
               end;

               vari := aaa.Fields.Item('SECCION').Value;
               if vari.IsText then begin
                   epsilon.Sección := CopyStr(vari, 1, 50);
               end;

               vari := aaa.Fields.Item('DEPARTAMENTO').Value;
               if vari.IsText then begin
                   epsilon.Departamento := vari;
               end;

               vari := aaa.Fields.Item('ID_EMPRESA').Value;
               if vari.IsText then begin
                   epsilon."ID Empresa" := vari;
               end;
               vari := aaa.Fields.Item('NOMBRE_EMPRESA').Value;
               if vari.IsText then begin
                   epsilon."Empresa Nomina" := vari;
               end;
               vari := aaa.Fields.Item('ID_CONVENIO').Value;
               if vari.IsText then begin
                   epsilon.Convenio := vari;
               end;
               vari := aaa.Fields.Item('D_N_ESTUDIOS').Value;
               if vari.IsText then begin
                   epsilon.Studies := CopyStr(vari, 1, 150);
               end;
               vari := aaa.Fields.Item('ID_CONTRATO').Value;
               if vari.IsText then begin
                   epsilon."Id Contrato" := vari;
               end;
               vari := aaa.Fields.Item('FAMILIA_PUESTO').Value;
               if vari.IsText then begin
                   epsilon."Familia Puesto" := vari;
               end;

               vari := aaa.Fields.Item('UBICACION_INTERNACIONAL').Value;
               if vari.IsText then begin
                   tt := vari;
                   if tt = 'EXPATRIADO' then
                       epsilon.Expatriado := true;
               end;

               vari := aaa.Fields.Item('FECHA_NACIMIENTO').Value;
               if vari.IsDateTime then begin
                   vari := DT2Date(vari);
                   if vari.IsDate then
                       epsilon."Birth Date" := vari;
               end;
               vari := aaa.Fields.Item('ROL').Value;
               if vari.IsText then begin
                   epsilon.Rol := vari;
               end;
               vari := aaa.Fields.Item('PUESTO').Value;
               if vari.IsText then begin
                   epsilon.Puesto := vari;
               end;
               vari := aaa.Fields.Item('PAIS_NAC_ISO').Value;
               if vari.IsText then begin
                   epsilon."Country/Region Code" := vari;
               end;
               vari := aaa.Fields.Item('GUARDA_LEGAL').Value;
               if vari.IsInteger then begin
                   RR := vari;
                   if RR = 1 then
                       epsilon."Guarda legal" := true
                   else
                       epsilon."Guarda legal" := false;
               end;

               /*
                  vari :=  aaa.Fields.Item('P_JORNADA_TRAB');
                  IF vari.ISINTEGER THEN BEGIN
                    epsilon."Porcentaje jornada" := vari;
                  END;
                  */

        /*

                      vari := aaa.Fields.Item('CENTRO_COSTE').Value;
                      if vari.IsText then begin
                          epsilon."Cost Center Code" := vari;
                      end;

                      vari := aaa.Fields.Item('GRUPO_PROF').Value;
                      if vari.IsText then
                          epsilon."Grupo Profesional" := vari;


                      vari := aaa.Fields.Item('ID_GRUPOPROF').Value;
                      if Format(vari) = '1' then
                          epsilon."Grupo Profesional." := 'PRODNAC';
                      if Format(vari) = '2' then
                          epsilon."Grupo Profesional." := 'ESTRNAC';
                      if Format(vari) = '3' then
                          epsilon."Grupo Profesional." := 'ESTRINT';
                      if Format(vari) = '4' then
                          epsilon."Grupo Profesional." := 'PRODINT';



                      epsilon.Insert;
                      aaa.MoveNext;
                      VENT.Update(1, epsilon."No.");
                      Commit;
                  until aaa.EOF;
                  VENT.Close;

                  epsilon.Reset;
                  tot := epsilon.Count;
                  i := 0;
                  j := 0;
                  VENT.Open('Ordenando :  @@@@@@@@@@@@@@@1@@@@@@@@@@@@');
                  if epsilon.FindFirst then
                      repeat
                          i += 1;
                          j += 1;
                          VENT.Update(1, (i * 10000) div tot);
                          epsilon2.Reset;
                          epsilon2.SetRange("No.", epsilon."No.");
                          if epsilon2.Count > 1 then begin
                              epsilon3.Reset;
                              epsilon3.SetRange("No.", epsilon."No.");
                              epsilon3.SetFilter("Termination Date", '%1', 0D);
                              if epsilon3.FindFirst then begin
                                  k := 0;
                                  epsilon3.Orden := j;
                                  epsilon3.Modify;
                                  epsilon2.Reset;
                                  epsilon2.SetRange("No.", epsilon."No.");
                                  epsilon2.SetFilter("Termination Date", '<>%1', 0D);
                                  if epsilon2.FindFirst then
                                      repeat
                                          k += 1;
                                          j += 1;
                                          epsilon2.Orden := j;
                                          epsilon2.Indentacion := k;
                                          epsilon2.Modify;
                                      until epsilon2.Next = 0;
                              end else begin
                                  epsilon.Orden := j;
                              end;
                          end;

                          epsilon2.Reset;
                          epsilon2.SetRange("No.", epsilon."No.");
                          epsilon2.SetFilter("Termination Date", '<>%1', 0D);
                          if epsilon2.FindFirst then begin
                              epsilon3.Reset;
                              epsilon3.SetRange("No.", epsilon."No.");
                              epsilon3.SetFilter("Termination Date", '%1', 0D);
                              if not epsilon3.FindFirst then begin
                                  epsilon4.Reset;
                                  epsilon4.SetRange("No.", epsilon."No.");
                                  if epsilon4.FindFirst then
                                      repeat
                                          epsilon4.Baja := true;
                                          if EMPL.Get(epsilon4."No.") then begin
                                              if EMPL."Termination Date" < EMPL."Employment Date" then
                                                  EMPL.Baja := false;
                                          end;
                                          epsilon4.Modify;
                                          if EMPL.Get(epsilon4."No.") then begin
                                              EMPL."Termination Date" := epsilon4."Termination Date";
                                              if epsilon4."Termination Date" < epsilon2."Termination Date" then
                                                  EMPL."Termination Date" := epsilon2."Termination Date";
                                              EMPL.Baja := true;
                                              if EMPL."Termination Date" < EMPL."Employment Date" then
                                                  EMPL.Baja := false;
                                              EMPL.Modify;
                                          end;
                                      until epsilon4.Next = 0;
                              end;
                          end else begin
                              epsilon2.Reset;
                              epsilon2.SetRange("No.", epsilon."No.");
                              if epsilon2.FindFirst then
                                  repeat
                                      if epsilon2."Termination Date" > epsilon."Termination Date" then begin
                                          EMPL.Get(epsilon."No.");
                                          EMPL."Empresa Nomina" := epsilon2."Empresa Nomina";
                                          EMPL."ID Empresa" := epsilon2."ID Empresa";
                                          EMPL.Modify;
                                      end;

                                  until epsilon2.Next = 0;
                          end;

                      until epsilon.Next = 0;
                  VENT.Close;

                  VENT.Open('Actualizando tabla de Empleados RRHH :    ###########1###########\' +
                           'Proceso :    @@@@@@@@@@@@@@@@@@@@@@2@@@@@@@@@@@@@@@@@@@@@@@@@@@@@');
                  epsilon.Reset;
                  epsilon.SetRange(Indentacion, 0);
                  tot := epsilon.Count;
                  i := 0;
                  j := 0;
                  if epsilon.FindFirst then
                      repeat

                          i += 1;
                          VENT.Update(1, epsilon."Nombre Completo");
                          VENT.Update(2, (i * 10000) div tot);
                          if not EMPL.Get(epsilon."No.") then begin
                              EMPL.Init;
                              EMPL.TransferFields(epsilon);
                              EMPL."Nombre Completo" := epsilon.Name + ' ' + epsilon."First Family Name" + ' ' + epsilon."Second Family Name";
                              EMPL.Insert;
                          end else begin
                              EMPL."Nombre Completo" := epsilon.Name + ' ' + epsilon."First Family Name" + ' ' + epsilon."Second Family Name";
                              if EMPL."Email Ortiz" = '' then
                                  EMPL."Email Ortiz" := epsilon."Email Ortiz";
                              EMPL.Name := epsilon.Name;
                              EMPL."Second Family Name" := epsilon."Second Family Name";
                              EMPL."First Family Name" := epsilon."First Family Name";
                              EMPL."Employment Date" := epsilon."Employment Date";
                              EMPL."Post Code" := epsilon."Post Code";
                              EMPL."Centro de Trabajo" := epsilon."Centro de Trabajo";
                              EMPL.Gender := epsilon.Gender;
                              // EMPL."Area Geografica" :=  epsilon."Area Geografica";
                              //EMPL."Area Negocio" :=  epsilon."Area Negocio";
                              if EMPL."Birth Date" = 0D then
                                  EMPL."Birth Date" := epsilon."Birth Date";
                              //EMPL.Sección :=  epsilon.Sección;
                              //EMPL.Departamento := epsilon.Departamento;
                              //EMPL."Tipo contrato" := epsilon."Tipo contrato";
                              EMPL.Rol := epsilon.Rol;
                              EMPL.Puesto := epsilon.Puesto;
                              EMPL."ID Empresa" := epsilon."ID Empresa";
                              EMPL."Empresa Nomina" := epsilon."Empresa Nomina";
                              EMPL.Convenio := epsilon.Convenio;
                              EMPL.studies := epsilon.Studies;
                              EMPL."Id Contrato" := epsilon."Id Contrato";
                              EMPL."Familia Puesto" := epsilon."Familia Puesto";
                              EMPL."Country/Region Code" := epsilon."Country/Region Code";
                              EMPL."Guarda legal" := epsilon."Guarda legal";
                              EMPL.Expatriado := epsilon.Expatriado;
                              EMPL."Porcentaje jornada" := epsilon."Porcentaje jornada";
                              EMPL."Cost Center Code" := epsilon."Cost Center Code";
                              EMPL.Modify;
                          end;

                          if EMPL."Salario 2021" < 60000 then
                              EMPL."Num Comidas" := 4;
                          if EMPL."Salario 2021" >= 60000 then
                              EMPL."Num Comidas" := 2;
                          if EMPL."Salario 2021" >= 80000 then
                              EMPL."Num Comidas" := 0;
                          if EMPL."Guarda legal" then
                              EMPL."Num Comidas" := 1;
                          EMPL."Grupo Profesional." := epsilon."Grupo Profesional.";
                          EMPL.Modify;
                      until epsilon.Next = 0;
                  VENT.Close;
                  Message('Proceso Actualización Epsilon');

                  Commit;

                  EMPL.Reset;
                  if EMPL.FindFirst then
                      repeat
                          if EMPL."Termination Date" < EMPL."Employment Date" then begin
                              EMPL.Baja := false;
                              EMPL.Modify;
                          end;
                          if EMPL."Termination Date" > Today then begin
                              EMPL.Baja := true;
                              EMPL.Modify;
                          end;
                      until EMPL.Next = 0;
              */


    end;

    var
        i: Integer;
        aa: Guid;
        aaa: Guid;
        /*epsilon: Record "Employee Epsilon";*/
        VENT: Dialog;
        vari: Variant;
        tot: Integer;
        /*epsilon2: Record "Employee Epsilon";*/
        /*epsilon3: Record "Employee Epsilon";*/
        j: Integer;
        /*epsilon4: Record "Employee Epsilon";*/
        k: Integer;
        C: Char;
        EMPL: Record Employee;
        emplrel: Record Employee;
        tt: Text;
        RR: Integer;
        total: Integer;
        insert: Integer;
}

