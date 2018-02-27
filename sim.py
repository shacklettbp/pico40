import os
os.environ['MANTLE'] = 'coreir'
from magma import *
from pico40.asm import *
from pico40.setup import makepico
from magma.simulator.mdb import simulate
from magma.simulator.python_simulator import PythonSimulator 
from magma.simulator.coreir_simulator import CoreIRSimulator

def prog():
    ldlo(r0, 2)
    ldlo(r1, 2)
    add(r1,r0)
    st(r1, 0)
    jmp(0)

class MainCircuit(Circuit):
    name = 'main'
    IO = ['I', In(Bits(8)), 'O', Out(Bits(8)), 'CLK', In(Clock)]
    @classmethod
    def definition(circuit):
        pico, romb = makepico(prog, circuit.I, circuit.O, 8, 8, None)

#simulate(MainCircuit, PythonSimulator)
#simulate(MainCircuit, CoreIRSimulator)
compile('coreir_proc', MainCircuit, output='coreir')
