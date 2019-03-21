/*/ Boolean example - can be set to TRUE, FALSE, NULL 
Boolean isWeekend = false;

// Use system.debug() to print a debug log.
System.debug('isWeekend = ' + isWeekend);



// Date example - value that indicates a prticular day. 
Date myDate = date.newinstance(2019, 3, 5);
System.debug('Todays Date: ' + myDate);

//Decimal a number that includes a decimal point. 
//Currency fields are automatically assigned bit type decimal 
Decimal cost = 19.99; 
System.debug('cost = ' cost);

//Double - 64 bit number that includes a decimal point 
Double pi - 3.14159; 

//Decimal vs double you should NEVER use floating point representation (Double) to handle monetary representation 
Double zeroPointZeroOne = 0.01; 
Double doubleSum = 0.0; 
for (Integer i =0; i < 10; i++){
	doubleSum += zeroPointZeroOne;  
}

System.debug('doubleSum = ' +  doubleSum);

Decimal zeroPointZeroOne = 0.01; 
decimal doubleSum = 0.0; 
for (Integer i =0; i < 10; i++){
	doubleSum += zeroPointZeroOne;  
}

System.debug('doubleSum = ' +  doubleSum);

//Integer - A 32-bit number that DOESN'T include a decimal 
//Min = -2,147,483,648 & MAX = 2,147,483,647
integer age = 23; 

//Long - a 64-bit number that DOESN'T include a decimal 
long diatanceInInchesToTheMoon = 151300000000L; 

//Objecty any dataatype that is supported in Apex 
object obj = 10; 
object obj2 = new Account(Name = 'Matt'); 
System.debug('obj:' + obj); 
System.debug('obj2:' + obj2); 

//String - Any set of characters surrounded by single quotes. 
string sentence = 'The quick breon fox jumps over the lazy do'; 

//sObejct - Salesforce object 
sObject cc = new Contact(): 
c.lastName = 'Morales'; 
Contact c = new Contact(); 
System.debug('c.LastName:' + c.lastName); 

*/
public class DataTypeExamples {
	
    
    
}