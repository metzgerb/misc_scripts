'''
This script parses the firewall log for HTTP traffic into .csv format
Author: Brian Metzger
Last updated: 06-25-2018
'''

import sys
import os
#import string

def parse(input_file_name, output_file_name):
    #open output file
    output_file = open(output_file_name, "w+")
    
    #open input file
    input_file = open(input_file_name, "r")
    
    #build header
    header_elements = ["datetime", "proxy", "id", "severity", "sys", "sub", "name","action", 
            "method", "srcip", "dstip", "user", "group", "ad_domain", "statuscode", 
            "cached", "profile", "filteraction", "size", "request", "url", "referer",
            "error", "authtime", "dnstime", "cattime", "avscantime", "fullreqtime", 
            "device", "auth", "ua", "exceptions", "category", "reputation", "categoryname",
            "country", "content-type", "application", "app-id", "reason", "sandbox", "engine"]
    
    #convert header to single string
    header = ' '.join(header_elements) + '\n'
    
    #write header line
    output_file.write(header)
    
    #read lines
    lines = input_file.readlines()
      
    #close input file
    input_file.close()
    
    #loop through each line
    for line in lines:
        line_list = []
        #insert datetime and proxy tags
        line = line[:40] + '" ' + line[41:]
        line = line[:19] + '" proxy="' + line[20:]
        line = line[5:7] + '/' + line[8:10] + '/' + line[:4] + ' ' + line[11:]
        line = 'datetime="' + line
        #parse line
        #line = line.replace("filteraction=",'')
        #line = line.replace("categoryname=",'')
        #line = line.replace("app-id=", '')
        
        for element in header_elements:
            value_start = 0
            value_end = 0
            if(line.find(element + '=')==-1):
                line_list.append("")
            else:
                value_start = line.find(element + '=')+ len(element + '=')
                value_end = line.find('"', value_start+1)+1
                line_list.append(line[value_start:value_end])
        
        line = ' '.join(line_list) + '\n'
        
        #write line to output file
        output_file.write(line)

    #close output file
    
    #print completion message

if __name__=="__main__":
    parse(os.getcwd() + '\\' + sys.argv[1],os.getcwd() + '\\parsed_' + sys.argv[1])
	#parselog input_file_name