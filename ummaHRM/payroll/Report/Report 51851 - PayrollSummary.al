report 51851 "Payroll SummaryFix"
{
    DefaultLayout = RDLC;
    RDLCLayout = './payroll/Report/SSR/Payroll Summary 2.rdl';


    dataset
    {
        dataitem("HRM-Employee C"; "HRM-Employee (D)")
        {
            column(compAddress; info.Address)
            {
            }
            column(compName; info.Name)
            {
            }
            column(PrintBy; 'PRINTED BY NAME:........................................................................................ SIGNATURE:................................... DESIGNATION:...................................... DATE:.......................................')
            {
            }
            column(CheckedBy; 'CHECKED BY NAME:........................................................................................ SIGNATURE:................................... DESIGNATION:...................................... DATE:.......................................')
            {
            }
            column(VerifiedBy; 'VERIFIED BY NAME:........................................................................................ SIGNATURE:................................... DESIGNATION:...................................... DATE:.......................................')
            {
            }
            column(ApprovedBy; 'APPROVED BY NAME:........................................................................................ SIGNATURE:................................... DESIGNATION:...................................... DATE:.......................................')
            {
            }
            column(BasicPayLbl; 'BASIC PAY')
            {
            }
            column(payelbl; 'PAYE.')
            {
            }
            column(nssflbl; 'NSSF')
            {
            }
            column(nhiflbl; 'NHIF')
            {
            }
            column(Netpaylbl; 'Net Pay')
            {
            }
            column(payeamount; payeamount)
            {
            }
            column(nssfam; nssfam)
            {
            }
            column(nhifamt; nhifamt)
            {
            }
            column(NetPay; NetPay)
            {
            }
            column(pic; info.Picture)
            {
            }
            column(BasicPay; BasicPay)
            {
            }
            column(periods; 'PAYROLL SUMMARY for ' + Format(periods, 0, 4))
            {
            }
            column(empName; "No." + ': ' + "First Name" + ' ' + "Middle Name" + ' ' + "Last Name")
            {
            }
            column(TransName_1_1; TransName[1, 1])
            {
            }
            column(TransName_1_2; TransName[1, 2])
            {
            }
            column(TransName_1_3; TransName[1, 3])
            {
            }
            column(TransName_1_4; TransName[1, 4])
            {
            }
            column(TransName_1_5; TransName[1, 5])
            {
            }
            column(TransName_1_6; TransName[1, 6])
            {
            }
            column(TransName_1_7; TransName[1, 7])
            {
            }
            column(TransName_1_8; TransName[1, 8])
            {
            }
            column(TransName_1_9; TransName[1, 9])
            {
            }
            column(TransName_1_10; TransName[1, 10])
            {
            }
            column(TransName_1_11; TransName[1, 11])
            {
            }
            column(TransName_1_12; TransName[1, 12])
            {
            }
            column(TransName_1_13; TransName[1, 13])
            {
            }
            column(TransName_1_14; TransName[1, 14])
            {
            }
            column(TransName_1_15; TransName[1, 15])
            {
            }
            column(TransName_1_16; TransName[1, 16])
            {
            }
            column(TransName_1_17; TransName[1, 17])
            {
            }
            column(TransName_1_18; TransName[1, 18])
            {
            }
            column(TransName_1_19; TransName[1, 19])
            {
            }
            column(TransName_1_20; TransName[1, 20])
            {
            }
            column(TransName_1_21; TransName[1, 21])
            {
            }
            column(TransName_1_22; TransName[1, 22])
            {
            }
            column(TransName_1_23; TransName[1, 23])
            {
            }
            column(TransName_1_24; TransName[1, 24])
            {
            }
            column(TransName_1_25; TransName[1, 25])
            {
            }
            column(TransName_1_26; TransName[1, 26])
            {
            }
            column(TransName_1_27; TransName[1, 27])
            {
            }
            column(TransName_1_28; TransName[1, 28])
            {
            }
            column(TranscAmount_1_1; TranscAmount[1, 1])
            {
            }
            column(TranscAmount_1_2; TranscAmount[1, 2])
            {
            }
            column(TranscAmount_1_3; TranscAmount[1, 3])
            {
            }
            column(TranscAmount_1_4; TranscAmount[1, 4])
            {
            }
            column(TranscAmount_1_5; TranscAmount[1, 5])
            {
            }
            column(TranscAmount_1_6; TranscAmount[1, 6])
            {
            }
            column(TranscAmount_1_7; TranscAmount[1, 7])
            {
            }
            column(TranscAmount_1_8; TranscAmount[1, 8])
            {
            }
            column(TranscAmount_1_9; TranscAmount[1, 9])
            {
            }
            column(TranscAmount_1_10; TranscAmount[1, 10])
            {
            }
            column(TranscAmount_1_11; TranscAmount[1, 11])
            {
            }
            column(TranscAmount_1_12; TranscAmount[1, 12])
            {
            }
            column(TranscAmount_1_13; TranscAmount[1, 13])
            {
            }
            column(TranscAmount_1_14; TranscAmount[1, 14])
            {
            }
            column(TranscAmount_1_15; TranscAmount[1, 15])
            {
            }
            column(TranscAmount_1_16; TranscAmount[1, 16])
            {
            }
            column(TranscAmount_1_17; TranscAmount[1, 17])
            {
            }
            column(TranscAmount_1_18; TranscAmount[1, 18])
            {
            }
            column(TranscAmount_1_19; TranscAmount[1, 19])
            {
            }
            column(TranscAmount_1_20; TranscAmount[1, 20])
            {
            }
            column(TranscAmount_1_21; TranscAmount[1, 21])
            {
            }
            column(TranscAmount_1_22; TranscAmount[1, 22])
            {
            }
            column(TranscAmount_1_23; TranscAmount[1, 23])
            {
            }
            column(TranscAmount_1_24; TranscAmount[1, 24])
            {
            }
            column(TranscAmount_1_25; TranscAmount[1, 25])
            {
            }
            column(TranscAmount_1_26; TranscAmount[1, 26])
            {
            }
            column(TranscAmount_1_27; TranscAmount[1, 27])
            {
            }
            column(TranscAmount_1_28; TranscAmount[1, 28])
            {
            }

            trigger OnAfterGetRecord()
            begin

                TransCount := 0;
                showdet := true;
                NetPay := 0;
                BasicPay := 0;
                Clear(TranscAmount);
                payeamount := 0;
                nssfam := 0;
                nhifamt := 0;
                repeat
                begin
                    TransCount := TransCount + 1;
                    prPeriodTransactions.Reset;
                    prPeriodTransactions.SetRange(prPeriodTransactions."Payroll Period", periods);
                    prPeriodTransactions.SetRange(prPeriodTransactions."Employee Code", "HRM-Employee C"."No.");
                    prPeriodTransactions.SetRange(prPeriodTransactions."Transaction Code", Transcode[1, TransCount]);
                    if prPeriodTransactions.Find('-') then begin
                        TranscAmount[1, TransCount] := prPeriodTransactions.Amount;
                    end;
                    repeat
                    begin
                        TranscAmountTotal[1, TransCount] := ((TranscAmountTotal[1, TransCount]) + TranscAmount[1, TransCount]);
                    end;
                    until prPeriodTransactions.Next = 0;

                end;
                until TransCount = 70;//COMPRESSARRAY(TransName);



                prPeriodTransactions.Reset;
                prPeriodTransactions.SetRange(prPeriodTransactions."Payroll Period", periods);
                prPeriodTransactions.SetRange(prPeriodTransactions."Employee Code", "HRM-Employee C"."No.");
                prPeriodTransactions.SetRange(prPeriodTransactions."Transaction Name", 'Net Pay');
                if prPeriodTransactions.Find('-') then begin
                    NetPay := prPeriodTransactions.Amount;
                    //NetPayTotal:=(NetPayTotal+(prPeriodTransactions.Amount));

                end;


                prPeriodTransactions.Reset;
                prPeriodTransactions.SetRange(prPeriodTransactions."Payroll Period", periods);
                prPeriodTransactions.SetRange(prPeriodTransactions."Employee Code", "HRM-Employee C"."No.");
                //prPeriodTransactions.SETRANGE(prPeriodTransactions."Transaction Name",'Net Pay');
                if prPeriodTransactions.Find('-') then begin
                    repeat
                    begin
                        if prPeriodTransactions."Transaction Code" = 'NPAY' then begin
                            NetPay := prPeriodTransactions.Amount;
                            NetPayTotal := (NetPayTotal + (prPeriodTransactions.Amount));
                        end else
                            if prPeriodTransactions."Transaction Code" = 'PAYE' then begin
                                payeamount := prPeriodTransactions.Amount;
                                ;
                                payeamountTotal := (payeamountTotal + (prPeriodTransactions.Amount));
                            end else
                                if prPeriodTransactions."Transaction Code" = 'NSSF' then begin
                                    nssfam := prPeriodTransactions.Amount;
                                    ;
                                    nssfamTotal := (nssfamTotal + (prPeriodTransactions.Amount));
                                end else
                                    if prPeriodTransactions."Transaction Code" = 'NHIF' then begin
                                        nhifamt := prPeriodTransactions.Amount;
                                        ;
                                        nhifamtTotal := (nhifamtTotal + (prPeriodTransactions.Amount));
                                    end else
                                        if prPeriodTransactions."Transaction Code" = 'BPAY' then begin
                                            BasicPay := prPeriodTransactions.Amount;
                                            ;
                                            BasicPayTotal := (BasicPayTotal + (prPeriodTransactions.Amount));
                                            ;
                                        end;
                    end;
                    until prPeriodTransactions.Next = 0;

                end;


                if "HRM-Employee C"."No." = '' then showdet := false;


                if ((BasicPay = 0) or ("HRM-Employee C"."No." = '')) then //showdet:=FALSE;
                    CurrReport.Skip;
            end;

            trigger OnPreDataItem()
            begin
                if periods = 0D then Error('Please Specify the Period first.');
                counts := 0;
                NetPayTotal := 0;
                BasicPayTotal := 0;
                payeamountTotal := 0;
                nssfamTotal := 0;
                nhifamtTotal := 0;

                Clear(TranscAmountTotal);

                // Make Headers
                // Pick The Earnings First
                prtransCodes.Reset;
                prtransCodes.SetFilter(prtransCodes."Transaction Type", '=%1', prtransCodes."Transaction Type"::Income);
                if prtransCodes.Find('-') then begin
                    repeat
                    begin
                        prPeriodTransactions.Reset;
                        prPeriodTransactions.SetRange(prPeriodTransactions."Transaction Code", prtransCodes."Transaction Code");
                        prPeriodTransactions.SetRange(prPeriodTransactions."Payroll Period", periods);
                        if prPeriodTransactions.Find('-') then begin
                            counts := counts + 1;
                            TransName[1, counts] := prtransCodes."Transaction Name";
                            Transcode[1, counts] := prtransCodes."Transaction Code";
                        end;
                    end;
                    until prtransCodes.Next = 0;
                end;

                // pick the deductions Here
                prtransCodes.Reset;
                prtransCodes.SetFilter(prtransCodes."Transaction Type", '=%1', prtransCodes."Transaction Type"::Deduction);
                if prtransCodes.Find('-') then begin
                    repeat
                    begin

                        prPeriodTransactions.Reset;
                        prPeriodTransactions.SetRange(prPeriodTransactions."Transaction Code", prtransCodes."Transaction Code");
                        prPeriodTransactions.SetRange(prPeriodTransactions."Payroll Period", periods);
                        if prPeriodTransactions.Find('-') then begin
                            counts := counts + 1;
                            TransName[1, counts] := prtransCodes."Transaction Name";
                            Transcode[1, counts] := prtransCodes."Transaction Code";
                        end;
                    end;
                    until prtransCodes.Next = 0;
                end;
                info.Reset;
                if info.Find('-') then info.CalcFields(info.Picture);
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field(Period; periods)
                {
                    ApplicationArea = all;
                    Caption = 'Period:';
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

    var
        prPayrollPeriods: Record "PRL-Payroll Periods";
        periods: Date;
        counts: Integer;
        prPeriodTransactions: Record "PRL-Period Transactions";
        TransName: array[1, 200] of Text[200];
        Transcode: array[1, 200] of Code[100];
        TransCount: Integer;
        TranscAmount: array[1, 200] of Decimal;
        TranscAmountTotal: array[1, 200] of Decimal;
        NetPay: Decimal;
        NetPayTotal: Decimal;
        showdet: Boolean;
        payeamount: Decimal;
        payeamountTotal: Decimal;
        nssfam: Decimal;
        nssfamTotal: Decimal;
        nhifamt: Decimal;
        nhifamtTotal: Decimal;
        BasicPay: Decimal;
        BasicPayTotal: Decimal;
        GrossPay: Decimal;
        GrosspayTotal: Decimal;
        prtransCodes: Record "PRL-Transaction Codes";
        info: Record "Company Information";
}

