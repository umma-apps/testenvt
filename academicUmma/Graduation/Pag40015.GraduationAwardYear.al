table 40008 "Graduation Award List"
{
    Caption = 'Graduation Award List';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry Number"; Integer)
        {
            Caption = 'Entry Number';
            AutoIncrement = true;
        }
        field(2; "Student No"; Code[50])
        {
            Caption = 'Student Number';
        }
        field(3; "Sur Name"; Code[50])
        {
            Caption = 'Sur Name';
        }
        field(4; "Middle Name "; Code[50])
        {
            Caption = 'Middle Name ';
        }
        field(5; "Last Name "; Code[50])
        {
            Caption = 'Last Name ';
        }
        field(6; "Campus "; Code[50])
        {
            Caption = 'Campus ';
        }
        field(7; "Graduation Year"; Code[50])
        {
            Caption = 'Graduation Year';
        }
        field(8; Semester; Code[50])
        {
            Caption = 'Semester';
        }
        field(9; "Program"; Code[50])
        {
            Caption = 'Program';
        }
        field(10; Faculty; Code[50])
        {
            Caption = 'Faculty';
        }
        field(11; Department; Code[50])
        {
            Caption = 'Department';
        }
        field(12; Email; code[50])
        {
            DataClassification = ToBeClassified;
        }
        field(13; Phone_Number; Code[50])
        {
            DataClassification = ToBeClassified;
        }

    }
    keys
    {
        key(PK; "Student No")
        {
            Clustered = true;
        }
    }
}

