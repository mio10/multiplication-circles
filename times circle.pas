uses
     GraphABC;

const
     RADIUS = 200;
     NUM_POINTS = 100;
var
     points: array[0..NUM_POINTS-1] of Point;

procedure setPoints();
begin
     var angle := 0.0;
     for var i := 0 to NUM_POINTS-1 do
     begin
          points[i].X := trunc(RADIUS * cos(angle));
          points[i].Y := trunc(RADIUS * sin(angle));
          angle += 2*pi / NUM_POINTS;
     end;
end;

procedure drawPoints();
begin
     for var i := 0 to NUM_POINTS-1 do
     begin
          DrawCircle(points[i].X, points[i].Y, 1);
     end;
end;

begin
     Coordinate.SetMathematic();
     Coordinate.OriginX := trunc(Window.Width / 2);
     Coordinate.OriginY := trunc(Window.Height / 2);
     DrawCircle(0, 0, RADIUS);
     
     setPoints();
     drawPoints();
     
     var multiplier := 1;
     while true do
     begin
          multiplier += 1;
          for var i := 0 to NUM_POINTS-1 do
          begin
               Line(points[i], points[i * MULTIPLIER mod NUM_POINTS]);
               sleep(5);
          end;
          sleep(500);
          Window.Clear();
          DrawCircle(0, 0, RADIUS);
     end;
end.