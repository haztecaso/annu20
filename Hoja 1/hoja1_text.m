%% Practicas de Matlab
%% Rutinas de Matlab y la resolución de EDO
%% Hoja 1
% *Nombre:*
% 
% *Apellido:*
% 
% *DNI:*
% 
% **
%% Práctica 1 (EDO de corazón)
% Considera el siguiente PVI
% 
% $$    \begin{array}{ccc}    \frac{dx_1}{dt} & = & x_2                 \\    
% \frac{dx_2}{dt} & = & -16x_1 + 4 \sin(2t) \\    x_1(0)          & = & 0                  
% \\    x_2(0)          & = & 2    \end{array}$$
% 
% en el intervalo, $[0,2 \pi]$. Ahora intenta resolverla numéricamente usando 
% el comando *ode45* de Matlab y pinta la solución
% 
% *Solución*

disp('Eso es el codigo de UB')
f = @(t, y) [y(2); -16*y(1)+4*sin(2*t)];
met='ode45';
intv=[0 2*pi];
x0=[0;2];
[t,y] = ode45(f, intv, x0);
i=1;
figure(i)
set(gca,'FontSize',16);
plot(t, y(:, 1), 'go-', t, y(:, 2), 'r+-')
s=sprintf('Ecuacion de Corazon,\n met=%s,intv=[%g %g],\n x0=[%g %g]',met,intv,x0);
title(s)
grid on
i=2;
figure(i)
set(gca,'FontSize',16);
hold on 
plot(y(:,1),y(:,2),'r-+')
hold off
grid on
s=sprintf('Diagrama de fase (Corazon),\n met=%s,intv=[%g %g],\n x0=[%g %g]',met,intv,x0);
title(s)
%% Práctica 2 (Sistema depredador-presa)
% Sea $x(t)$ la población de la especie presa, y $y(t)$ la de la especie depredadora,  
% $x'(t):=\frac{dx}{dt}$ y $y'(t):=\frac{dy}{dt}$ representarán los cambios de 
% las poblaciones con respecto del tiempo y vienen regidos por un sistema de 
% 
% * un sistema de _Lotka-Volterra_
% 
% $$        \begin{array}{ccl}          x^{\prime} & = & Ax - Byx \qquad 
% A,B\in {\mathord{\mathbb R}}^{+}   \\[0.2cm]          y^{\prime} & = & -Cy + 
% Dxy \qquad   C,D\in {\mathord{\mathbb R}}^{+} \\[0.2cm]          x(0) & = & 
% \alpha_1                                            \\[0.2cm]          y(0) 
% & = & \alpha_2        \end{array}$$
% 
% * o un o por un sistema de _Lotka-Volterra_ con un depredador externo (un 
% pescador)
% 
% $$        \begin{array}{ccl}         x^{\prime} & = & A x - B yx -E x \qquad 
% A,B,E\in {\mathord{\mathbb R}}^{+} \\[0.2cm]         y^{\prime} & = & -C y + 
% Dxy - E y \qquad C,D\in {\mathord{\mathbb R}}^{+}  \\[0.2cm]          x(0)      
% & = & \alpha_1                                                  \\[0.2cm]          
% y(0)      & = & \alpha_2        \end{array}$$
% 
% * ¿Existe algún punto de equilibrio para este modelo de población? En ese 
% caso, ¿ para qué valores de $x_1,x_2$ el punto de equilibrio es estable? 
% 
% *Solución:*
% 
% * Resuelve este sistema para $0\leq t\leq 100$, suponiendo que las constantes  
% $A,B,C,D$ describen la interacción entre las especies y su propio crecimiento 
% y decrecimiento: $A=0.4$, $B=0.01$, $C=0.3$ y $D=0.005$). Considera los datos 
% iniciales $[50;\, 30]$. Dibuja las componentes de solución frente el tiempo 
% en una ventana, en otra, el diagrama de fase.
% 
% *Solución:*


%% 
% * En el caso del sistema con depredador externo $E=0.04$ ¿Qué tipo de trayectorias 
% describen? Dibuja una gráfica de la solución de cada problema. ¿Qué es su conclusión?
% 
% *Solución* 


