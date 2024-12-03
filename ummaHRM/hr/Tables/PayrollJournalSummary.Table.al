table 61838 "Payroll Journal Summary"
{

    fields
    {
        field(1; "Transaction Code"; Code[20])
        {
        }
        field(2; "Transaction Name"; Code[250])
        {
        }
        field(3; "G/L Account"; Code[20])
        {
        }
        field(4; "Period Month"; Integer)
        {
        }
        field(5; "Period YearS"; Integer)
        {
        }
        field(6; "Posting Description"; Text[200])
        {
        }
        field(7; Amount; Decimal)
        {
            CalcFormula = Sum("Payroll Journal Details".Amount WHERE(
                "Transaction Code" = FIELD("Transaction Code"),
                "Period Month" = FIELD("Period Month"),
                "Period Year" = FIELD("Period YearS")
                ));
            FieldClass = FlowField;
        }
        field(9; "Post as"; Option)
        {
            OptionCaption = ' ,Debit,Credit';
            OptionMembers = " ",Debit,Credit;
        }
        field(24; "Journal Account Type"; Option)
        {
            OptionMembers = " ","G/L Account",Customer,Vendor;
        }
        field(27; "coop parameters"; Option)
        {
            Description = 'to be able to report the different coop contributions -Dennis';
            OptionMembers = "none",shares,loan,"loan Interest","Emergency loan","Emergency loan Interest","School Fees loan","School Fees loan Interest",Welfare,Pension,NSSF,Overtime;
        }
        field(28; "Budget Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(29; "Department Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(30; "Payroll Period"; Date)
        {
            DataClassification = ToBeClassified;
        }
    }

    keys
    {
        key(Key1; "Transaction Code", "Period Month", "Period YearS")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }
}

