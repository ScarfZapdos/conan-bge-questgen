import subprocess

def replace_goal(goal):
    with open("generalkehck.pddl","r") as j:
        with open("newgeneralkehck.pddl","w") as nj:
            for jtxt in j:
                if (jtxt[:6]=="(:goal"):
                    nj.write(goal)
                else:
                    nj.write(jtxt)

def make_plan(goal):
    replace_goal(goal)
    with open("plan.soln","w") as solution:
        calc = subprocess.run(['/mnt/e/anaconda/bin/python3', '/mnt/e/Work/conan-bge-questgen/src/downward/fast-downward.py', "domaingeneralkehck.pddl", "newgeneralkehck.pddl",'--search', "astar(lmcut())"], stdout=solution)

def count_actions_occurences(goal):
    make_plan(goal)
    plan_found = False
    counts = {}
    with open("plan.soln","r") as plan:
        for line in plan:
            if plan_found:
                if "Plan length:" in line:
                    break
                action = line.split()[0]
                if action not in counts:
                    counts[action] = 1
                else:
                    counts[action] += 1
            if "Actual search time:" in line:
                    plan_found = True
            if "no solution!" in line:
                break
    return counts

def test_preferences():
    tot_occurences = {}
    k = 1
    with open("tpout2","r") as goals:
        for goal in goals:
            print(f"Goal {k}")
            k+=1
            add_dictionaries(tot_occurences,count_actions_occurences("(:goal " + goal[:-1] + ")\n"))
    return tot_occurences

def add_dictionaries(d1,d2):
    for key in d2:
        if key not in d1:
            d1[key] = d2[key]
        else:
            d1[key] += d2[key]
    return d1

def main():
    print(test_preferences())



if __name__ == "__main__":
    main()
