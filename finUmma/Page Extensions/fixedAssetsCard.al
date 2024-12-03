// pageextension 52178707 "Fixed Asset Card EXT" extends "Fixed Asset Card";
// layout
//     {
        
//         addafter(Rooms)
//         {
//             field("Is Controlled"; Rec."Is Controlled")
//             {
//                 ApplicationArea = All;
//             }
//         }
//         addbefore("Standard Cost")
//         {
//             field("Item G/L Budget Account"; Rec."Item G/L Budget Account")
//             {
//                 ApplicationArea = all;
//             }
//         }
//     }

//     actions
//     {
//         addafter()
//         {
//             action("Import Unit of Measure")
//             {
//                 ApplicationArea = Basic, Suite;
//                 Caption = 'Unit of Measure';
//                 Image = Journal;
//                 RunObject = xmlport "Item Unit of measure";
//                 ToolTip = 'Item Unit of Measure';
//             }
//         }
//     }
// }