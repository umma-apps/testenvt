page 40008 PTClaimLines
{
    //Editable = false;
    Caption = 'PTClaimLines';
    PageType = ListPart;
    SourceTable = PTClaimLines;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("Batch No"; Rec."Batch No")
                {
                    Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Batch No field.', Comment = '%';
                }
                field(Semester; Rec.Semester)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Semester field.', Comment = '%';
                }
                field("PF No"; Rec."PF No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the PF No field.', Comment = '%';
                }
                field(Names; Rec.Names)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Names field.', Comment = '%';
                }
                field(Faculty; Rec.Faculty)
                {
                    ApplicationArea = All;
                }
                field(SchoolName; Rec.SchoolName)
                {
                    ApplicationArea = All;
                }
                field(Programz; Rec.Programz)
                {
                    Caption = 'Programme';
                    ApplicationArea = All;
                }
                field(Rate; Rec.Rate)
                {
                    ApplicationArea = All;
                }
                field("Is P.w.d"; Rec."P.W.D")
                {
                    ApplicationArea = All;

                    trigger OnValidate()
                    begin
                        Rec.Amount := Rec.Rate * Rec.Units;

                        // Check and insert record in PartTime Claims SetUp if not present
                        if not partimesetup.Get(1) then begin
                            partimesetup.Init();
                            partimesetup."primary Key" := 1;
                            partimesetup."Housing Levy%" := 1.5;  // Set default values as required
                            partimesetup."netPay%" := 10;         // Set default values as required
                            partimesetup.Insert();
                        end;

                        // Calculate Housing Levy
                        Rec."Housing Levy" := (Rec.Amount * partimesetup."Housing Levy%") / 100;

                        // Calculate Housing Levy Relief
                        HousingLevyRelief := (Rec."Housing Levy" * (partimesetup."Housing Levy Relief%") / 100);

                        // Check if the person is marked as PWD
                        if Rec."P.W.D" then begin
                            // If the person is PWD, they are exempt from PAYE
                            Rec."Paye Amount" := 0;
                        end else begin
                            // If not PWD, calculate PAYE as usual
                            Rec."Paye Amount" := (Rec.Amount - HousingLevyRelief) * partimesetup."netPay%" / 100;
                        end;

                        // Calculate Net Pay
                        Rec."Net Pay" := Rec.Amount - Rec."Housing Levy" - Rec."Other Deductions" - Rec."Paye Amount";
                    end;
                }

                field(Units; Rec.Units)
                {
                    //Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Units field.', Comment = '%';
                    trigger OnValidate()
                    begin
                        Rec.Amount := Rec.Rate * Rec.Units;

                        // Check and insert record in PartTime Claims SetUp if not present
                        if not partimesetup.Get(1) then begin
                            partimesetup.Init();
                            partimesetup."primary Key" := 1;
                            partimesetup."Housing Levy%" := 1.5;  // Set default values as required
                            partimesetup."netPay%" := 10;         // Set default values as required
                            partimesetup.Insert();
                        end;

                        // Calculate Housing Levy
                        Rec."Housing Levy" := (Rec.Amount * partimesetup."Housing Levy%") / 100;

                        // Calculate Housing Levy Relief
                        HousingLevyRelief := (Rec."Housing Levy" * (partimesetup."Housing Levy Relief%") / 100);

                        // Check if the person is marked as PWD
                        if Rec."P.W.D" then begin
                            // If the person is PWD, they are exempt from PAYE
                            Rec."Paye Amount" := 0;
                        end else begin
                            // If not PWD, calculate PAYE as usual
                            Rec."Paye Amount" := (Rec.Amount - HousingLevyRelief) * partimesetup."netPay%" / 100;
                        end;

                        // Calculate Net Pay
                        Rec."Net Pay" := Rec.Amount - Rec."Housing Levy" - Rec."Other Deductions" - Rec."Paye Amount";
                    end;
                }

                field(Amount; Rec.Amount)
                {
                    //Editable = false;
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Amount field.', Comment = '%';
                    trigger OnValidate()
                    begin
                        Rec.Amount := Rec.Rate * Rec.Units;

                        // Check and insert record in PartTime Claims SetUp if not present
                        if not partimesetup.Get(1) then begin
                            partimesetup.Init();
                            partimesetup."primary Key" := 1;
                            partimesetup."Housing Levy%" := 1.5;  // Set default values as required
                            partimesetup."netPay%" := 10;         // Set default values as required
                            partimesetup.Insert();
                        end;

                        // Calculate Housing Levy
                        Rec."Housing Levy" := (Rec.Amount * partimesetup."Housing Levy%") / 100;

                        // Calculate Housing Levy Relief
                        HousingLevyRelief := (Rec."Housing Levy" * (partimesetup."Housing Levy Relief%") / 100);

                        // Check if the person is marked as PWD
                        if Rec."P.W.D" then begin
                            // If the person is PWD, they are exempt from PAYE
                            Rec."Paye Amount" := 0;
                        end else begin
                            // If not PWD, calculate PAYE as usual
                            Rec."Paye Amount" := (Rec.Amount - HousingLevyRelief) * partimesetup."netPay%" / 100;
                        end;

                        // Calculate Net Pay
                        Rec."Net Pay" := Rec.Amount - Rec."Housing Levy" - Rec."Other Deductions" - Rec."Paye Amount";
                    end;
                }
                field("Other Deductions"; Rec."Other Deductions")
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        Rec.Amount := Rec.Rate * Rec.Units;

                        // Check and insert record in PartTime Claims SetUp if not present
                        if not partimesetup.Get(1) then begin
                            partimesetup.Init();
                            partimesetup."primary Key" := 1;
                            partimesetup."Housing Levy%" := 1.5;  // Set default values as required
                            partimesetup."netPay%" := 10;         // Set default values as required
                            partimesetup.Insert();
                        end;

                        // Calculate Housing Levy
                        Rec."Housing Levy" := (Rec.Amount * partimesetup."Housing Levy%") / 100;

                        // Calculate Housing Levy Relief
                        HousingLevyRelief := (Rec."Housing Levy" * (partimesetup."Housing Levy Relief%") / 100);

                        // Check if the person is marked as PWD
                        if Rec."P.W.D" then begin
                            // If the person is PWD, they are exempt from PAYE
                            Rec."Paye Amount" := 0;
                        end else begin
                            // If not PWD, calculate PAYE as usual
                            Rec."Paye Amount" := (Rec.Amount - HousingLevyRelief) * partimesetup."netPay%" / 100;
                        end;

                        // Calculate Net Pay
                        Rec."Net Pay" := Rec.Amount - Rec."Housing Levy" - Rec."Other Deductions" - Rec."Paye Amount";
                    end;


                }
                field("Housing Levy"; Rec."Housing Levy")
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        Rec.Amount := Rec.Rate * Rec.Units;

                        // Check and insert record in PartTime Claims SetUp if not present
                        if not partimesetup.Get(1) then begin
                            partimesetup.Init();
                            partimesetup."primary Key" := 1;
                            partimesetup."Housing Levy%" := 1.5;  // Set default values as required
                            partimesetup."netPay%" := 10;         // Set default values as required
                            partimesetup.Insert();
                        end;

                        // Calculate Housing Levy
                        Rec."Housing Levy" := (Rec.Amount * partimesetup."Housing Levy%") / 100;

                        // Calculate Housing Levy Relief
                        HousingLevyRelief := (Rec."Housing Levy" * (partimesetup."Housing Levy Relief%") / 100);

                        // Check if the person is marked as PWD
                        if Rec."P.W.D" then begin
                            // If the person is PWD, they are exempt from PAYE
                            Rec."Paye Amount" := 0;
                        end else begin
                            // If not PWD, calculate PAYE as usual
                            Rec."Paye Amount" := (Rec.Amount - HousingLevyRelief) * partimesetup."netPay%" / 100;
                        end;

                        // Calculate Net Pay
                        Rec."Net Pay" := Rec.Amount - Rec."Housing Levy" - Rec."Other Deductions" - Rec."Paye Amount";
                    end;

                }
                field("Paye Amount"; Rec."Paye Amount")
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        Rec.Amount := Rec.Rate * Rec.Units;

                        // Check and insert record in PartTime Claims SetUp if not present
                        if not partimesetup.Get(1) then begin
                            partimesetup.Init();
                            partimesetup."primary Key" := 1;
                            partimesetup."Housing Levy%" := 1.5;  // Set default values as required
                            partimesetup."netPay%" := 10;         // Set default values as required
                            partimesetup.Insert();
                        end;

                        // Calculate Housing Levy
                        Rec."Housing Levy" := (Rec.Amount * partimesetup."Housing Levy%") / 100;

                        // Calculate Housing Levy Relief
                        HousingLevyRelief := (Rec."Housing Levy" * (partimesetup."Housing Levy Relief%") / 100);

                        // Check if the person is marked as PWD
                        if Rec."P.W.D" then begin
                            // If the person is PWD, they are exempt from PAYE
                            Rec."Paye Amount" := 0;
                        end else begin
                            // If not PWD, calculate PAYE as usual
                            Rec."Paye Amount" := (Rec.Amount - HousingLevyRelief) * partimesetup."netPay%" / 100;
                        end;

                        // Calculate Net Pay
                        Rec."Net Pay" := Rec.Amount - Rec."Housing Levy" - Rec."Other Deductions" - Rec."Paye Amount";
                    end;

                }
                field("Net Pay"; Rec."Net Pay")
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        Rec.Amount := Rec.Rate * Rec.Units;

                        // Check and insert record in PartTime Claims SetUp if not present
                        if not partimesetup.Get(1) then begin
                            partimesetup.Init();
                            partimesetup."primary Key" := 1;
                            partimesetup."Housing Levy%" := 1.5;  // Set default values as required
                            partimesetup."netPay%" := 10;         // Set default values as required
                            partimesetup.Insert();
                        end;

                        // Calculate Housing Levy
                        Rec."Housing Levy" := (Rec.Amount * partimesetup."Housing Levy%") / 100;

                        // Calculate Housing Levy Relief
                        HousingLevyRelief := (Rec."Housing Levy" * (partimesetup."Housing Levy Relief%") / 100);

                        // Check if the person is marked as PWD
                        if Rec."P.W.D" then begin
                            // If the person is PWD, they are exempt from PAYE
                            Rec."Paye Amount" := 0;
                        end else begin
                            // If not PWD, calculate PAYE as usual
                            Rec."Paye Amount" := (Rec.Amount - HousingLevyRelief) * partimesetup."netPay%" / 100;
                        end;

                        // Calculate Net Pay
                        Rec."Net Pay" := Rec.Amount - Rec."Housing Levy" - Rec."Other Deductions" - Rec."Paye Amount";
                    end;

                }

            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(ValidateAllRecordsAction)
            {
                ApplicationArea = All;
                Caption = 'Update All Records';
                Image = Validate;
                trigger OnAction()
                begin
                    ValidateAllRecords();
                end;
            }
        }

    }
    // Procedure to validate all records in the PTClaimLines table
    procedure ValidateAllRecords()
    var
        MyRecord: Record "PTClaimLines"; // Replace 'PTClaimLines' with your actual table name
    begin
        // Find and loop through each record in the table
        if MyRecord.FindSet() then
            repeat
                // Call VALIDATE for the fields that need to be validated
                MyRecord.Validate(Amount);

                // You can add more validations if necessary
                // Example: MyRecord.Validate("AnotherField");

                // Modify the record after validation
                MyRecord.Modify(true);
            until MyRecord.Next() = 0;
    end;

    var
        partimesetup: Record "PartTine Claims SetUp";
        HousingLevyRelief: Decimal;

}
