# $MidnightBSD$
#
# Provide support to use perl5
#
# PERL5		- Set to full path of perl5, either in the system or
#		  installed from a port.
# PERL		- Set to full path of perl5, either in the system or
#		  installed from a port, but without the version number.
#		  Use this if you need to replace "#!" lines in scripts.
# PERL_VERSION	- Full version of perl5 (see below for current value).
#
# PERL_VER	- Short version of perl5 (major.minor without patchlevel)
#
# PERL_LEVEL	- Perl version as an integer of the form MNNNPP, where
#		  M is major version, N is minor version, and P is
#		  the patch level. E.g., PERL_VERSION=5.14.4 would give
#		  a PERL_LEVEL of 501404. This can be used in comparisons
#		  to determine if the version of perl is high enough,
#		  whether a particular dependency is needed, etc.
# PERL_ARCH	- Directory name of architecture dependent libraries
#		  (value: mach).
# PERL_PORT	- Name of the perl port that is installed
#		  (for example: perl5.24)
# SITE_PERL	- Directory name where site specific perl packages go.
#		  This value is added to PLIST_SUB.
# SITE_ARCH	- Directory name where arch site specific perl packages go.
#		  This value is added to PLIST_SUB.
# USE_PERL5	- If set, this port uses perl5 in one or more of the extract,
#		  patch, build, run or test phases.
#		  It can also have configure, modbuild and modbuildtiny when
#		  the port needs to run Makefile.PL, Build.PL and a
#		  Module::Build::Tiny flavor of Build.PL.
#
.if !defined(_INCLUDE_USES_PERL5_MK)
_INCLUDE_USES_PERL5_MK=	yes

.  if !empty(perl5_ARGS)
IGNORE=	Incorrect 'USES+=perl5:${perl5_ARGS}' perl5 takes no arguments
.  endif

USE_PERL5?=	run build

