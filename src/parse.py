f = open("toparse.txt","r")
g = open("parsed.txt","w")

for l in f:
    newline = '"' + l[:-1] + '",\n'
    print(newline)
    g.write(newline)

f.close()
g.close()
