import sys
import os
import time
import string
from itertools import product
import fitz

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

def crack(filename,checktype,pwlength):
    
    #obtain list of characters to test based on input
    chars = getchars(checktype)

    #calculate the number of possible combinations and prompt user to continue
    combs=0
    for length in range(1,pwlength+1):
        combs += len(chars)**length
    proc_time = int(combs/8700)
    response =str(input("Total possible password combinations: %s\nThis may take approximately %s seconds. Continue?(y,n)" % ("{:,}".format(combs),"{:,}".format(proc_time))))
    while response.lower() != "y":
        if response.lower() == "n":
            sys.exit()
        else:
            response =str(input("Total possible password combinations: %s\nThis may take approximately %s seconds. Continue?(y,n)" % ("{:,}".format(combs),"{:,}".format(proc_time))))                  

    start_time = time.time()
    filePDF = fitz.Document(filename)
    found = ""
    stop_attempt=False
    counter = 0
    print("Attempting to crack %s..." % filename)

    for length in range(1,pwlength+1): #do max password length of pwlength
        attempt=product(chars,repeat=length)
        print("Checking %s character passwords..." % length)
        for password in attempt:
            counter+=1
            #print("Attempting %s: " % "{:,}".format(counter) + ''.join(password))
            if filePDF.authenticate(''.join(password))>0:
                found=''.join(password)
                stop_attempt=True
                break             
        if stop_attempt:
            break
    print("\n")
    if found=="":
        print("Did not match password with given parameters.")
    else:
        print("password cracked: %s" % found)
    print("Total Run Time: %s seconds" % "{:,}".format(int(time.time()-start_time)))
    print("Total passwords tried: %s" % "{:,}".format(counter))
if __name__=="__main__":
    crack(os.getcwd()+"\\"+sys.argv[1],str(sys.argv[2]),int(sys.argv[3]))
