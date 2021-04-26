import subprocess
import os
import sys
import time

import questTranslation
import questClassification
import worldManagementbge

def replace_action(currentDomain, action, increase):
    #Changes the action cost in currentDomain by :
    #   - adding 1 if increase
    #   - substracting 1 if not increase
    costEffect = "(increase (total-cost) "
    position = currentDomain.find(":action "+action)
    print(action)
    cutDomain = currentDomain[position:]
    costPosition = cutDomain.find(costEffect)+position

    number = int(currentDomain[costPosition+23])
    print(number)

    if increase:
        number += 1
        changedDomain = currentDomain[0:costPosition]+costEffect+str(number)+")"+currentDomain[costPosition+(len(costEffect)+2):]
    else:
        number -= 1
        changedDomain = currentDomain[0:costPosition]+costEffect+str(number)+")"+currentDomain[costPosition+(len(costEffect)+2):]

    return changedDomain

def write_domains(data, domain, agents, preferences):
    # Uses replace_action to set the domain with agents preferences
    template = ""
    with open(os.path.join(data,domain),"r") as templatefile:
        template = templatefile.read()

    for agent in agents:
        currentDomain = template
        for preference in preferences[agent]:
            if preference[0] == "+":
                currentDomain = replace_action(currentDomain, preference[1:],increase=True)
            else:
                currentDomain = replace_action(currentDomain, preference[1:],increase=False)
        with open(os.path.join(data,"domain"+agent+".pddl"),"w") as newdomainfile:
            newdomainfile.write(currentDomain)

def finished_thinking(calculating):
    total = len(calculating)
    target = total

    for agent in calculating:
        if agent.poll() == None:
            total += -1

    return (total == target)


def main():
    data = "world/bge"

    domain = "domain.pddl"

    agents = sorted(["peyj","generalkehck"])

    write_domains(data, domain, agents, worldManagementbge.preferences)

    worldManagementbge.create(data,agents,genesis=True)

    too_long = 10000

    run = True
    calculating = []
    opened_files = []
    while run:

        for agent in agents:
            opened_files.append(open(os.path.join(data,agent+".soln"),"w"))
            calculating.append(subprocess.Popen([os.path.join("metricff","Metric-FF-v2.1","ff"), '-o', os.path.join(data,agent,"domain"+agent+".pddl"), '-f', os.path.join(data,agent,agent+".pddl"), '-s', '3'],stdout=opened_files[-1]))

        thinking_time = time.perf_counter()
        print('Thinking')
        while not finished_thinking(calculating):
            time.sleep(0.5)
            print("..", end=".")
            thinking_time = time.perf_counter()
            if thinking_time > too_long:
                break
        for opened_file in opened_files:
            opened_file.close()

        print("Done")
        translations, _, formalplans = questTranslation.interpret(data)

        print(formalplans)

        motivations = [questClassification.classify(formalplan) for formalplan in formalplans]

        for translation,motivation in zip(translations,motivations):
            print(translation,motivation)

        print("Enter 'exit' to end.")
        action = input()

        if action == "exit":
            run = False
        else:
            worldManagementbge.update(data, action, agents)


if __name__ == "__main__":
    main()
