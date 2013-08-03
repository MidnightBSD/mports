# ex:ts=4
#
# $MidnightBSD: mports/Mk/extensions/linux_rpm.mk,v 1.8 2011/06/18 01:37:19 laffer1 Exp $
#

# Variables:
# LINUX_DIST          - Will be used to set some dist-specific presets.
#                                       Valid values: fedora
# LINUX_DIST_VER      - Use depends upon the dist-specific presets.
#                                       Valid values for "fedora": all version numbers
#                                       e.g. 3 for fedora core 3, 4 for fedora core 4
#                                       This is used to set MASTER_SITE_{,SRC_}SUBDIR
#                                       if it isn't already set.
# MASTER_SITE_SRC_SUBDIR
#                                     - The subdir for the src RPM's.
# DISTFILES                   - For simple cases this will be set automatically
#                                       based upon the DISTNAME.
# SRC_DISTFILES               - Variable which contains the corresponding src RPM's.
#                                       If there's no corresponding src RPM, it has to be
#                                       set to the empty value (SRC_DISTFILES=        "").
# AUTOMATIC_PLIST     - Generate a dynamic plist (please have a look at the
#                                       porters handbook section which talks about plists.
#                                       This feature is reserved for rare cases).
# BRANDELF_DIRS               - A list of directories with executables to brand
#                                       as a linux executable. The directories has to not
#                                       contain libraries.
# BRANDELF_FILES      - A list of files to brand as a linux executable in
#                                       case BRANDELF_DIRS can't be used.

.if !defined(_POSTMKINCLUDED) && !defined(Linux_RPM_Pre_Include)

Linux_RPM_Include_MAINTAINER=	ports@MidnightBSD.org
Linux_RPM_Pre_Include=			linux-rpm.mk

EXTRACT_SUFX?=		.${LINUX_RPM_ARCH}.rpm
SRC_SUFX?=		.src.rpm

USE_LINUX?=			yes
USE_LINUX_PREFIX=	yes

NO_BUILD=			yes

.  if ${ARCH} == "amd64"
LINUX_RPM_ARCH?=	i386	# the linuxulator does not yet support amd64 code
.  else
LINUX_RPM_ARCH?=	${ARCH}
.  endif

.endif

.if defined(_POSTMKINCLUDED) && !defined(Linux_RPM_Post_Include)

Linux_RPM_Post_Include=	linux-rpm.mk

LINUX_DIST?=		fedora
LINUX_DIST_VER?=	10

# linux Fedora 10 infrastructure ports should be used with compat.linux.osrelease=2.6.16,
# linux_base-f10 (or greater) port
.  if ${LINUX_DIST_VER} == 10
# let's check for apropriate compat.linux.osrelease
.    if (${LINUX_OSRELEASE} != "2.6.16")
IGNORE=		linux_rpm.mk test failed: the port should be used with compat.linux.osrelease=2.6.16, which is supported at 0.4-CURRENT
.    endif
# the default for OSVERSION < 4004
.    if ${OSVERSION} < 4004
# let's check if an apropriate linux base port is used
.      if ${USE_LINUX} != f10
IGNORE=		linux_rpm.mk test failed: the port should be used with at least linux_base-f10
.      endif
# let's check if OVERRIDE_LINUX_NONBASE_PORTS is defined
.      ifndef(OVERRIDE_LINUX_NONBASE_PORTS)
IGNORE=		linux_rpm.mk test failed: the port should be used with defined OVERRIDE_LINUX_NONBASE_PORTS
.      endif
# the default for OSVERSION >= 4004
#.      else
.    endif # ${OSVERSION} < 4004
.  endif

.  if defined(LINUX_DIST)
DIST_SUBDIR?=	rpm/${LINUX_RPM_ARCH}/${LINUX_DIST}/${LINUX_DIST_VER}

.    if ${LINUX_DIST} == "fedora"
# we do not want to define MASTER_SITES and MASTER_SITE_* if they are already defined
# ex.: MASTER_SITES=file:///...
.      ifndef MASTER_SITES
MASTER_SITES=			${MASTER_SITE_FEDORA_LINUX}
.        if ${LINUX_DIST_VER} == 10
MASTER_SITE_SUBDIR?=	../releases/${LINUX_DIST_VER}/Everything/${LINUX_RPM_ARCH}/os/Packages \
			../updates/${LINUX_DIST_VER}/${LINUX_RPM_ARCH}
MASTER_SITE_SRC_SUBDIR?=	../releases/${LINUX_DIST_VER}/Everything/source/SRPMS \
				../updates/${LINUX_DIST_VER}/SRPMS
