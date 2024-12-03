page 40007 PTClaimsHeader
{
    Caption = 'PTClaimsHeader';
    PageType = Card;
    SourceTable = "PT Claims Header";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field("Batch No"; Rec."Batch No")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Batch No field.', Comment = '%';
                }
                field(Semster; Rec.Semster)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Semster field.', Comment = '%';
                }
                field("Academic Year"; Rec."Academic Year")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Academic Year field.', Comment = '%';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Created By field.', Comment = '%';
                }
                field("Date Generated"; Rec."Date Generated")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Date Generated field.', Comment = '%';
                }
                field("Gross Amount"; Rec."Gross Amount")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
            }
            part(claimLines; PTClaimLines)
            {
                SubPageLink = "Batch No" = field("Batch No"), Semester = field(Semster);
                ApplicationArea = All;
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Generate Claim Lines")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                Image = Revenue;

                trigger OnAction()
                begin
                    genClaim.generateClaim(Rec.Semster, Rec."Batch No");
                end;
            }
            action("Genarate Journal Entries")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                Image = Revenue;
                trigger OnAction()

                var
                    journalCreated: Boolean;
                    DepartmentTotals: Record "Department Amounts"; // Ensure this is the correct record type
                    line: Record PTClaimLines; // Replace with your actual source table
                begin
                    // // Initialize the Department Totals
                    // DepartmentTotals.DeleteAll();

                    // // Sum amounts by department
                    // if line.FindSet() then
                    //     repeat
                    //         // Initialize or update department totals
                    //         if not DepartmentTotals.Get(line."Department Code") then begin
                    //             DepartmentTotals.Init();
                    //             DepartmentTotals."Department Code" := line."Department Code";
                    //             DepartmentTotals."Gross Amount" := 0;
                    //             DepartmentTotals."Net Pay" := 0;
                    //             DepartmentTotals.Payee := 0;
                    //             DepartmentTotals."Housing Levy" := 0;
                    //             DepartmentTotals."Other Deductions" := 0;
                    //         end;

                    //         // Accumulate totals
                    //         DepartmentTotals."Gross Amount" += line."Gross Amount"; // Ensure these fields exist
                    //         DepartmentTotals."Net Pay" += line."Net Pay";
                    //         DepartmentTotals.Payee += line."Paye Amount";
                    //         DepartmentTotals."Housing Levy" += line."Housing Levy";
                    //         DepartmentTotals."Other Deductions" += line."Other Deductions";
                    //         DepartmentTotals.Modify();
                    //     until line.Next() = 0;

                    // // Call the procedure to create the journal voucher
                    // journalCreated := CreateSingleJournalVoucher(Rec, DepartmentTotals);

                    // // Provide feedback to the user
                    // if journalCreated then
                    //     Message('Journal Voucher created successfully.')
                    // else
                    //     Error('Failed to create Journal Voucher.');
                    if Rec."Voucher Generated" then
                        Error('Journal Voucher already generated for this record.')
                    else begin
                        journalCreated := CreateSingleJournalVoucher(Rec);
                        if journalCreated then begin
                            Rec."Voucher Generated" := true;
                            Rec.Modify();
                            Message('Journal Voucher created successfully.');
                        end
                        else
                            Error('Failed to create Journal Voucher.');
                    end;
                end;


            }
            action("Partime setup")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                Image = Setup;
                RunObject = page "Parttime Claim setup";
            }
            action("PT Claims Report")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                Image = Payment;
                RunObject = report "PTClaim File";

            }
            action("Bank Schdule")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                Image = Payment;
                RunObject = report "PT Bank Schedule";

            }
            action("Validate Amount")
            {
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                Image = Revenue;
                trigger OnAction()
                begin
                    validateAmount(Rec."Batch No");
                end;

            }
        }
    }
    var
        genClaim: Codeunit "PTClaim Generation";
        ptLines: Record PTClaimLines;

    procedure validateAmount(batch: code[20])
    begin
        ptLines.Reset();
        ptLines.SetRange("Batch No", batch);
        if ptLines.Find('-') then begin
            repeat
                ptLines.Validate(Rate);
                ptLines.Modify();
            until ptLines.Next() = 0;

        end;
    end;

    // Define a temporary table for department amounts
    procedure generateVoucher()
    var
        JournalVoucher: Record "Journal Voucher Headder";
        journalLine: Record "Journal Voucher Lines";
        ptSetup: Record "PartTine Claims SetUp";

    begin
        Rec.CalcFields("Gross Amount", "Net Amount", "Total payee", "Other Deductions");




    end;


    local procedure CreateSingleJournalVoucher(
           PTClaimsHeader: Record "PT Claims Header"): Boolean
    var
        GenLedgerSetup: Record "Cash Office Setup";
        journalVoucher: Record 52178778;
        NoSeriesMgt: Codeunit NoSeriesManagement;
        Nextno: Code[20];
    begin
        // Get General Ledger Setup
        // journalVoucher.RESET;
        // journalVoucher.SetRange("Batch No.", PTClaimsHeader."Batch No");
        // if journalVoucher.FindFirst() then begin

        GenLedgerSetup.Reset();
        GenLedgerSetup.SetRange("Primary Key", '1');
        if not GenLedgerSetup.FindSet() then
            exit(false);

        GenLedgerSetup.TestField("Journal Vouchers");

        // Get next number for journal voucher
        Nextno := NoSeriesMgt.GetNextNo(GenLedgerSetup."Journal Vouchers", Today, true);

        // Create single journal voucher header
        journalVoucher.Init();
        journalVoucher."No." := Nextno;
        journalVoucher."Document Date" := Rec."Date Generated";
        journalVoucher."Created By" := UserId;
        journalVoucher.Description := StrSubstNo('Part time Claims Journal Voucher For %1 - Batch %2',
                                                PTClaimsHeader.Semster,
                                                PTClaimsHeader."Batch No");
        if not journalVoucher.Insert() then
            exit(false);


        // Create all journal lines for this single voucher
        if not CreateAllJournalLines(
            journalVoucher) then
            exit(false);

        exit(true);
    end;

    local procedure CreateAllJournalLines(
            journalVoucher: Record "Journal Voucher Headder"
           ): Boolean
    var
        journalLine: Record "Journal Voucher Lines";
        ptSetup: Record "PartTine Claims SetUp";
        LineNo: Integer;
        ClaimsHeader: Record "PT Claims Header";
    begin
        ptSetup.GET(1);
        LineNo := 0;
        ClaimsHeader.RESET;
        ClaimsHeader.SETRANGE("Batch No", Rec."Batch No");
        if ClaimsHeader.FindFirst() then begin
            repeat
                ClaimsHeader.CalcFields("Gross Amount", "Net Amount", "Total payee", "Other Deductions", "Total Housing Levy");
            until ClaimsHeader.Next() = 0;
            LineNo += 10000; // Increment for Gross Amount
            journalLine.Init();
            journalLine."Line No" := LineNo;
            journalLine."Docuument No" := journalVoucher."No.";
            journalLine."Account Type" := journalLine."Account Type"::"G/L Account";
            journalLine."Account No" := ptSetup."Gross Amount g/L";
            journalVoucher."Document Date" := Rec."Date Generated";
            journalLine.Description := StrSubstNo('Parttime Gross Amount for %1 - Batch %2',
                                                  ClaimsHeader.Semster);
            journalLine."Amount" := ClaimsHeader."Gross Amount"; // Debit
            if not journalLine.Insert() then
                exit(false);

            // PAYE (Credit)
            LineNo += 10000; // Increment for PAYE
            journalLine.Init();
            journalLine."Line No" := LineNo;
            journalLine."Docuument No" := journalVoucher."No.";
            journalLine."Account Type" := journalLine."Account Type"::"G/L Account";
            journalLine."Account No" := ptSetup."Paye G/l"; // Replace with actual GL Account
            journalLine.Description := StrSubstNo('Parttime PAYE for %1 - Batch %2',
                                                  ClaimsHeader.Semster);
            journalVoucher."Document Date" := Rec."Date Generated";
            journalLine."Amount" := -ClaimsHeader."Total payee"; // Credit
            if not journalLine.Insert() then
                exit(false);

            // Net Pay (Credit)
            LineNo += 10000; // Increment for Net Pay
            journalLine.Init();
            journalLine."Line No" := LineNo;
            journalLine."Docuument No" := journalVoucher."No.";
            journalLine."Account Type" := journalLine."Account Type"::"G/L Account";
            journalLine.Description := StrSubstNo('Parttime Net Pay for %1 - Batch %2',
                                                  ClaimsHeader.Semster);
            journalVoucher."Document Date" := Rec."Date Generated";
            journalLine."Account No" := ptSetup."NetPay G/l ";
            journalLine."Amount" := -ClaimsHeader."Net Amount"; // Credit
            if not journalLine.Insert() then
                exit(false);

            // Housing Levy (Credit)
            LineNo += 10000; // Increment for Housing Levy
            journalLine.Init();
            journalLine."Line No" := LineNo;
            journalLine."Docuument No" := journalVoucher."No.";
            journalLine."Account Type" := journalLine."Account Type"::Vendor;
            journalVoucher."Document Date" := Rec."Date Generated";
            journalLine.Description := StrSubstNo('Parttime Housing Levy for %1 - Batch %2',
                                                ClaimsHeader.Semster);
            journalLine."Account No" := ptSetup."Hosing Levy G/l";
            journalLine."Amount" := -ClaimsHeader."Total Housing Levy"; // Credit
            if not journalLine.Insert() then
                exit(false);
            //Housing Levy (Credit)
            LineNo += 10000; // Increment for Housing Levy
            journalLine.Init();
            journalLine."Line No" := LineNo;
            journalLine."Docuument No" := journalVoucher."No.";
            journalLine."Account Type" := journalLine."Account Type"::Vendor;
            journalVoucher."Document Date" := Rec."Date Generated";
            journalLine.Description := StrSubstNo('Parttime Housing Levy for %1 - Batch %2',
                                                ClaimsHeader.Semster);
            journalLine."Account No" := ptSetup."Hosing Levy G/l";
            journalLine."Amount" := -ClaimsHeader."Total Housing Levy"; // Credit
            journalLine."Balancing Account No" := '51210177';
            if not journalLine.Insert() then
                exit(false);

            // Other Deductions (Credit)
            LineNo += 10000; // Increment for Other Deductions
            journalLine.Init();
            journalLine."Line No" := LineNo;
            journalLine."Docuument No" := journalVoucher."No.";
            journalLine."Account Type" := journalLine."Account Type"::"G/L Account";
            journalLine."Account No" := ptSetup."Other deduction G/l";
            journalLine.Description := StrSubstNo('Parttime Other Deductions for %1 - Batch %2',
                                                ClaimsHeader.Semster);
            journalLine."Posting Date" := ClaimsHeader."Date Generated";
            journalLine."Amount" := -ClaimsHeader."Other Deductions"; // Credit
            if journalLine."Amount" <> 0 then
                if not journalLine.Insert() then
                    exit(false);

            exit(true);
        end;


    end;



    // Create lines for each total amount in the department totals record
    // Gross Amount (Debit)




    /*ptSetup.GET(1);

    // Initialize temporary table to store sums per department
    TempDeptSums.RESET;
    TempDeptSums.DELETEALL;

    // Create dictionaries to store department totals
    CLEAR(DeptGrossAmount);
    CLEAR(DeptNetPay);
    CLEAR(DeptPayeAmount);
    CLEAR(DeptHousingLevy);
    CLEAR(DeptOtherDeductions);


    // Variables for overall totals
    TotalGrossAmount := 0;
    TotalNetPay := 0;
    TotalPaye := 0;
    TotalHousingLevy := 0;
    TotalOtherDeductions := 0;
    ptLines.RESET;
    ptLines.SETRANGE("Batch No", PTClaimsHeader."Batch No");
    ptLines.SETRANGE("Semester", PTClaimsHeader.Semster);
    if ptLines.FindSet() then begin
        repeat
            ptLines.CALCFIELDS("Department Code");
            // ptLines.TestField("Department Code");

            dimesion.RESET;
            dimesion.SETRANGE("Code", ptLines."Department Code");
            if dimesion.FindSet() then begin
                //ptLines."Shortcut Dimension 3 Code" := dimesion."Shortcut Dimension 3 Code";
                ptLines2.RESET;
                ptLines2.CalcFields("Department Code");
                ptLines2.SETRANGE("Department Code", dimesion."Code");
                if ptLines2.FindSet() then begin
                    repeat
                        ptLines2.CalcSums("Amount", "Net Pay", "Paye Amount", "Housing Levy", "Other Deductions");

                        GenLedgerSetup.RESET;
                        GenLedgerSetup.SetRange("Primary Key", '1');
                        IF GenLedgerSetup.FINDSET THEN begin
                            GenLedgerSetup.TESTFIELD(GenLedgerSetup."Journal Vouchers");
                            Nextno := NoSeriesMgt.GetNextNo(GenLedgerSetup."Journal Vouchers", today, true);



                            //GenLedgerSetup.GET(1);

                            //Gross Amount
                            journalVoucher.INIT;
                            journalVoucher."No." := Nextno;
                            journalVoucher."Document Date" := PTClaimsHeader."Date Generated";
                            journalVoucher."Created By" := UserId;
                            journalVoucher.Description := 'Part time Claims Journal Voucher For' + '-' + PTClaimsHeader.Semster;
                            journalVoucher.INSERT;
                            journalLine.INIT;
                            journalLine."Line No" := getJvLineno() + 1;
                            journalLine."Docuument No" := journalVoucher."No.";
                            // journalLine."Shortcut Dimension 2 Code" := ptLines2.
                            journalLine."Account Type" := journalLine."Account Type"::"G/L Account";
                            journalLine."Account No" := ptSetup."Gross Amount g/L";
                            journalLine."Amount" := TotalGrossAmount;
                            journalLine.Insert();
                            //Payee

                            journalLine.INIT;
                            journalLine."Line No" := getJvLineno() + 1;
                            journalLine."Docuument No" := journalVoucher."No.";
                            // journalLine."Shortcut Dimension 2 Code" := ptLines2.
                            journalLine."Account Type" := journalLine."Account Type"::"G/L Account";
                            journalLine."Account No" := ptSetup."Paye G/l";
                            journalLine."Amount" := -TotalPaye;
                            journalLine.Insert();
                            //Net Pay
                            journalLine.INIT;
                            journalLine."Line No" := getJvLineno() + 1;
                            journalLine."Docuument No" := journalVoucher."No.";
                            // journalLine."Shortcut Dimension 2 Code" := ptLines2.
                            journalLine."Account Type" := journalLine."Account Type"::"G/L Account";
                            journalLine."Account No" := ptSetup."NetPay G/l ";
                            journalLine."Amount" := -TotalNetPay;
                            journalLine.Insert();
                            //Housing Levy
                            journalLine.INIT;
                            journalLine."Line No" := getJvLineno() + 1;
                            journalLine."Docuument No" := journalVoucher."No.";
                            // journalLine."Shortcut Dimension 2 Code" := ptLines2.
                            journalLine."Account Type" := journalLine."Account Type"::"G/L Account";
                            journalLine."Account No" := ptSetup."Hosing Levy G/l";
                            journalLine."Amount" := -TotalHousingLevy;
                            journalLine.Insert();
                            //Other Deductions
                            journalLine.INIT;
                            journalLine."Line No" := getJvLineno() + 1;
                            journalLine."Docuument No" := journalVoucher."No.";
                            // journalLine."Shortcut Dimension 2 Code" := ptLines2.
                            journalLine."Account Type" := journalLine."Account Type"::"G/L Account";
                            journalLine."Account No" := ptSetup."Other deduction G/l";
                            journalLine."Amount" := -TotalOtherDeductions;
                            journalLine.Insert();
                        end;




                    until ptLines2.NEXT = 0;

                end;

            end;

        until ptLines.NEXT = 0;
    end;*/


    // Reset and filter eftLines2


    /* IF eftLines2.FINDSET THEN BEGIN
         REPEAT
            eftLines2.CALCFIELDS("Department Code");

             // Update department totals
             UpdateDeptTotal(DeptGrossAmount, eftLines2."Department Code", eftLines2.Amount);
             UpdateDeptTotal(DeptNetPay, eftLines2."Department Code", eftLines2."Net Pay");
             UpdateDeptTotal(DeptPayeAmount, eftLines2."Department Code", eftLines2."Paye Amount");
             UpdateDeptTotal(DeptHousingLevy, eftLines2."Department Code", eftLines2."Housing Levy");
             UpdateDeptTotal(DeptOtherDeductions, eftLines2."Department Code", eftLines2."Other Deductions");

             // Update overall totals
             TotalGrossAmount += eftLines2.Amount;
             TotalNetPay += eftLines2."Net Pay";
             TotalPaye += eftLines2."Paye Amount";
             TotalHousingLevy += eftLines2."Housing Levy";
             TotalOtherDeductions += eftLines2."Other Deductions";

         UNTIL eftLines2.NEXT = 0;
     END;

     // Insert department totals into TempDeptSums
     FOREACH DepartmentCode IN DeptGrossAmount.Keys DO BEGIN
         TempDeptSums.INIT;
         TempDeptSums."Line No" := GetTempDeptSumsLastLineNo() + 1;
         TempDeptSums."Shortcut Dimension 3 Code" := DepartmentCode;
         TempDeptSums."Gross Amount" := DeptGrossAmount.Get(DepartmentCode);
         TempDeptSums."Net Pay" := DeptNetPay.Get(DepartmentCode);
         TempDeptSums."Paye Amount" := DeptPayeAmount.Get(DepartmentCode);
         TempDeptSums."Housing Levy" := DeptHousingLevy.Get(DepartmentCode);
         TempDeptSums."Other Deductions" := DeptOtherDeductions.Get(DepartmentCode);
         TempDeptSums.INSERT;
     END;

     // Insert overall totals
     TempDeptSums.INIT;
     TempDeptSums."Line No" := GetTempDeptSumsLastLineNo() + 1;
     TempDeptSums."Shortcut Dimension 3 Code" := eftLines2."Department Code";
     TempDeptSums."Gross Amount" := TotalGrossAmount;
     TempDeptSums."Net Pay" := TotalNetPay;
     TempDeptSums."Paye Amount" := TotalPaye;
     TempDeptSums."Housing Levy" := TotalHousingLevy;
     TempDeptSums."Other Deductions" := TotalOtherDeductions;
     TempDeptSums.INSERT;
     TempDeptSums.RESET;
     IF TempDeptSums.FINDSET THEN BEGIN
         REPEAT
             lineNo += 10000;
             genline.reset;
             genline.SetRange("Journal Batch Name", 'DEFAULT');
             genline.SetRange("Journal Template Name", 'GENERAL');
             if genline.FindSet() then
                 genline.DeleteAll();

             // Insert Gross Amount
             genline.INIT;

             genline."Line No." := getgenline() + 50000;
             genline."Journal Template Name" := 'GENERAL';
             genline."Journal Batch Name" := 'DEFAULT';
             genline."Document No." := Rec."Batch No";
             genline."Posting Date" := Rec."Date Generated";
             genline."Shortcut Dimension 4 code" := TempDeptSums."Shortcut Dimension 3 Code";
             genline."Account Type" := genline."Account Type"::"G/L Account";
             genline."Account No." := ptSetup."Gross Amount g/L";
             genline."Amount" := TempDeptSums."Gross Amount";
             genline.Validate(Amount);
             genline.Description := FORMAT(Rec."Batch No") + ': ' + FORMAT(Rec.Semster) + ' - ' + TempDeptSums."Shortcut Dimension 3 Code";
             genline.INSERT;

             // Insert Net Pay
             genline.INIT;
             genline."Line No." := getgenline() + 100;
             genline."Journal Template Name" := 'GENERAL';
             genline."Journal Batch Name" := 'DEFAULT';
             genline."Document No." := Rec."Batch No";
             genline."Shortcut Dimension 4 code" := TempDeptSums."Shortcut Dimension 3 Code";
             genline."Posting Date" := Rec."Date Generated";
             genline."Account Type" := genline."Account Type"::"G/L Account";
             genline."Account No." := ptSetup."NetPay G/l ";
             genline."Amount" := -TempDeptSums."Net Pay";
             genline.Validate(Amount);
             genline.Description := FORMAT(Rec."Batch No") + ': ' + FORMAT(Rec.Semster) + ' - ' + TempDeptSums."Shortcut Dimension 3 Code";
             genline.INSERT;

             // Insert Housing Levy
             genline.INIT;
             genline."Line No." := getgenline() + 40000;
             genline."Journal Template Name" := 'GENERAL';
             genline."Journal Batch Name" := 'DEFAULT';
             genline."Document No." := Rec."Batch No";
             genline."Posting Date" := Rec."Date Generated";
             genline."Shortcut Dimension 4 code" := TempDeptSums."Shortcut Dimension 3 Code";
             genline."Account Type" := genline."Account Type"::Vendor;
             genline."Account No." := ptSetup."Hosing Levy G/l";
             genline."Amount" := -TempDeptSums."Housing Levy";
             genline.Validate(Amount);
             genline.Description := FORMAT(Rec."Batch No") + ': ' + FORMAT(Rec.Semster) + ' - ' + TempDeptSums."Shortcut Dimension 3 Code";
             genline.INSERT;
             genline.INIT;
             genline."Line No." := getgenline() + 60000;
             genline."Journal Template Name" := 'GENERAL';
             genline."Journal Batch Name" := 'DEFAULT';
             genline."Document No." := Rec."Batch No";
             genline."Posting Date" := Rec."Date Generated";
             genline."Shortcut Dimension 4 code" := TempDeptSums."Shortcut Dimension 3 Code";
             genline."Account Type" := genline."Account Type"::Vendor;
             genline."Account No." := ptSetup."Hosing Levy G/l";
             genline."Amount" := -TempDeptSums."Housing Levy";
             genline.Validate(Amount);
             genline."Bal. Account Type" := genline."Bal. Account Type"::"G/L Account";
             genline."Bal. Account No." := '51210177';
             genline.Description := FORMAT(Rec."Batch No") + ': ' + FORMAT(Rec.Semster) + ' - ' + TempDeptSums."Shortcut Dimension 3 Code";
             genline.INSERT;

             // Insert Other Deductions
             genline.INIT;
             genline."Line No." := getgenline() + 2000;
             genline."Journal Template Name" := 'GENERAL';
             genline."Journal Batch Name" := 'DEFAULT';
             genline."Document No." := Rec."Batch No";
             genline."Posting Date" := Rec."Date Generated";
             genline."Shortcut Dimension 4 code" := TempDeptSums."Shortcut Dimension 3 Code";
             genline."Account Type" := genline."Account Type"::"G/L Account";
             genline."Account No." := ptSetup."Other deduction G/l";
             genline."Amount" := TempDeptSums."Other Deductions";
             genline.Validate(Amount);
             genline.Description := FORMAT(Rec."Batch No") + ': ' + FORMAT(Rec.Semster) + ' - ' + TempDeptSums."Shortcut Dimension 3 Code";
             if genline.Amount <> 0 then
                 genline.INSERT;


             // Insert Paye Amount
             genline.INIT;
             genline."Line No." := getgenline() + 10000;
             genline."Journal Template Name" := 'GENERAL';
             genline."Shortcut Dimension 4 code" := TempDeptSums."Shortcut Dimension 3 Code";
             genline."Journal Batch Name" := 'DEFAULT';
             genline."Document No." := Rec."Batch No";
             genline."Posting Date" := Rec."Date Generated";
             genline."Account Type" := genline."Account Type"::"G/L Account";
             genline."Account No." := ptSetup."Paye G/l";
             genline."Amount" := -TempDeptSums."Paye Amount";
             genline.Validate(Amount);
             genline.Description := FORMAT(Rec."Batch No") + ': ' + FORMAT(Rec.Semster) + ' - ' + TempDeptSums."Shortcut Dimension 3 Code";
             if genline.Amount <> 0 then
                 genline.INSERT;

         UNTIL TempDeptSums.NEXT = 0;
     END;

 end;



 // Local procedure to update department totals
 PROCEDURE UpdateDeptTotal(VAR DeptDict: Dictionary of [Code[20], Decimal]; DeptCode: Code[20]; Amount: Decimal)
 BEGIN
     IF NOT DeptDict.ContainsKey(DeptCode) THEN
         DeptDict.Add(DeptCode, 0);
     DeptDict.Set(DeptCode, DeptDict.Get(DeptCode) + Amount);
 END;

 // Function to get the last line number in TempDeptSums
 PROCEDURE GetTempDeptSumsLastLineNo(): Integer
 VAR
     LastTempDeptSums: Record TempDeptSums;
 BEGIN
     LastTempDeptSums.RESET;
     IF LastTempDeptSums.FINDLAST THEN
         EXIT(LastTempDeptSums."Line No");
     EXIT(0);
 END;*/


    procedure getgenline(): Integer
    var
        genline: Record "Gen. Journal Line";
    begin
        genline.Reset();
        if genline.FindLast() then
            exit(genline."Line No.");
    end;

    procedure getJvLineno(): Integer

    var
        JvLine: Record 52178781;

    begin
        JvLine.RESET;
        if JvLine.FindLast() then
            exit(JvLine."Line No")





    end;



}