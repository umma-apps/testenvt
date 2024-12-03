table 61194 "HRM-Proffessional Membership"
{

    fields
    {
        field(1; "Employee Code"; Code[20])
        {
            TableRelation = "HRM-Employee (D)"."No.";
        }
        field(2; "Membership No"; Code[30])
        {
        }
        field(3; "Name of Body"; Text[200])
        {
        }
        field(4; "Date of Membership"; Date)
        {
        }
        field(5; "Membership Status"; Option)
        {
            OptionMembers = ,Active,Inactive;
        }
        field(6; "Line No."; Integer)
        {
            AutoIncrement = true;
        }
        field(50000; Remarks; Text[250])
        {
        }
    }

    keys
    {
        key(Key1; "Line No.", "Employee Code")
        {
        }
    }

    fieldgroups
    {
    }
}

