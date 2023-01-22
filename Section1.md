# Section 1: Class Familiarity
Did you know that MATLAB is more than just a fancy calculator? It’s actually a powerful programming language and IDE (Integrated Development Environment).
## Class Creation
Just like any powerful programming language, you can create classes within MATLAB (if you aren’t super familiar with Object Oriented Programming, refresh yourself [here](https://www.techtarget.com/searchapparchitecture/definition/object-oriented-programming-OOP)).

To learn the basics on how to create a class in MATLAB read through [this](https://www.mathworks.com/help/matlab/matlab_oop/create-a-simple-class.html) documentation from Mathworks.
```matlab
classdef BasicClass
   properties
      Value = 420;
      Name = 'Rho Beta'
   end
   methods
	   function self = BasicClass(name)
		   self.Name = name;
	   end
	   
	   function r = getValue(self)
		   r = self.Value;
	   end
	   
	   function setValue(self, newVal)
		   self.Value = newVal;
	   end
   end
end
```


## Class Vairables/Attributes

## Getters and Setters
### What are they?
Because of the nature of OOP, you cannot directly access the attributes of the object (instantiated instance of a class). For example, as seen above in BasicClass or Robot, the attributes of Value and goal cannot directly be assessed. Therefore we need getter functions to return the values, and setter functions that will set those values.
### MATLAB
As seen in the above example, getter and setter functions are relatively straightforward. The functions `getValue` and `setValue` do exactly what you think they do, they return the value of `Value` and set `Value` to a new value.