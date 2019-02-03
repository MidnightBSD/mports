# $MidnightBSD$
#
# Provide support to use perl5

.if !defined(_POSTMKINCLUDED) || !defined(Perl_Pre_Include)

Perl_Pre_Include=			perl.mk
Perl_Include_MAINTAINER=	ctriv@MidnightBSD.org

# This file contains the glue that is supposed to make your life easier when
# dealing with ports of perl related software, specifially CPAN modules. It
# is automatically included when USE_PERL5, PERL_CONFIGURE, or PERL_MODBUILD
# is defined in the port's makefile.
#
##
# USE_PERL5		- If set, this port uses perl5 in one or more of the extract,
#				  patch, build, install or run phases.
# USE_PERL5_BUILD
#				- If set, this port uses perl5 in one or more of the extract,
#				  patch, build or install phases.
# USE_PERL5_RUN	- If set, this port uses perl5 for running.
# PERL5			- Set to full path of perl5, either in the system or
#				  installed from a port.
# PERL			- Set to full path of perl5, either in the system or
#				  installed from a port, but without the version number.
#				  Use this if you need to replace "#!" lines in scripts.
# PERL_VERSION	- Full version of perl5 (see below for current value).
# PERL_VER		- Short version of perl5 (see below for current value).
# PERL_LEVEL	- Perl version as an integer of the form MNNNPP, where
#				  M is major version, N is minor version, and P is
#				  the patch level. E.g., PERL_VERSION=5.6.1 would give
#				  a PERL_LEVEL of 500601. This can be used in comparisons
#				  to determine if the version of perl is high enough,
#				  whether a particular dependency is needed, etc.
# PERL_ARCH		- Directory name of architecture dependent libraries
#				  (value: ${ARCH}-freebsd).
# PERL_PORT		- Name of the perl port that is installed
#				  (value: perl5)
# SITE_PERL		- Directory name where site specific perl packages go.
#				  This value is added to PLIST_SUB.
# PERL_MODBUILD	- Use Module::Build to configure, build and install port.
##

#
# Common Vars.
#

PERL_BRANCH?=		${PERL_VERSION:C/\.[0-9]+$//}
PERL_PORT?=		perl${PERL_BRANCH}
# use true_prefix so that PERL will be right in faked targets.
# this is historical.

PERL_PREFIX?=		${LOCALBASE}
SITE_PERL_REL?=		lib/perl5/site_perl/${PERL_VER}
SITE_PERL?=		${PERL_PREFIX}/${SITE_PERL_REL}
SITE_ARCH_REL?=		${SITE_PERL_REL}/${PERL_ARCH}
SITE_ARCH?=		${LOCALBASE}/${SITE_ARCH_REL}
SITE_MAN3_REL?=		${SITE_PERL_REL}/man/man3
SITE_MAN3?=		${PREFIX}/${SITE_MAN3_REL}
SITE_MAN1_REL?=		${SITE_PERL_REL}/man/man1
SITE_MAN1?=		${PREFIX}/${SITE_MAN1_REL}

.if exists(/usr/lib/perl5) && !exists(${PERL_PREFIX}/bin/cpan)
PERL=			/usr/bin/perl
CPAN_CMD?= 		/usr/bin/cpan
_CORE_PERL=		yes
.else
PERL=			${PERL_PREFIX}/bin/perl
CPAN_CMD?=		${PERL_PREFIX}/bin/cpan
.endif

CONFIGURE_ENV+=	ac_cv_path_PERL=${PERL} ac_cv_path_PERL_PATH=${PERL} \
		PERL_USE_UNSAFE_INC=1

MAKE_ENV+=	PERL_USE_UNSAFE_INC=1

QA_ENV+=	SITE_ARCH_REL=${SITE_ARCH_REL} LIBPERL=libperl.so.${PERL_VER}

.if (${ARCH} == "amd64")
.if ${OSVERSION} > 4015
PERL_ARCH?=		${ARCH}-midnightbsd-thread-multi
.else
PERL_ARCH?=		${ARCH}-midnightbsd
.endif
.else
.if (${ARCH} == "i386" && ${OSVERSION} > 4015)
PERL_ARCH?=		${ARCH}-midnightbsd-thread-multi-64int
.else
PERL_ARCH?=		${ARCH}-midnightbsd-64int
.endif
.endif

PERL5=			${PERL}${PERL_VERSION}
PERL_TEST_TARGET?=	test



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

.if !defined(PERL_LEVEL) && defined(PERL_VERSION)
perl_major=		${PERL_VERSION:C|^([1-9]+).*|\1|}
_perl_minor=	00${PERL_VERSION:C|^([1-9]+)\.([0-9]+).*|\2|}
perl_minor=		${_perl_minor:C|^.*(...)|\1|}
.if ${perl_minor} >= 100
perl_minor=		${PERL_VERSION:C|^([1-9]+)\.([0-9][0-9][0-9]).*|\2|}
perl_patch=		${PERL_VERSION:C|^.*(..)|\1|}
.else # ${perl_minor} < 100
_perl_patch=	0${PERL_VERSION:C|^([1-9]+)\.([0-9]+)\.*|0|}
perl_patch=		${_perl_patch:C|^.*(..)|\1|}
.endif # ${perl_minor} < 100
PERL_LEVEL=	${perl_major}${perl_minor}${perl_patch}
.else
PERL_LEVEL=0
.endif # !defined(PERL_LEVEL) && defined(PERL_VERSION)



# XXX parse USE_PERL=5.8 5.10+

#
# dependancies
#
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

#
# Configure
# 
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
PL_BUILD?=		Build
CONFIGURE_SCRIPT?=	Build.PL
.if ${PORTNAME} != Module-Build
BUILD_DEPENDS+=		${SITE_PERL}/Module/Build.pm:devel/p5-Module-Build
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
.if !target(do-configure)
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

#
# Build
#
.if defined(PERL_MODBUILD) && !target(do-build)
do-build:
	@(cd ${BUILD_WRKSRC}; ${SETENV} ${MAKE_ENV} ${PERL5} ${PL_BUILD} ${MAKE_ARGS} ${ALL_TARGET})
.endif


#
# Install
#	
.if defined(PERL_MODBUILD) && !target(do-install)
do-install:
	@cd ${INSTALL_WRKSRC} && ${SETENV} ${MAKE_ENV} ${PERL5}\
		${PL_BUILD} ${MAKE_ARGS} --destdir ${FAKE_DESTDIR} ${FAKE_TARGET}
.endif

#
# Convenience target for testing.
#
.if !target(test)
.if (PERL_MODBUILD)
test: build
	@cd ${BUILD_WRKSRC} && ${SETENV} ${MAKE_ENV} ${PERL5} ${PL_BUILD} ${PERL_TEST_TARGET}
.else
test: build
	@cd ${BUILD_WRKSRC} && ${SETENV} ${MAKE_ENV} make ${PERL_TEST_TARGET}
.endif
.endif


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

.endif      # defined(_POSTMKINCLUDED) && !defined(Perl_Post_Include)