%% Práctica 3 (Ecuación del péndulo)
% Estudiar la ecuación
% 
% $$\begin{cases}m L \theta '' (t) + 2 L \beta \theta' (t) + mg (\theta(t)) 
% = F & t \in [0,T] \\\theta(0) = \theta_0, \\\theta' (0) = w_0.\end{cases}$$
% 
% Se consideran los valores $m = 1 [kg] , g = 9.8 [m/s^2], T = 10.$ Estudiar, 
% para $F= 0, L = 1 [m]$, los diferentes comportamientos del sistema con $\beta  
% = 0, 0.25, 1.5$ partiendo del dato inicial $\theta_0 = 0, w_0 = 0.5$. Representar 
% tanto $(t, \theta(t))$ como el diagrama de fase $(\theta, \dot \theta)$.
% 
% Utilizar paso de tiempo $h = 0.01, 0.0001$¿es fidedigno el resultado con 
% respecto a las soluciones explícitas conocidas? 
% 
% *Solución:* 
% 
% $$\dot{\mathbf q} = \mathbf f(\mathbf q) = \left (q_2,\  \frac 1 {mL} (F 
% - 2L \beta q_2 - mgq_1) \right)$$


%% 
% *Solución Diagrama de Fase:*


%% Práctica 4: (Diagramas de fase: ecuación del péndulo *Comparar, considerando* $F = 0$, con el problema linealizado)
% Estudiar la ecuación
% 
% $$\begin{cases}m L \theta '' (t) + 2 L \beta \theta' (t) + mg \sin (\theta(t)) 
% = F & t \in [0,T] \\\theta(0) = \theta_0, \\\theta' (0) = w_0.\end{cases}$$
% 
% Se consideran los valores $m = 1 [kg] , g = 9.8 [m/s^2], T = 10.$
% 
% *Comparar, considerando* $F = 0$*, con el problema linealizado*
% 
% $$\begin{cases}m L \theta '' (t) + 2 L \beta \theta' (t) + mg \theta(t) 
% =0 & t \in [0,T] \\\theta(0) = \theta_0, \\\theta' (0) = w_0.\end{cases}$$
% 
% *Solucion con diferentes figures*
% 
% P4 solución con simple plots


%% 
% 
%% solution with simple plots fase
%%

%% 
% *Solucion con subplots*


%% 
% 
% 
% solution with subplots fase


%% Práctica 5 (Lorenz)
% Explora, usando *ode45*, el comportamiento de la solución en el intervalo  
% $0\leq t \leq 10$, para varias elecciones de los datos iniciales.
% 
% $$    \frac{d}{dt}    \left(       \begin{array}{cc}        &x\\        
% &y\\        &z      \end{array}    \right)    =    \left(       \begin{array}{ccc}        
% s (y(t)  & -x(t)) &             \\        r x(t)   & -y(t)  & - x(t)z(t) \\        
% x(t)y(t) &        & - b z(t)      \end{array}    \right)$$
% 
% * tomando $s = 10$, $b = \frac{8}{3}$. Ve aumentando desde $r=0.1$ a $r=1$ 
% con paso $0.1$ y luego a $r = 30$ con paso $1$. Observa la dinámica en los valores 
% intermedios $r=1$, $r=13.962$ y $r= 24.74$.
% 
% *Solucion*


%%

%% 
% 
% 
% # Toma $r= 100.5$ y el dato inicial $(0,5,75)$ para ver una solución periódica. 
% Manteniendo el dato inicial mueve $r$ entre $99.524$ y  $100.795$ (p.ej. $r=  
% 99.65$) y observa el cambio de dinámica.
% 
% *Solucion*


%% Práctica 6 (Problema de tres cuerpos)
% Consideramos el problema de tres cuerpos restringidos en la siguiente manera: 
% dos cuerpos con masas $1-\mu$ y $\mu$ se mueven en círculos en un plano mientras 
% que un tercer cuerpo con una masa que es despreciable en comparación con los 
% otras dos masas se mueve en el mismo plano. Las ecuaciones para el tercer cuerpo 
% son:
% 
% $$    \begin{array}{ccl}      x'' &=& x + 2 y' - \left( 1-m\right)\frac{x+m 
% }{D1}      - m \frac{x - (1-m)}{D2}\\      y'' &=& y - 2       x'      - \left( 
% 1-m      \right)\frac{y }{D1} - m \frac{y }{D2}\\      D1 &=&      \sqrt[3]{\left( 
% \left( x+m \right)^2+ y^2 \right)^{2}}      \\      D2 &=&      \sqrt[3]{\left(\left(x-(1-m) 
% \right)^2+ y^2\right)^{2}}\\      &m&=0.012277471     \end{array}$$
% 
% # Transforma el sistema en un sistema equivalente de primer orden.
% # Resuelve el sistema para los datos iniciales 
% 
% $$\begin{array}{ccc} x(0)     & = & 0.994                            \\ 
% x'(0)    & = & 0                                \\ y(0)     & = & 0                                
% \\y'(0)     & = & -2.00158510637908252240537862224 \\T_{period} & = & 17.0652165015796255 
% \qquad\mbox{El periodo de la solución}\end{array} $$
% 
% con el método de *ode45* y pinta $x(t)$ frente a $y(t)$.
% 
% *Solucion*


%% 
%