page 68475 "ACA-Applic. Setup Grade List"
{
    Editable = false;
    PageType = ListPart;
    PopulateAllFields = true;
    SourceTable = 61364;

    layout
    {
        area(content)
        {
            repeater(___)
            {
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                }
                field(Grade; Rec.Grade)
                {
                    ApplicationArea = All;
                }
                field(Points; Rec.Points)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnInit()
    begin
        CurrPage.LOOKUPMODE := TRUE;
    end;
}

