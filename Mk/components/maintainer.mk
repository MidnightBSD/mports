#
# $MidnightBSD: mports/Mk/components/maintainer.mk,v 1.1 2009/03/20 06:44:54 ctriv Exp $
#
# maintainer.mk
#
# Targets used by port maintainers.
#

.if !target(makepatch)
makepatch:
	@cd ${.CURDIR} && ${MKDIR} ${FILESDIR}
	@(cd ${WRKSRC}; \
		for i in `find . -type f -name '*.orig'`; do \
			ORG=$$i; \
			NEW=$${i%.orig}; \
			OUT=${FILESDIR}`${ECHO} $${NEW} | \
				${SED} -e 's|/|__|g' \
					-e 's|^\.__|/patch-|'`; \
			${ECHO} ${DIFF} -ud $${ORG} $${NEW} '>' $${OUT}; \
			${DIFF} -ud $${ORG} $${NEW} > $${OUT} || ${TRUE}; \
		done \
	)
.endif


GENPLIST?=				${.CURDIR}/gen-plist

# This needs to be something egrep can understand
MAKEPLIST_IGNORE?=		(\.packlist$$)  

# Try to make a plist.  This will probably need to be edited.
.if !target(makeplist)
makeplist: 
	@cd ${.CURDIR} && ${SETENV} _MAKEPLIST=1 ${MAKE} fake
	@${ECHO_MSG} "===>   Generating packing list"
	@if [ ! -f ${DESCR} ]; then ${ECHO_MSG} "** Missing pkg-descr for ${PKGNAME}."; exit 1; fi
	@${MKDIR} `${DIRNAME} ${GENPLIST}`
	@${ECHO_CMD} '@comment $$MidnightBSD: mports/Mk/components/maintainer.mk,v 1.1 2009/03/20 06:44:54 ctriv Exp $$' > ${GENPLIST}

.	if !defined(NO_MTREE)
		@cd ${FAKE_DESTDIR}${PREFIX}; directories=""; files=""; \
		new=`${MTREE_CMD} -Uf ${MTREE_FILE} | ${SED} -e 's/\s*extra$$//' | ${EGREP} -v "^man/|^share/nls/POSIX|^share/nls/en_US.US-ASCII"`; \
		for file in $$new; do \
			if [ ! -L $$file ] && [ -d $$file ]; then \
				tree=`${FIND} -d $$file -type f -or -type d -or -type l | ${EGREP} -v "man/man[123456789]`; \
				for f in $$tree; do \
					if [ -d $$f ]; then \
						directories="$$directories $$f"; \
					else \
						files="$$files $$f"; \
					fi; \
				done; \
			else \
				files="$$files $$file"; \
			fi; \
		done; \
		for file in $$files; do \
			${ECHO_CMD} $$file >> ${GENPLIST}; \
		done; \
		for dir in $$directories; do \
			${ECHO_CMD} "@dirrm $$dir" >> ${GENPLIST}; \
		done;
.	else 
		@cd ${FAKE_DESTDIR}${PREFIX}; \
		${FIND} -d . ! -type d	| ${SED} -e 's:^\./::' >> ${GENPLIST}; \
		${FIND} -d . -type d ! -name . | ${SED} -e 's:^\./:@dirrm :' >> ${GENPLIST};
.	endif


.	if defined(USE_LINUX) && ${PREFIX} != ${LINUXBASE_REL}
		@${ECHO_CMD} '@cwd ${LINUXBASE_REL}' >> ${GENPLIST}
		@cd ${FAKE_DESTDIR}${LINUXBASE_REL}; directoriess=""; files=""; \
		new=`${MTREE_CMD} -Uf ${MTREE_LINUX_FILE} | ${SED} -e 's/\s*extra$$//'`; \
		for file in $$new; do \
			if [ -d $$file ]; then \
				tree=`${FIND} -d $$file -type f -or -type d | ${EGREP} -v "man/man[123456789]"`; \
				for f in $$tree; do \
					if [ -d $$f ]; then \
						directories="$$directories $$f"; \
					else \
						files="$$files $$f"; \
					fi; \
				done; \
			else \
				files="$$files $$file"; \
			fi; \
		done; \
		for file in $$files; do \
			${ECHO_CMD} $$file >> ${GENPLIST}; \
		done; \
		for dir in $$directories; do \
			${ECHO_CMD} "@dirrm " >> ${GENPLIST}; \
		done;
		@${ECHO_CMD} '@cwd ${PREFIX}' >> ${GENPLIST}
.	endif
	@perl -mstrict -mwarnings -e '\
		my $$raw = q`${PLIST_SUB}`; \
		my %sub; \
		while ($$raw =~ m/(\w+)=(?:(?:"([^"]+)")|(\S+))/g) { \
			my $$from = $$2 || $$3; \
			my $$to = $$1; \
			next if $$to eq "PREFIX" || $$to eq "XAWVER" || !$$from || $$from eq q[""]; \
			$$sub{$$from}  = $$to; \
		} \
		my $$subst = q:sub { \
			while (<>) { \
		:; \
		foreach my $$key (sort { length $$b <=> length $$a } keys %sub) { \
			$$subst .= "s/\Q$$key\E/%%\Q$$sub{$$key}\E%%/g;\n"; \
		} \
		$$subst .= "print; }}"; \
		$$subst = eval $$subst || die "Could not eval sub: $$@\n"; \
		$$subst->();' <${GENPLIST} >${GENPLIST}.tmp
	@${EGREP} -v "${MAKEPLIST_IGNORE}" < ${GENPLIST}.tmp >${GENPLIST}
	@${RM} ${GENPLIST}.tmp

.endif


update-patches:
	@toedit=`PATCH_WRKSRC=${PATCH_WRKSRC} \
		PATCHDIR=${PATCHDIR} \
		PATCH_LIST=${PATCHDIR}/patch-* \
		DIFF_ARGS=${DIFF_ARGS} \
		DISTORIG=${DISTORIG} \
		${SH} ${PORTSDIR}/Tools/scripts/update-patches`; \
	case $$toedit in "");; \
	*) ${ECHO_CMD} -n 'edit patches: '; read i; \
	cd ${PATCHDIR} && $${VISUAL:-$${EDIT:-/usr/bin/vi}} $$toedit;; esac


_CHECKSECS=	1 2 3 4 5 6 7 8 9
manvars: fake
.for SEC in ${_CHECKSECS}
	@cd ${FAKE_DESTDIR}; \
		_pages=`${FIND} . -path '*man/man${SEC}/*' -type f | perl -pe 'chomp; s/(\.gz)+$$//; s:.*/::; $$_ .= " ";'`; \
		if [ "x$$_pages" != "x" ]; then \
			echo "MAN${SEC}= $$_pages"; \
		fi
.endfor
