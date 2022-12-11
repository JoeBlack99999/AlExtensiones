codeunit 50103 Epsilon
{
    Permissions = TableData "G/L Entry" = rimd,
                  TableData "Cust. Ledger Entry" = rimd,
                  TableData "Vendor Ledger Entry" = rimd,
                  TableData "Job Ledger Entry" = rimd,
                  TableData "Bank Acc. Reconciliation Line" = rimd,
                  tabledata "Employee" = rimd;

    trigger OnRun()
    var
        fecharr: Date;
    begin

        vDialogo.Open('HOla');

        vDialogo.Close();


    end;




    var
        rExcelBuffer: Record "Excel Buffer";
        i: Integer;
        vDialogo: Dialog;

        rEmpleado: Record Employee;
}

