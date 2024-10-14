def triangleChecker(a, b, c):
    
    unique_values = len({a, b, c})

    return (
        "Kolmio on tasasivuinen" if unique_values == 1
        else "Kolmio on tasakylkinen" if unique_values == 2
        else "Kaikki kolmion sivut ovat eripituisia"
    )