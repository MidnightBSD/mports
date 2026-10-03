#
# Format the POD documentation into manual pages.
#
# perl is not in base on MidnightBSD 4.0+, so pod2man comes from lang/perl5.
.if exists(/usr/local/bin/pod2man)
POD2MAN?=	/usr/local/bin/pod2man
.else
POD2MAN?=	/usr/bin/pod2man
.endif

.if !exists(${POD2MAN})
.error "pod2man not found.  Install lang/perl5 (mport install perl5)."
.endif

POD5=	bsd.mport.mk.pod
MAN5=	${POD5:S/.pod$/.5/}

all: ${MAN5}

.SUFFIXES: .pod .5

.pod.5:
	${POD2MAN} -r MidnightBSD -c "MidnightBSD File Formats Manual" \
		-n ${.TARGET:R} -s 5 ${.IMPSRC} > ${.TARGET}

check:
	podchecker ${POD5}

.PHONY: all check clean

clean:
	rm -f ${MAN5}