.        else
MASTER_SITE_SUBDIR?=	${LINUX_DIST_VER}/${LINUX_RPM_ARCH}/os/Fedora/RPMS \
			updates/${LINUX_DIST_VER}/${LINUX_RPM_ARCH}
MASTER_SITE_SRC_SUBDIR?=	${LINUX_DIST_VER}/SRPMS \
				updates/${LINUX_DIST_VER}/SRPMS
.        endif
.      endif
.    else
IGNORE=	unknown LINUX_DIST in port Makefile
.    endif
.  endif
PKGNAMEPREFIX?=			linux-

# DISTFILES and SRC_DISTFILES assume that there is only one bindist
# and one src file.
# Please, define them n the Makefile of the port in case this assumption
# is not true.

DISTFILES?=		${DISTNAME}${EXTRACT_SUFX}
BIN_DISTFILES:=		${DISTFILES}
SRC_DISTFILES?=		${DISTNAME}${SRC_SUFX}
EXTRACT_ONLY?=		${BIN_DISTFILES}

.  if defined(PACKAGE_BUILDING)
DISTFILES+=		${SRC_DISTFILES}
MASTER_SITE_SUBDIR+=	${MASTER_SITE_SRC_SUBDIR}
ALWAYS_KEEP_DISTFILES=	yes
.  endif

EXTRACT_CMD?=			${TAR}
EXTRACT_BEFORE_ARGS?=	-xf
EXTRACT_AFTER_ARGS?=

HASH_FILE?=				${MASTERDIR}/distinfo.${LINUX_RPM_ARCH}

BRANDELF_DIRS?=
BRANDELF_FILES?=

# For ports that define PORTDOCS, be sure not to install
# documentation if NOPORTDOCS is defined
.  if defined(PORTDOCS) && defined(NOPORTDOCS)
pre-patch: linux-rpm-clean-portdocs

.    if !target(linux-rpm-clean-portdocs)
linux-rpm-clean-portdocs:
.      for x in ${PORTDOCS}
	@${RM} -f ${WRKDIR}/${DOCSDIR_REL}/${x}
.      endfor
	@${RMDIR} ${WRKDIR}/${DOCSDIR_REL}
.    endif
.  endif

do-extract:
	@${MKDIR} -p ${WRKSRC}
	@for file in ${EXTRACT_ONLY}; do \
		if !(cd ${WRKSRC} && ${EXTRACT_CMD} ${EXTRACT_BEFORE_ARGS} ${DISTDIR}/${DIST_SUBDIR}/$$file ${EXTRACT_AFTER_ARGS});\
		then \
			exit 1; \
		fi \
	done
	@if [ `${ID} -u` = 0 ]; then \
		${CHMOD} -R ug-s ${WRKDIR}; \
		${CHOWN} -R 0:0 ${WRKDIR}; \
	fi


.  if defined(AUTOMATIC_PLIST)

.    if ${USE_LINUX} == "f10" || ${USE_LINUX:L} == "yes"
_LINUX_BASE_SUFFIX=		f10
.    else
# other linux_base ports do not provide a pkg-plist file
IGNORE=					uses AUTOMATIC_PLIST with an unsupported USE_LINUX, \"${USE_LINUX}\". Supported values are \"yes\" and \"f10\"
.    endif

PLIST?=					${WRKDIR}/.PLIST.linux-rpm

pre-package: linux-rpm-generate-plist

.    if !target(linux-rpm-generate-plist)
linux-rpm-generate-plist:
	@cd ${.CURDIR} && ${MAKE} makeplist GENPLIST=${PLIST}
# 	Run make-tmpplist again, because the it didn't have ${PLIST} that time.
	@cd ${.CURDIR} && ${MAKE} make-tmpplist
.    endif
.  endif

.  if !target(do-install)
do-install:
.	if ${BRANDELF_DIRS}
		@cd ${WRKSRC} && ${FIND} ${BRANDELF_DIRS} -type f -print0 \
		| ${XARGS} -0 ${FILE} | ${GREP} ELF | ${CUT} -d : -f 1 \
		| ${XARGS} ${BRANDELF} -t Linux
.	endif
.	if ${BRANDELF_FILES}
		@cd ${WRKSRC} && ${BRANDELF} -t Linux ${BRANDELF_FILES}
.	endif
	@cd ${WRKSRC} && ${FIND} * -type d -exec ${MKDIR} "${PREFIX}/{}" \;
	@cd ${WRKSRC} && ${FIND} * ! -type d | ${CPIO} -pm -R root:wheel ${PREFIX}
.  endif


.endif
