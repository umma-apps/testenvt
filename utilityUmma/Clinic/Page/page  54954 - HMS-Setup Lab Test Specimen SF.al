page 54954 "HMS-Setup Lab Test Specimen SF"
{
    PageType = List;
    SourceTable = "HMS-Setup Test Specimen";

    layout
    {
        area(content)
        {
            repeater(Rep)
            {
                field(Specimen; Rec.Specimen)
                {
                    ApplicationArea = All;
                }
                field("Specimen Name"; Rec."Specimen Name")
                {
                    ApplicationArea = All;
                }
                field("Measuring Unit"; Rec."Measuring Unit")
                {
                    ApplicationArea = All;
                }
                field("Minimum Value"; Rec."Minimum Value")
                {
                    ApplicationArea = All;
                }
                field("Maximum Value"; Rec."Maximum Value")
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

