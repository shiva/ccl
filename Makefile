#----------------------------------------------------
#                  UNIX makefile
# Creates the library libccl.a and a small test program "dotest"
# 
#---------------------------------------------------
# Optimized CFLAGS setting
CFLAGS=-g -Wno-pointer-sign -DUNIX -Wall -D__MAC_OSX
CC=gcc
# Debug CFLAGS setting
#CFLAGS=-Wno-pointer-sign -DUNIX -Wall -g
SRC= src/vector.c src/bloom.c src/error.c src/dlist.c src/qsortex.c src/heap.c \
 src/deque.c src/hashtable.c src/malloc_debug.c include/containers.h include/ccl_internal.h \
 include/stdint.h src/pool.c src/pooldebug.c src/scapegoat.c src/smallpool.c include/ccl_internal.h \
 src/bitstrings.c src/dictionarygen.c src/list.c src/memorymanager.c src/strcollection.c src/searchtree.c \
 include/containers.h include/ccl_internal.h src/redblacktree.c src/fgetline.c src/generic.c src/queue.c src/buffer.c src/observer.c \
 src/valarraydouble.c src/vectorsize_t.c src/valarrayint.c src/valarraylongdouble.c src/valarraygen.c \
 src/valarrayshort.c src/valarrayfloat.c src/valarrayuint.c src/valarraylonglong.c \
 src/valarrayulonglong.c src/sequential.c src/iMask.c src/wstrcollection.c src/strcollectiongen.c \
 src/stringlistgen.c include/stringlistgen.h src/stringlist.c include/stringlist.h include/wstringlist.h \
    src/priorityqueue.c src/intlist.c src/listgen.c src/SuffixTree.c 
DOCS=
MAKEFILES=Makefile Makefile.lcc Makefile.msvc

OBJS=vector.o error.o dlist.o qsortex.o bitstrings.o generic.o \
    dictionary.o wdictionary.o list.o strcollection.o searchtree.o heap.o malloc_debug.o \
    bloom.o fgetline.o pool.o pooldebug.o redblacktree.o scapegoat.o queue.o \
    buffer.o observer.o valarraydouble.o valarrayint.o vectorsize_t.o \
    valarraylongdouble.o valarrayshort.o valarrayfloat.o valarrayuint.o \
    valarraylonglong.o valarrayulonglong.o memorymanager.o sequential.o \
    iMask.o deque.o hashtable.o wstrcollection.o stringlist.o wstringlist.o \
    priorityqueue.o intlist.o doublelist.o longlonglist.o intdlist.o \
    doubledlist.o longlongdlist.o SuffixTree.o
LIST_GENERIC=src/listgen.c include/listgen.h
DLIST_GENERIC=src/dlistgen.c include/dlistgen.h

dotest:	libccl.a test.o
	gcc -o dotest -g $(CFLAGS) src/test.c libccl.a -lm
libccl.a:	$(OBJS) include/containers.h include/ccl_internal.h 
	ar r libccl.a $(OBJS)
clean:
	rm -rf $(OBJS) libccl.a dotest dotest.dSYM container-lib-src.zip
zip:	$(SRC)
	rm container-lib-src.zip;rm -rf ccl;svn export . ccl;zip -9 -r  container-lib-src.zip ccl 

