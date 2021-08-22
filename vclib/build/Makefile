#=======================================================================
# UCB CS250 Makefile for vcs-sim-rtl
#-----------------------------------------------------------------------
#
# This makefile will build a rtl simulator and run various tests to
# verify proper functionality.
#

default: run-unit-tests

basedir = ..
srcdir  = $(basedir)/src

instname    = vclib
instbasedir = $(UCB_VLSI_HOME)/install

#------------------------------------------------------------
# Library components

vlibsrcs = \
	$(srcdir)/vcTestSource.v \
	$(srcdir)/vcTestSink.v \
	$(srcdir)/vcMuxes.v \
	$(srcdir)/vcStateElements.v \
	$(srcdir)/vcRAMs.v \
	$(srcdir)/vcQueues.v \
	$(srcdir)/vcMemories.v \
	$(srcdir)/vcArith.v \
	$(srcdir)/vcDecoders.v \
	$(srcdir)/vcTest.v \
	$(srcdir)/vcTrace.v \

#------------------------------------------------------------
# Unit tests

unit_tests = \
	vcMuxes.t.v \
	vcQueues.t.v \
	vcStateElements.t.v \
	vcMemories.t.v \
	vcArith.t.v \
	vcRAMs.t.v \

#------------------------------------------------------------
# Build unit tests

VCS      = vcs -full64
VCS_OPTS = -notice -PP -line +lint=all +v2k

utests_exe = $(patsubst %.t.v,%-unit-test,$(unit_tests))
utests_out = $(addsuffix .out, $(utests_exe))

$(utests_exe): %-unit-test: $(srcdir)/%.t.v $(vlibsrcs)
	$(VCS) $(VCS_OPTS) +incdir+$(srcdir) -o $@ $< \
           $(addprefix -v ,$(vlibsrcs)) 

$(utests_out): %.out: %
	./$< +verbose=1 > $@

run-unit-tests: $(utests_out)
	@echo; grep -h -e "Entering Test Suite" -e "FAILED" $(utests_out); echo;

junk += $(utests_exe) $(utests_out)

#------------------------------------------------------------
# Install

date_suffix = $(shell date +%Y-%m-%d_%H-%M)
install_dir = $(instbasedir)/$(instname)-$(date_suffix)
latest_install = $(shell ls -1 -d $(instbasedir)/$(instname)* | tail -n 1)

install:
	mkdir $(install_dir)
	cp $(vlibsrcs) $(install_dir)

install-link:
	rm -rf $(instbasedir)/$(instname)
	ln -s $(latest_install) $(instbasedir)/$(instname)

#------------------------------------------------------------
# Clean up

clean:
	rm -rf $(junk) *~ \#* *.log *.cmd *.daidir simv* csrc *.vpd vcs.key ucli.key
