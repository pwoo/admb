GTEST_DIR=../googletest-read-only

all: gtest-all
	./gtest-all

gtest-all: main.cpp test_adstring_strcase.cpp test_fmm_control.cpp test_atan2.cpp test_adstring_array.cpp test_dlist.cpp test_ad_comm.cpp test_adthread_manager.cpp
	cp $(GTEST_DIR)/gtest-all.o .
	CXXFLAGS=-I$(GTEST_DIR)/include ../../admb gtest-all.o $^

clean:
	@rm -vf gtest-all *.o
	@rm -f variance
	@rm -f eigv.rpt
	@rm -f simple.log
	@rm -f fmin.log