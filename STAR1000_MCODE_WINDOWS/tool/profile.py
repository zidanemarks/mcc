#!/usr/bin/python
#the tool the analyze the profiling result from Deana FW
#prefer to use PyScripter
import os
import sys

symbol_list = []
total_probe_count = 0


class SymbolAddr:
    def __init__(self, name, addr, size):
        self.name = name
        self.addr = addr
        self.size = size
        self.probed = 0
        self.distribution = [0]*(size+1)

    def probe(self, addr):
        self.probed += 1
        index = min(addr-self.addr, self.size)
        self.distribution[index] += 1

    def  __repr__(self):
        return "%5d   %s (0x%x, %d)" % \
                (self.probed, self.name, self.addr, self.size)


def list_hot_functions():
    #print highly probed functions
    print "total probe count:", total_probe_count
    print "=========================="
    print "ratio count  function name"
    symbol_list.sort(key=lambda x: x.probed, reverse=True)
    for symbol in symbol_list:
        if symbol.probed > total_probe_count/100:
            print "%.2f" % (float(symbol.probed)/total_probe_count),
            print symbol
    print

def collect_probe_data():
    global symbol_list, total_probe_count

    #get all symbol start address from list file
    with open("img\\deana.lst") as lfile:
        for line in lfile.readlines():
            str_list = line.split()

            #the line we are looking for
            if len(str_list) != 6:
                continue

            #get the symbol and address string of code entries
            symbol, address, type, code, size_str = str_list[:5]
            if code != "Code":
                continue

            start_addr = int(address, 0)
            #only cares the code in 128K SRAM
            if start_addr > 128*1024:
                continue

            size = int(size_str)
            symbol_list.append(SymbolAddr(symbol, start_addr, size))

    #analyze the profile result
    with open("profile.log") as pfile:
        for line in pfile.readlines():
            if line.startswith("[PROFILE]"):
                #print the result on last CPU
                if total_probe_count > 0:
                    list_hot_functions()
                    total_probe_count = 0
                #clear probe times for the next CPU
                for symbol in symbol_list:
                    symbol.probed = 0
                #sort by address
                symbol_list.sort(key=lambda x: x.addr)
                print line,

            if len(line) == 51: #valid line
                for addr_str in line.split(' ')[1:]:
                    addr = int(addr_str, 16)
                    target = symbol_list[0]

                    #search the function by address
                    for symbol in symbol_list:
                        if symbol.addr < addr:
                            target = symbol
                        else:
                            break

                    #add one probe
                    target.probe(addr)
                    total_probe_count += 1
                    #print target


def list_distribution(function):
    print "details in", function
    for symbol in symbol_list:
        if symbol.name == function:
            lineno = 0
            for called_times in symbol.distribution:
                if called_times > 0:
                    print "0x%x: %d" % (symbol.addr+lineno, called_times)
                lineno += 1


if __name__ == '__main__':
    collect_probe_data()
    list_hot_functions()
    if len(sys.argv) == 2:
        list_distribution(sys.argv[1])
