deposit = int(input('Enter how much you need to put into the account:'))
days = int(input('Enter how many days need to keep in the account:'))
bonus = int(input('Enter how much bonus you will receive:'))
presetAPY = float(input('Enter current APY% (default is 2%):') or 2)/100
APY_of_the_offered_Bank = float(input('Enter offered bank APY% (default is 2%):') or 2)/100
effort = 0 #Effort to enroll? setup a value to show your "effort" 

est_income = (deposit * presetAPY / 365) * days

currentAPY = 365* (bonus/days/deposit)

interest_in_the_offer_bank = (deposit * APY_of_the_offered_Bank / 365) * days

final_income_for_the_offer = bonus+interest_in_the_offer_bank

print("Your offered APY will be:" , round(currentAPY,5))
print("Your income, if not opt-in:", round(est_income,2))
print("Your income, if opt-in", round(final_income_for_the_offer,2) )
print("Diff b/w bank and this offer:", round(final_income_for_the_offer-est_income,2))
print("You should enroll" if round(final_income_for_the_offer-est_income,2) > effort else "You should NOT enroll")





