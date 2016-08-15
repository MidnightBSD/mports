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

MANDIRS+=	${MANPREFIX}/man
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

# Compress all manpage not already compressed which are not hardlinks
# Find all manpages which are not compressed and are hadlinks, and only get the
# list of inodes concerned, for each of them compress the first one found and recreate the hardlinks for the others
# Fixes all dead symlinks left by the previous round
.if !target(fake-compress-man)
fake-compress-man:
	@${ECHO_MSG} "====> Compressing man pages (fake-compress-man)"
	@mdirs= ; \
	for dir in ${MANDIRS:S/^/${FAKE_DESTDIR}/} ; do \
		[ -d $$dir ] && mdirs="$$mdirs $$dir" ;\
	done ; \
	for dir in $$mdirs; do \
	${FIND} $$dir -type f \! -name "*.gz" -links 1 -exec ${GZIP_CMD} {} \; ; \
	${FIND} $$dir -type f \! -name "*.gz" \! -links 1 -exec ${STAT} -f '%i' {} \; | \
		${SORT} -u | while read inode ; do \
			unset ref ; \
			for f in $$(${FIND} $$dir -type f -inum $${inode} -print); do \
				if [ -z $$ref ]; then \
					ref=$${f}.gz ; \
					${GZIP_CMD} $${f} ; \
					continue ; \
				fi ; \
				${RM} -f $${f} ; \
				(cd $${f%/*}; ${LN} -f $${ref##*/} $${f##*/}.gz) ; \
				done ; \
			done ; \
		${FIND} $$dir -type l \! -name "*.gz" | while read link ; do \
				dest=$$(readlink $$link) ; \
				rm -f $$link ; \
				(cd $${link%/*} ; ${LN} -sf $${dest##*/}.gz $${link##*/}.gz) ;\
		done; \
	done
.endif

