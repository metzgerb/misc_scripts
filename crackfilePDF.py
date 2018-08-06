import sys
import os
import time
import fitz

def crack(filename,pwfile):
    file_path = "C:\\Users\\bdm.oag-9276\\Documents\\Batches and Scripts\\Python\\passwordFiles\\"
    processrate = 9500
    if pwfile.lower() == "k":
        pwfile = os.path.join(file_path,"10kPass.txt")
        proc_time = int(10000/processrate)
    elif pwfile.lower() == "j":
        pwfile = os.path.join(file_path,"john.txt")
        proc_time = int(3106/processrate)
    elif pwfile.lower()== "r":
        pwfile = os.path.join(file_path,"rockyou.txt")
        proc_time = int(14341634/processrate)
    else:
        pwfile = os.path.join(file_path,pwfile)
        if(os.path.isfile(pwfile)):
            with open(pwfile) as f:
                for i, l in enumerate(f):
                    pass
            proc_time = int((i+1)/processrate)
        else:
            print("Invalid parameter or file does not exist: \nUse 'k', 'j', 'r' or a filename to specify which dictionary file to use.")
            exit()
    #calculate the number of possible combinations and prompt user to continue
    response =str(input("This may take approximately %s seconds. Continue?(y,n)" % "{:,}".format(proc_time)))
    while response.lower() != "y":
        if response.lower() == "n":
            sys.exit()
        else:
            response =str(input("Invalid Input.\nThis may take approximately %s seconds. Continue?(y,n)" % "{:,}".format(proc_time)))                  
    start_time = time.time()
    found = ""
    filePDF = fitz.Document(filename)
	
    #collect passwords into list
    password_file = open(pwfile,'r')
    passwords = password_file.readlines()
    passwords = [item.rstrip('\n') for item in passwords]
    password_file.close()

    print("Attempting to crack %s..." % filename)
    counter=0
    for password in passwords:
        counter+=1
        #print("Attempting password %s: %s\r" % ("{:,}".format(counter),password))
        if filePDF.authenticate(password)>0:
            found=str(password)
            break			
    print("\n")
    if found=="":
        print("Password not found in list.")
    else:
        print("password cracked: %s" % found)
    print("Total Run Time: %s seconds" % "{:,}".format(int(time.time()-start_time)))
    print("Total passwords tried: %s" % "{:,}".format(counter))

                          
if __name__=="__main__":
    crack(os.getcwd()+"\\"+sys.argv[1],str(sys.argv[2]))
