page 68099 "GEN--Calendar Small"
{
    // Created by Philippe Durand - Soudage Automatique - France
    // 
    // For any remark or suggestion, be welcome at : pdurand@soudage-automatique.fr
    // 
    // This tool was created on version 2.0 of Navision.
    // It is distributed as freeware.
    // It can be run alone or in association with any Date field.
    // 
    // Example for utilization (Date is supposed to be the date field) :
    // -> Local variables    Calendar : Form Calendar
    //                       D        : Date
    // 
    // Calendar.SetDate(Date);
    // Calendar.RUNMODAL;
    // D := Calendar.GetDate;
    // CLEAR(Calendar);
    // IF D <> 0D THEN
    //   Date := D;
    // 
    // Remarks :
    // Function SetDate is useful if you want to force the calendar to a predefined date.
    // If this date is empty or if the instruction is not used, the calendar starts with current Workdate().

    PageType = Card;

    layout
    {
        area(content)
        {
            field(Lbl_Week; Lbl_Week)
            {
                Editable = false;
                ApplicationArea = All;
            }
            field("DayOfWeek[1]"; DayOfWeek[1])
            {
                Editable = false;
                ApplicationArea = All;
            }
            field("DayOfWeek[2]"; DayOfWeek[2])
            {
                Editable = false;
                ApplicationArea = All;
            }
            field("DayOfWeek[3]"; DayOfWeek[3])
            {
                Editable = false;
                ApplicationArea = All;
            }
            field("DayOfWeek[4]"; DayOfWeek[4])
            {
                Editable = false;
                ApplicationArea = All;
            }
            field("Semaine[1]"; Semaine[1])
            {
                BlankNumbers = BlankNegAndZero;
                Editable = false;
                ToolTip = 'Week no.';
                ApplicationArea = All;
            }
            field(Btn1; Btns[1])
            {
                BlankNumbers = BlankNegAndZero;
                ApplicationArea = All;
            }
            field(Btn2; Btns[2])
            {
                BlankNumbers = BlankNegAndZero;
                ApplicationArea = All;
            }
            field(Btn3; Btns[3])
            {
                BlankNumbers = BlankNegAndZero;
                ApplicationArea = All;
            }
            field(Btn4; Btns[4])
            {
                BlankNumbers = BlankNegAndZero;
                ApplicationArea = All;
            }
            field("Semaine[2]"; Semaine[2])
            {
                BlankNumbers = BlankNegAndZero;
                Editable = false;
                ToolTip = 'Week no.';
                ApplicationArea = All;
            }
            field(Btn8; Btns[8])
            {
                ApplicationArea = All;
            }
            field(Btn9; Btns[9])
            {
                ApplicationArea = All;
            }
            field(Btn10; Btns[10])
            {
                ApplicationArea = All;
            }
            field(Btn11; Btns[11])
            {
                ApplicationArea = All;
            }
            field("Semaine[3]"; Semaine[3])
            {
                BlankNumbers = BlankNegAndZero;
                Editable = false;
                ToolTip = 'Week no.';
                ApplicationArea = All;
            }
            field(Btn15; Btns[15])
            {
                ApplicationArea = All;
            }
            field(Btn16; Btns[16])
            {
                ApplicationArea = All;
            }
            field(Btn17; Btns[17])
            {
                ApplicationArea = All;
            }
            field(Btn18; Btns[18])
            {
                ApplicationArea = All;
            }
            field("Semaine[4]"; Semaine[4])
            {
                BlankNumbers = BlankNegAndZero;
                Editable = false;
                ToolTip = 'Week no.';
                ApplicationArea = All;
            }
            field("Semaine[5]"; Semaine[5])
            {
                BlankNumbers = BlankNegAndZero;
                Editable = false;
                ToolTip = 'Week no.';
                ApplicationArea = All;
            }
            field("DayOfWeek[5]"; DayOfWeek[5])
            {
                Editable = false;
                ApplicationArea = All;
            }
            field("DayOfWeek[6]"; DayOfWeek[6])
            {
                Editable = false;
                ApplicationArea = All;
            }
            field("DayOfWeek[7]"; DayOfWeek[7])
            {
                Editable = false;
                ApplicationArea = All;
            }
            field(Btn5; Btns[5])
            {
                BlankNumbers = BlankNegAndZero;
                ApplicationArea = All;
            }
            field(Btn6; Btns[6])
            {
                BlankNumbers = BlankNegAndZero;
                ApplicationArea = All;
            }
            field(Btn7; Btns[7])
            {
                BlankNumbers = BlankNegAndZero;
                ApplicationArea = All;
            }
            field(Btn12; Btns[12])
            {
                ApplicationArea = All;
            }
            field(Btn13; Btns[13])
            {
                ApplicationArea = All;
            }
            field(Btn14; Btns[14])
            {
                ApplicationArea = All;
            }
            field(Btn19; Btns[19])
            {
                ApplicationArea = All;
            }
            field(Btn20; Btns[20])
            {
                ApplicationArea = All;
            }
            field(Btn22; Btns[22])
            {
                ApplicationArea = All;
            }
            field(Btn21; Btns[21])
            {
                ApplicationArea = All;
            }
            field(Btn23; Btns[23])
            {
                ApplicationArea = All;
            }
            field(Btn24; Btns[24])
            {
                ApplicationArea = All;
            }
            field(Btn25; Btns[25])
            {
                ApplicationArea = All;
            }
            field(Btn26; Btns[26])
            {
                ApplicationArea = All;
            }
            field(Btn27; Btns[27])
            {
                ApplicationArea = All;
            }
            field(Btn29; Btns[29])
            {
                BlankNumbers = BlankNegAndZero;
                ApplicationArea = All;
            }
            field(Btn28; Btns[28])
            {
                ApplicationArea = All;
            }
            field(Btn30; Btns[30])
            {
                BlankNumbers = BlankNegAndZero;
                ApplicationArea = All;
            }
            field(Btn31; Btns[31])
            {
                BlankNumbers = BlankNegAndZero;
                ApplicationArea = All;
            }
            field("Semaine[6]"; Semaine[6])
            {
                BlankNumbers = BlankNegAndZero;
                Editable = false;
                ToolTip = 'Week no.';
                ApplicationArea = All;
            }
            field(TestNextMonth; DayOfWeek[8])
            {
                Editable = false;
                ApplicationArea = All;
            }
            field(Btn36; Btns[36])
            {
                BlankNumbers = BlankNegAndZero;
                ApplicationArea = All;
            }
            field(Btn37; Btns[37])
            {
                BlankNumbers = BlankNegAndZero;
                ApplicationArea = All;
            }
            field(Btn38; Btns[38])
            {
                BlankNumbers = BlankNegAndZero;
                ApplicationArea = All;
            }
            field(MainDate; MainDate)
            {
                Editable = false;
                ApplicationArea = All;
            }
            field(Lbl_Month; Lbl_Month)
            {
                Editable = false;
                ApplicationArea = All;
            }
            field(Lbl_Year; Lbl_Year)
            {
                Editable = false;
                ApplicationArea = All;
            }
            field(Btn32; Btns[32])
            {
                BlankNumbers = BlankNegAndZero;
                ApplicationArea = All;
            }
            field(Btn33; Btns[33])
            {
                BlankNumbers = BlankNegAndZero;
                ApplicationArea = All;
            }
            field(Btn39; Btns[39])
            {
                BlankNumbers = BlankNegAndZero;
                ApplicationArea = All;
            }
            field(Btn40; Btns[40])
            {
                BlankNumbers = BlankNegAndZero;
                ApplicationArea = All;
            }
            field(Btn34; Btns[34])
            {
                BlankNumbers = BlankNegAndZero;
                ApplicationArea = All;
            }
            field(Btn35; Btns[35])
            {
                BlankNumbers = BlankNegAndZero;
                ApplicationArea = All;
            }
            field(Btn41; Btns[41])
            {
                BlankNumbers = BlankNegAndZero;
                ApplicationArea = All;
            }
            field(Btn42; Btns[42])
            {
                BlankNumbers = BlankNegAndZero;
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Action46)
            {
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    MainDate := CalcDate('-1' + LetterMonth, MainDate);
                    AffMonth(MainDate);
                end;
            }
            action(Action57)
            {
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    MainDate := CalcDate('-1' + LetterYear, MainDate);
                    AffMonth(MainDate);
                    CurrPage.Caption := Format(MainDate, 0, '<Month Text> <Year4>');
                end;
            }
            action(Action55)
            {
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    MainDate := CalcDate('+1' + LetterMonth, MainDate);
                    AffMonth(MainDate);
                end;
            }
            action(Action56)
            {
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    MainDate := CalcDate('+1' + LetterYear, MainDate);
                    AffMonth(MainDate);
                    CurrPage.Caption := Format(MainDate, 0, '<Month Text> <Year4>');
                end;
            }
            action(Btn_Today)
            {
                Caption = 'Today';
                Promoted = true;
                PromotedCategory = Process;
                ApplicationArea = All;

                trigger OnAction()
                begin
                    MainDate := WorkDate();
                    AffMonth(MainDate);
                end;
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        Btns1OnFormat;
        Btns2OnFormat;
        Btns3OnFormat;
        Btns4OnFormat;
        Btns5OnFormat;
        Btns6OnFormat;
        Btns7OnFormat;
        Btns8OnFormat;
        Btns9OnFormat;
        Btns10OnFormat;
        Btns11OnFormat;
        Btns12OnFormat;
        Btns13OnFormat;
        Btns14OnFormat;
        Btns15OnFormat;
        Btns16OnFormat;
        Btns17OnFormat;
        Btns18OnFormat;
        Btns19OnFormat;
        Btns20OnFormat;
        Btns21OnFormat;
        Btns22OnFormat;
        Btns23OnFormat;
        Btns24OnFormat;
        Btns25OnFormat;
        Btns26OnFormat;
        Btns27OnFormat;
        Btns28OnFormat;
        Btns29OnFormat;
        Btns30OnFormat;
        Btns31OnFormat;
        Btns32OnFormat;
        Btns33OnFormat;
        Btns34OnFormat;
        Btns35OnFormat;
        Btns36OnFormat;
        Btns37OnFormat;
    end;

    trigger OnInit()
    begin
        // Name of days (Column headers)
        Calendrier.Get(Calendrier."Period Type"::Date, 19900101D);
        for Ind := 1 to 7 do begin
            DayOfWeek[Ind] := CopyStr(Calendrier."Period Name", 1, 3);
            Calendrier.Next;
        end;

        // other captions
        Calendrier.Get(Calendrier."Period Type"::Week, 19900101D);
        Lbl_Week := Format(Calendrier."Period Type");
        LetterWeek := CopyStr(Lbl_Week, 1, 1);
        Calendrier.Get(Calendrier."Period Type"::Month, 19900101D);
        Lbl_Month := Format(Calendrier."Period Type");
        LetterMonth := CopyStr(Lbl_Month, 1, 1);
        Calendrier.Get(Calendrier."Period Type"::Year, 19900101D);
        Lbl_Year := Format(Calendrier."Period Type");
        LetterYear := CopyStr(Lbl_Year, 1, 1);
    end;

    trigger OnOpenPage()
    begin
        if MainDate = 0D then
            MainDate := WorkDate();
        AffMonth(MainDate);
        OnActivateForm;
    end;

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    begin
        if CloseAction in [ACTION::Cancel, ACTION::LookupCancel] then
            CancelOnPush;
        if CloseAction in [ACTION::OK, ACTION::LookupOK] then
            OKOnPush;
    end;

    var
        MainDate: Date;
        MemoMainDate: Date;
        Btns: array[42] of Integer;
        Semaine: array[6] of Integer;
        DayOfWeek: array[8] of Text[3];
        Ind: Integer;
        MemoInd: Integer;
        Calendrier: Record Date;
        Validation: Boolean;
        Work: Integer;
        DateWork: Date;
        Lbl_Week: Text[10];
        Lbl_Month: Text[10];
        Lbl_Year: Text[10];
        LetterWeek: Code[1];
        LetterMonth: Code[1];
        LetterYear: Code[1];

    procedure SetDate(Date: Date): Date
    begin
        MainDate := Date;
    end;

    procedure GetDate(): Date
    begin
        if Validation then
            exit(MainDate);
    end;

    procedure AffMonth(Dte: Date)
    var
        Ind0: Integer;
        FirstDayOfMonth: Date;
    begin
        // search for first day of current month
        FirstDayOfMonth := DMY2Date(1, Date2DMY(Dte, 2), Date2DMY(Dte, 3));

        // display calendar
        for Ind := 1 to 42 do begin
            Work := Date2DMY(FirstDayOfMonth + Ind - Date2DWY(FirstDayOfMonth, 1), 1);
            if ((Ind <= 7) and (Work > 20)) or ((Ind >= 21) and (Work < 15)) then
                Btns[Ind] := -Work
            else
                Btns[Ind] := Work;
            if Btns[Ind] = Date2DMY(Dte, 1) then
                MemoInd := Ind;
        end;

        // display week no.
        Work := Date2DWY(FirstDayOfMonth, 2);
        for Ind := 0 to 5 do
            Semaine[Ind + 1] := Work + Ind;

        case MemoInd of
            1:
                ;
            2:
                ;
            3:
                ;
            4:
                ;
            5:
                ;
            6:
                ;
            7:
                ;
            8:
                ;
            9:
                ;
            10:
                ;
            11:
                ;
            12:
                ;
            13:
                ;
            14:
                ;
            15:
                ;
            16:
                ;
            17:
                ;
            18:
                ;
            19:
                ;
            20:
                ;
            21:
                ;
            22:
                ;
            23:
                ;
            24:
                ;
            25:
                ;
            26:
                ;
            27:
                ;
            28:
                ;
            29:
                ;
            30:
                ;
            31:
                ;
            32:
                ;
            33:
                ;
            34:
                ;
            35:
                ;
            36:
                ;
            37:
                ;
            38:
                ;
            39:
                ;
            40:
                ;
            41:
                ;
            42:
                ;
        end;

        //CurrPage.CAPTION := FORMAT(Dte,0,'<Month Text> <Year4>');
        MemoMainDate := MainDate;
    end;

    procedure MajMainDate(Index: Integer)
    begin
        if Btns[Index] < 0 then begin
            if Date2DMY(MainDate, 2) <> Date2DMY(MemoMainDate, 2) then begin
                if Index < 15 then
                    DateWork := CalcDate('-1' + LetterMonth, MainDate)
                else
                    DateWork := CalcDate('+1' + LetterMonth, MainDate);
                MainDate := DMY2Date(-Btns[Index], Date2DMY(DateWork, 2), Date2DMY(DateWork, 3));
                AffMonth(MainDate);
            end;
        end
        else
            MainDate := DMY2Date(Btns[Index], Date2DMY(MainDate, 2), Date2DMY(MainDate, 3));

        MemoMainDate := MainDate;
        //CurrPage.UPDATE;
    end;

    procedure PreviousMonth()
    begin
        MainDate := CalcDate('-1' + LetterWeek, MainDate);
        AffMonth(MainDate);
        //CurrPage.UPDATE;
    end;

    procedure NextMonth()
    begin
        MainDate := CalcDate('+1' + LetterWeek, MainDate);
        AffMonth(MainDate);
        //CurrPage.UPDATE;
    end;

    procedure PreviousDay()
    begin
        MainDate := MainDate - 1;
        AffMonth(MainDate);
        //CurrPage.UPDATE;
    end;

    procedure NextDay()
    begin
        MainDate := MainDate + 1;
        AffMonth(MainDate);
        //CurrPage.UPDATE;
    end;

    procedure IsLastDayOfMonth(Dt: Date): Boolean
    begin
        if Date2DMY(Dt + 1, 2) <> Date2DMY(Dt, 2) then
            exit(true);
    end;

    procedure TestFirstBtns(Btn: Integer)
    var
        D: Date;
    begin
        if Btns[Btn] <= 0 then
            if Date2DMY(MainDate, 1) = 1 then
                PreviousDay
            else begin
                if Date2DMY(MainDate, 2) = 1 then
                    D := DMY2Date(Abs(Btns[Btn]), 12, Date2DMY(MainDate, 3) - 1)
                else
                    D := DMY2Date(Abs(Btns[Btn]), Date2DMY(MainDate, 2) - 1, Date2DMY(MainDate, 3));
                if MainDate = D + 7 then
                    PreviousMonth
                else begin
                    MainDate := D;
                    AffMonth(MainDate);
                    //CurrPage.UPDATE;
                end;
            end;
    end;

    procedure TestLastBtns(Btn: Integer)
    var
        D: Date;
    begin
        if Btns[Btn] <= 0 then
            if IsLastDayOfMonth(MainDate) then
                NextDay
            else begin
                if Date2DMY(MainDate, 2) = 12 then
                    D := DMY2Date(Abs(Btns[Btn]), 1, Date2DMY(MainDate, 3) + 1)
                else
                    D := DMY2Date(Abs(Btns[Btn]), Date2DMY(MainDate, 2) + 1, Date2DMY(MainDate, 3));
                if MainDate = D - 7 then
                    NextMonth
                else begin
                    MainDate := D;
                    AffMonth(MainDate);
                    //CurrPage.UPDATE;
                end;
            end;
    end;

    local procedure Btns1OnActivate()
    begin
        TestFirstBtns(1);
    end;

    local procedure Btns2OnActivate()
    begin
        TestFirstBtns(2);
    end;

    local procedure Btns3OnActivate()
    begin
        TestFirstBtns(3)
    end;

    local procedure Btns4OnActivate()
    begin
        TestFirstBtns(4);
    end;

    local procedure Btns5OnActivate()
    begin
        TestFirstBtns(5);
    end;

    local procedure Btns6OnActivate()
    begin
        TestFirstBtns(6);
    end;

    local procedure Btns29OnActivate()
    begin
        TestLastBtns(29)
    end;

    local procedure Btns30OnActivate()
    begin
        TestLastBtns(30)
    end;

    local procedure Btns31OnActivate()
    begin
        TestLastBtns(31)
    end;

    local procedure Btns32OnActivate()
    begin
        TestLastBtns(32)
    end;

    local procedure Btns33OnActivate()
    begin
        TestLastBtns(33)
    end;

    local procedure Btns34OnActivate()
    begin
        TestLastBtns(34)
    end;

    local procedure Btns35OnActivate()
    begin
        TestLastBtns(35)
    end;

    local procedure Btns36OnActivate()
    begin
        TestLastBtns(36)
    end;

    local procedure Btns37OnActivate()
    begin
        TestLastBtns(37)
    end;

    local procedure Btns38OnActivate()
    begin
        TestLastBtns(38)
    end;

    local procedure Btns39OnActivate()
    begin
        TestLastBtns(39)
    end;

    local procedure Btns40OnActivate()
    begin
        TestLastBtns(40)
    end;

    local procedure Btns41OnActivate()
    begin
        TestLastBtns(41)
    end;

    local procedure Btns42OnActivate()
    begin
        TestLastBtns(42)
    end;

    local procedure DayOfWeek7OnActivate()
    begin
        PreviousMonth;
    end;

    local procedure DayOfWeek8OnActivate()
    begin
        NextMonth;
    end;

    local procedure LblWeekOnActivate()
    begin
        PreviousMonth;
    end;

    local procedure OnActivateForm()
    begin
        //CurrPage.CAPTION := FORMAT(MainDate, 0, '<Month Text> <Year4>');
    end;

    local procedure Btns1OnBeforeInput()
    begin
        MajMainDate(1);
    end;

    local procedure Btns2OnBeforeInput()
    begin
        MajMainDate(2);
    end;

    local procedure Btns3OnBeforeInput()
    begin
        MajMainDate(3);
    end;

    local procedure Btns4OnBeforeInput()
    begin
        MajMainDate(4);
    end;

    local procedure Btns5OnBeforeInput()
    begin
        MajMainDate(5);
    end;

    local procedure Btns6OnBeforeInput()
    begin
        MajMainDate(6);
    end;

    local procedure Btns7OnBeforeInput()
    begin
        MajMainDate(7);
    end;

    local procedure Btns8OnBeforeInput()
    begin
        MajMainDate(8);
    end;

    local procedure Btns9OnBeforeInput()
    begin
        MajMainDate(9);
    end;

    local procedure Btns10OnBeforeInput()
    begin
        MajMainDate(10);
    end;

    local procedure Btns11OnBeforeInput()
    begin
        MajMainDate(11);
    end;

    local procedure Btns12OnBeforeInput()
    begin
        MajMainDate(12);
    end;

    local procedure Btns13OnBeforeInput()
    begin
        MajMainDate(13);
    end;

    local procedure Btns14OnBeforeInput()
    begin
        MajMainDate(14);
    end;

    local procedure Btns15OnBeforeInput()
    begin
        MajMainDate(15);
    end;

    local procedure Btns16OnBeforeInput()
    begin
        MajMainDate(16);
    end;

    local procedure Btns17OnBeforeInput()
    begin
        MajMainDate(17);
    end;

    local procedure Btns18OnBeforeInput()
    begin
        MajMainDate(18);
    end;

    local procedure Btns19OnBeforeInput()
    begin
        MajMainDate(19);
    end;

    local procedure Btns20OnBeforeInput()
    begin
        MajMainDate(20);
    end;

    local procedure Btns21OnBeforeInput()
    begin
        MajMainDate(21);
    end;

    local procedure Btns22OnBeforeInput()
    begin
        MajMainDate(22);
    end;

    local procedure Btns23OnBeforeInput()
    begin
        MajMainDate(23);
    end;

    local procedure Btns24OnBeforeInput()
    begin
        MajMainDate(24);
    end;

    local procedure Btns25OnBeforeInput()
    begin
        MajMainDate(25);
    end;

    local procedure Btns26OnBeforeInput()
    begin
        MajMainDate(26);
    end;

    local procedure Btns27OnBeforeInput()
    begin
        MajMainDate(27);
    end;

    local procedure Btns28OnBeforeInput()
    begin
        MajMainDate(28);
    end;

    local procedure Btns29OnBeforeInput()
    begin
        MajMainDate(29);
    end;

    local procedure Btns30OnBeforeInput()
    begin
        MajMainDate(30);
    end;

    local procedure Btns31OnBeforeInput()
    begin
        MajMainDate(31);
    end;

    local procedure Btns32OnBeforeInput()
    begin
        MajMainDate(32);
    end;

    local procedure Btns33OnBeforeInput()
    begin
        MajMainDate(33);
    end;

    local procedure Btns34OnBeforeInput()
    begin
        MajMainDate(34);
    end;

    local procedure Btns35OnBeforeInput()
    begin
        MajMainDate(35);
    end;

    local procedure Btns36OnBeforeInput()
    begin
        MajMainDate(36);
    end;

    local procedure Btns37OnBeforeInput()
    begin
        MajMainDate(37);
    end;

    local procedure Btns38OnBeforeInput()
    begin
        MajMainDate(38);
    end;

    local procedure Btns39OnBeforeInput()
    begin
        MajMainDate(39);
    end;

    local procedure Btns40OnBeforeInput()
    begin
        MajMainDate(40);
    end;

    local procedure Btns41OnBeforeInput()
    begin
        MajMainDate(41);
    end;

    local procedure Btns42OnBeforeInput()
    begin
        MajMainDate(42);
    end;

    local procedure Semaine1OnBeforeInput()
    begin
        MajMainDate(42);
    end;

    local procedure Semaine2OnBeforeInput()
    begin
        MajMainDate(42);
    end;

    local procedure Semaine3OnBeforeInput()
    begin
        MajMainDate(42);
    end;

    local procedure Semaine4OnBeforeInput()
    begin
        MajMainDate(42);
    end;

    local procedure Semaine5OnBeforeInput()
    begin
        MajMainDate(42);
    end;

    local procedure Semaine6OnBeforeInput()
    begin
        MajMainDate(42);
    end;

    local procedure OKOnPush()
    begin
        Validation := true;
    end;

    local procedure CancelOnPush()
    begin
        MainDate := 0D;
    end;

    local procedure Btns1OnFormat()
    begin
        ////CurrPage.Btn1.UPDATESELECTED(Btns[1] = DATE2DMY(MainDate, 1));
    end;

    local procedure Btns2OnFormat()
    begin
        ////CurrPage.Btn2.UPDATESELECTED(Btns[2] = DATE2DMY(MainDate, 1));
    end;

    local procedure Btns3OnFormat()
    begin
        //CurrPage.Btn3.UPDATESELECTED(Btns[3] = DATE2DMY(MainDate, 1));
    end;

    local procedure Btns4OnFormat()
    begin
        //CurrPage.Btn4.UPDATESELECTED(Btns[4] = DATE2DMY(MainDate, 1));
    end;

    local procedure Btns5OnFormat()
    begin
        //CurrPage.Btn5.UPDATESELECTED(Btns[5] = DATE2DMY(MainDate, 1));
    end;

    local procedure Btns6OnFormat()
    begin
        //CurrPage.Btn6.UPDATESELECTED(Btns[6] = DATE2DMY(MainDate, 1));
    end;

    local procedure Btns7OnFormat()
    begin
        //CurrPage.Btn7.UPDATESELECTED(Btns[7] = DATE2DMY(MainDate, 1));
    end;

    local procedure Btns8OnFormat()
    begin
        //CurrPage.Btn8.UPDATESELECTED(Btns[8] = DATE2DMY(MainDate, 1));
    end;

    local procedure Btns9OnFormat()
    begin
        //CurrPage.Btn9.UPDATESELECTED(Btns[9] = DATE2DMY(MainDate, 1));
    end;

    local procedure Btns10OnFormat()
    begin
        //CurrPage.Btn10.UPDATESELECTED(Btns[10] = DATE2DMY(MainDate, 1));
    end;

    local procedure Btns11OnFormat()
    begin
        //CurrPage.Btn11.UPDATESELECTED(Btns[11] = DATE2DMY(MainDate, 1));
    end;

    local procedure Btns12OnFormat()
    begin
        //CurrPage.Btn12.UPDATESELECTED(Btns[12] = DATE2DMY(MainDate, 1));
    end;

    local procedure Btns13OnFormat()
    begin
        //CurrPage.Btn13.UPDATESELECTED(Btns[13] = DATE2DMY(MainDate, 1));
    end;

    local procedure Btns14OnFormat()
    begin
        //CurrPage.Btn14.UPDATESELECTED(Btns[14] = DATE2DMY(MainDate, 1));
    end;

    local procedure Btns15OnFormat()
    begin
        //CurrPage.Btn15.UPDATESELECTED(Btns[15] = DATE2DMY(MainDate, 1));
    end;

    local procedure Btns16OnFormat()
    begin
        //CurrPage.Btn16.UPDATESELECTED(Btns[16] = DATE2DMY(MainDate, 1));
    end;

    local procedure Btns17OnFormat()
    begin
        //CurrPage.Btn17.UPDATESELECTED(Btns[17] = DATE2DMY(MainDate, 1));
    end;

    local procedure Btns18OnFormat()
    begin
        //CurrPage.Btn18.UPDATESELECTED(Btns[18] = DATE2DMY(MainDate, 1));
    end;

    local procedure Btns19OnFormat()
    begin
        //CurrPage.Btn19.UPDATESELECTED(Btns[19] = DATE2DMY(MainDate, 1));
    end;

    local procedure Btns20OnFormat()
    begin
        //CurrPage.Btn20.UPDATESELECTED(Btns[20] = DATE2DMY(MainDate, 1));
    end;

    local procedure Btns21OnFormat()
    begin
        //CurrPage.Btn21.UPDATESELECTED(Btns[21] = DATE2DMY(MainDate, 1));
    end;

    local procedure Btns22OnFormat()
    begin
        //CurrPage.Btn22.UPDATESELECTED(Btns[22] = DATE2DMY(MainDate, 1));
    end;

    local procedure Btns23OnFormat()
    begin
        //CurrPage.Btn23.UPDATESELECTED(Btns[23] = DATE2DMY(MainDate, 1));
    end;

    local procedure Btns24OnFormat()
    begin
        //CurrPage.Btn24.UPDATESELECTED(Btns[24] = DATE2DMY(MainDate, 1));
    end;

    local procedure Btns25OnFormat()
    begin
        //CurrPage.Btn25.UPDATESELECTED(Btns[25] = DATE2DMY(MainDate, 1));
    end;

    local procedure Btns26OnFormat()
    begin
        //CurrPage.Btn26.UPDATESELECTED(Btns[26] = DATE2DMY(MainDate, 1));
    end;

    local procedure Btns27OnFormat()
    begin
        //CurrPage.Btn27.UPDATESELECTED(Btns[27] = DATE2DMY(MainDate, 1));
    end;

    local procedure Btns28OnFormat()
    begin
        //CurrPage.Btn28.UPDATESELECTED(Btns[28] = DATE2DMY(MainDate, 1));
    end;

    local procedure Btns29OnFormat()
    begin
        //CurrPage.Btn29.UPDATESELECTED(Btns[29] = DATE2DMY(MainDate, 1));
    end;

    local procedure Btns30OnFormat()
    begin
        //CurrPage.Btn30.UPDATESELECTED(Btns[30] = DATE2DMY(MainDate, 1));
    end;

    local procedure Btns31OnFormat()
    begin
        //CurrPage.Btn31.UPDATESELECTED(Btns[31] = DATE2DMY(MainDate, 1));
    end;

    local procedure Btns32OnFormat()
    begin
        //CurrPage.Btn32.UPDATESELECTED(Btns[32] = DATE2DMY(MainDate, 1));
    end;

    local procedure Btns33OnFormat()
    begin
        //CurrPage.Btn33.UPDATESELECTED(Btns[33] = DATE2DMY(MainDate, 1));
    end;

    local procedure Btns34OnFormat()
    begin
        //CurrPage.Btn34.UPDATESELECTED(Btns[34] = DATE2DMY(MainDate, 1));
    end;

    local procedure Btns35OnFormat()
    begin
        //CurrPage.Btn35.UPDATESELECTED(Btns[35] = DATE2DMY(MainDate, 1));
    end;

    local procedure Btns36OnFormat()
    begin
        //CurrPage.Btn36.UPDATESELECTED(Btns[36] = DATE2DMY(MainDate, 1));
    end;

    local procedure Btns37OnFormat()
    begin
        //CurrPage.Btn37.UPDATESELECTED(Btns[37] = DATE2DMY(MainDate, 1));
    end;
}

