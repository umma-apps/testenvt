page 50503 "CSV Combiner"
{
    Caption = 'CSV Combiner';
    PageType = List;
    SourceTable = BufferTableCSV;
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Line No field.', Comment = '%';
                }
                field("Employeee No"; Rec."Employeee No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employee Type field.', Comment = '%';
                }
                field("Employee Type"; Rec."Employee Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employee Type field.', Comment = '%';
                }
                field("Payroll Period"; Rec."Payroll Period")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Payroll Period field.', Comment = '%';
                }
                field("Period Month"; Rec."Period Month")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Period Month field.', Comment = '%';
                }
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Amount field.', Comment = '%';
                }
                field("Period Year"; Rec."Period Year")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Payroll Period field.', Comment = '%';
                }
                field(Programme; Rec.Programme)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Programme field.', Comment = '%';
                }
                field("Transaction Code"; Rec."Transaction Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Transacrion Code field.', Comment = '%';
                }
                field("Transaction Name"; Rec."Transaction Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Transaction Name field.', Comment = '%';
                }
            }
        }
    }
}
