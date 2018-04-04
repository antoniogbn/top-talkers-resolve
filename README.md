# top-talkers-resolve

#### Description
- It´s a Win 32 application coded and built in Delphi XE5, that resolves DNS names from IP address aqcuired from cisco  routers top-talkers command output;

#### Way to work

- On a Cisco Router CLI , Issue this command : `sh ip flow top-talkers` ;
- Copy the output using CRTL+C;
- Open the resolver and paste using CRTL+V;
- Application will get pasted data and resolve all IP address collums;
- Export using *CSV Button* to a CSV formatted file;

