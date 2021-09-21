import adventuresawaitbge
import sys

def main():
    save = sys.stdout
    sys.stdout = open('tests/tpin','w')

    adventuresawaitbge.main()

    sys.stdout.close()

    with open('tests/tpin','r') as tpin:
        with open('tests/tpout','w') as tpout:

            tpintxt = tpin.read()

            pos = tpintxt.find("Should be empty")

            chunks = tpintxt[pos:].split('\n')

            goal = chunks[5]
            #goal = goal[2:-2]

            tpout.write(goal)
    sys.stdout = save

if __name__ == "__main__":
    main()