valarraylongdouble.o:   src/valarraygen.c src/valarraylongdouble.c include/containers.h include/ccl_internal.h include/valarraygen.h include/valarray.h
valarraydouble.o:       src/valarraygen.c src/valarraydouble.c include/containers.h include/ccl_internal.h include/valarraygen.h include/valarray.h
valarrayint.o:          src/valarraygen.c src/valarrayint.c include/containers.h include/ccl_internal.h include/valarraygen.h include/valarray.h
valarrayshort.o: src/valarraygen.c src/valarrayshort.c include/containers.h include/ccl_internal.h include/valarraygen.h include/valarray.h
vectorsize_t.o:       src/vectorgen.c src/vectorsize_t.c include/containers.h include/ccl_internal.h include/vectorgen.h 
valarrayfloat.o: src/valarraygen.c src/valarrayfloat.c include/containers.h include/ccl_internal.h include/valarraygen.h include/valarray.h
valarrayuint.o:	 src/valarraygen.c src/valarrayuint.c include/containers.h include/ccl_internal.h include/valarraygen.h include/valarray.h
valarraylonglong.o: src/valarraygen.c src/valarraylonglong.c include/containers.h include/ccl_internal.h include/valarraygen.h include/valarray.h
valarrayulonglong.o:     src/valarraygen.c src/valarrayulonglong.c include/containers.h include/ccl_internal.h include/valarraygen.h include/valarray.h
bitstrings.o: include/containers.h include/ccl_internal.h src/bitstrings.c 
searchtree.o: include/containers.h include/ccl_internal.h src/searchtree.c 
malloc_debug.o: include/containers.h include/ccl_internal.h src/malloc_debug.c 
fgetline.o: include/containers.h include/ccl_internal.h src/fgetline.c 
pool.o: include/containers.h include/ccl_internal.h src/pool.c 
pooldebug.o: include/containers.h include/ccl_internal.h src/pooldebug.c 
redblacktree.o: include/containers.h include/ccl_internal.h src/redblacktree.c 
observer.o: include/containers.h include/ccl_internal.h src/observer.c 
buffer.o: include/containers.h include/ccl_internal.h src/buffer.c
vector.o: include/containers.h include/ccl_internal.h src/vector.c
buffer.o: include/containers.h include/ccl_internal.h src/buffer.c
vector.o: include/containers.h include/ccl_internal.h src/vector.c
bloom.o: include/containers.h include/ccl_internal.h src/bloom.c
error.o: include/containers.h include/ccl_internal.h src/error.c
dlist.o:	 src/dlist.c include/containers.h include/ccl_internal.h
deque.o: src/deque.c include/containers.h include/ccl_internal.h
hashtable.o: src/hashtable.c include/containers.h include/ccl_internal.h
dlist.o: src/dlist.c include/containers.h include/ccl_internal.h
list.o:	 src/list.c include/containers.h include/ccl_internal.h
dictionary.o: src/dictionary.c src/dictionarygen.c include/containers.h include/ccl_internal.h
wdictionary.o: src/wdictionary.c src/dictionarygen.c include/containers.h include/ccl_internal.h
qsortex.o: src/qsortex.c include/containers.h include/ccl_internal.h
generic.o: src/generic.c include/containers.h include/ccl_internal.h
heap.o: src/heap.c include/containers.h include/ccl_internal.h
memorymanager.o: src/memorymanager.c include/containers.h include/ccl_internal.h
sequential.o: src/sequential.c include/containers.h include/ccl_internal.h
iMask.o: src/iMask.c include/containers.h include/ccl_internal.h
scapegoat.o: src/scapegoat.c include/containers.h include/ccl_internal.h
wstrcollection.o: src/wstrcollection.c src/strcollectiongen.c include/containers.h include/ccl_internal.h
strcollection.o:       src/strcollection.c src/strcollectiongen.c include/containers.h include/ccl_internal.h
stringlist.o: src/stringlist.c src/stringlistgen.c include/containers.h include/ccl_internal.h include/stringlist.h include/stringlistgen.h
wstringlist.o: src/wstringlist.c src/stringlistgen.c include/stringlistgen.h include/wstringlist.h include/containers.h include/ccl_internal.h
queue.o: src/queue.c include/ccl_internal.h include/containers.h
priorityqueue.o: src/priorityqueue.c include/ccl_internal.h include/containers.h
intlist.o: include/intlist.h src/intlist.c include/ccl_internal.h include/containers.h $(LIST_GENERIC)
doublelist.o: include/doublelist.h src/doublelist.c include/ccl_internal.h include/containers.h $(LIST_GENERIC)
longlonglist.o: include/longlonglist.h src/longlonglist.c include/ccl_internal.h include/containers.h $(LIST_GENERIC)
intdlist.o:      include/intdlist.h src/intdlist.c include/ccl_internal.h include/containers.h $(LIST_GENERIC)
doubledlist.o:   include/doubledlist.h src/doubledlist.c include/ccl_internal.h include/containers.h $(DLIST_GENERIC)
longlongdlist.o: include/longlongdlist.h src/longlongdlist.c include/ccl_internal.h include/containers.h $(DLIST_GENERIC)
SuffixTree.o: src/SuffixTree.c include/containers.h
