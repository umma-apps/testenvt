table 40009 "Department Amounts"
{
    Caption = 'Department Amounts';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Department Code"; Code[20])
        {
            Caption = 'Department Code';
        }
        field(2; "Total Amount"; Decimal)
        {
            Caption = 'Total Amount';
        }
        field(3; "Gross Amount"; Decimal)
        {
            Caption = 'Gross Amount';
        }
        field(4; "Net Amount"; Decimal)
        {
            Caption = 'Net Amount';
        }
        field(5; "Payee"; Decimal)
        {
            Caption = 'Payee Amount';
        }
        field(6; "Housing Levy"; Decimal)
        {
            Caption = 'Housing Levy';
        }
        field(7; "Other Deductions"; Decimal)
        {
            Caption = 'Other Deductions';
        }
        field(8; "School Code"; code[20])
        {
            Caption = 'School Code';
        }
        field(9; "Net PAY"; Decimal)
        {
            Caption = 'Net Pay';
        }
    }
    keys
    {
        key(PK; "Department Code")
        {
            Clustered = true;
        }
    }
}
