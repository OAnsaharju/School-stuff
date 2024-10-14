def verifyAge(age):
    if (age < 18):
        return("Olet lapsi")
    elif (age < 70):
        return("Olet aikuinen")
    else:
        return("Olet eläkeläinen")