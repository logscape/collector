import java.net.* 
import groovy.json.*

s = new Socket("localhost", 55555);
//  echo  '{"module":"process","action":"list","args":"unixapp"}' | netcat 10.28.0.96 55555
def arguments=["","",""] 
for(i=0;i<args.size();i++){
	arguments[i]=args[i]
}
if(args.size() < 3){
	for(def i=args.size()  ;i< arguments.size()  ;i++) {
		arguments[i] = "" 
		sleep(1000)
	}
}

def module=arguments[0]
def action=arguments[1]
def params=arguments[2]
cmd="{\"module\":\"$module\", \"action\":\"$action\",\"args\":\"$params\"}"

println cmd + "\n" 

println  "\n"
s.withStreams { input, output ->
	output << "$cmd \n"
	json = new JsonSlurper().parseText(input.newReader().readLine())
	println json["response"].replace("\\n","\n").replace("\\t","\t") 
}
