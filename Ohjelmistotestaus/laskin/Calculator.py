from laskin.CalculatorUtils import sum,sub,mul,div


operand = "start"

while (operand != "exit"):

    operand = input("Haluatko '+', '-', '*', vai '/'. 'exit' lopettaa sovelluksen: ")

    if (operand != "exit"):
        if (operand == "+" or operand == "-" or operand == "*" or operand == "/"):
            number1Given = False

            while (not number1Given):
                try:
                    n1 = int(input("anna numero 1: "))
                    number1Given=True
                except Exception: print("antamasi syöte ei ollut numero. yritätkö uudestaan.")

            number2Given = False

            while (not number2Given):
                try:
                    n2 = int(input("anna numero 2: "))
                    number2Given=True
                except Exception: print("antamasi syöte ei ollut numero. yritätkö uudestaan.")
            


            match operand:
                case "+":
                    print(sum(n1,n2))
                case "-":
                    print(sub(n1,n2))
                case "*":
                    print(mul(n1,n2))
                case "/":
                    print(div(n1,n2))

    else:
        print("kiitos kun käytit laskinta")


