report 60017 "Aca-Hostel Charge Collection"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Reports/SSR/Aca-Hostel Charge Collection.rdl';

    dataset
    {
        dataitem("ACA-Students Hostel Rooms"; "ACA-Students Hostel Rooms")
        {
            RequestFilterFields = Semester;
            DataItemTableView = WHERE(Billed = FILTER(true));
            column(SNo; "ACA-Students Hostel Rooms".Student)
            {
            }
            column(HNo; "ACA-Students Hostel Rooms"."Hostel No")
            {
            }
            column(RNo; "ACA-Students Hostel Rooms"."Room No")
            {
            }
            column(Sem; "ACA-Students Hostel Rooms".Semester)
            {
            }
            column(AYear; "ACA-Students Hostel Rooms"."Academic Year")
            {
            }
            column(Scharges; "ACA-Students Hostel Rooms".Charges)
            {
            }
            column(BDate; FORMAT("ACA-Students Hostel Rooms"."Billed Date"))
            {
            }
            column(SpaceNo; "ACA-Students Hostel Rooms"."Space No")
            {
            }
            column(address; info.Address)
            {
            }
            column(Phone; info."Phone No.")
            {
            }
            column(pics; info.Picture)
            {
            }
            column(name; info.Name)
            {
            }
            column(city; info.City)
            {
            }
            column(postal_code; info."Post Code")
            {
            }
            column(email; info."E-Mail")
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

    trigger OnPreReport()
    begin
        info.RESET;
        IF info.FIND('-') THEN info.CALCFIELDS(Picture)
    end;

    var
        info: Record 79;
        totRooms: Integer;
}

