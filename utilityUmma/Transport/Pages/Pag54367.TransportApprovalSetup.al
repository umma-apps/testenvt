page 54367 "Transport Approval Setup"
{
    PageType = Worksheet;
    SourceTable = "Transport Approval Setup";
    DeleteAllowed = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {

                field(Department; Rec.Department)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field("Head of Department"; Rec."Head of Department")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Head of Department field.';
                }
                field("Transport Officer"; Rec."Transport Officer")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Transport Officer field.';
                }
                field("Registrar HRM"; Rec."Registrar HRM")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Registrar HRM field.';
                }
            }
        }
    }
}