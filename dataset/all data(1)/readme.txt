 Copyright (c) 2008 SAS Institute Inc.                                       
 Cary, N.C. USA 27513-8000                                                    
 All Rights Reserved                                                          
                                                                              
 THE INFORMATION CONTAINED IN THIS DISTRIBUTION IS PROVIDED BY THE INSTITUTE  
 "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR IMPLIED, INCLUDING 
 BUT NOT LIMITED TO THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR 
 A PARTICULAR PURPOSE.  RECIPIENTS ACKNOWLEDGE AND AGREE THAT THE INSTITUTE   
 SHALL NOT BE LIABLE WHATSOEVER FOR ANY DAMAGES ARISING OUT OF THEIR USE OF   
 THIS INFORMATION.                                                            
                                                                              
 =============================================================================
                                                                              
 Instructions for SAS training class with course code PRG2              
                                                                        
 For each student, copy all of the data into a space that allows for    
 READ/WRITE access.                                                     
                                                                        
 **For more information about the course data, contact your SAS Instructor.**   
                                                                                
 =============================================================================  
                                                                                
 Windows Operating Environments                                                 
                                                                                
   Copy the data as is from the main folder.                                    
                                                                                
   Ignore all subfolders.                                                       
                                                                                
                                                                                
 UNIX Operating Environments                                                    
                                                                                
   Transfer the prg2.stc file from the main folder in BINARY format.        
       [See further details below for importing this transport file.]       
                                                                            
   Transfer .dat and .csv files from the main folder in TEXT format.        
                                                                            
   Transfer .sas files from the Unix subfolder in TEXT format.              
                                                                            
   Ignore all other files and subfolders.                                   
                                                                            
                                                                            
 z/OS Systems                                                               
                                                                            
   Transfer the prg2.stc file from the main folder in BINARY format.    
       [See further details below for importing this transport file.]   
                                                                        
   Transfer files from the zOS/rawdata subfolder in TEXT format        
   into a single PDS such as prefix.PRG2.RAWDATA                  
       [See zOS/raw-dcb.txt for recommended DCB settings]        
                                                                  
   Transfer files from the zOS/sascode subfolder in TEXT format  
   into a single PDS such as prefix.PRG2.SASCODE            
       [Use DSORG=PS, RECFM=FB, LRECL=80, BLKSIZE=8000]     
                                                            
   Check zOS/renames.txt for name changes required by PDS loading.             
                                                                                
   Ignore all other files and subfolders.                                       
                                                                                
 =============================================================================  
                                                                                
                       Importing .STC transport files                           
                       ==============================                           
 The SAS data libraries were ported using the SAS procedure CPORT into a file   
 with the extension of STC.  These files must be transferred in BINARY format.  
                                                                                
 Once on your system, use the appropriate operating system utility to check     
 the record length.                                                             
                                                                                
     z/OS TSO  SPF 3.2        Check the Organization: PS                        
                              Record format: FB                                 
                              Record length: 80                                 
                              Block size: 8000                                  
                                                                                
 Run the SAS procedure CIMPORT against the transport file.                      
                                                                                
     Example:       LIBNAME OUT 'prefix.PRG2.SASDATA';                    
                    FILENAME IN 'prg2.stc';                           
                    PROC CIMPORT LIBRARY=OUT INFILE=IN;               
                    RUN;                                              
                                                                      
 For more information, see SAS Technical Support - Knowledge Base  
      http://support.sas.com/kb/22/688.html                          
                                                                                
 =============================================================================  
                                                                                
