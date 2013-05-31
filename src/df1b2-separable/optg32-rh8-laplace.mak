LIBPATH =gcc32-rh8olp
LIBNAME = libdf1b2o.a
SRCDIR =  src
vpath %.obj $(LIBPATH)

.SUFFIXES: .obj .cpp

.PHONY: disk
include objects.lst

all: disk

#disk: $(DISKDIR)/lib/$(LIBNAME) $(DISKDIR)/bin/tpl2rem
disk: $(DISKDIR)/lib/$(LIBNAME) 
	cp adpool.h $(DISKDIR)/include
	cp adrndeff.h $(DISKDIR)/include
	cp df1b2fun.h $(DISKDIR)/include
	cp df3fun.h $(DISKDIR)/include
	cp df1b2fnl.h $(DISKDIR)/include
	cp df1b2loc.h $(DISKDIR)/include
	cp smartbuf.h $(DISKDIR)/include
	cp seddf1b* sedf1b2* $(DISKDIR)/bin

$(DISKDIR)/lib/$(LIBNAME): $(OBJ0) $(OBJ1) $(OBJ2) $(OBJ3)
	$(AR) -rs $@ $(LIBPATH)/*.obj

$(DISKDIR)/bin/tpl2rem: tpl2rem.c
	$(CC) $(CFLAGS) -o $@ $<

tpl2rem.c: tpl2rem.lex
	flex $<
	sed -f sedflex lex.yy.c > $@

%.obj: %.cpp
	$(CXX) $(CXXFLAGS)  $< -o $(LIBPATH)/$*.obj
