PROGRAM Calender;

const
  max = 10;
  zero = 0;
  endH = 23;
  endM = 59;

Type 
  Time = RECORD
    hour: zero..endH;
    minute: zero..endM;
  END; 

  Appointement  = RECORD
    title: String;
    startTime: Time;
    endTime: Time;
  END; 

  calenderArr = ARRAY [1..max] OF Appointement;

FUNCTION Duration(p: Appointement): integer;

BEGIN (* Duration *)
  Duration := (p.endTime.hour - p.startTime.hour) * 60 + (p.endTime.minute - p.startTime.minute);
END; (* Duration *)


FUNCTION Totalduration(arr : calenderArr; n: integer): integer;

VAR
  i, sumMin: integer;

BEGIN (* Totalduration *)
  sumMin := 0;

  FOR i := 1 TO n DO BEGIN
    sumMin := sumMin + Duration(arr[i]);
  END; (* FOR *)

  Totalduration := sumMin;
  
END; (* Totalduration *)

FUNCTION createTime(hour, minute: integer ): Time;

VAR
  t: Time;

BEGIN (* createTime *)
  t.hour := hour;
  t.minute := minute;
  createTime := t;
  
END; (* createTime *)

FUNCTION createAppointment(title: String; startHour, startMinute, endHour, endMinute: integer): Appointement;
VAR
  p: Appointement;

BEGIN (* createAppointment *)
  p.title := title;
  p.endTime := createTime(endMinute, endHour);
  p.startTime := createTime(startHour, startMinute);
  createAppointment := p;

END; (* createAppointment *)

VAR
  arr: calenderArr;

BEGIN
  arr[1] := createAppointment('ADE', 13, 00, 16, 15);
  arr[2] := createAppointment('ADE', 13, 00, 16, 15);

  WriteLn('Total duration: ', Totalduration(arr, 2));
END.