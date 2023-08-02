Menu = "###"

[d] depositar
[s] sacar
[e] extrato
[q] sair
saldo= 0
limite=500
extrato=**
numero_saque=0
limite_saque=3
while true:
    opção=input(menu)
    if opção =="d":
        print("deposito")
    elif opção=="s":
print ("saque")
elif opção=="e":
print("extrato")
elif opção=="q":
break
else:
print("Opção invalida, por favor digite novamente a operação desejada")
