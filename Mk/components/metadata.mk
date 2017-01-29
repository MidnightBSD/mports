# Metadata support for mports.  This file has the targets for displaying bits 
# of metadata, such as `describe` and `describe-yaml`
#
#
# $MidnightBSD$
#

# This target generates an index entry suitable for aggregation into
# a large index.  Format is:
#
# distribution-name|port-path|installation-prefix|comment| \
#  description-file|maintainer|categories|extract-depends| \
#  patch-depends|fetch-depends|build-depends|run-depends|www site

.if !target(describe)
describe:
	@${ECHO_CMD} -n "${PKGNAME}|${.CURDIR}|${PREFIX}|"
.if defined(COMMENT)
	@${ECHO_CMD} -n ${COMMENT:Q}
.else
	@${ECHO_CMD} -n '** No Description'
.endif
	@perl -e ' \
		if ( -f q{${DESCR}} ) { \
			print q{|${DESCR}}; \
		} else { \
			print q{|/dev/null}; \
		} \
		print q{|${MAINTAINER}|${CATEGORIES}|}; \
		@edirs = map((split /:/)[1], split(q{ }, q{${EXTRACT_DEPENDS}})); \
		@pdirs = map((split /:/)[1], split(q{ }, q{${PATCH_DEPENDS}})); \
		@fdirs = map((split /:/)[1], split(q{ }, q{${FETCH_DEPENDS}})); \
		@bdirs = map((split /:/)[1], split(q{ }, q{${BUILD_DEPENDS}})); \
		@rdirs = map((split /:/)[1], split(q{ }, q{${RUN_DEPENDS}})); \
		@ddirs = map((split /:/)[0], split(q{ }, q{${DEPENDS}})); \
		@ldirs = map((split /:/)[1], split(q{ }, q{${LIB_DEPENDS}})); \
		@pkgdirs = map((split /:/)[1], split(q{ }, q{${PKG_DEPENDS}})); \
		for my $$i (\@edirs, \@pdirs, \@fdirs, \@bdirs, \@rdirs, \@ddirs, \@ldirs, \@pkgdirs) { \
			my @dirs = @$$i; \
			@$$i = (); \
			for (@dirs) { \
				if (index($$_, "/usr/mports/") == -1) { \
					$$_ = "/usr/mports/" . $$_; \
				} \
				if (-d $$_) { \
					push @$$i, $$_; \
				} else { \
					print STDERR qq{${PKGNAME}: \"$$_\" non-existent -- dependency list incomplete\n}; \
					exit(1); \
				} \
			} \
		} \
		for (@edirs, @ddirs) { \
			$$xe{$$_} = 1; \
		} \
		print join(q{ }, sort keys %xe), q{|}; \
		for (@pdirs, @ddirs) { \
			$$xp{$$_} = 1; \
		} \
		print join(q{ }, sort keys %xp), q{|}; \
		for (@fdirs, @ddirs) { \
			$$xf{$$_} = 1; \
		} \
		print join(q{ }, sort keys %xf), q{|}; \
		for (@bdirs, @ddirs, @ldirs) { \
			$$xb{$$_} = 1; \
		} \
		print join(q{ }, sort keys %xb), q{|}; \
		for (@rdirs, @ddirs, @ldirs) { \
			$$xr{$$_} = 1; \
		} \
		print join(q{ }, sort keys %xr), q{|}; \
		if (open(DESCR, q{${DESCR}})) { \
			while (<DESCR>) { \
				if (/^WWW:\s+(\S+)/) { \
					print $$1; \
					last; \
				} \
			} \
		} \
		print qq{\n};'
.endif


#
# describe-yaml
#
# Prints the port's description in YAML markup.  YAML is very human readable, and 
# there are libraries in many languages for conversion to native data structures.
#
# This target requires perl.
.if !target(describe-yaml)
describe-yaml:
	@perl -MYAML -e ' \
		sub uniq (@) {  my %saw;  return grep(!$$saw{$$_}++, @_); } \
		my %port = ( \
			pkgname        => q(${PKGSUBNAME}), \
			name           => q(${PKGORIGIN}), \
			version        => q(${PKGVERSION}), \
			description    => qq(${COMMENT:S/'/\x27/g}), \
			license        => [qw(${LICENSE})], \
			license_perms  => [qw(${LICENSE_PERMS})], \
			license_name   => q(${LICENSE_NAME}), \
			license_text   => q(${LICENSE_TEXT}), \
			categories     => [qw(${CATEGORIES})], \
			is_interactive => q(${IS_INTERACTIVE}) ? 1 : 0, \
			restricted     => q(${RESTRICTED}) ? 1 : 0, \
		); \
		$$port{license} ||= undef; \
		my %depends; \
		$$depends{extract} = [ uniq map((split /:/)[1], qw{${EXTRACT_DEPENDS:S|${PORTSDIR}/||g}}) ]; \
		$$depends{patch}   = [ uniq map((split /:/)[1], qw{${PATCH_DEPENDS:S|${PORTSDIR}/||}})   ]; \
		$$depends{fetch}   = [ uniq map((split /:/)[1], qw{${FETCH_DEPENDS:S|${PORTSDIR}/||}})   ]; \
		$$depends{build}   = [ uniq map((split /:/)[1], qw{${BUILD_DEPENDS:S|${PORTSDIR}/||}})   ]; \
		$$depends{run}     = [ uniq map((split /:/)[1], qw{${RUN_DEPENDS:S|${PORTSDIR}/||}})     ]; \
		$$depends{misc}	   = [ uniq map((split /:/)[0], qw{${DEPENDS:S|${PORTSDIR}/||}})         ]; \
		$$depends{lib}     = [ uniq map((split /:/)[1], qw{${LIB_DEPENDS:S|${PORTSDIR}/||}})     ]; \
		$$port{depends}  = \%depends; \
		open(my $$desc, q(<), q(${DESCR})) || die qq(Could not open ${DESCR}: $$!\n); \
		while (<$$desc>) { \
			if (m/^WWW:\s+(\S+)/) { \
				$$port{www} = $$1; \
				last; \
			} \
		} \
		$$port{www} ||= undef; \
		print Dump(\%port);  '
