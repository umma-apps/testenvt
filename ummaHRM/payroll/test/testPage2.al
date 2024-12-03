page 50943 "UpdateData"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = update;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(payrollNo; Rec.payrollNo)
                {
                    ApplicationArea = All;
                }
                field(name; Rec.name)
                {
                    ApplicationArea = All;
                }
                field(nssfNo; Rec.nssfNo)
                {
                    ApplicationArea = All;
                }
                field(IdNo; Rec.IdNo)
                {
                    ApplicationArea = All;
                }
                field(kraPIN; Rec.kraPIN)
                {
                    ApplicationArea = All;
                }

            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action("Update Data")
            {
                ApplicationArea = All;

                trigger OnAction();
                begin
                    updateKraDta();
                end;
            }
        }
    }
    var
        hremp: Record "HRM-Employee (D)";
        set: Record update;

    procedure updateKraDta()
    begin
        hremp.Reset();
        hremp.SetRange(Status, hremp.Status::Active);
        if hremp.Find('-') then begin
            repeat
                set.Reset();
                set.SetRange(payrollNo, hremp."No.");
                if set.Find('-') then begin
                    // hremp."PIN Number" := set.kraPIN;
                    // hremp."ID Number" := set.IdNo;
                    hremp."NHIF No." := set.nssfNo;
                    hremp.Modify();
                end;
            until hremp.Next() = 0;
        end;
    end;
}