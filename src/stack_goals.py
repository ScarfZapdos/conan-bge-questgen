import write_goal

with open('tests/tpout2','a') as tpout2:
    for k in range(100):
        with open('tests/tpout','r') as tpout:
            write_goal.main()
            tpout2.write(tpout.read())
            tpout2.write("\n")
        print(f"{k+1}/100 Done")
