function [e1,b1] = for_lattice_str(gama,e,b)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
e1=e-gama*b;
b1=-gama*e+b;
end