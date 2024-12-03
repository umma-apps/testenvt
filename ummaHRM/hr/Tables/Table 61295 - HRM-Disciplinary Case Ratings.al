table 61295 "HRM-Disciplinary Case Ratings"
{
    LookupPageID = "HRM-Disciplinary Case Ratings";

    fields
    {
        field(1; "Code"; Code[50])
        {
            NotBlank = true;
        }
        field(2; Description; Text[100])
        {
        }
        field(3; Comments; Text[200])
        {
        }
    }

    keys
    {
        key(Key1; "Code")
        {
        }
    }

    fieldgroups
    {
    }
}

