IBM Bluemix Container Test Project

rd 2016

[![Deploy to Bluemix](https://bluemix.net/deploy/button.png)](https://bluemix.net/deploy?repository=https://github.com/ralfduerig/docker2bluemix_v2.git) 



After successful deployment to bluemix test rhd1war web app by opening a browser pointing to 

http://inet-adress-of-your-deployed-docker:9080/rd1/MyJSP.jsp

or

http://inet-adress-of-your-deployed-docker:9080/rd1/MyServlet

----
you can connect to the container via ssh (generate your own cloud.key) 
or you can connect to container directly via 
cf ic using:
 #cf ic exec -it [container-id] /bin/bash
