## Copyright (C) 2020 Bill
## 
## This program is free software; you can redistribute it and/or modify it
## under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <http://www.gnu.org/licenses/>.

## -*- texinfo -*- 
## @deftypefn {Function File} {@var{retval} =} normOf (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: Bill <Bill@LAPTOP-8QMK16I4>
## Created: 2020-12-19

function [retval] = normOf (aMatrixColumn)
  retval = 0;
  
  for i = 1:length(aMatrixColumn)
    retval += aMatrixColumn(i)^2;
  endfor
  retval = sqrt(retval);
endfunction
