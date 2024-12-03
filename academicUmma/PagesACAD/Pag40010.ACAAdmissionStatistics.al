page 40010 "ACA Admission Statistics"
{
    Caption = 'ACA Admission Statistics';
    PageType = CardPart;
    SourceTable = "Admission Cues";

    layout
    {
        area(Content)
        {
            cuegroup(General)
            {
                Caption = 'General';
                field(Applications; REC."Alll Applications")
                {
                    Caption = 'APPLICATIONS';
                    DrillDownPageID = "ACA-Applications List";
                    ApplicationArea = All;
                }
                field(Registration; REC."Awaiting Admission")
                {
                    Caption = 'Awaiting Admission numbers';
                    DrillDownPageID = "ACA-Applications List";
                    ApplicationArea = All;
                }

                field("Admitted Students"; REC."Admitted Students")
                {
                    Caption = 'Admitted Students';
                    DrillDownPageID = "ACA-Applications List";
                    ApplicationArea = All;
                }

            }
        }
    }

    trigger OnOpenPage()
    var
        myInt: Integer;
    begin
        rec.Reset();
        if not rec.Get() then begin
            rec.Init();
            rec.Insert();
        end;
    end;
}
