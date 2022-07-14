program Qparm;
uses crt;
{Berechnet R,L,C,Q und fs eines Quarzes aus den Simulationsergebnissen für Co und den Real- und Imaginärteil des komplexen Widerstandes bei zwei Frequenzen in der Naehe der Resonanzfrequenz}

var
   r1,x1,r2,x2,a1,b1,a2,b2 :double;
   f1,f2,x1n,x2n,w1,w2     :double;
   c0,r,rn,l,c,q,fs        :double;

begin
   clrscr;
   writeln('Berechnung des Quarzersatzschaltbildes aus Simulationsergebnissen:');
   writeln;
   write('Co eingeben in pF:            ');
   readln(c0);
   writeln;
   write('f1 eingeben in Hz:            ');
   readln (f1);
   write('Realteil bei f1 in Ohm:       ');
   read (r1);
   write('Imagin„rteil bei f1 in Ohm:   ');
   readln (x1);
   writeln;
   write('f2 eingeben in Hz:            ');
   readln (f2);
   write('Realteil bei f2 in Ohm:       ');
   readln (r2);
   write('Imagin„rteil bei f2 in Ohm:   ');
   readln (x2);
   w1 := 2*pi*f1;
   w2 := 2*pi*f2;
   a1 := r1/(r1*r1+x1*x1) ;
   b1 := -x1/(r1*r1+x1*x1);
   a2 := r2/(r2*r2+x2*x2) ;
   b2 := -x2/(r2*r2+x2*x2);
   c0 := c0 * 1e-12;
   r  := a1 / (a1*a1 + (b1-w1*c0)*(b1-w1*c0))    ;       { R   Berechnung }
   rn := a2 / (a2*a2 + (b2-w2*c0)*(b2-w2*c0))    ;
   x1n:= (w1*c0-b1)/( a1*a1 + (b1-w1*c0)*(b1-w1*c0) );   { L C Berechnung }
   x2n:= (w2*c0-b2)/( a2*a2 + (b2-w2*c0)*(b2-w2*c0) );
   c  := (w1*w1-w2*w2)/(x1n*w1*w2*w2 - x2n*w1*w1*w2);
   l  := ( (x1n*w1) - (x2n*w2) ) / ( (w1*w1) - (w2*w2) );
   fs := 1.0 / ( 2*pi * sqrt(c*l) );
   q  := ( 2.0 * pi * fs * l ) / r ;
  writeln;
  writeln('C0 : ',c0:12  ,'   in F'   );
  writeln('R  : ',r :14  ,'   in Ohm' );
  writeln('R# : ',rn:12  ,'   in Ohm' );
  writeln('L  : ',l :12  ,'   in H'   );
  writeln('C  : ',c :12  ,'   in F'   );
  writeln('Q  : ',q :12             );
  writeln('fs : ',fs:14  ,' in Hz ' );
  writeln;
  readln;
end.
