table 61286 "HRM-Committees"
{
    LookupPageID = "HRM-Committees (C)";

    fields
    {
        field(1; "Code"; Code[20])
        {
            NotBlank = true;
        }
        field(2; Description; Text[200])
        {
            NotBlank = true;
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

