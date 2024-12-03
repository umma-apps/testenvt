table 54887 "HMS-Treatment Form Drug"
{
    DrillDownPageId = "HMS-Treatment Form Drug";
    LookupPageId = "HMS-Treatment Form Drug";
    fields
    {
        field(1; "Treatment No."; Code[20])
        {
            NotBlank = true;
        }
        field(2; "Drug No."; Code[20])
        {
            NotBlank = true;
            TableRelation = "Pharmacy Items"."No.";

            trigger OnValidate()
            begin
                IF Item.GET("Drug No.") THEN begin
                    "Drug Name" := Item.Description;
                    "Unit Of Measure II" := item."Unit of measure";
                    Item.CalcFields(Inventory);
                    //"Quantity In Store" := Inventory;
                end;

                "Quantity In Store" := item.Inventory;

                /*Check if the drug has any drug within the prescription where it is not compatible*/
                Interaction.RESET;
                Interaction.SETRANGE(Interaction."Drug No.", "Drug No.");
                IF Interaction.FIND('-') THEN BEGIN
                    REPEAT
                        /*Get the lines of drugs that have been identified as being incompatible with the drug selected*/
                        Line.RESET;
                        Line.SETRANGE(Line."Treatment No.", "Treatment No.");
                        Line.SETRANGE(Line."Drug No.", Interaction."Drug No. 1");
                        IF Line.FIND('-') THEN BEGIN
                            Line.CALCFIELDS(Line."Drug Name");
                            IF CONFIRM('Drug:' + Line."Drug Name" + '::' + Interaction."Alert Remarks" + '. CONTINUE?', FALSE) = TRUE THEN BEGIN
                                Line."Marked as Incompatible" := TRUE;
                                Line.MODIFY;
                            END
                            ELSE BEGIN
                                ERROR('Drug Incompatible.Operation Cancelled');
                            END;
                        END;
                        Line.RESET;
                        Line.SETRANGE(Line."Treatment No.", "Treatment No.");
                        Line.SETRANGE(Line."Drug No.", Interaction."Drug No.");
                        IF Line.FIND('-') THEN BEGIN
                            Line.CALCFIELDS(Line."Drug Name");
                            IF CONFIRM('Drug:' + Line."Drug Name" + '::' + Interaction."Alert Remarks" + '. CONTINUE?', FALSE) = TRUE THEN BEGIN
                                Line."Marked as Incompatible" := TRUE;
                                Line.MODIFY;
                            END
                            ELSE BEGIN
                                ERROR('Drug Incompatible.Operation Cancelled');
                            END;
                        END;

                    UNTIL Interaction.NEXT = 0;
                END;

            end;
        }
        field(3; "Drug Name"; Text[150])
        {
        }
        field(4; Quantity; Integer)
        {
            trigger OnValidate()
            begin
                if Quantity > "Quantity In Store" then
                    error('Can not Prescribe more than what is in store');
                "Quantity to issue" := Quantity;

            end;
        }
        field(5; "Unit Of Measure"; Code[20])
        {

        }
        field(6; Remarks; Text[100])
        {
        }
        field(7; "Pharmacy Code"; Code[20])
        {
            NotBlank = true;
            TableRelation = Location.Code;
        }
        field(8; "Actual Quantity"; Decimal)
        {
        }
        field(9; Inventory; Decimal)
        {
        }
        field(10; Issued; Boolean)
        {
        }
        field(11; Dosage; Text[200])
        {
            NotBlank = true;
        }
        field(12; "Marked as Incompatible"; Boolean)
        {
        }
        field(13; "Product Group"; Code[20])
        {

            TableRelation = "Item Category".Code;

        }
        field(14; "No stock Drugs"; Text[250])
        {
        }
        field(15; Price; Decimal)
        {

        }
        field(20; "Unit of Measure II"; Option)
        {
            OptionMembers = ,Tablets;
        }
        field(21; "Pharmacy No."; code[20])
        {

        }
        field(22; "Quantity to issue"; Decimal)
        {

        }
        field(23; "Quantity In Store"; Decimal)
        {

        }
    }

    keys
    {
        key(Key1; "Treatment No.", "Drug No.", "Pharmacy No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        Interaction: Record "HMS-Drug Interaction";
        Line: Record "HMS-Treatment Form Drug";
        Item: Record "Pharmacy Items";
        itemledger: Record "Pharmacy Item Ledger";
}