PERL_BRANCH?=		${PERL_VERSION:C/\.[0-9]+$//}
PERL_PORT?=		perl${PERL_BRANCH}

.if exists(/usr/lib/perl5) && !exists(${PERL_PREFIX}/bin/cpan)
PERL=			/usr/bin/perl
CPAN_CMD?= 		/usr/bin/cpan
_CORE_PERL=		yes
.else
PERL=			${PERL_PREFIX}/bin/perl
CPAN_CMD?=		${PERL_PREFIX}/bin/cpan
.  endif

CONFIGURE_ENV+=	ac_cv_path_PERL=${PERL} ac_cv_path_PERL_PATH=${PERL} \
		PERL_USE_UNSAFE_INC=1

MAKE_ENV+=	PERL_USE_UNSAFE_INC=1

QA_ENV+=	SITE_ARCH_REL=${SITE_ARCH_REL} LIBPERL=libperl.so.${PERL_VER}

.if ${ARCH} == "i386"
PERL_ARCH?=		${ARCH}-midnightbsd-thread-multi-64int
.else
PERL_ARCH?=		${ARCH}-midnightbsd-thread-multi
.endif

PERL5=			${PERL}${PERL_VERSION}


# PERL_CONFIGURE implies USE_PERL5
.if defined(PERL_CONFIGURE) || defined(PERL_MODBUILD)
USE_PERL5=	yes
.endif


# USE_PERL5_(RUN|BUILD) implies USE_PERL5, USE_PERL5 => USE_PERL5_*
.if defined(USE_PERL5_BUILD)
USE_PERL5= ${USE_PERL5_BUILD}
.elif defined(USE_PERL5_RUN)
USE_PERL5= ${USE_PERL5_RUN}
.elif defined(USE_PERL5)
USE_PERL5_RUN=yes
USE_PERL5_BUILD=yes
.endif


.if defined(USE_PERL) && ${USE_PERL5:tl} == "yes"
USE_PERL5= ${PERL_BRANCH}
.endif


#
# Perl version stuff.
#
.if ${OSVERSION} > 101001
_DEFAULT_PERL_VERSION=	5.28.0
.elif ${OSVERSION} > 9009
_DEFAULT_PERL_VERSION=	5.26.0
.else
_DEFAULT_PERL_VERSION= 5.20.0
.endif
_DEFAULT_PERL_BRANCH= 5.20

.if !defined(PERL_VERSION)
.	if exists(${PERL}) && !defined(PACKAGE_BUILDING)
PERL_VERSION!= ${PERL} -MConfig -le 'print $$Config{version}'
.	else
PERL_VERSION=	${_DEFAULT_PERL_VERSION}
.	endif
.endif


PERL_VER?=		${PERL_VERSION}

.  if !defined(PERL_LEVEL) && defined(PERL_VERSION)
perl_major=	${PERL_VERSION:C|^([1-9]+).*|\1|}
_perl_minor=	00${PERL_VERSION:C|^([1-9]+)\.([0-9]+).*|\2|}
perl_minor=	${_perl_minor:C|^.*(...)|\1|}
.    if ${perl_minor} >= 100
perl_minor=	${PERL_VERSION:C|^([1-9]+)\.([0-9][0-9][0-9]).*|\2|}
perl_patch=	${PERL_VERSION:C|^.*(..)|\1|}
.    else # ${perl_minor} < 100
_perl_patch=	0${PERL_VERSION:C|^([1-9]+)\.([0-9]+)\.*|0|}
perl_patch=	${_perl_patch:C|^.*(..)|\1|}
.    endif # ${perl_minor} < 100
PERL_LEVEL=	${perl_major}${perl_minor}${perl_patch}
.  else
PERL_LEVEL=0
.  endif # !defined(PERL_LEVEL) && defined(PERL_VERSION)


# use true_prefix so that PERL will be right in faked targets.
# this is historical.
PERL_PREFIX?=		${LOCALBASE}
SITE_PERL_REL?=	lib/perl5/site_perl/${PERL_VER}
SITE_PERL?=	${PERL_PREFIX}/${SITE_PERL_REL}
SITE_ARCH_REL?=	${SITE_PERL_REL}/${PERL_ARCH}
SITE_ARCH?=	${LOCALBASE}/${SITE_ARCH_REL}
SITE_MAN3_REL?=	${SITE_PERL_REL}/man/man3
SITE_MAN3?=	${PREFIX}/${SITE_MAN3_REL}
SITE_MAN1_REL?=	${SITE_PERL_REL}/man/man1
SITE_MAN1?=	${PREFIX}/${SITE_MAN1_REL}


PERL_NO_DEPENDS?= NO

.if (${PERL_NO_DEPENDS:tu} == "NO") && !defined(_CORE_PERL)
.if defined(USE_PERL5_BUILD)
EXTRACT_DEPENDS+=${PERL5}:lang/${PERL_PORT}
PATCH_DEPENDS+=	${PERL5}:lang/${PERL_PORT}
BUILD_DEPENDS+=	${PERL5}:lang/${PERL_PORT}
.endif
.if defined(USE_PERL5) || defined(USE_PERL5_RUN)
RUN_DEPENDS+=	${PERL5}:lang/${PERL_PORT}
.endif
.endif

.if defined(PERL_CONFIGURE) || defined(PERL_MODBUILD)
CONFIGURE_ARGS+=	CC="${CC}" CCFLAGS="${CFLAGS}" LD="${CC}"

# XXX do we really want to store man pages here?
.if !defined(_CORE_PERL)
MAN3PREFIX?= ${TARGETDIR}/lib/perl5/${PERL_VERSION}
.endif

.undef HAS_CONFIGURE

.if (defined(BATCH) && !defined(IS_INTERACTIVE))
CONFIGURE_ENV+=	PERL_MM_USE_DEFAULT="YES"
.endif

.if defined(PERL_MODBUILD)
ALL_TARGET?=
PL_BUILD?=	Build
CONFIGURE_SCRIPT?=	Build.PL
.if ${PORTNAME} != Module-Build
BUILD_DEPENDS+=	${SITE_PERL}/Module/Build.pm:devel/p5-Module-Build
.endif
CONFIGURE_ARGS+= \
	create_packlist=0 \
	install_path=lib="${TARGETDIR}/${SITE_PERL_REL}" \
	install_path=arch="${TARGETDIR}/${SITE_PERL_REL}/${PERL_ARCH}" \
	install_path=script="${TARGETDIR}/bin" \
	install_path=bin="${TARGETDIR}/bin" \
	install_path=libdoc="${MAN3PREFIX}/man/man3" \
	install_path=bindoc="${MAN1PREFIX}/man/man1" 
.else
CONFIGURE_SCRIPT?=	Makefile.PL
CONFIGURE_ARGS+=	INSTALLDIRS="site"
SKIP_FAKE_CHECK= 	.*\.packlist
.endif 
.endif # defined(PERL_CONFIGURE) || defined(PERL_MODBUILD)




.endif      # !defined(_POSTMKINCLUDED) && !defined(Perl_Pre_Include)
.if defined(_POSTMKINCLUDED) && !defined(Perl_Post_Include)

Perl_Post_Include=	perl.mk

PLIST_SUB+=		PERL_VERSION=${PERL_VERSION} \
				PERL_VER=${PERL_VER} \
				PERL_ARCH=${PERL_ARCH} \
				PERL5_MAN1=man/man1 \
				PERL5_MAN3=man/man3 \
				SITE_PERL=${SITE_PERL_REL} \
				SITE_ARCH=${SITE_ARCH_REL}

SUB_LIST+=		PERL_VERSION=${PERL_VERSION} \
				PERL_VER=${PERL_VER} \
				PERL_ARCH=${PERL_ARCH} \
				SITE_PERL=${SITE_PERL_REL} \
				SITE_ARCH=${SITE_ARCH_REL} \
				PERL5_MAN1=man/man1 \
				PERL5_MAN3=man/man3 \
				PERL=${PERL}


.if defined(PERL_CONFIGURE) || defined(PERL_MODBUILD)
.    if !target(do-configure)
do-configure:
	@cd ${CONFIGURE_WRKSRC} && \
		${SETENV} ${CONFIGURE_ENV} \
		${PERL5} ./${CONFIGURE_SCRIPT} ${CONFIGURE_ARGS}
.if !defined(PERL_MODBUILD)
	@cd ${CONFIGURE_WRKSRC} && \
		${PERL5} -pi -e 's/ doc_(perl|site|\$$\(INSTALLDIRS\))_install$$//' Makefile
.endif
.endif
.endif # defined(PERL_CONFIGURE) || defined(PERL_MODBUILD)

.if defined(PERL_MODBUILD) && !target(do-build)
do-build:
	@(cd ${BUILD_WRKSRC}; ${SETENV} ${MAKE_ENV} ${PERL5} ${PL_BUILD} ${MAKE_ARGS} ${ALL_TARGET})
.endif



.if defined(PERL_MODBUILD) && !target(do-install)
do-install:
	@cd ${INSTALL_WRKSRC} && ${SETENV} ${MAKE_ENV} ${PERL5} ${PL_BUILD} ${MAKE_ARGS} --destdir ${FAKE_DESTDIR} ${FAKE_TARGET}
.endif
PACKLIST_DIR?=	${PREFIX}/${SITE_ARCH_REL}/auto

# In all those, don't use - before the command so that the user does
# not wonder what has been ignored by this message "*** Error code 1 (ignored)"
_USES_install+=	560:fix-perl-things
fix-perl-things:
# Remove FAKE_DESTDIR from .packlist and add the file to the plist.
	@(if [ -d ${FAKE_DESTDIR}${PACKLIST_DIR} ] ; then \
		${FIND} ${FAKE_DESTDIR}${PACKLIST_DIR} -name .packlist | while read f ; do \
			${SED} -i '' 's|^${FAKE_DESTDIR}||' "$$f"; \
			${ECHO} $$f | ${SED} -e 's|^${FAKE_DESTDIR}||' >> ${TMPPLIST}; \
		done \
	fi) || :

# Starting with perl 5.20, the empty bootstrap files are not installed any more
# by ExtUtils::MakeMaker.  As we don't need them anyway, remove them.
# Module::Build continues to install them, so remove the files unconditionally.
	@${FIND} ${FAKE_DESTDIR} -name '*.bs' -size 0 -delete || :

# Some ports use their own way of building perl modules and generate
# perllocal.pod, remove it here so that those ports don't include it
# by mistake in their plists.  It is sometime compressed, so use a
# shell glob for the removal.  Also, remove the directories that
# contain it to not leave orphans directories around.
	@${RM} ${FAKE_DESTDIR}${PREFIX}/lib/perl5/${PERL_VER}/${PERL_ARCH}/perllocal.pod* || :
	@${RMDIR} -p ${FAKE_DESTDIR}${PREFIX}/lib/perl5/${PERL_VER}/${PERL_ARCH} 2>/dev/null || :
# Starting at ExtUtils::MakeMaker 7.06 and Perl 5.25.1, the base README.pod is
# no longer manified into a README.3, as the README.pod is installed and can be
# read with perldoc, remove the README.3 files that may be generated.
	@[ -d "${FAKE_DESTDIR}${SITE_MAN3}" ] && \
		${FIND} ${FAKE_DESTDIR}${SITE_MAN3} -name '*::README.3' -delete || :
# Starting at ExtUtils::MakeMaker 7.31_06 and Perl 5.27.1, the base README.pod is
# no longer installed. So remove any that can be there.
	@[ -d "${FAKE_DESTDIR}${PREFIX}/${SITE_PERL_REL}" ] && \
		${FIND} ${FAKE_DESTDIR}${PREFIX}/${SITE_PERL_REL} -name README.pod -delete || :

.  if !target(do-test) && (!empty(USE_PERL5:Mmodbuild*) || !empty(USE_PERL5:Mconfigure))
TEST_TARGET?=	test
TEST_WRKSRC?=	${BUILD_WRKSRC}
do-test:
.    if ${USE_PERL5:Mmodbuild*}
	@cd ${TEST_WRKSRC}/ && ${SETENV} ${TEST_ENV} ${PERL5} ${PL_BUILD} ${TEST_TARGET} ${TEST_ARGS}
.    elif ${USE_PERL5:Mconfigure}
	@cd ${TEST_WRKSRC}/ && ${SETENV} ${TEST_ENV} ${MAKE_CMD} ${TEST_ARGS} ${TEST_TARGET}
.    endif # USE_PERL5:Mmodbuild*
.  endif # do-test


.if !target(check-latest)
check-latest:
	@if [ -x ${CPAN_CMD} ]; then \
		_cpan_version=`${CPAN_CMD} -D ${PORTNAME:S/-/::/g} | ${GREP} "	CPAN:" | ${AWK} '{ print $$2 }'`; \
		${ECHO_MSG} "CPAN version: $$_cpan_version"; \
		${ECHO_MSG} "Port version: ${PORTVERSION}"; \
	else \
		${ECHO_MSG} "Cannot check for latest CPAN version: ${CPAN_CMD} not installed"; \
	fi
.endif	

.endif # defined(_POSTMKINCLUDED)
