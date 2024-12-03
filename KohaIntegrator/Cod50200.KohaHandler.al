codeunit 50481 "Koha Handler"
{

    var
        KohaBaseURL: Text;// 'https://lib-admin.umma.ac.ke/api/v1';
        KohaUsername: Text;// 'admin';
        KohaPassword: Text;// 'K0ha@Buc';
        RestHandler: Codeunit "Rest Handler";
        ReqEnum: Enum "Http Requests Enum";
        JsonObject: JsonObject;
        PatronId: JsonToken;
        UserId: JsonToken;
        FileName: Text;
        FilePath: Text;
        PayloadFile: File;


    procedure CreateStudentPatron(Cust: Record Customer)
    var
        payload: Text[2048];
        Response: Text;
        JObject: JsonObject;
        NullDate: Date;
        KohaBaseURL: Text;
        KohaUsername: Text;
        KohaPassword: Text;
        jValue: JsonValue;
        firstname: Text;
        middlename: Text;
        surname: Text;
    begin
        Clear(NullDate);
        ParseFullName(Cust.Name, firstname, middlename, surname);
        JObject.Add('surname', surname);
        JObject.Add('address', Cust.Address);
        JObject.Add('city', Cust.City);
        case Cust."Global Dimension 1 Code" OF
            '10':
                JObject.Add('library_id', 'UUKlib');
            '30':
                JObject.Add('library_id', 'UUGSA');
            '40':
                JObject.Add('library_id', 'UUMSA');
        end;
        JObject.Add('category_id', 'ST');
        JObject.Add('patron_id', '136');
        JObject.Add('cardnumber', Cust."No.");
        JObject.Add('firstname', firstname);
        JObject.Add('title', '');
        JObject.Add('other_name', middlename);
        JObject.Add('initials', '');
        JObject.Add('street_number', '');
        JObject.Add('street_type', '');
        JObject.Add('address2', Cust."Address 2");
        JObject.Add('state', '');
        JObject.Add('postal_code', Cust."Post Code");
        JObject.Add('country', Cust."Country/Region Code");
        JObject.Add('email', Cust."E-Mail");
        JObject.Add('phone', Cust."Phone No.");
        JObject.Add('mobile', Cust."Phone No.");
        JObject.Add('fax', Cust."Fax No.");
        JObject.Add('secondary_email', '');
        JObject.Add('secondary_phone', '');
        JObject.Add('altaddress_street_number', '');
        JObject.Add('altaddress_street_type', '');
        JObject.Add('altaddress_address', '');
        JObject.Add('altaddress_address2', '');
        JObject.Add('altaddress_city', '');
        JObject.Add('altaddress_state', '');
        JObject.Add('altaddress_postal_code', '');
        JObject.Add('altaddress_country', '');
        JObject.Add('altaddress_email', '');
        JObject.Add('altaddress_phone', '');
        if Cust."Date Of Birth" <> 0D then
            JObject.Add('date_of_birth', Format(Cust."Date Of Birth", 0, '<Year4>-<Month,2>-<Day,2>'))
        else
            JObject.Add('date_of_birth', jValue);
        JObject.Add('date_enrolled', Format(Today, 0, '<Year4>-<Month,2>-<Day,2>'));
        JObject.Add('expiry_date', Format(CalcDate('<5Y>', Today), 0, '<Year4>-<Month,2>-<Day,2>'));
        JObject.Add('date_renewed', Format(Today, 0, '<Year4>-<Month,2>-<Day,2>'));
        JObject.Add('incorrect_address', 'false');
        JObject.Add('patron_card_lost', 'false');
        JObject.Add('staff_notes', '');
        JObject.Add('relationship_type', '');
        JObject.Add('gender', CopyStr(UpperCase(Format(Cust.Gender)), 1, 1));
        JObject.Add('userid', '');
        JObject.Add('opac_notes', '');
        JObject.Add('altaddress_notes', '');
        JObject.Add('statistics_1', '');
        JObject.Add('statistics_2', '');
        JObject.Add('autorenew_checkouts', 'false');
        JObject.Add('altcontact_firstname', '');
        JObject.Add('altcontact_surname', '');
        JObject.Add('altcontact_address', '');
        JObject.Add('altcontact_address2', '');
        JObject.Add('altcontact_city', '');
        JObject.Add('altcontact_state', '');
        JObject.Add('altcontact_postal_code', '');
        JObject.Add('altcontact_country', '');
        JObject.Add('altcontact_phone', '');
        JObject.Add('sms_number', jValue);
        JObject.Add('sms_provider_id', jValue);
        JObject.Add('privacy', '10');
        JObject.Add('privacy_guarantor_checkouts', '10');
        JObject.Add('privacy_guarantor_fines', 'false');
        JObject.Add('check_previous_checkout', '');
        JObject.Add('updated_on', Format(CurrentDateTime, 0, '<Year4>-<Month,2>-<Day,2>T<Hours24,2>:<Minutes,2>:<Seconds,2>Z'));
        JObject.Add('last_seen', Format(CurrentDateTime, 0, '<Year4>-<Month,2>-<Day,2>T<Hours24,2>:<Minutes,2>:<Seconds,2>Z'));
        JObject.Add('lang', 'en');
        JObject.Add('login_attempts', '10');
        JObject.Add('overdrive_auth_token', '');
        JObject.WriteTo(payload);
        KohaBaseURL := 'https://lib-admin.umma.ac.ke/api/v1';
        KohaUsername := 'ICT001';
        KohaPassword := 'ICT@2024';
        Response := RestHandler.CallService(KohaBaseURL + '/patrons', ReqEnum::post, payload, KohaUsername, KohaPassword, '');
        JsonObject.ReadFrom(Response);
        if JsonObject.Get('userid', UserId) or (JsonObject.Get('patron_id', PatronId)) then begin
            cust."Library Username" := UserId.AsValue().AsText();
            Cust.Modify(true);
            setPatronPassword(PatronId.AsValue().AsText(), DelChr(Cust."No.", '=', '/'));
        end
        else begin
            Error('Failed to retrieve patron_id or userid from the response');
        end;
        if UserId.AsValue().AsText() <> '' then begin
            Message('Patron created successfully. Username: %1', UserId.AsValue().AsText());
        end
        else begin
            Error('Failed to create patron');
        end;
    end;

    procedure setPatronPassword(patronId: Text; password: Text)
    var
        payload: Text;
        Response: Text;
    begin
        payload := '{' +
                '"password": "' + password + '"' +
                '"password_2": "' + password + '"' +
            '}';
        KohaBaseURL := 'https://lib-admin.umma.ac.ke/api/v1';
        KohaUsername := 'ICT001';
        KohaPassword := 'ICT@2024';
        Response := RestHandler.CallService(KohaBaseURL + '/patrons/' + patronId + '/password', ReqEnum::post, payload, KohaUsername, KohaPassword, '');
    end;

    procedure ParseFullName(FullName: Text; var FirstName: Text; var MiddleName: Text; var Surname: Text)
    var
        NameParts: List of [Text];
        WordCount: Integer;
        i: Integer;
    begin
        Clear(FirstName);
        Clear(MiddleName);
        Clear(Surname);
        NameParts := FullName.Split(' ');
        WordCount := NameParts.Count;
        case WordCount of
            1:
                begin
                    FirstName := NameParts.Get(1);
                end;
            2:
                begin
                    FirstName := NameParts.Get(1);
                    Surname := NameParts.Get(2);
                end;
            else begin
                FirstName := NameParts.Get(1);
                Surname := NameParts.Get(WordCount);
                for i := 2 to WordCount - 1 do
                    if MiddleName = '' then
                        MiddleName := NameParts.Get(i)
                    else
                        MiddleName += ' ' + NameParts.Get(i);
            end;
        end;
    end;

    procedure createStaffPatron(Emp: Record "HRM-Employee (D)")
    var
        payload: Text[2048];
        Response: Text;
        JObject: JsonObject;
        NullDate: Date;
        KohaBaseURL: Text;
        KohaUsername: Text;
        KohaPassword: Text;
        jValue: JsonValue;
        firstname: Text;
        middlename: Text;
        surname: Text;
    begin
        Clear(NullDate);
        ParseFullName(Emp.FullName(), firstname, middlename, surname);
        JObject.Add('surname', surname);
        JObject.Add('address', Emp."Postal Address");
        JObject.Add('city', Emp.City);
        case eMP.Campus OF
            '10':
                JObject.Add('library_id', 'UUKlib');
            '30':
                JObject.Add('library_id', 'UUGSA');
            '40':
                JObject.Add('library_id', 'UUMSA');
        end;
        if Emp."Salary Category" in ['ADMIN STAFF', 'ADMIN'] then
            JObject.Add('category_id', 'ADM')
        else
            if Emp.Lecturer then
                JObject.Add('category_id', 'T')
            else
                JObject.Add('category_id', 'S');
        JObject.Add('patron_id', '136');
        JObject.Add('cardnumber', Emp."No.");
        JObject.Add('firstname', firstname);
        JObject.Add('title', '');
        JObject.Add('other_name', middlename);
        JObject.Add('initials', '');
        JObject.Add('street_number', '');
        JObject.Add('street_type', '');
        JObject.Add('address2', Emp."Postal Address2");
        JObject.Add('state', '');
        JObject.Add('postal_code', Emp."Post Code");
        JObject.Add('country', Emp."Country Code");
        JObject.Add('email', Emp."E-Mail");
        JObject.Add('phone', Emp."Cellular Phone Number");
        JObject.Add('mobile', Emp."Cellular Phone Number");
        JObject.Add('fax', Emp."Fax Number");
        JObject.Add('secondary_email', '');
        JObject.Add('secondary_phone', '');
        JObject.Add('altaddress_street_number', '');
        JObject.Add('altaddress_street_type', '');
        JObject.Add('altaddress_address', '');
        JObject.Add('altaddress_address2', '');
        JObject.Add('altaddress_city', '');
        JObject.Add('altaddress_state', '');
        JObject.Add('altaddress_postal_code', '');
        JObject.Add('altaddress_country', '');
        JObject.Add('altaddress_email', '');
        JObject.Add('altaddress_phone', '');
        if Emp."Date Of Birth" <> 0D then
            JObject.Add('date_of_birth', Format(Emp."Date Of Birth", 0, '<Year4>-<Month,2>-<Day,2>'))
        else
            JObject.Add('date_of_birth', jValue);
        JObject.Add('date_enrolled', Format(Today, 0, '<Year4>-<Month,2>-<Day,2>'));
        JObject.Add('expiry_date', Format(CalcDate('<5Y>', Today), 0, '<Year4>-<Month,2>-<Day,2>'));
        JObject.Add('date_renewed', Format(Today, 0, '<Year4>-<Month,2>-<Day,2>'));
        JObject.Add('incorrect_address', 'false');
        JObject.Add('patron_card_lost', 'false');
        JObject.Add('staff_notes', '');
        JObject.Add('relationship_type', '');
        JObject.Add('gender', CopyStr(UpperCase(Format(Emp.Gender)), 1, 1));
        JObject.Add('userid', '');
        JObject.Add('opac_notes', '');
        JObject.Add('altaddress_notes', '');
        JObject.Add('statistics_1', '');
        JObject.Add('statistics_2', '');
        JObject.Add('autorenew_checkouts', 'false');
        JObject.Add('altcontact_firstname', '');
        JObject.Add('altcontact_surname', '');
        JObject.Add('altcontact_address', '');
        JObject.Add('altcontact_address2', '');
        JObject.Add('altcontact_city', '');
        JObject.Add('altcontact_state', '');
        JObject.Add('altcontact_postal_code', '');
        JObject.Add('altcontact_country', '');
        JObject.Add('altcontact_phone', '');
        JObject.Add('sms_number', jValue);
        JObject.Add('sms_provider_id', jValue);
        JObject.Add('privacy', '10');
        JObject.Add('privacy_guarantor_checkouts', '10');
        JObject.Add('privacy_guarantor_fines', 'false');
        JObject.Add('check_previous_checkout', '');
        JObject.Add('updated_on', Format(CurrentDateTime, 0, '<Year4>-<Month,2>-<Day,2>T<Hours24,2>:<Minutes,2>:<Seconds,2>Z'));
        JObject.Add('last_seen', Format(CurrentDateTime, 0, '<Year4>-<Month,2>-<Day,2>T<Hours24,2>:<Minutes,2>:<Seconds,2>Z'));
        JObject.Add('lang', 'en');
        JObject.Add('login_attempts', '10');
        JObject.Add('overdrive_auth_token', '');
        JObject.WriteTo(payload);
        KohaBaseURL := 'https://lib-admin.umma.ac.ke/api/v1';
        KohaUsername := 'ICT001';
        KohaPassword := 'ICT@2024';
        Response := RestHandler.CallService(KohaBaseURL + '/patrons', ReqEnum::post, payload, KohaUsername, KohaPassword, '');
        JsonObject.ReadFrom(Response);
        if JsonObject.Get('userid', UserId) or (JsonObject.Get('patron_id', PatronId)) then begin
            //Emp."Library Username" := UserId.AsValue().AsText();
            Emp.Modify(true);
            setPatronPassword(PatronId.AsValue().AsText(), DelChr(Emp."No.", '=', '/'));
        end
        else begin
            Error('Failed to retrieve patron_id or userid from the response');
        end;
        if UserId.AsValue().AsText() <> '' then begin
            Message('Patron created successfully. Username: %1', UserId.AsValue().AsText());
        end
        else begin
            Error('Failed to create patron');
        end;
    end;
}
