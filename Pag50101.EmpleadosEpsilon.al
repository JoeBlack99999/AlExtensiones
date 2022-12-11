page 50101 "Empleados Epsilon"
{
    ApplicationArea = All;
    Caption = 'Empleados Epsilon';
    PageType = List;
    SourceTable = Employee;
    SourceTableView = SORTING("No.")
                       ORDER(Ascending);
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the number of the involved entry or record, according to the specified number series.';
                }
                field("First Family Name"; Rec."First Family Name")
                {
                    ToolTip = 'Specifies the employee''s last name.';
                }
                field("Second Family Name"; Rec."Second Family Name")
                {
                    ToolTip = 'Specifies the second part of the family name.';
                }
                field(Name; Rec.Name)
                {
                    ToolTip = 'Specifies the employee''s first name.';
                }

                field("Employment Date"; Rec."Employment Date")
                {
                    ToolTip = 'Specifies the date when the employee began to work for the company.';
                }
                field("Birth Date"; Rec."Birth Date")
                {
                    ToolTip = 'Specifies the employee''s date of birth.';
                }
                field("E-Mail"; Rec."E-Mail")
                {
                    ToolTip = 'Specifies the employee''s private email address.';
                }
            }
        }

        area(factboxes)
        {
            part(Control1000000018; "Employee Picture")
            {
                ApplicationArea = BasicHR;
                SubPageLink = "No." = FIELD("No.");
            }
        }

    }

    actions
    {
        area("Processing")
        {
            action("&Import")
            {
                ApplicationArea = All;
                Caption = '&Import';
                Image = ImportExcel;
                Promoted = true;
                PromotedCategory = Process;
                ToolTip = 'Importar Excel';
                trigger OnAction()
                begin
                    ReadExcelSheet();
                    ImportExcelData();

                end;

            }

        }

    }

    var
        rExcelBuffer: Record "Excel Buffer";
        i: Integer;
        vDialogo: Dialog;
        FileName: Text[100];
        SheetName: text[100];



    local procedure ReadExcelSheet()
    var
        FileManagement: Codeunit "File Management";
        IStream: InStream;
        FromFile: Text[100];

    begin
        UploadIntoStream('Seleccione el Excel..', '', '', FromFile, IStream);
        if FromFile <> '' then begin
            FileName := FileManagement.GetFileName(FromFile);
            SheetName := rExcelBuffer.SelectSheetsNameStream(IStream);
        end else
            Error('Excel no encontrado');

        rExcelBuffer.Reset();
        rExcelBuffer.DeleteAll();
        rExcelBuffer.OpenBookStream(IStream, SheetName);
        rExcelBuffer.ReadSheet();
    end;

    local procedure GetValueAtCell(RowNo: Integer; ColNo: Integer): Text
    begin
        rExcelBuffer.Reset();
        if rExcelBuffer.get(RowNo, ColNo) then
            exit(rExcelBuffer."Cell Value as Text")
        else
            exit('');

    end;

    local procedure ImportExcelData()
    var
        rEmpleado: Record Employee;
        RowNo: Integer;
        Colno: Integer;
        LineNo: Code[20];
        MaxRow: Integer;

    begin
        RowNo := 0;
        Colno := 0;
        LineNo := '';
        Maxrow := 0;

        rEmpleado.Reset();
        if rEmpleado.FindLast() then
            LineNo := rEmpleado."No.";

        rExcelBuffer.Reset();

        if rExcelBuffer.FindLast() then begin
            MaxRow := rExcelBuffer."Row No.";
        end;

        for RowNo := 2 to MaxRow do begin
            rEmpleado.Init();
            Evaluate(rEmpleado."No.", GetValueAtCell(RowNo, 14));
            Evaluate(rEmpleado."First Family Name", GetValueAtCell(RowNo, 16));
            Evaluate(rEmpleado."Second Family Name", GetValueAtCell(RowNo, 17));
            Evaluate(rEmpleado.Name, GetValueAtCell(RowNo, 18));
            Evaluate(rEmpleado."Employment Date", GetValueAtCell(RowNo, 42));
            Evaluate(rEmpleado."Birth Date", GetValueAtCell(RowNo, 83));
            Evaluate(rEmpleado."E-Mail", GetValueAtCell(RowNo, 123));

            rEmpleado.Insert();

        end;

        Message('Importación Excel satisfactoria ');


    end;
}
