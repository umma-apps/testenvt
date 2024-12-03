// pageextension 52178557 "User Personalization" extends "User Personalization List"
// {
//     layout
//     {

//     }

//     trigger OnOpenPage()
//     var
//         usersetup: Record "User Setup";
//         Nopermission: Label 'You have insufficient Rights to access the setup';
//     begin
//         AllowAccessSettings := true;
//         if usersetup.get(UserId) then
//             if (usersetup."Can Personalize profile") then begin
//                 AllowAccessSettings := usersetup."Can Personalize profile";
//                 exit
//             end;
//         Error(Nopermission);
//     end;

//     var
//         AllowAccessSettings: boolean;
// }