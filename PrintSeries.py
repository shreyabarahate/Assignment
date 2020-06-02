'''
Created on May 30, 2020

@author: barahate
'''

def printSeries(N):
    
    for num in range(N,0,-1):
        if num % 3 ==0 and num % 5 ==0:
            print("Testing")
         
        elif num % 3==0:
            print("Software")
            
        elif num %5 ==0:
            print("Agile") 
               
        else:
            print num

if __name__=="__main__":
    N=input("Enter the number up to which the series need to be print:") 
    printSeries(N)