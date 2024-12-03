report 51807 "PRL-Payments Summary 2 a"
{
    DefaultLayout = RDLC;
    RDLCLayout = './payroll/Report/SSR/PRL-Payments Summary 2.rdl';

    dataset
    {
        dataitem("PRL-Period Transactions"; "PRL-Period Transactions")
        {
            column(COMPANYNAME; CompanyInfo.Name)
            {
            }
            column(COMPANYNAME_Control1102755015; CompanyName)
            {
            }
            column(COMPANYNAME_Control1102756027; CompanyName)
            {
            }
            column(COMPANYNAME_Control1102756028; CompanyName)
            {
            }
            column(CompanyInfo_Picture; CompanyInfo.Picture)
            {
            }
            column(CompanyInfo_Picture_Control1102756014; CompanyInfo.Picture)
            {
            }
            column(PayrollSummary; 'COMPANY PAYROLL SUMMARY')
            {
            }
            column(PeriodNamez; 'PERIOD:  ' + PeriodName)
            {
            }
            column(TransDesc; 'TRANSACTION DESC.')
            {
            }
            column(payments; 'PAYMENTS')
            {
            }
            column(deductions; 'DEDUCTIONS')
            {
            }
            column(kirinyagatitle; CompanyName)
            {
            }
            column(abreviation; 'CUEA')
            {
            }
            column(DetDate; DetDate)
            {
            }
            column(EmpNo; "PRL-Period Transactions"."Employee Code")
            {
            }
            column(empName; empName)
            {
            }
            column(EmpAmount; "PRL-Period Transactions".Amount)
            {
            }
            column("code"; "PRL-Period Transactions"."Transaction Code")
            {
            }
            column(name; "PRL-Period Transactions"."Transaction Name")
            {
            }
            column(Transaction; "PRL-Period Transactions"."Transaction Code" + ': ' + "PRL-Period Transactions"."Transaction Name")
            {
            }
            column(TotLabel; "PRL-Period Transactions"."Transaction Code" + ': ' + "PRL-Period Transactions"."Transaction Name")
            {
            }
            column(compNAme; CompanyInfo.Name)
            {
            }

            trigger OnAfterGetRecord()
            begin
                Clear(empName);
                if emps.Get("PRL-Period Transactions"."Employee Code") then
                    empName := emps."First Name" + ' ' + emps."Middle Name" + ' ' + emps."Last Name";

                if not (((("PRL-Period Transactions"."Group Order" = 1) and
                ("PRL-Period Transactions"."Sub Group Order" <> 1)) or
               ("PRL-Period Transactions"."Group Order" = 3) or
                (("PRL-Period Transactions"."Group Order" = 4) and
                 ("PRL-Period Transactions"."Sub Group Order" <> 0)))) then begin
                    CurrReport.Skip;
                end;


                "prPayroll Periods".Reset;
                "prPayroll Periods".SetRange("prPayroll Periods"."Date Opened", SelectedPeriod);
                if "prPayroll Periods".Find('-') then begin
                    Clear(DetDate);
                    DetDate := Format("prPayroll Periods"."Period Name");
                end;

                /*IF NOT ( ((("prPeriod Transactions"."Group Order"=7) AND
                     (("prPeriod Transactions"."Sub Group Order"<>6)
                    AND ("prPeriod Transactions"."Sub Group Order"<>5))) OR
                    (("prPeriod Transactions"."Group Order"=8) AND
                     ("prPeriod Transactions"."Sub Group Order"<>9)))) THEN BEGIN
                      CurrReport.SKIP;
                      END; */

                /*
              CLEAR(rows);
              CLEAR(rows2);
              "prPeriod Transactions".RESET;
              "prPeriod Transactions".SETRANGE("Payroll Period",SelectedPeriod);
              "prPeriod Transactions".SETFILTER("Group Order",'=1|3|4|7|8|9');
              //"prPeriod Transactions".SETFILTER("prPeriod Transactions"."Sub Group Order",'=2');
              "prPeriod Transactions".SETCURRENTKEY("Payroll Period","Group Order","Sub Group Order");
              IF "prPeriod Transactions".FIND('-') THEN BEGIN
              CLEAR(DetDate);
              DetDate:=FORMAT("prPayroll Periods"."Period Name");
              REPEAT
              BEGIN
              IF "prPeriod Transactions".Amount>0 THEN BEGIN
              IF (("prPeriod Transactions"."Group Order"=4) AND ("prPeriod Transactions"."Sub Group Order"=0)) THEN
                GPY:=GPY+"prPeriod Transactions".Amount;

              IF (("prPeriod Transactions"."Group Order"=7) AND
              (("prPeriod Transactions"."Sub Group Order"=3) OR ("prPeriod Transactions"."Sub Group Order"=1) OR
               ("prPeriod Transactions"."Sub Group Order"=2)))  THEN
                STAT:=STAT+"prPeriod Transactions".Amount;

              IF (("prPeriod Transactions"."Group Order"=8) AND
              (("prPeriod Transactions"."Sub Group Order"=1) OR ("prPeriod Transactions"."Sub Group Order"=0))) THEN
                 DED:=DED+"prPeriod Transactions".Amount;

              IF (("prPeriod Transactions"."Group Order"=9) AND ("prPeriod Transactions"."Sub Group Order"=0)) THEN
                NETS:=NETS+"prPeriod Transactions".Amount;





              //TotalsAllowances:=TotalsAllowances+"prPeriod Transactions".Amount;
                  IF ((("prPeriod Transactions"."Group Order"=1) AND
                   ("prPeriod Transactions"."Sub Group Order"<>1)) OR
                  ("prPeriod Transactions"."Group Order"=3) OR
                   (("prPeriod Transactions"."Group Order"=4) AND
                    ("prPeriod Transactions"."Sub Group Order"<>0))) THEN BEGIN // A Payment
                    CLEAR(countz);
                   // countz:=1;
                    CLEAR(found);
                    REPEAT
                   BEGIN
                     countz:=countz+1;
                     IF (PayTrans[countz])="prPeriod Transactions"."Transaction Name" THEN found:=TRUE;
                     END;
                    UNTIL ((countz=(ARRAYLEN(PayTransAmt))) OR ((PayTrans[countz])="prPeriod Transactions"."Transaction Name")
                    OR ((PayTrans[countz])=''));
                   rows:= countz;
                  PayTrans[rows]:="prPeriod Transactions"."Transaction Name";
                  PayTransAmt[rows]:=PayTransAmt[rows]+"prPeriod Transactions".Amount;
                  END ELSE IF ((("prPeriod Transactions"."Group Order"=7) AND
                   (("prPeriod Transactions"."Sub Group Order"<>6)
                  AND ("prPeriod Transactions"."Sub Group Order"<>5))) OR
                  (("prPeriod Transactions"."Group Order"=8) AND
                   ("prPeriod Transactions"."Sub Group Order"<>9))) THEN BEGIN
                    CLEAR(countz);
                   // countz:=1;
                    CLEAR(found);
                    REPEAT
                   BEGIN
                     countz:=countz+1;
                     IF (DedTrans[countz])="prPeriod Transactions"."Transaction Name" THEN found:=TRUE;
                     END;
                    UNTIL ((countz=(ARRAYLEN(DedTransAmt))) OR ((DedTrans[countz])="prPeriod Transactions"."Transaction Name")
                    OR ((DedTrans[countz])=''));
                   rows:= countz;
                  DedTrans[rows]:="prPeriod Transactions"."Transaction Name";
                  DedTransAmt[rows]:=DedTransAmt[rows]+"prPeriod Transactions".Amount;
                  END;
                  END; // If Amount >0;
              END;
              UNTIL "prPeriod Transactions".NEXT=0;
              END;// End prPeriod Transactions Repeat
              // MESSAGE('Heh'+FORMAT(rows)+', '+FORMAT(rows2));
                                    */

            end;

            trigger OnPreDataItem()
            begin

                //LastFieldNo := FIELDNO("Period Year");
                "PRL-Period Transactions".SetFilter("PRL-Period Transactions"."Payroll Period", '=%1', SelectedPeriod);
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field(periodfilter; PeriodFilter)
                {
                    ApplicationArea = all;
                    Caption = 'Period Filter';
                    TableRelation = "PRL-Payroll Periods"."Date Opened";
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnInitReport()
    begin
        objPeriod.Reset;
        objPeriod.SetRange(objPeriod.Closed, false);
        if objPeriod.Find('-') then;
        PeriodFilter := objPeriod."Date Opened";
    end;

    trigger OnPreReport()
    begin

        SelectedPeriod := PeriodFilter;
        objPeriod.Reset;
        objPeriod.SetRange(objPeriod."Date Opened", SelectedPeriod);
        if objPeriod.Find('-') then begin
            PeriodName := objPeriod."Period Name";
        end;


        if CompanyInfo.Get() then
            CompanyInfo.CalcFields(CompanyInfo.Picture);
        Clear(rows);
        Clear(GPY);
        Clear(STAT);
        Clear(DED);
        Clear(NETS);
    end;

    var
        empName: Text[250];
        DetDate: Text[100];
        found: Boolean;
        countz: Integer;
        PeriodFilter: Date;
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        PeriodTrans: Record "PRL-Period Transactions";
        objPeriod: Record "PRL-Payroll Periods";
        SelectedPeriod: Date;
        PeriodName: Text[30];
        CompanyInfo: Record "Company Information";
        TotalsAllowances: Decimal;
        Dept: Boolean;
        PaymentDesc: Text[200];
        DeductionDesc: Text[200];
        GroupText1: Text[200];
        GroupText2: Text[200];
        PaymentAmount: Decimal;
        DeductAmount: Decimal;
        PayTrans: array[70] of Text[250];
        PayTransAmt: array[70] of Decimal;
        DedTrans: array[70] of Text[250];
        DedTransAmt: array[70] of Decimal;
        rows: Integer;
        rows2: Integer;
        GPY: Decimal;
        NETS: Decimal;
        STAT: Decimal;
        DED: Decimal;
        TotalFor: Label 'Total for ';
        GroupOrder: Label '3';
        TransBal: array[2, 60] of Text[250];
        Addr: array[2, 10] of Text[250];
        RecordNo: Integer;
        NoOfColumns: Integer;
        ColumnNo: Integer;
        emps: Record "HRM-Employee (D)";
        "prPayroll Periods": Record "PRL-Payroll Periods";
}

