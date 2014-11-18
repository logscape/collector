
def appMain = new AppMain(args)
try { 
	appMain.start() 

 }catch (Exception e){
	e.printStackTrace() 
	appMain.exit() 
}

