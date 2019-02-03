#
# $MidnightBSD$
#

#
# A simple makefile to format our POD into manpages and stick them in src. 
# It's up to you to commit them to cvs after that.
# 


POD2MAN=	/usr/bin/pod2man

.if !exists(${POD2MAN}) 
.error "pod2man not found.  Perhaps you don't have perl installed?"
.endif

POD5=	bsd.mport.mk.pod
MAN5=	${POD5:S/.pod/.5/g}

MANS=	${MAN5}

all: ${MANS}

.for SEC in "1 2 3 4 5 6 7 8"
.    for PAGE in ${MAN${SEC}:S/.${SEC}//g}
${PAGE}.${SEC}: ${PAGE}.pod
	${POD2MAN} -r MidnightBSD -c "MidnightBSD File Formats Manual" -n ${PAGE} -s ${SEC} ${PAGE}.pod > ${PAGE}.${SEC}
.    endfor
.endfor

.PHONY: clean

clean:
	rm -f ${MANS}
