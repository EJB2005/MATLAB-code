plot(penX, penY);
hold on;
axis([1,1])
plot(cx,cy,'o');
title('Pen Stroke Shape');
xlabel('X-corrdinate');
ylabel('Y-coordinate');
legend('Pen Stroke','Corners');
hold off;