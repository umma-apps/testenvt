table 61084 "PRL-Employee Banks"
{
    LookupPageID = "PRL-Employee Banks";

    fields
    {
        field(1; "Employee Code"; Code[20])
        {
            TableRelation = "HRM-Employee (D)"."No.";
        }
        field(2; "Bank Code"; Code[20])
        {
            TableRelation = "PRL-Bank Structure"."Bank Code";
        }
        field(3; "Branch Code"; Code[20])
        {
            TableRelation = "PRL-Bank Structure"."Branch Code";
        }
        field(4; Default; Boolean)
        {
            InitValue = true;
        }
        field(5; "Account No"; Text[50])
        {
        }
        field(6; Percentage; Decimal)
        {
            Description = 'Refers to %of Net to be transfered to this A/C';
            InitValue = 100;
        }
        field(7; Amount; Decimal)
        {
            Description = 'Refers to Amount to be transfered to this A/C';
            InitValue = 0;
        }
    }

    keys
    {
        key(Key1; "Employee Code", "Bank Code", "Branch Code")
        {
        }
    }

    fieldgroups
    {
    }
}

