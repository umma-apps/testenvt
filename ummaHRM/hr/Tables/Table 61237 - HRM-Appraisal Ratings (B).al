table 61237 "HRM-Appraisal Ratings (B)"
{
    //todo  LookupPageID = 39003986;

    fields
    {
        field(1; "Code"; Code[10])
        {
        }
        field(2; Description; Text[30])
        {
        }
        field(3; Score; Decimal)
        {

            trigger OnValidate()
            begin
                /*
                HRAppraisalRating.RESET;
                HRAppraisalRating.SETRANGE(HRAppraisalRating.Score,Score);
                IF HRAppraisalRating.FIND('-') THEN
                  BEGIN
                    ERROR('You cannot have two appraisal ratings with the same score');
                  END;
                */

            end;
        }
        field(4; Recommendations; Text[200])
        {
        }
        field(5; "Description 2"; Text[250])
        {
        }
    }

    keys
    {
        key(Key1; "Code")
        {
        }
        key(Key2; Description, Score)
        {
        }
    }

    fieldgroups
    {
    }

    var
        HRAppraisalRating: Record "HRM-Appraisal Ratings (B)";
}

