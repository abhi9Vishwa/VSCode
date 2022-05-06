from requests import post
from sys import argv
from time import time
import re

def parse_time(inp):
	return sum(int(i)*60**ind for ind,i in enumerate(reversed(inp.split(':'))))+1

def progress(i, l):
	tmp = int(i*70/l)
	print('['+'='*tmp+' '*(70-tmp)+'] '+str(i*100//l)+'%', end='\r')

usage = '''
Usage: mookit.py <OPTIONS> <URL>
Options:
-y <LEN>  :  Use it if lecture seen for more than 10 seconds
-n  :  Use it if lecture seen for less than 10 seconds
-c <PERCENTAGE>  :  Use it if -y flag used and lecture seen continuously(without skipping, fast-forwarding etc)
<LEN>  :  Length of lecture video in format hr:min:s
<URL>  :  URL of lecture video
<PERCENTAGE>  :  Percentage video seen
'''
flag = 0
l = None
suf = None
per = None
try:
	if not "-n" in argv and not "-y" in argv:
		raise Exception
	if "-y" in argv:
		flag = 1
		l = parse_time(argv[argv.index("-y")+1])
		per = 10
		if "-c" in argv:
			per = ((int(argv[argv.index("-c")+1])-1)*l)//100
			per -= per%10
	suf = argv[-1]
except:
	print(usage)
	exit(0)
suf = re.findall('.*hello.iitk.ac.in/(.*?)/.*/(.*)',suf)[0]
url = 'https://hello.iitk.ac.in/api/'+ suf[0] +'/analytics/video/' + suf[1]
cookie = {'_ga' : 'GA1.3.729650906.1606391567' , 'role' : 'Student' , 'username' : 'abhinavv20' , 'token' : 'e0609054b12e8b0f2982e6c17bcf535752f64fa0' , 'uid' : '26735'  }
header = {"token":cookie["token"], "uid": cookie["uid"], "Referer":"https://hello.iitk.ac.in/"+suf[0]+"/"}
print("STARTING...")
t1 = time()
if not flag:
	post(url, headers = header, json = {"secondsWatched": 10, "totalLength": 10}, cookies = cookie)
	progress(10, 10)
else:
	for i in range(per, l+10, 10):
		progress(i, l)
		post(url, headers = header, json = {"secondsWatched": i, "totalLength": l}, cookies = cookie)
	post(url, headers = header, data = {"secondsWatched": l, "totalLength": l}, cookies = cookie)
t2 = time()
print("\nFINISHED in %0.3fs." % (t2-t1))
