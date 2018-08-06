import sys
import os
import time
import string
from itertools import product

def getchars(char_type):
    
    lower_chars = string.ascii_lowercase #26 characters
    upper_chars = string.ascii_uppercase #26 characters
    digits = string.digits				 #10 characters
    symbols = string.punctuation		 #32 characters
    
    if char_type == "l":
        return lower_chars
    elif char_type == "u":
        return upper_chars
    elif char_type == "a":
        return lower_chars+upper_chars
    elif char_type == "n":
        return digits
    elif char_type == "s":
        return symbols
    elif char_type == "an":
        return lower_chars+upper_chars+digits
    elif char_type == "all":
        return lower_chars+upper_chars+digits+symbols
		
def generate(filename,checktype,pwlength):
    
    #obtain list of characters to test based on input
    chars = getchars(checktype)

    #calculate the number of possible combinations and prompt user to continue
    combs=0
    for length in range(1,pwlength+1):
        combs += len(chars)**length
    listSize = int((combs*7)/1048576)
    procTime = int(combs/526000)
    response =str(input("Total possible password combinations: %s\nThis file may be approximately %s MB in size.\nEstimated time: %s seconds. Continue?(y,n)" % ("{:,}".format(combs),"{:,}".format(listSize),"{:,}".format(procTime))))
    while response.lower() != "y":
        if response.lower() == "n":
            sys.exit()
        else:
            response =str(input("Total possible password combinations: %s\nThis file mat be approximately %s MB in size. Continue?(y,n)" % ("{:,}".format(combs),"{:,}".format(listSize),"{:,}".format(procTime))))                  

    start_time = time.time()
    counter = 0
	
	#create the file
    outFile = open(filename,"w+")
    print("Building password list %s..." % filename)

    for length in range(1,pwlength+1): #do max password length of pwlength
        attempt=product(chars,repeat=length)
        print("writing %s character passwords..." % length)
        for password in attempt:
            counter+=1
            #write password to file
            outFile.write(''.join(password)+"\n")           
    print("\nPassword file complete.")
    print("Total Run Time: %s seconds" % "{:,}".format(int(time.time()-start_time)))
    print("Total passwords written: %s" % "{:,}".format(counter))
		
if __name__=="__main__":
    generate("C:\\Users\\bdm.oag-9276\\Documents\\Batches and Scripts\\Python\\passwordFiles\\"+sys.argv[1],str(sys.argv[2]),int(sys.argv[3]))
	# generatePWList outfile charTypes maxPWLength