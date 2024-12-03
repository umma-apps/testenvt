page 54952 "HMS-Setup Lab Test Card"
{
    PageType = Card;
    SourceTable = "HMS-Setup Lab Test";

    layout
    {
        area(content)
        {
            group(Group)
            {
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
            }
            part(Page; "HMS-Setup Lab Test Specimen SF")
            {
                SubPageLink = Test = FIELD(Code);
                ApplicationArea = All;
            }
        }
    }

    actions
    {
    }
}

