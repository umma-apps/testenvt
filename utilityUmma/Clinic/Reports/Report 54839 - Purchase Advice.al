// report  54839 "Purchase Advice"
// {
//     DefaultLayout = RDLC;
//     RDLCLayout = './Clinic/Report/SSR/Purchase Advice.rdl';
//     Caption = 'Purchase Advice';

//     dataset
//     {
//         dataitem(Item;Item)
//         {
//             DataItemTableView = WHERE("Replenishment System"=CONST(Purchase));
//             RequestFilterFields = "No.","Search Description","Inventory Posting Group","Location Filter","Vendor No.";
//             column(FORMAT_TODAY_0_4_;Format(Today,0,4))
//             {
//             }
//             column(TIME;Time)
//             {
//             }
//             column(CompanyInformation_Name;CompanyInformation.Name)
//             {
//             }
//             column(CurrReport_PAGENO;CurrReport.PageNo)
//             {
//             }
//             column(USERID;UserId)
//             {
//             }
//             column(STRSUBSTNO_Text000_BeginDate_EndDate_;StrSubstNo(Text000,BeginDate,EndDate))
//             {
//             }
//             column(Item_TABLECAPTION__________ItemFilter;Item.TableCaption + ': ' + ItemFilter)
//             {
//             }
//             column(myItemFilter;ItemFilter)
//             {
//             }
//             column(GroupHeading;GroupHeading)
//             {
//             }
//             column(myGroupItem;GroupItem)
//             {
//             }
//             column(Item__No__;"No.")
//             {
//             }
//             column(Item_Description;Description)
//             {
//             }
//             column(Item_Inventory;Inventory)
//             {
//                 DecimalPlaces = 2:5;
//             }
//             column(Item__Qty__on_Sales_Order_;"Qty. on Sales Order")
//             {
//                 DecimalPlaces = 2:5;
//             }
//             column(BackOrderQuantity;BackOrderQuantity)
//             {
//                 DecimalPlaces = 2:5;
//             }
//             column(Item__Qty__on_Purch__Order_;"Qty. on Purch. Order")
//             {
//                 DecimalPlaces = 2:5;
//             }
//             column(QtyAvailable;QtyAvailable)
//             {
//                 DecimalPlaces = 2:5;
//             }
//             column(Item__Reorder_Point_;"Reorder Point")
//             {
//                 DecimalPlaces = 2:5;
//             }
//             column(Item__Reorder_Quantity_;"Reorder Quantity")
//             {
//                 DecimalPlaces = 2:5;
//             }
//             column(Item__Maximum_Inventory_;"Maximum Inventory")
//             {
//                 DecimalPlaces = 2:5;
//             }
//             column(FIELDCAPTION__Lead_Time_Calculation____________FORMAT__Lead_Time_Calculation__;FieldCaption("Lead Time Calculation") + ': ' + Format("Lead Time Calculation"))
//             {
//             }
//             column(AverageDailyUsage;AverageDailyUsage)
//             {
//                 DecimalPlaces = 2:5;
//             }
//             column(ReorderAmount1;ReorderAmount1)
//             {
//                 DecimalPlaces = 2:5;
//             }
//             column(ReorderAmount2;ReorderAmount2)
//             {
//                 DecimalPlaces = 2:5;
//             }
//             column(myStockkeeping;Item."Stockkeeping Unit Exists")
//             {
//             }
//             column(myUseSKU;UseSKU)
//             {
//             }
//             column(Item_Inventory_Posting_Group;"Inventory Posting Group")
//             {
//             }
//             column(Item_Vendor_No_;"Vendor No.")
//             {
//             }
//             column(Item_Variant_Filter;"Variant Filter")
//             {
//             }
//             column(Item_Location_Filter;"Location Filter")
//             {
//             }
//             column(Item_Date_Filter;"Date Filter")
//             {
//             }
//             column(Purchase_AdviceCaption;Purchase_AdviceCaptionLbl)
//             {
//             }
//             column(CurrReport_PAGENOCaption;CurrReport_PAGENOCaptionLbl)
//             {
//             }
//             column(Item_InventoryCaption;FieldCaption(Inventory))
//             {
//             }
//             column(Item__Qty__on_Sales_Order_Caption;FieldCaption("Qty. on Sales Order"))
//             {
//             }
//             column(BackOrderQuantityCaption;BackOrderQuantityCaptionLbl)
//             {
//             }
//             column(Item__Qty__on_Purch__Order_Caption;FieldCaption("Qty. on Purch. Order"))
//             {
//             }
//             column(QtyAvailableCaption;QtyAvailableCaptionLbl)
//             {
//             }
//             column(Item__Reorder_Point_Caption;FieldCaption("Reorder Point"))
//             {
//             }
//             column(Item__Reorder_Quantity_Caption;FieldCaption("Reorder Quantity"))
//             {
//             }
//             column(Item__Maximum_Inventory_Caption;FieldCaption("Maximum Inventory"))
//             {
//             }
//             column(AverageDailyUsageCaption;AverageDailyUsageCaptionLbl)
//             {
//             }
//             column(ReorderAmount1Caption;ReorderAmount1CaptionLbl)
//             {
//             }
//             column(ReorderAmount2Caption;ReorderAmount2CaptionLbl)
//             {
//             }
//             /* column(DataItem47;Reorder_Amount_2_is_the_quantity_you_should_order_if_you_want_to_take_into_account_the_Average_Daily_Use_and_Lead_Time_CaptioLbl)
//             {
//             } */
//             column(Reorder_Amount_1_is_the_quantity_you_should_order_if_you_do_not_want_to_take_those_factors_into_account_Caption;Reorder_Amount_1_is_the_quantity_you_should_order_if_you_do_not_want_to_take_those_factors_into_account_CaptionLbl)
//             {
//             }
//             dataitem("Stockkeeping Unit";"Stockkeeping Unit")
//             {
//                 DataItemLink = "Item No."=FIELD("No."),"Variant Code"=FIELD("Variant Filter"),"Location Code"=FIELD("Location Filter"),"Date Filter"=FIELD("Date Filter");
//                 DataItemTableView = SORTING("Item No.","Location Code","Variant Code") WHERE("Replenishment System"=CONST(Purchase));
//                 column(ReorderAmount2_Control1480000;ReorderAmount2)
//                 {
//                     DecimalPlaces = 2:5;
//                 }
//                 column(FIELDCAPTION__Lead_Time_Calculation____________FORMAT__Lead_Time_Calculation___Control1480001;FieldCaption("Lead Time Calculation") + ': ' + Format("Lead Time Calculation"))
//                 {
//                 }
//                 column(ReorderAmount1_Control1480002;ReorderAmount1)
//                 {
//                     DecimalPlaces = 2:5;
//                 }
//                 column(AverageDailyUsage_Control1480003;AverageDailyUsage)
//                 {
//                     DecimalPlaces = 2:5;
//                 }
//                 column(Stockkeeping_Unit__Maximum_Inventory_;"Maximum Inventory")
//                 {
//                     DecimalPlaces = 2:5;
//                 }
//                 column(Stockkeeping_Unit__Reorder_Quantity_;"Reorder Quantity")
//                 {
//                     DecimalPlaces = 2:5;
//                 }
//                 column(Stockkeeping_Unit__Reorder_Point_;"Reorder Point")
//                 {
//                     DecimalPlaces = 2:5;
//                 }
//                 column(QtyAvailable_Control1480007;QtyAvailable)
//                 {
//                     DecimalPlaces = 2:5;
//                 }
//                 column(Stockkeeping_Unit__Qty__on_Purch__Order_;"Qty. on Purch. Order")
//                 {
//                     DecimalPlaces = 2:5;
//                 }
//                 column(Stockkeeping_Unit_Description;Description)
//                 {
//                 }
//                 column(BackOrderQuantity_Control1480010;BackOrderQuantity)
//                 {
//                     DecimalPlaces = 2:5;
//                 }
//                 column(Stockkeeping_Unit__Qty__on_Sales_Order_;"Qty. on Sales Order")
//                 {
//                     DecimalPlaces = 2:5;
//                 }
//                 column(Stockkeeping_Unit__Item_No__;"Item No.")
//                 {
//                 }
//                 column(Stockkeeping_Unit_Inventory;Inventory)
//                 {
//                     DecimalPlaces = 2:5;
//                 }
//                 column(Stockkeeping_Unit__Location_Code_;"Location Code")
//                 {
//                 }
//                 column(Stockkeeping_Unit__Variant_Code_;"Variant Code")
//                 {
//                 }
//                 column(Stockkeeping_Unit_Date_Filter;"Date Filter")
//                 {
//                 }
//                 column(Stockkeeping_Unit__Location_Code_Caption;FieldCaption("Location Code"))
//                 {
//                 }
//                 column(Stockkeeping_Unit__Variant_Code_Caption;FieldCaption("Variant Code"))
//                 {
//                 }

