# kompilator c
CCOMP = gcc

# konsolidator
LOADER = gcc

# opcje optymalizacji:
# wersja do debugowania
OPT = -g -DDEBUG
# wersja zoptymalizowana do mierzenia czasu
# OPT = -O3

# pliki naglowkowe
INC = -I/usr/include

# biblioteki
LIB = -L/usr/lib64

# zaleznosci i komendy
p2p: p2p.o
	$(LOADER) $(OPT) -pthread p2p.o -o p2p $(LIB)

p2p.o: p2p.c
	$(CCOMP) -c $(OPT) p2p.c $(INC)

clean:
	rm -f *.o
