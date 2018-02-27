from magma import *
from magma.bitutils import int2seq, seq2int
from mantle import *
import coreir as coreir_
from pico40 import assemble, Pico

__all__ = ['makepico', 'makepicoicestick']

def DefineCoreirRom(depth, width, init):
    name = "coreir_mem{}x{}".format(depth,width)
    addr_width = max((depth-1).bit_length(), 1)
    IO = ["raddr", In(Bits(addr_width)),
          "rdata", Out(Bits(width)),
          "waddr", In(Bits(addr_width)),
          "wdata", In(Bits(width)),
          "clk", In(Clock),
          "wen", In(Bit) ]
    init = [b for i in init for b in int2seq(i, width)]
    init = ''.join([str(b) for b in init])
    return DeclareCircuit(name, *IO, verilog_name="coreir_mem",
            coreir_name="mem", coreir_lib="coreir",
            coreir_genargs={"width": width, "depth": depth, "has_init": True,}, 
            coreir_configargs={"init": coreir_.type.BitVector(width*depth, init)})

def MakeRom(height, width, mem):
    class RomCircuit(Circuit):
        name = 'rom'
        addr_width = max(height.bit_length() - 1, 1)
        IO = ['RADDR', In(Bits(addr_width)), 'RDATA', Out(Bits(width)), "CLK", In(Clock)]
        @classmethod
        def definition(circuit):
            coreir_mem = DefineCoreirRom(height, width, mem)()
            wire(0, coreir_mem.wen)
            wire(array([0]*len(coreir_mem.waddr)), coreir_mem.waddr)
            wire(array([0]*len(coreir_mem.wdata)), coreir_mem.wdata)
            coreir_reg = DefineCoreirReg(width)()
            wire(coreir_mem.rdata, coreir_reg.interface.ports['in'])
            wire(coreir_reg.out, circuit.RDATA)
            wire(circuit.RADDR, coreir_mem.raddr)

    return RomCircuit()
    
def makepico(prog, input, output, ADDRN, DATAN, debug):

    mem = assemble(prog, 1 << ADDRN)

    romb = MakeRom(len(mem), 16, mem) # this should have a width=16
    #print(repr(romb))
    #print('ADDRN',len(romb.RADDR))
    #print('INSTN',len(romb.RDATA))
    assert len(romb.RDATA) == 16

    pico = Pico(ADDRN, DATAN, debug)
    #print('ADDRN',len(pico.addr))
    #print('INSTN',len(pico.data))

    wire(pico.addr, romb.RADDR)
    wire(romb.RDATA, pico.data)

    #input = Input(DATAN, inputs)
    #wire(pico.port, input.A)
    #wire(input.O, pico.I)
    wire(input, pico.I)

    if debug is None:
        #output = Output(DATAN, outputs)
        #wire(pico.port, output.A)
        reg = Register(DATAN, has_ce=True)
        reg(pico.O, ce=pico.we)
        wire(reg.O, output)
    else:
        wire(pico.O, output)

    return pico, romb

def makepicoicestick(prog, ADDRN, DATAN, debug=None):

    icestick = IceStick()
    icestick.Clock.on()
    for i in range(8):
        icestick.J1[i].input().on()
    for i in range(8):
        icestick.J3[i].output().on()

    main = icestick.main()

    pico, romb = makepico(prog, main.J1, main.J3, ADDRN, DATAN, debug)

    return main
