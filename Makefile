CC = gcc 
CFLAGS = -g -std=c99 -Wall -Werror 
LIBS = -lirods_client -lirods_common -lstdc++ -lssl -lcrypto -lpthread -ldl -lm -lrt -ljansson

PREFIX = /usr
CPPFLAGS = -I$(PREFIX)/include -I$(PREFIX)/include/irods
LDFLAGS = -L$(PREFIX)/lib -L$(PREFIX)/lib/irods/externals

all: test

test_client: test_client.c
	$(CC) $($CFLAGS) $(CPPFLAGS) -o test_client test_client.c $(LDFLAGS) $(LIBS)

test: test_client
	./test_client

clean:
	rm test_client

.PHONY: all test clean