//                 trigger OnAfterGetRecord()
//                 begin
//                     Item2 := Item;
//                     Item2.Reset;
//                     if "Location Code" <> '' then
//                       Item2.SetRange("Location Filter","Location Code");
//                     if "Variant Code" <> '' then
//                       Item2.SetRange("Variant Filter","Variant Code");
//                     Item2.SetRange("Date Filter",0D,WorkDate);
//                     CalcFields("Qty. on Purch. Order");
//                     Item2.CalcFields("Sales (Qty.)","Negative Adjmt. (Qty.)","Consumptions (Qty.)");

//                     // Calculate the lead time in days
//                     ReceiptDate := CalcDate("Lead Time Calculation",WorkDate);
//                     LeadTimeDays := ReceiptDate - WorkDate;

//                     // Calculate the average daily usage of the product
//                     // for the period the user specifies.
//                     Item2.SetRange("Date Filter",BeginDate,EndDate);
//                     DaysUsed := EndDate - BeginDate;
//                     if DaysUsed <> 0 then begin
//                       Item2.CalcFields("Sales (Qty.)","Negative Adjmt. (Qty.)","Consumptions (Qty.)");
//                       AverageDailyUsage := (Item2."Sales (Qty.)" + Item2."Negative Adjmt. (Qty.)" + Item2."Consumptions (Qty.)") / DaysUsed;
//                     end else
//                       AverageDailyUsage := 0;
//                     Item2.SetRange("Date Filter");
//                     CalcFields(Inventory,"Qty. on Sales Order","Qty. on Purch. Order",
//                       "Qty. on Service Order","Scheduled Need (Qty.)",Description);
//                     if (Inventory - "Qty. on Sales Order") > 0 then
//                       BackOrderQuantity := 0
//                     else
//                       BackOrderQuantity := Abs(Inventory - "Qty. on Sales Order");
//                     QtyAvailable := Inventory - "Qty. on Sales Order" + "Qty. on Purch. Order" -
//                       "Scheduled Need (Qty.)" - "Qty. on Service Order";
//                     ReorderAmount1 := CalculateReorderSKU(QtyAvailable);

