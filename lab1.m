function varargout = lab1(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @lab1_OpeningFcn, ...
                   'gui_OutputFcn',  @lab1_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end

function lab1_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);

function varargout = lab1_OutputFcn(hObject, eventdata, handles)

% задаем сеттеры и геттеры для значений X и Y вершин
function setx(val)
global s
s = val;
function x = getx
global s
x = s;
function sety(val)
global t
t = val;
function x = gety
global t
x = t;

% строим случайный многоугольник
function plot_Callback(hObject, eventdata, handles)
n = randi([3 25]); % случайным образом задаем количество вершин от 3 до 25
set(handles.Nte, 'String', n); % выводим количество вершин
% получаем и сохраняем в глобальные переменные координаты X и Y
setx(randn(1,n));
sety(1i*randn(1,n));
% получаем локальные переменные из глобальных
x = getx;
y = gety;
p = x + y; % собираем координаты случайных вершин в одну переменную
pm = mean(p); % находим среднее значение - центр
% центрируем точки и находим их:
a = angle(p-pm); % считаем аргументы в радианах
r = abs(p-pm); % считаем радиус-векторы
[a id] = sort(a); % упорядочиваем углы
r = r(id); % упорядочиваем радиусы
pn = r.*exp(1i*a) + pm; % восстанавливаем первоначальные координаты
pn(end+1) = pn(1); % замыкаем многоугольник
plot(pn,'r') % строим многоугольник
varargout{1} = handles.output;

%зеркальное отображаем многоугольник относительно вертикальной оси
function otob_Callback(hObject, eventdata, handles)
n = handles.Nte.String; %считываем количество углов многоугольника
% получаем локальные переменные из глобальных
x = -getx;
y = gety;
setx(x); % сохраняем в глобальные переменные измененные координаты X
p = x + y; % собираем координаты случайных вершин в одну переменную
pm = mean(p); % находим среднее значение - центр
% центрируем точки и находим их:
a = angle(p-pm); % считаем аргументы в радианах
r = abs(p-pm); % считаем радиус-векторы
[a id] = sort(a); % упорядочиваем углы
r = r(id); % упорядочиваем радиусы
pn = r.*exp(1i*a) + pm; % восстанавливаем первоначальные координаты
pn(end+1) = pn(1); % замыкаем многоугольник
plot(pn,'r') % строим многоугольник