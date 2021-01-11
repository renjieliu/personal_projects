def is_even(num):
    result = 1
    temp = str(num)
    for i in range(0, len(temp)):
        if int(temp[i])%2!=0:
            result = 0
            break
    return result


def output(num):

    plus = 0
    minus = 0

    start=num
    start_v = start

    while is_even(start_v) != 1:
        plus +=1
        start_v += 1

    start_v = start

    while is_even(start_v) != 1:
        minus +=1
        start_v -= 1


    if plus <= minus:
        return plus
    else:
        return minus


print("Case #1: ", end = "" ) , print(output(42))
print("Case #2: ", end = "" ) , print(output(11))
print("Case #3: ", end = "" ) , print(output(1))
print("Case #4: ", end = "" ) , print(output(2018))
print("Case #5: ", end = "" ) , print(output(8443257735395719))
print("Case #6: ", end = "" ) , print(output(3208453465779946))
print("Case #7: ", end = "" ) , print(output(2043439400806565))
print("Case #8: ", end = "" ) , print(output(5323780492592791))
print("Case #9: ", end = "" ) , print(output(4335359103044849))
print("Case #10: ", end = "" ) , print(output(3187971487657685))
print("Case #11: ", end = "" ) , print(output(965135100884463))
print("Case #12: ", end = "" ) , print(output(2))
print("Case #13: ", end = "" ) , print(output(1645105264890959))
print("Case #14: ", end = "" ) , print(output(1651013940130118))
print("Case #15: ", end = "" ) , print(output(1107629925327913))
print("Case #16: ", end = "" ) , print(output(8))
print("Case #17: ", end = "" ) , print(output(9))
print("Case #18: ", end = "" ) , print(output(1555555555555555))
print("Case #19: ", end = "" ) , print(output(7))
print("Case #20: ", end = "" ) , print(output(3679611869180437))
print("Case #21: ", end = "" ) , print(output(10))
print("Case #22: ", end = "" ) , print(output(7938060657258174))
print("Case #23: ", end = "" ) , print(output(4825975801190870))
print("Case #24: ", end = "" ) , print(output(3127662647418319))
print("Case #25: ", end = "" ) , print(output(2993661506096990))
print("Case #26: ", end = "" ) , print(output(5033611206310619))
print("Case #27: ", end = "" ) , print(output(6522973834713685))
print("Case #28: ", end = "" ) , print(output(7985186550336178))
print("Case #29: ", end = "" ) , print(output(3347562352608270))
print("Case #30: ", end = "" ) , print(output(1326339744282004))
print("Case #31: ", end = "" ) , print(output(7480603363132169))
print("Case #32: ", end = "" ) , print(output(8240988447020423))
print("Case #33: ", end = "" ) , print(output(1337371646092875))
print("Case #34: ", end = "" ) , print(output(5142840810688781))
print("Case #35: ", end = "" ) , print(output(4204566031065241))
print("Case #36: ", end = "" ) , print(output(8315103468096997))
print("Case #37: ", end = "" ) , print(output(1550540757242824))
print("Case #38: ", end = "" ) , print(output(6))
print("Case #39: ", end = "" ) , print(output(5))
print("Case #40: ", end = "" ) , print(output(3301511805182441))
print("Case #41: ", end = "" ) , print(output(2034261063973180))
print("Case #42: ", end = "" ) , print(output(3))
print("Case #43: ", end = "" ) , print(output(1624607553992255))
print("Case #44: ", end = "" ) , print(output(496751776148768))
print("Case #45: ", end = "" ) , print(output(3878990487719733))
print("Case #46: ", end = "" ) , print(output(233930138507428))
print("Case #47: ", end = "" ) , print(output(189692857078347))
print("Case #48: ", end = "" ) , print(output(4052077684071508))
print("Case #49: ", end = "" ) , print(output(1958109005670493))
print("Case #50: ", end = "" ) , print(output(10000000000000000))
print("Case #51: ", end = "" ) , print(output(6971957867112306))
print("Case #52: ", end = "" ) , print(output(8888888888888889))
print("Case #53: ", end = "" ) , print(output(5283062679867123))
print("Case #54: ", end = "" ) , print(output(8440651276745840))
print("Case #55: ", end = "" ) , print(output(1375527603528762))
print("Case #56: ", end = "" ) , print(output(8715584141883134))
print("Case #57: ", end = "" ) , print(output(8163450696797725))
print("Case #58: ", end = "" ) , print(output(6788732883967888))
print("Case #59: ", end = "" ) , print(output(9999999999999999))
print("Case #60: ", end = "" ) , print(output(5347363169457821))
print("Case #61: ", end = "" ) , print(output(4298029790558041))
print("Case #62: ", end = "" ) , print(output(5805064716657129))
print("Case #63: ", end = "" ) , print(output(1806791933758186))
print("Case #64: ", end = "" ) , print(output(7272660783617992))
print("Case #65: ", end = "" ) , print(output(3660610777438848))
print("Case #66: ", end = "" ) , print(output(5843361730579456))
print("Case #67: ", end = "" ) , print(output(6080334421419632))
print("Case #68: ", end = "" ) , print(output(5155470161652371))
print("Case #69: ", end = "" ) , print(output(4))
print("Case #70: ", end = "" ) , print(output(5209026359028))
print("Case #71: ", end = "" ) , print(output(117807724110664))
print("Case #72: ", end = "" ) , print(output(8125372526658496))
print("Case #73: ", end = "" ) , print(output(2790825644477351))
print("Case #74: ", end = "" ) , print(output(95))
print("Case #75: ", end = "" ) , print(output(3503811308886195))
print("Case #76: ", end = "" ) , print(output(1936894310448265))
print("Case #77: ", end = "" ) , print(output(6458483610398552))
print("Case #78: ", end = "" ) , print(output(9600164625148179))
print("Case #79: ", end = "" ) , print(output(1253603953337480))
print("Case #80: ", end = "" ) , print(output(2796277510156695))
print("Case #81: ", end = "" ) , print(output(6329603104128405))
print("Case #82: ", end = "" ) , print(output(5899328494745306))
print("Case #83: ", end = "" ) , print(output(4229736524117628))
print("Case #84: ", end = "" ) , print(output(3436726949125577))
print("Case #85: ", end = "" ) , print(output(564317895518012))
print("Case #86: ", end = "" ) , print(output(902535784477749))
print("Case #87: ", end = "" ) , print(output(4269664682284824))
print("Case #88: ", end = "" ) , print(output(2471816536645070))
print("Case #89: ", end = "" ) , print(output(2328169568197412))
print("Case #90: ", end = "" ) , print(output(2025267255919963))
print("Case #91: ", end = "" ) , print(output(1048822921539168))
print("Case #92: ", end = "" ) , print(output(9756513335710382))
print("Case #93: ", end = "" ) , print(output(9205454041025047))
print("Case #94: ", end = "" ) , print(output(2072819705362884))
print("Case #95: ", end = "" ) , print(output(4618304723087462))
print("Case #96: ", end = "" ) , print(output(2133096072293059))
print("Case #97: ", end = "" ) , print(output(4805821693525465))
print("Case #98: ", end = "" ) , print(output(4241638601957121))
print("Case #99: ", end = "" ) , print(output(9360530591816075))
print("Case #100: ", end = "" ) , print(output(8922861411369607))
