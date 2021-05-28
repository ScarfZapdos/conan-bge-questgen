import os
import subprocess

heuristic = "astar(ipdb())"
def plan_quest(agent):

#    os.chdir(os.path.join("world",agent))
#    with open("garbage","w") as garbage:
#        subprocess.call(["/mnt/e/anaconda/bin/python3","/mnt/c/cygwin64/home/MARTIN/downward/src/translate/translate.py","domain"+agent+".pddl", agent+".pddl"], stdout=garbage)
#    with open("output.sas","r") as outputsas:
#        with open("garbage2","w") as garbage2:
#            subprocess.call(["C:\cygwin\home\Vincent\Fast-Downward-134116d39300\src\preprocess\preprocess"], stdin=outputsas, stdout=garbage2)
#    with open("output","r") as output:
#        with open(os.path.join("..",agent+".soln"),"w") as solution:
#            calc = subprocess.Popen(["/mnt/e/anaconda/bin/python3",'/mnt/c/cygwin64/home/MARTIN/downward/fast-downward.py','--search ' + heuristic], stdin=output, stdout=solution)
    os.chdir(os.path.join("world/bge",agent))
#    with open("garbage","w") as garbage:
#        subprocess.call(["/mnt/e/anaconda/bin/python3","mnt/e/Work/downward-issue698-v1/builds/release32/bin/translate/translate.py","domain"+agent+".pddl", agent+".pddl"], stdout=garbage)
#    with open("output.sas","r") as outputsas:
#        with open("garbage2","w") as garbage2:
#            subprocess.call(["mnt/e/Work/downward-issue698-v1/builds/release32/bin/preprocess"], stdin=outputsas, stdout=garbage2)
#    with open("output","r") as output:
    with open(os.path.join("..",agent+".soln"),"w") as solution:
        #calc = subprocess.call(['mnt/e/anaconda/bin/python3.8', 'mnt/e/Work/fast-downward/fast-downward.py', "domain"+agent+".pddl", agent+".pddl",'--search', heuristic], stdout=solution)
        calc = subprocess.Popen(["java", '-jar', '../../../aquaplanning-master/target/aquaplanning-0.0.1-SNAPSHOT-jar-with-dependencies.jar', "domain"+agent+".pddl", agent+".pddl","-s=aStar"], stdout=solution)
        print("the commandline is {}".format(["java", '-jar', '../../../aquaplanning-master/target/aquaplanning-0.0.1-SNAPSHOT-jar-with-dependencies.jar', "domain"+agent+".pddl", agent+".pddl"]))

    os.chdir("..")
    os.chdir("..")
    os.chdir("..")
    return calc
