from magma import *
from mantle import *

__all__ = ['Cond']

A0 = 0xAAAA
A1 = 0xCCCC
A2 = 0xF0F0
A3 = 0xFF00

def ROM4(x):
    return uncurry(LUT(x, 4))

class Cond(Circuit):
    IO = ["inst", In(Bits(4)), 
          "cond", In(Bits(4)),
          "z",    In(Bit),
          "c",    In(Bit),
          "jump", Out(Bit)]
    @classmethod

    def definition(io):
        inst = io.inst
        cond = io.cond
        z = io.z
        c = io.c

        # control flow instructions
        jumpinst = ROM4(1 << 12)(inst)
        #callinst = ROM4(1 << 13)(inst)
        #retinst = ROM4(1 << 14)(inst)

        condz  = Decode(0, 4)(cond) #jz
        condnz = Decode(1, 4)(cond) #jnz
        jumpz = LUT((A0&A2)|(A1&~A2), 3)(condz, condnz, z)

        condc  = Decode(2, 4)(cond) #jc
        condnc = Decode(3, 4)(cond) #jnc
        jumpc = LUT((A0&A2)|(A1&~A2), 3)(condc, condnc, c)

        always = Decode(15, 4)(cond)

        # jump is jump always of jump cond 
        cond = Or(3)(always, jumpz, jumpc) 

        jump = And(2)(jumpinst, cond)

        wire(jump, io.jump)