//                     // Calculate the expected daily usage of the product during the lead time so
//                     // we can know approximately how much we can be expected to sell while we
//                     // wait to receive the purchase - will be considered in reorder2 amount
//                     ExpectedDailyUsage := AverageDailyUsage * LeadTimeDays;
//                     ReorderAmount2 := CalculateReorderSKU(QtyAvailable - ExpectedDailyUsage);
//                     if not IncludeZeroOrders and
//                        (ReorderAmount1 = 0) and
//                        (ReorderAmount2 = 0)
//                     then
//                       CurrReport.Skip;
//                 end;

//                 trigger OnPreDataItem()
//                 begin
//                     if not UseSKU then
//                       CurrReport.Break;
//                 end;
//             }

//             trigger OnAfterGetRecord()
//             begin
//                 CalcFields("Stockkeeping Unit Exists");
//                 if not UseSKU or not "Stockkeeping Unit Exists" then begin
//                   SetRange("Date Filter",0D,WorkDate);
//                   CalcFields("Qty. on Purch. Order","Sales (Qty.)","Negative Adjmt. (Qty.)","Consumptions (Qty.)");

//                   // Calculate the lead time in days
//                   ReceiptDate := CalcDate("Lead Time Calculation",WorkDate);
//                   LeadTimeDays := ReceiptDate - WorkDate;

