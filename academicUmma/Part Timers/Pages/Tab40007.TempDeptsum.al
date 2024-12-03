table 40007 TempDeptSums
{

    DataClassification = ToBeClassified;

    fields
    {


        field(2; "Gross Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(3; "Net Pay"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(4; "Housing Levy"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(5; "Other Deductions"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(6; "Paye Amount"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "Line No"; Integer)
        {
            AutoIncrement = true;
        }
        field(50032; "Global Dimension 1 Code"; Code[30])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            Description = 'Stores the reference to the first global dimension in the database';
            NotBlank = false;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(1));

            trigger OnValidate()
            begin
                // DimVal.RESET;
                // DimVal.SETRANGE(DimVal."Global Dimension No.", 1);
                // DimVal.SETRANGE(DimVal.Code, "Global Dimension 1 Code");
                // IF DimVal.FIND('-') THEN
                //     "Function Name" := DimVal.Name;
                //UpdateLines;
            end;
        }
        field(50033; "Shortcut Dimension 2 Code"; Code[30])
        {
            CaptionClass = '1,2,2';
            Caption = 'Shortcut Dimension 2 Code';
            Description = 'Stores the reference of the second global dimension in the database';
            NotBlank = false;
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(2));

            trigger OnValidate()
            begin
                // DimVal.RESET;
                // DimVal.SETRANGE(DimVal."Global Dimension No.", 2);
                // DimVal.SETRANGE(DimVal.Code, "Shortcut Dimension 2 Code");
                // IF DimVal.FIND('-') THEN
                //     "Budget Center Name" := DimVal.Name;
                //UpdateLines
            end;
        }
        field(81; "Shortcut Dimension 3 Code"; Code[20])
        {
            CaptionClass = '1,2,3';
            Caption = 'Shortcut Dimension 3 Code';
            Description = 'Stores the reference of the Third global dimension in the database';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3));

            trigger OnValidate()
            begin

            end;
        }
        field(82; "Shortcut Dimension 4 Code"; Code[20])
        {
            CaptionClass = '1,2,4';
            Caption = 'Shortcut Dimension 4 Code';
            Description = 'Stores the reference of the Third global dimension in the database';
            TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(4));

            trigger OnValidate()
            begin

            end;
        }

    }

    keys
    {
        key(PK; "Shortcut Dimension 3 Code", "Line No")
        {
            Clustered = true;
        }
    }
}