.endif

www-site:
.if exists(${DESCR})
	@${AWK} '$$1 ~ /^WWW:/ {print $$2}' ${DESCR} | ${HEAD} -1
.else
	@${ECHO_CMD}
.endif

.if !target(readmes)
readmes:	readme
.endif

.if !target(readme)
readme:
	@${RM} -f ${.CURDIR}/README.html
	@cd ${.CURDIR} && ${MAKE} ${__softMAKEFLAGS} ${.CURDIR}/README.html
.endif

${.CURDIR}/README.html:
	@${ECHO_MSG} "===>   Creating README.html for ${PKGNAME}"
	@__softMAKEFLAGS='${__softMAKEFLAGS:S/'/'\''/g}'; \
	${SED} -e 's|%%PORT%%|'$$(${ECHO_CMD} ${.CURDIR} | \
							  ${SED} -e 's|.*/\([^/]*/[^/]*\)$$|\1|')'|g' \
			-e 's|%%PKG%%|${PKGNAME}|g' \
			-e 's|%%LICENSE%%|${LICENSE}|g' \
			-e 's|%%COMMENT%%|'"$$(${ECHO_CMD} ${COMMENT:Q})"'|' \
			-e '/%%COMMENT%%/d' \
			-e 's|%%DESCR%%|'"$$(${ECHO_CMD} ${DESCR} | \
								 ${SED} -e 's|${.CURDIR}/||')"'|' \
			-e 's|%%EMAIL%%|'"$$(${ECHO_CMD} "${MAINTAINER}" | \
								 ${SED} -e 's/([^)]*)//;s/.*<//;s/>.*//')"'|g' \
			-e 's|%%MAINTAINER%%|${MAINTAINER}|g' \
			-e 's|%%WEBSITE%%|'"$$(cd ${.CURDIR} && eval ${MAKE} \
					$${__softMAKEFLAGS} pretty-print-www-site)"'|' \
			-e 's|%%BUILD_DEPENDS%%|'"$$(cd ${.CURDIR} && eval ${MAKE} \
					$${__softMAKEFLAGS} pretty-print-build-depends-list)"'|' \
			-e 's|%%RUN_DEPENDS%%|'"$$(cd ${.CURDIR} && eval ${MAKE} \
					$${__softMAKEFLAGS} pretty-print-run-depends-list)"'|' \
			-e 's|%%TOP%%|'"$$(${ECHO_CMD} ${CATEGORIES} | \
							   ${SED} -e 's| .*||' -e 's|[^/]*|..|g')"'/..|' \
		${TEMPLATES}/README.port >> ${.TARGET}

# The following two targets require an up-to-date INDEX in ${PORTSDIR}

_PRETTY_PRINT_DEPENDS_LIST=\
	if [ ! -r ${INDEXDIR}/${INDEXFILE} ] ; then \
		${ECHO_MSG} "${.TARGET} requires an INDEX file (${INDEXFILE}). Please run make index or make fetchindex."; \
	else \
		target=${.TARGET:C/pretty-print-(.*)-depends-list/\1/} ; \
		if [ "$$target" = "build" ] ; then fldnum=8 ; else fldnum=9 ; fi ; \
		${ECHO_MSG} -n 'This port requires package(s) "' ; \
		${ECHO_MSG} -n `${AWK} -F\| "\\$$1 ~ /^${PKGNAME}/ {print \\$$$${fldnum};}" ${INDEXDIR}/${INDEXFILE}` ; \
		${ECHO_MSG} "\" to $$target."; \
	fi;


.if !target(pretty-print-build-depends-list)
pretty-print-build-depends-list:
.if defined(EXTRACT_DEPENDS) || defined(PATCH_DEPENDS) || \
	defined(FETCH_DEPENDS) || defined(BUILD_DEPENDS) || \
	defined(LIB_DEPENDS) || defined(DEPENDS)
	@${_PRETTY_PRINT_DEPENDS_LIST}
.endif
.endif

.if !target(pretty-print-run-depends-list)
pretty-print-run-depends-list:
.if defined(RUN_DEPENDS) || defined(LIB_DEPENDS) || \
	defined(DEPENDS)
	@${_PRETTY_PRINT_DEPENDS_LIST}
.endif
.endif
