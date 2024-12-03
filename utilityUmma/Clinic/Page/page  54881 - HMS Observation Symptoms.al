page 54881 "HMS Observation Symptoms"
{
    PageType = ListPart;
    SourceTable = "HMS-Observation Symptoms";

    layout
    {
        area(content)
        {
            repeater(rep)
            {
                field("Symptom Code"; Rec."Symptom Code")
                {
                    ApplicationArea = All;
                }
                field("Symptom Description"; Rec."Symptom Description")
                {
                    ApplicationArea = All;
                }
                field(Duration; Rec.Duration)
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field(Characteristics; Rec.Characteristics)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
    }
}

