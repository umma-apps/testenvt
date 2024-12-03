report 54820 "Hms Treatment   List"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Clinic/Reports/SSR/HmsTreatmentList.rdl';

    dataset
    {
        dataitem(Treatment; "HMS-Treatment Form Header")
        {
            PrintOnlyIfDetail = false;
            RequestFilterFields = "Treatment Date", "Treatment Type";
            column(seq; seq)
            {
            }
            column(StartDate; StartDate)
            {
            }
            column(EndDate; EndDate)
            {
            }
            column(TNo; Treatment."Treatment No.")
            {
            }
            column(Tdate; Treatment."Treatment Date")
            {
            }
            column(EmpNo; Treatment."Employee No.")
            {
            }
            column(CustNo; Treatment."Student No.")
            {
            }
            column(Remarks; Treatment."Treatment Remarks")
            {
            }
            column(Phone; Treatment."Telephone No. 1")
            {
            }
            column(Cname; Treatment.Surname)
            {
            }
            column(CompAddress; info.Address)
            {
            }
            column(CompAddress1; info."Address 2")
            {
            }
            column(CompPhonenO; info."Phone No.")
            {
            }
            column(CompPhoneNo2; info."Phone No. 2")
            {
            }
            column(CompPic; info.Picture)
            {
            }
            column(CompEmail1; info."E-Mail")
            {
            }
            column(CompHome; info."Home Page")
            {
            }
            column(Name; info.Name)
            {
            }

            trigger OnAfterGetRecord()
            begin
                seq := seq + 1;
                /*IntMonth:=DATE2DMY(SalesHeader."Posting Date",2);
                IF IntMonth<>0 THEN BEGIN
                  IF IntMonth=1 THEN BEGIN
                    MonthName:='JAN';
                    END ELSE IF IntMonth=2 THEN BEGIN
                      MonthName:='FEB';
                      END  ELSE IF IntMonth=3 THEN BEGIN
                        MonthName:='MAR';
                      END  ELSE IF IntMonth=4 THEN BEGIN
                        MonthName:='APRIL';
                      END  ELSE IF IntMonth=5 THEN BEGIN
                        MonthName:='MAY';
                      END  ELSE IF IntMonth=6 THEN BEGIN
                        MonthName:='JUNE';
                      END  ELSE IF IntMonth=7 THEN BEGIN
                        MonthName:='JULY';
                      END  ELSE IF IntMonth=8 THEN BEGIN
                        MonthName:='AUG';
                      END  ELSE IF IntMonth=9 THEN BEGIN
                        MonthName:='SEPT';
                      END  ELSE IF IntMonth=10 THEN BEGIN
                        MonthName:='OCT';
                      END  ELSE IF IntMonth=11 THEN BEGIN
                        MonthName:='NOV';
                      END  ELSE IF IntMonth=12 THEN BEGIN
                        MonthName:='DEC';
                      END
                  END;*/

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
        IF info.GET() THEN BEGIN
            info.CALCFIELDS(Picture);
        END;

        CLEAR(seq);
    end;

    var
        info: Record 79;
        route: Code[20];
        MonthName: Code[20];
        IntMonth: Integer;
        StartDate: Date;
        EndDate: Date;
        seq: Integer;
}

