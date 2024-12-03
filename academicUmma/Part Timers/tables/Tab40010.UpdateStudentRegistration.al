table 40010 "Update Student Registration"
{
    Caption = 'Update Student Registration';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Student No"; Code[20])
        {
            Caption = 'Student No';
        }
        field(2; Semester; Code[20])
        {
            Caption = 'Semester';
        }
        field(3; Modified; Boolean)
        {
            Caption = 'Modified';
        }
        field(4; "Reg.Transacton ID"; Code[20])
        {
            Caption = 'Reg.Transacton ID';
        }
    }
    keys
    {
        key(PK; "Student No", "Reg.Transacton ID")
        {
            Clustered = true;
        }
    }
}
