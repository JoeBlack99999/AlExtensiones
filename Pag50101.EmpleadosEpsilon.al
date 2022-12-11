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
                field(City; Rec.City)
                {
                    ToolTip = 'Specifies the city of the address.';
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
}
