table 54848 "HMS-Patients Doctor's Advice"
{

    fields
    {
        field(1; "Patient Code"; Code[20])
        {
            TableRelation = Customer."No.";
        }
        field(2; Date; Date)
        {
            NotBlank = true;
        }
        field(3; Time; Time)
        {
        }
        field(4; "Doctor Code"; Text[20])
        {
            TableRelation = Resource."No.";
        }
        field(5; "Consultancy Charges"; Code[20])
        {
            TableRelation = Resource."No.";
        }
        field(6; "Doctors Advice"; Text[200])
        {
            TableRelation = "HMS-Doctors Advice".Advice;
        }
        field(7; Posted; Boolean)
        {
            Editable = false;
        }
    }

    keys
    {
        key(Key1; Date, "Patient Code", "Doctor Code")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

