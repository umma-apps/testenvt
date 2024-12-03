report 54204 "FLT Driver List"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Transport/Report/SSR/FLT Driver List.rdl';
    Caption = 'FLT Driver List';

    dataset
    {
        dataitem("FLT-Driver"; "FLT-Driver")
        {
            column(driver; "FLT-Driver"."driver  PF NO")
            {
            }
            column(DriveName; "FLT-Driver"."Driver Name")
            {
            }
            column(License; "FLT-Driver"."Driver License Number")
            {
            }
            column(Grade; "FLT-Driver".Grade)
            {
            }
            column(RenDate; "FLT-Driver"."Last License Renewal")
            {
            }
            column(RenInterval; "FLT-Driver"."Renewal Interval")
            {
            }
            column(Ren_Value; "FLT-Driver"."Renewal Interval Value")
            {
            }
            column(Status; "FLT-Driver".Active)
            {
            }
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
}

