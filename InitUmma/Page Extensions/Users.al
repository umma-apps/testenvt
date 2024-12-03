pageextension 52178556 "Users Ext" extends Users
{

    trigger OnOpenPage()
    var
        usersetup: Record "User Setup";
        Nopermission: Label 'You have insufficient Rights to access the setup';
    begin
        
        AllowAccessSettings := true;
        if usersetup.get(UserId) then
            if (usersetup."Create System Users") then begin
                AllowAccessSettings := usersetup."Create System Users";
                exit
            end;
        Error(Nopermission);
    end;

    var
        AllowAccessSettings: boolean;
}