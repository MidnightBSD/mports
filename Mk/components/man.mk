# man.mk - Manual Pages
#
# Man_MAINTAINER=	luke@midnightbsd.org
#
#

.if ${PREFIX} == /usr
MANPREFIX?=	/usr/share
.else
MANPREFIX?=	${PREFIX}
.endif

.for sect in 1 2 3 4 5 6 7 8 9
MAN${sect}PREFIX?=	${MANPREFIX}
.endfor
MANLPREFIX?=	${MANPREFIX}
MANNPREFIX?=	${MANPREFIX}

MANLANG?=	""	# english only by default

.if !defined(NOMANCOMPRESS)
MANEXT?=	.gz
.endif

.if (defined(MLINKS) || defined(_MLINKS_PREPEND)) && !defined(_MLINKS)
__pmlinks!=	${ECHO_CMD} '${MLINKS:S/	/ /}' | ${AWK} \
 '{ if (NF % 2 != 0) { print "broken"; exit; } \
	for (i=1; i<=NF; i++) { \
		if ($$i ~ /^-$$/ && i != 1 && i % 2 != 0) \
			{ $$i = $$(i-2); printf " " $$i " "; } \
		else if ($$i ~ /^[^ ]+\.[1-9ln][^. ]*$$/ || $$i ~ /^\//) \
			printf " " $$i " "; \
		else \
			{ print "broken"; exit; } \
	} \
  }' | ${SED} -e 's \([^/ ][^ ]*\.\(.\)[^. ]*\) $${MAN\2PREFIX}/$$$$$$$${__lang}/man\2/\1${MANEXT}g' -e 's/ //g' -e 's/MANlPREFIX/MANLPREFIX/g' -e 's/MANnPREFIX/MANNPREFIX/g'
.if ${__pmlinks:Mbroken} == "broken"
check-makevars::
	@${ECHO_MSG} "${PKGNAME}: Makefile error: unable to parse MLINKS."
	@${FALSE}
.endif
_MLINKS=	${_MLINKS_PREPEND}
.for lang in ${MANLANG:S%^%man/%:S%^man/""$%man%}
.for ___pmlinks in ${__pmlinks}
.for __lang in ${lang}
_MLINKS+=	${___pmlinks:S// /g}
.endfor
.endfor
.endfor
.endif
_COUNT=0
.for ___tpmlinks in ${_MLINKS}
.if ${_COUNT} == "1"
_TMLINKS+=	${___tpmlinks}
_COUNT=0
.else
_COUNT=1
.endif
.endfor


.for ___link in ${_MLINKS}
_FAKE_MLINKS += ${FAKE_DESTDIR}${___link}
.endfor

# XXX 20040119 This next line should read:
# .for manlang in ${MANLANG:S%^%man/%:S%^man/""$%man%}
# but there is currently a bug in make(1) that prevents the double-quote
# substitution from working correctly.  Once that problem is addressed,
# and has had a enough time to mature, this hack should be removed.
.for manlang in ${MANLANG:S%^%man/%:S%^man/""$%man%:S%^man/"$%man%}

.for sect in 1 2 3 4 5 6 7 8 9 L N
.if defined(MAN${sect})
_MANPAGES+=	${MAN${sect}:S%^%${MAN${sect}PREFIX}/${manlang}/man${sect:L}/%}
.endif
.endfor

.endfor

.if !defined(_TMLINKS)
_TMLINKS=
.endif

.if defined(_MANPAGES)

.if defined(NOMANCOMPRESS)
__MANPAGES=	${_MANPAGES:S%^${PREFIX}/%%}
.else
__MANPAGES=	${_MANPAGES:S%^${PREFIX}/%%:S%$%.gz%}
.endif

.for m in ${_MANPAGES}
_FAKEMAN += ${FAKE_DESTDIR}${m}  
.endfor

.endif