//                   // Calculate the average daily usage of the product
//                   // for the period the user specifies.
//                   SetRange("Date Filter",BeginDate,EndDate);
//                   DaysUsed := EndDate - BeginDate;
//                   if DaysUsed <> 0 then begin
//                     CalcFields("Sales (Qty.)","Negative Adjmt. (Qty.)","Consumptions (Qty.)");
//                     AverageDailyUsage := ("Sales (Qty.)" + "Negative Adjmt. (Qty.)" + "Consumptions (Qty.)") / DaysUsed;
//                   end else
//                     AverageDailyUsage := 0;
//                   SetRange("Date Filter");
//                   CalcFields(Inventory,"Qty. on Sales Order","Qty. on Purch. Order",
//                     "Qty. on Service Order","Scheduled Need (Qty.)");
//                   if (Inventory - "Qty. on Sales Order") > 0 then
//                     BackOrderQuantity := 0
//                   else
//                     BackOrderQuantity := Abs(Inventory - "Qty. on Sales Order");
//                   QtyAvailable := Inventory - "Qty. on Sales Order" + "Qty. on Purch. Order" -
//                     "Scheduled Need (Qty.)" - "Qty. on Service Order";
//                   ReorderAmount1 := CalculateReorder(QtyAvailable);

//                   // Calculate the expected daily usage of the product during the lead time so
//                   // we can know approximately how much we can be expected to sell while we
//                   // wait to receive the purchase - will be considered in reorder2 amount
//                   ExpectedDailyUsage := AverageDailyUsage * LeadTimeDays;
//                   ReorderAmount2 := CalculateReorder(QtyAvailable - ExpectedDailyUsage);
//                   if not IncludeZeroOrders and
//                      (ReorderAmount1 = 0) and
//                      (ReorderAmount2 = 0)
//                   then
//                     CurrReport.Skip;
//                 end;

//                 GroupHeading := '';
//                 if StrPos(CurrentKey,'Inventory Posting Group') <> 0 then begin
//                   GroupHeading := FieldCaption("Inventory Posting Group") + ': ' + "Inventory Posting Group";
//                   GroupItem := 1;
//                 end;
//                 if StrPos(CurrentKey,'Vendor No.') <> 0 then begin
//                   GroupHeading := FieldCaption("Vendor No.") + ': ' + "Vendor No.";
//                   if Vendor.Get("Vendor No.") then
//                     GroupHeading := GroupHeading + '  ' + Vendor.Name;
//                   GroupItem := 2;
//                 end
//             end;
//         }
//     }

//     requestpage
//     {
//         SaveValues = true;

//         layout
//         {
//             area(content)
//             {
//                 group(Options)
//                 {
//                     Caption = 'Options';
//                     group("Average Usage")
//                     {
//                         Caption = 'Average Usage';
//                         field(BeginDate;BeginDate)
//                         {
//                             ApplicationArea = Basic,Suite;
//                             Caption = 'Beginning Date';
//                             ToolTip = 'Specifies the start date for the report.';
//                         }
//                         field(EndDate;EndDate)
//                         {
//                             ApplicationArea = Basic,Suite;
//                             Caption = 'Ending Date';
//                             ToolTip = 'Specifies the date to which the report or batch job processes information.';
//                         }
//                     }
//                     field(IncludeZeroOrders;IncludeZeroOrders)
//                     {
//                         ApplicationArea = Basic,Suite;
//                         Caption = 'Include Items with Zero Reorder Quantities';
//                         MultiLine = true;
//                         ToolTip = 'Specifies if you want to include items that do not need to be ordered.';
//                     }
//                     field(UseSKU;UseSKU)
//                     {
//                         Caption = 'Use Stockkeeping Unit';
//                     }
//                 }
//             }
//         }

//         actions
//         {
//         }

//         trigger OnClosePage()
//         begin
//             if BeginDate <> 0D then
//               if EndDate = 0D then
//                 EndDate := WorkDate;
//         end;
//     }

//     labels
//     {
//     }

//     trigger OnPreReport()
//     begin
//         CompanyInformation.Get;

//         // Calculate the average daily usage of the product over the past 3 months or
//         // for the period the user specifies.
//         if BeginDate = 0D then begin
//           EndDate := WorkDate;
//           BeginDate := CalcDate('<-3M>',EndDate);
//         end;
//         ItemFilter := Item.GetFilters;
//     end;

