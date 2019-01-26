# logCollection_pwrShl
Powershell script to collect various logs and system states

# You will see a .cmd that executes the Powershell .ps1 from a command prompt. I use this means of execution commonly.

In this script:
Collect various logs locally and output them to a respective flat file.  You can import the .csv or .log output into a monitoring solution of your choice or a custom SQL database or noSQL database of your favorite data platform.

# What is happening?
- Collect Event Logs for Application category
  Export top 100 (most recent) messages to flat file
    Append flat file with timestamp of execution time in contents of file.

- Collect Event Logs for System category
  Export top 100 (most recent) messages to flat file
    Append flat file with timestamp of execution time in contents of file.
  
  - Output Services List to a flat file, sorted by run status.
    Append flat file with timestamp of execution time in contents of file. (Append time to output file)
   
- Get OS cmd output for Netstat open ports and details.
  Output to flat file   
    (Append time to output file)
        
- Get OS cmd for Tasklist. Output to flat file
  (Append time to output file)
    
- Collect Scheduled Tasks for output to file. Sorted by Hiearchy path.
    (Append time to output file)
