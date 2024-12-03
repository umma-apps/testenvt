codeunit 40000 "Post Stud Receipt Buffer"
{

    Access = Public;

    trigger OnRun()
    begin

    end;

    var
        StudPay: Record 61536;
        Cust: Record 18;
        GenJnl: Record 81;
        GenSetup: Record 61534;
        GLPosting: Codeunit 12;
        Stud: Record 18;
        StudentNo: Code[20];
        CReg: Record 61532;
        LineNo: Integer;
        TransType: Option " ","Direct Bank Deposit",HELB,Bursary,CDF,Scholarship;
        Imported_Receipts_BufferCaptionLbl: Label 'Imported Receipts Buffer';
        CurrReport_PAGENOCaptionLbl: Label 'Page';
        TotalCaptionLbl: Label 'Total';
        TransBank: Code[20];
        receiptsBuffer: Record "ACA-Imp. Receipts Buffer";

    procedure PostReceiptBuffer(var scholarshipHeader: Record "ACA-Scholarship Batches")
    begin

        scholarshipHeader.Find();
        scholarshipHeader.TestField("Batch No.");

        GenSetup.GET();

        //delete exisiting gen journal lines before re inserting
        GenJnl.RESET;
        GenJnl.SETRANGE("Journal Template Name", 'SALES');
        GenJnl.SETRANGE("Journal Batch Name", 'SCH');
        if not GenJnl.IsEmpty then GenJnl.DeleteAll();

        //find receipts buffer lines
        receiptsBuffer.Reset();
        receiptsBuffer.SetRange("Transaction Code", scholarshipHeader."No.");
        receiptsBuffer.SetRange("Batch No.", scholarshipHeader."Batch No.");
        receiptsBuffer.SetRange(Posted, false);
        receiptsBuffer.SetFilter(Amount, '>%1', 0);
        if receiptsBuffer.Find('-') then
            repeat
                //cust 
                GenJnl.INIT;
                GenJnl."Line No." := GenJnl."Line No." + 110;
                GenJnl."Posting Date" := receiptsBuffer.Date;
                GenJnl."Document No." := receiptsBuffer."Batch No.";
                GenJnl.VALIDATE(GenJnl."Document No.");
                GenJnl."Journal Template Name" := 'SALES';
                GenJnl."Journal Batch Name" := 'SCH';
                //GenJnl."Document Type" := GenJnl."Document Type"::Payment;
                GenJnl."Account Type" := GenJnl."Account Type"::Customer;
                GenJnl."External Document No." := receiptsBuffer."Receipt No";
                GenJnl."Account No." := receiptsBuffer."Student No.";
                //GenJnl."Bill-to/Pay-to No."
                GenJnl.Amount := receiptsBuffer.Amount * -1;
                GenJnl.VALIDATE(GenJnl."Account No.");
                GenJnl.VALIDATE(GenJnl.Amount);
                // GenJnl."Bal. Account Type" := GenJnl."Bal. Account Type"::Vendor;
                // GenJnl."Bal. Account No." := scholarshipHeader.Vendor;
                GenJnl.Description := receiptsBuffer.Description + '-' + scholarshipHeader."Batch No.";
                GenJnl.INSERT;


                //GenJnl."Bill-to/Pay-to No." := receiptsBuffer."Student No.";

                //GenJnl.VALIDATE(GenJnl."Bal. Account No.");
                //Vendor
                GenJnl.INIT;
                GenJnl."Line No." := GenJnl."Line No." + 120000;
                GenJnl."Posting Date" := receiptsBuffer.Date;
                GenJnl."Document No." := receiptsBuffer."Batch No.";
                GenJnl.VALIDATE(GenJnl."Document No.");
                GenJnl."Journal Template Name" := 'SALES';
                GenJnl."Journal Batch Name" := 'SCH';
                scholarshipHeader.TestField(Vendor);
                //GenJnl."Document Type" := GenJnl."Document Type"::Payment;
                GenJnl."Account Type" := GenJnl."Account Type"::Vendor;
                GenJnl."External Document No." := receiptsBuffer."Receipt No";
                GenJnl."Account No." := scholarshipHeader.Vendor;
                //GenJnl."Bill-to/Pay-to No."
                GenJnl.Amount := receiptsBuffer.Amount;
                GenJnl.VALIDATE(GenJnl."Account No.");
                GenJnl.VALIDATE(GenJnl.Amount);
                GenJnl.Description := receiptsBuffer.Description + '-' + scholarshipHeader."Batch No.";
                GenJnl.INSERT;

                receiptsBuffer.Unallocated := TRUE;
                receiptsBuffer.Posted := TRUE;
                receiptsBuffer.MODIFY;

            until receiptsBuffer.Next() = 0;

        GenJnl.Reset();
        GenJnl.SETRANGE("Journal Template Name", 'SALES');
        GenJnl.SETRANGE("Journal Batch Name", 'SCH');
        IF GenJnl.FIND('-') THEN BEGIN
            CODEUNIT.RUN(CODEUNIT::"Gen. Jnl.-Post", GenJnl);
        end;


    end;

}