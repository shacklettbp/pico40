import os
os.environ['MANTLE'] = 'coreir'
from pico40.asm import *
from pico40.setup import makepicoicestick
from magma.simulator.mdb import simulate

def prog():
    ldlo(r0, 2)
    ldlo(r1, 2)
    add(r1,r0)
    st(r1, 0)
    jmp(0)

main = makepicoicestick(prog, 8, 8)
simulate(main)
