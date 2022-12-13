tableextension 50115 "Extension Employee" extends Employee
{
    fields
    {
        field(50100; NifEmpleado; Text[9])
        {
            Caption = 'NifEmpleado';
            DataClassification = ToBeClassified;
        }
        field(50101; Area_Geografica; Text[20])
        {
            Caption = 'Area_Geografica';
            DataClassification = ToBeClassified;
        }
        field(50102; Area_Negocio; Text[30])
        {
            Caption = 'Area_Negocio';
            DataClassification = ToBeClassified;
        }
        field(50103; Departamento; Text[50])
        {
            Caption = 'Departamento';
            DataClassification = ToBeClassified;
        }
        field(50104; Seccion; Text[50])
        {
            Caption = 'Seccion';
            DataClassification = ToBeClassified;
        }
        field(50105; Rol; Text[50])
        {
            Caption = 'Rol';
            DataClassification = ToBeClassified;
        }
        field(50106; Orden_Rol_Seccion; Text[50])
        {
            Caption = 'Orden_Rol_Seccion';
            DataClassification = ToBeClassified;
        }
        field(50107; Puesto; Text[50])
        {
            Caption = 'Puesto';
            DataClassification = ToBeClassified;
        }
        field(50108; Subrogable; Text[2])
        {
            Caption = 'Subrogable';
            DataClassification = ToBeClassified;
        }
        field(50109; Proyecto; Text[200])
        {
            Caption = 'Proyecto';
            DataClassification = ToBeClassified;
        }
    }
}
