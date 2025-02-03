cipher = "}eYcbt4fB{_yD0nUu_05Rp_1TNh_GM13R_"
print(cipher)
ch1 = ""
for i in range(1,len(cipher),2) : 
    ch1+=cipher[i]
print(ch1)
ch2 = ""
for i in range(2,len(cipher),2) : 
    ch2+=cipher[i]
print(ch2)
print(f"Flag :" ,ch1+ch2[::-1],"}" )