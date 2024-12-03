table 61296 "HRM-Disciplinary Remarks"
{
    LookupPageID = "HRM-Disciplinary Remarks";

    fields
    {
        field(1; Remark; Code[50])
        {
            NotBlank = true;
        }
        field(2; Description; Text[200])
        {
        }
        field(3; Comments; Text[200])
        {
        }
    }

    keys
    {
        key(Key1; Remark)
        {
        }
    }

    fieldgroups
    {
    }
}

