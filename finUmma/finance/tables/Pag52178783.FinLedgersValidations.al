page 52178787 "Fin Ledgers Validations"
{
    Caption = 'Fin Ledgers Validations';
    PageType = List;
    UsageCategory = Administration;
    SourceTable = "Fin-Ledgers Validatiobn";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Amount; Rec.Amount)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Amount field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("External Doc No"; Rec."External Doc No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the External Doc No field.';
                }
                field("G_L Account"; Rec."G_L Account")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the G_L Account field.';
                }
                field(Exist; Rec.Exist)
                {
                    ApplicationArea = all;
                }
                field(TotalGLAmount; Rec.TotalGLAmount)
                {
                    ApplicationArea = ALL;
                }
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Line No field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
                field("ShortCut 1 Dimension"; Rec."ShortCut 1 Dimension")
                {
                    ApplicationArea = all;
                }
                field("ShortCut 2 Dimension"; Rec."ShortCut 2 Dimension")
                {
                    ApplicationArea = all;
                }
                field("ShortCut 3 Dimension"; Rec."ShortCut 3 Dimension")
                {
                    ApplicationArea = all;
                }
                field("ShortCut 4 Dimension"; Rec."ShortCut 4 Dimension")
                {
                    ApplicationArea = all;
                }
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = all;

                }
            }
        }
    }
}
