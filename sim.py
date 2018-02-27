import os
os.environ['MANTLE'] = 'coreir'
from magma import *
from pico40.asm import *
from pico40.setup import makepico
from magma.simulator.mdb import simulate

def prog():
    ldlo(r0, 2)
    ldlo(r1, 2)
    add(r1,r0)
    st(r1, 0)
    jmp(0)

class MainCircuit(Circuit):
    name = 'main'
    IO = ['I0', In(Bits(8)), 'I1', In(Bits(8)), 'CLK', In(Clock)]
    @classmethod
    def definition(circuit):
        pico, romb = makepico(prog, circuit.I0, circuit.I1, 8, 8, None)

compile('coreir_proc', MainCircuit, output='coreir')
