def calculate_fare(distance,vehicle,time):
    rates={
        "Economy": 10,
        "Premium": 18,
        "SUV": 25
    }
    if vehicle not in rates:
        return None
    bill=distance * rates[vehicle]
    if time >= 17 and time <= 20:
        bill *= 1.5
    return bill
distance=float(input("Enter distance in km:"))
vehicle=input("Enter vehicle type Economy or Premium or SUV:")
time=int(input("Enter time of travel (0-23):"))
fare=calculate_fare(distance,vehicle,time)
if fare is None:
    print("Invalid selection")
else:
    print("\n Fare Details:  ")
    print("distance: ",distance,"km")
    print("vehicle: ",vehicle)
    print("Time: ",time,"hrs")
    print("Total Fare: ",fare)
