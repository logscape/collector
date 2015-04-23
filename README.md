# Logscape Cloud Collector

## Intro 

The Logscape Cloud services accepts data from different sources. Any client that implements syslog can send data into Logscape. Raw TCP Data can also be sent into Logscape Cloud and Application metrics can be forwarded into the data. 

 ![](/docs/images/overview.png) 

There are other ways of getting data into Logscape Cloud. The first is via [syslog](docs/syslog.md) and by [sending raw socket data](docs/rawtcp.md) 

## Downloads

 * [Windows Collector](installers/windows/setup.exe) 
 * [Platform Independent](dist/LogscapeCloudAgent.zip?raw=true) 



## Setup

Download and run setup.exe and unpack the Collector. When the setup.exe is finished it will install the Logscape Cloud Collector as a service. Open up task ma

###1. Sign Up

The first step is to sign up for a new account. 

 ![](/docs/images/signup.png) 

You will be asked to verify your email. Once you have logged to your user account area, take note of the security token. This token is used to send data into Logscape Cloud.

###2. Install 
***Windows***

Download the setup.exe and run on the hosts you want to monitor. The setup process will install the Collector as a Windows Service but will not attempt to run it

***Platform Independent***

Unpack the platform independent zip file and execute ./start.sh ( or start.bat) to run in standalone mode. 


###3. Configure 

Edit the service.json file and update the json with you security token.  

	{	"manager":"10.28.1.170" 
	,"token":"70657eb1:14999ee959f:-7fd6"
	,"apps":["unixapp"]
	}

**manager** - Points to the Logscape Cloud Manager. This is set to the default saas.logscape.com. 
	
**token** - The security token provided on Sign Up.

**apps** - The apps is a list of apps to run when the service runner is started. See [apps.logscape.com](http://apps.logscape.com) for availabe integrations.  

##4. Start

To start the Logscape Collector  in standalone mode execute ./start.sh or ./start.bat depending on your Operating System. When you execute this process it will read in your services.json and execute the apps listed in the *apps* field using the security token specified by *token*. 





# The Command Client

The Command Client allows you to send instructions to a running Logscape Cloud Collector. Use the command client to stop/start Cloud Apps, see running processes, update your configuration and install new applications. There are four main modules

 1. config 
 2. bundle 
 3. process 
 

## CONFIG

	./command config help 

 * write -  takes a list of key value pairs and writes them to your services.json. The values that can be written are *manager*,*token*,*tag* and the app list *apps* 

## BUNDLE

	./command bundle help

 * list  -  Lists all install applications on the system
 * install *appname*  - Installs an app from an online repository 


## PROCESS 
	./command process help

 * list -  Lists all running apps
 * start *appname* - Start an app
 * stop *appname* - stops an app 



### Examples: 

There are two ways of updating your configuration. Using the first method, edit your services.json, then restart the agent. The second method uses the command client to send instructions to the Logscape Collector. Here are a few example commands 

** Display Current Config **

	./command config 

*** Update the security token *** 

	./command config write token="123:456:678" manager="saas.logscape.com" 


*** Display the config for an app  ***

	./command config unixapp 

*** Update a value ***

	./command config myapp tag=uat


