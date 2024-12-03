page 86642 vcClearedList
{
    PageType = ListPart;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = VcCleraedList;

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Clearance batch"; Rec."Clearance batch")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(studentNo; Rec.studentNo)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the studentNo field.';
                }
                field("Reason For Clerance"; Rec."Reason For Clerance")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Reason For Clerance field.';
                }
                field("Academic Year"; Rec."Academic Year")
                {
                    ApplicationArea = All;
                }
                field(Semester; Rec.Semester)
                {
                    ApplicationArea = All;
                }
                field(Approved; Rec.Approved)
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Reason For Clerance field.';
                }

            }
        }

    }


}