from random import Random
import copy

def completed_number(prefix, length):
    """
    'prefix' is the start of the CC number as a string, any number of digits.
    'length' is the length of the CC number to generate. Typically 13 or 16
    """
    generator = Random()
    generator.seed()    # Seed from current time
    ccnumber = prefix
    # generate digits
    while len(ccnumber) < (length - 1):
        digit = str(generator.choice(range(0, 10)))
        ccnumber.append(digit)
  # Calculate sum
    sum = 0
    pos = 0
    reversedCCnumber = []
    reversedCCnumber.extend(ccnumber)
    reversedCCnumber.reverse()
    while pos < length - 1:
        odd = int(reversedCCnumber[pos]) * 2
        if odd > 9:
            odd -= 9
        sum += odd
        if pos != (length - 2):
            sum += int(reversedCCnumber[pos + 1])
        pos += 2
  # Calculate check digit
    checkdigit = ((sum // 10 + 1) * 10 - sum) % 10
    ccnumber.append(str(checkdigit))
    return ''.join(ccnumber)

def credit_card_number(prefixList, howMany=1, length=16):
    generator = Random()
    generator.seed()    # Seed from current time
    if type(prefixList)==str:
        prefixList=[[i for i in prefixList]]
    if type(prefixList[0])==str:
        prefixList=[[i for i in List] for List in prefixList]
    result = []
    while len(result) < howMany:
        ccnumber = copy.copy(generator.choice(prefixList))
        result.append(completed_number(ccnumber, length))
    return result

if __name__ == "__main__":
 fakecard = credit_card_number(['123','234'], 15,16)
 print fakecard
