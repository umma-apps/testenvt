table 86010 BufferTableCSV
{
    Caption = 'BufferTableCSV';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Payroll Period"; Code[20])
        {
            Caption = 'Payroll Period';
        }
        field(2; "Period Month"; Integer)
        {
            Caption = 'Period Month';
        }
        field(3; "Period Year"; Integer)
        {
            Caption = 'Payroll Period';
        }
        field(4; "Transaction Code"; Code[20])
        {
            Caption = 'Transacrion Code';
        }
        field(5; "Transaction Name"; Text[200])
        {
            Caption = 'Transaction Name';
        }
        field(6; Amount; Decimal)
        {
            Caption = 'Amount';
        }
        field(7; "Employee Type"; Option)
        {
            Caption = 'Employee Type';
            OptionMembers = "Primary Employer","Secondary Employee";
        }
        field(8; "Employeee No"; Code[20])
        {
            Caption = 'Employee Type';
            TableRelation = "HRM-Employee (D)";
        }
        field(9; "Line No"; Integer)
        {
            AutoIncrement = true;
        }
        field(10; Programme; code[20])
        {

        }
    }
    keys
    {
        key(PK; "Payroll Period", "Period Month", "Period Year", "Employeee No", "Transaction Code", Programme, "Line No")
        {
            Clustered = true;
        }
    }
}
