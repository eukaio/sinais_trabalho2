function [] = grafico_leitura_potenc_controle_led()  
 board = arduino();  
 h = figure(1);  
 finishup = onCleanup(@() exitprogram(board,h));  
 hLine1 = line(nan, nan, 'Color','red');  
 i = 0;  
 while 1  
   b = readVoltage(board,0);  
   pause(0.01);  
   x1 = get(hLine1, 'XData');  
   y1 = get(hLine1, 'YData');  
   x1 = [x1 i];  
   y1 = [y1 b];  
   set(hLine1, 'XData', x1, 'YData', y1);  
   i = i + 1;
   if readVoltage(board,0)>3
	writeDigitalPin(board,'d3',1)
    readVoltage(board,0)
   else
    writeDigitalPin(board,'d3',0)
   end
pause(.01);
 end  
 end   
 function exitprogram(b,h)  
 clear b;  
 close(h);  
 disp('Exit');  
 end  