//     var
//         CompanyInformation: Record "Company Information";
//         Vendor: Record Vendor;
//         Item2: Record Item;
//         ItemFilter: Text;
//         GroupHeading: Text[80];
//         LeadTimeDays: Integer;
//         ExpectedDailyUsage: Decimal;
//         DaysUsed: Decimal;
//         BackOrderQuantity: Decimal;
//         QtyAvailable: Decimal;
//         AverageDailyUsage: Decimal;
//         ReorderAmount1: Decimal;
//         ReorderAmount2: Decimal;
//         BeginDate: Date;
//         EndDate: Date;
//         IncludeZeroOrders: Boolean;
//         ReceiptDate: Date;
//         Text000: Label 'Average Daily Use is calculated based on usage from %1 through %2.';
//         UseSKU: Boolean;
//         GroupItem: Integer;
//         Purchase_AdviceCaptionLbl: Label 'Purchase Advice';
//         CurrReport_PAGENOCaptionLbl: Label 'Page';
//         BackOrderQuantityCaptionLbl: Label 'Back Order Quantity';
//         QtyAvailableCaptionLbl: Label 'Quantity Available';
//         AverageDailyUsageCaptionLbl: Label 'Average Daily Usage';
//         ReorderAmount1CaptionLbl: Label 'Reorder Amount 1';
//         ReorderAmount2CaptionLbl: Label 'Reorder Amount 2';
//         //Reorder_Amount_2_is_the_quantity_you_should_order_if_you_want_to_take_into_account_the_Average_Daily_Use_and_Lead_Time_CaptioLbl: Label 'Reorder Amount 2 is the quantity you should order if you want to take into account the Average Daily Use and Lead Time.';
//         Reorder_Amount_1_is_the_quantity_you_should_order_if_you_do_not_want_to_take_those_factors_into_account_CaptionLbl: Label 'Reorder Amount 1 is the quantity you should order if you do not want to take those factors into account.';

//     procedure CalculateReorder(QtyExpected: Decimal): Decimal
//     begin
//         // Calculates the quantity that should be ordered based
//         // on the quantity that you expect the inventory to be.
//         if QtyExpected >= Item."Reorder Point" then
//           exit(0);
//         if Item."Maximum Inventory" <= 0 then begin
//           if Item."Reorder Quantity" > 0 then
//             exit(Round((Item."Reorder Point" - QtyExpected) / Item."Reorder Quantity",1,'>')
//               * Item."Reorder Quantity");

//           exit(Item."Reorder Point" - QtyExpected);
//         end;

//         if (Item."Reorder Point" > Item."Maximum Inventory") or
//            ((QtyExpected + Item."Reorder Quantity") > Item."Maximum Inventory")
//         then
//           exit(0);

//         if Item."Reorder Quantity" > 0 then
//           exit(Round((Item."Maximum Inventory" - QtyExpected) / Item."Reorder Quantity",1,'<')
//             * Item."Reorder Quantity");

//         exit(Item."Maximum Inventory" - QtyExpected);
//     end;

//     procedure CalculateReorderSKU(QtyExpected: Decimal): Decimal
//     begin
//         // Calculates the quantity that should be ordered based
//         // on the quantity that you expect the inventory to be.
//         if QtyExpected >= "Stockkeeping Unit"."Reorder Point" then
//           exit(0);
//         if "Stockkeeping Unit"."Maximum Inventory" <= 0 then begin
//           if "Stockkeeping Unit"."Reorder Quantity" > 0 then
//             exit(Round(("Stockkeeping Unit"."Reorder Point" - QtyExpected) / "Stockkeeping Unit"."Reorder Quantity",1,'>')
//               * "Stockkeeping Unit"."Reorder Quantity");

//           exit("Stockkeeping Unit"."Reorder Point" - QtyExpected);
//         end;

//         if ("Stockkeeping Unit"."Reorder Point" > "Stockkeeping Unit"."Maximum Inventory") or
//            ((QtyExpected + "Stockkeeping Unit"."Reorder Quantity") > "Stockkeeping Unit"."Maximum Inventory")
//         then
//           exit(0);

//         if "Stockkeeping Unit"."Reorder Quantity" > 0 then
//           exit(Round(("Stockkeeping Unit"."Maximum Inventory" - QtyExpected) / "Stockkeeping Unit"."Reorder Quantity",1,'<')
//             * "Stockkeeping Unit"."Reorder Quantity");

//         exit("Stockkeeping Unit"."Maximum Inventory" - QtyExpected);
//     end;
// }

