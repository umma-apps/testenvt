report 52178717 "Customer Statement Summary"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Reports/SSR/customerStament.rdl';

    dataset
    {
        dataitem(Customer; 18)
        {
            RequestFilterFields = "No.", "Date Filter";

            column(StudNo; Customer."No.")
            {
            }
            column(StudName; Customer.Name)
            {
            }
            // column(First_Name; "First Name")
            // {

            // }
            // column(Middle_Name; "Middle Name")
            // {

            // }
            // column(Last_Name; "Last Name")
            // {

            // }
            column(Balance; Customer.Balance)
            {
            }
            column(campus; Customer."Global Dimension 1 Code")
            {
            }

            column(compName; CompanyInformation.Name)
            {
            }
            column(address; CompanyInformation.Address + ',' + CompanyInformation."Address 2")
            {
            }
            column(phones; CompanyInformation."Phone No." + '/' + CompanyInformation."Phone No. 2")
            {
            }
            column(pics; CompanyInformation.Picture)
            {
            }
            column(mails; CompanyInformation."E-Mail" + '/' + CompanyInformation."Home Page")
            {
            }
            dataitem("Detailed Cust. Ledg. Entry"; "Detailed Cust. Ledg. Entry")
            {
                DataItemLink = "Customer No." = FIELD("No.");
                DataItemTableView = sorting("Posting Date")
                                    ORDER(Ascending)
                                    WHERE("Entry Type" = FILTER("Initial Entry"));
                column(pDate; CustLedgerEntry."Posting Date")
                {
                }
                column(DocNo; CustLedgerEntry."Document No.")
                {
                }
                column(Desc; (CustLedgerEntry.Description) + CustLedgerEntry."External Document No.")
                {
                }
                // column(Desc; COPYSTR(CustLedgerEntry.Description, 1, 35) + CustLedgerEntry."External Document No.")
                // {
                // }
                column(Amount; "Detailed Cust. Ledg. Entry".Amount)
                {
                }
                column(DebitAm; "Detailed Cust. Ledg. Entry"."Debit Amount")
                {
                }
                column(CreditAm; "Detailed Cust. Ledg. Entry"."Credit Amount")
                {
                }
                column(runningBal; runningBal)
                {
                }

                trigger OnAfterGetRecord()
                begin
                    //runningBal:=runningBal+"Detailed Cust. Ledg. Entry"."Debit Amount"-"Detailed Cust. Ledg. Entry"."Credit Amount";
                    CustLedgerEntry.RESET;
                    CustLedgerEntry.SETRANGE(CustLedgerEntry."Entry No.", "Detailed Cust. Ledg. Entry"."Cust. Ledger Entry No.");
                    IF CustLedgerEntry.FIND('-') THEN BEGIN
                        IF CustLedgerEntry.Reversed THEN CurrReport.SKIP;
                    END;
                    runningBal := runningBal + "Detailed Cust. Ledg. Entry".Amount;
                end;
            }

            trigger OnAfterGetRecord()
            begin
                CLEAR(runningBal);

            end;
        }
    }

    requestpage
    {

        layout
        {
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
        CompanyInformation.RESET;
        IF CompanyInformation.FIND('-') THEN BEGIN
            CompanyInformation.CALCFIELDS(Picture);
        END;
    end;

    var
        runningBal: Decimal;
        //ACACourseRegistration: Record 61532;
        //Progs: Record 61511;
        CustLedgerEntry: Record 21;
        CompanyInformation: Record 79;
}

