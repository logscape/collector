# Logscape Collector Collector

## Intro 

The Logscape Cloud services accepts data from different sources. Any client that implements syslog can send data into Logscape. Raw TCP Data can also be sent into Logscape Cloud and Application metrics can be forwarded into the data. 

 ![](/docs/images/overview.png) 

## Downloads

 * [Windows Collector](installers/windows/setup.exe) 

## Sign Up

The first step is to sign up for a new account. 

 ![](/docs/images/signup.png) 

You will be asked to verify your email. Once you have logged to your user account area, take note of the security token. This token is used to send data into Logscape Cloud.

## Installation

### Windows 

Download and run setup.exe and unpack the Collector. 



## Configure 

Edit the service.json file and update the json with you security token.  

	{	"manager":"10.28.1.170" 
	,"token":"70657eb1:14999ee959f:-7fd6"
	,"apps":["unixapp"]
	}

**manager** - Points to the Logscape Cloud Manager. This is set to the default saas.logscape.com. 
	
**token** - The security token provided on Sign Up.

**apps** - The apps is a list of apps to run when the service runner is started. See [apps.logscape.com](http://apps.logscape.com) for availabe integrations.  

## Collector 

To start the Logscape Collector  in standalone mode execute ./start.sh or ./start.bat depending on your Operating System. When you execute this process it will read in your services.json and execute the apps listed in the *apps* field using the security token specified by *token*. 



