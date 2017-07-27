function [e,b] = lattice_structure(gama,e,b);
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
e=e+gama*b;
b=-gama*e+b;
end