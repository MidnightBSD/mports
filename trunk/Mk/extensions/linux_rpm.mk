# ex:ts=4
#
# $MidnightBSD$
#

# Variables:
# LINUX_DIST		- Will be used to set some dist-specific presets.
#					  Valid values: fedora
# LINUX_DIST_VER	- Use depends upon the dist-specific presets.
#					  Valid values for "fedora": all version numbers
#					  e.g. 10 for fedora 10
#					  This is used to set MASTER_SITE_{,SRC_}SUBDIR
#					  if it isn't already set.
# MASTER_SITE_SRC_SUBDIR
#					- The subdir for the src RPM's.
# DISTFILES			- For simple cases this will be set automatically
#					  based upon the DISTNAME.
# SRC_DISTFILES		- Variable which contains the corresponding src RPM's.
#					  If there's no corresponding src RPM, it has to be
#					  set to the empty value (SRC_DISTFILES=	"").
# AUTOMATIC_PLIST	- Generate a dynamic plist (please have a look at the
#					  porters handbook section which talks about plists.
#					  This feature is reserved for rare cases).
# BRANDELF_DIRS		- A list of directories with executables to brand
#					  as a linux executable. The directories has to not
#					  contain libraries.
# BRANDELF_FILES	- A list of files to brand as a linux executable in
#					  case BRANDELF_DIRS can't be used.

.if !defined(_POSTMKINCLUDED) && !defined(Linux_RPM_Pre_Include)

Linux_RPM_Include_MAINTAINER=	ports@MidnightBSD.org
Linux_RPM_Pre_Include=			linux-rpm.mk

EXTRACT_SUFX?=		.${LINUX_RPM_ARCH}.rpm
SRC_SUFX?=		.src.rpm

USE_LINUX?=			yes
USE_LINUX_PREFIX=	yes

NO_WRKSUBDIR=		yes
NO_BUILD=			yes

.	if ${ARCH} == "amd64" || ${ARCH} == "i386"
.		if ${USE_LINUX} == "c6" || ${USE_LINUX} == "yes" # default to CentOS
# Do not build CentOS 6 ports if overridden by f10
.			if defined(OVERRIDE_LINUX_BASE_PORT) && ${OVERRIDE_LINUX_NONBASE_PORTS} == "f10"
IGNORE=		This port requires CentOS ${LINUX_DIST_VER}. Please remove OVERRIDE_LINUX_NONBASE_PORTS=f10 in /etc/make.conf.
.			endif
LINUX_RPM_ARCH?=	i686	# ?= because of nasty c5 qt ports
.		elif ${USE_LINUX} == "f10"
# Do not build Fedora 10 ports unless specifically overridden.
#.			if ! defined(OVERRIDE_LINUX_NONBASE_PORTS) || ${OVERRIDE_LINUX_NONBASE_PORTS} != "f10"
#IGNORE=		This port requires Fedora 10, yet Fedora 10 is heavily outdated and contains many vulnerable ports. If you really need it, add OVERRIDE_LINUX_NONBASE_PORTS=f10 in /etc/make.conf.
#.			endif
LINUX_RPM_ARCH?=	i386	# the linuxulator does not yet support amd64 code
.		else
LINUX_RPM_ARCH?=	${ARCH}
. 		endif

.	elif ${ARCH} == "powerpc"
LINUX_RPM_ARCH?=	ppc
.	endif
.endif

.if defined(_POSTMKINCLUDED) && !defined(Linux_RPM_Post_Include)

Linux_RPM_Post_Include=	linux-rpm.mk

.if ${USE_LINUX} == "f10"
USE_LINUX?=	"f10"
LINUX_DIST=	fedora
LINUX_DIST_VER=	10
.else			# default to CentOS
LINUX_DIST=	centos
LINUX_DIST_VER=	6.6
.endif

.	if defined(LINUX_DIST)
DIST_SUBDIR?=	rpm/${LINUX_RPM_ARCH}/${LINUX_DIST}/${LINUX_DIST_VER}

.		if ${LINUX_DIST} == "fedora"
# we do not want to define MASTER_SITES and MASTER_SITE_* if they are already defined
# ex.: MASTER_SITES=file:///...
.			ifndef MASTER_SITES
MASTER_SITES=			${MASTER_SITE_FEDORA_LINUX}
.				if ${LINUX_DIST_VER} == 10
MASTER_SITE_SUBDIR?=	../releases/${LINUX_DIST_VER}/Everything/${LINUX_RPM_ARCH}/os/Packages \
			../updates/${LINUX_DIST_VER}/${LINUX_RPM_ARCH}
MASTER_SITE_SRC_SUBDIR?=	../releases/${LINUX_DIST_VER}/Everything/source/SRPMS \
				../updates/${LINUX_DIST_VER}/SRPMS
.				else
MASTER_SITE_SUBDIR?=	${LINUX_DIST_VER}/${LINUX_RPM_ARCH}/os/Fedora/RPMS \
			updates/${LINUX_DIST_VER}/${LINUX_RPM_ARCH}
MASTER_SITE_SRC_SUBDIR?=	${LINUX_DIST_VER}/SRPMS \
				updates/${LINUX_DIST_VER}/SRPMS
.				endif
.			endif
.		elif ${LINUX_DIST} == "centos"
MASTER_SITES_SUBDIR=	/centos/6/os/i386/Packages/
.			if ${LINUX_DIST_VER} == "5" #needed for Qt...
LINUX_RPM_ARCH=	i386
MASTER_SITES_SUBDIR=	/centos/5/os/i386/Packages/
.			endif

.			ifndef MASTER_SITES
MASTER_SITES=	${MASTER_SITE_CENTOS_LINUX}
.				if ${LINUX_DIST_VER} == "6.6"
.					if ! defined(PACKAGE_BUILDING)
MASTER_SITES=	http://mirror.centos.org/centos/6/os/i386/Packages/
MASTER_SITES_SUBDIR=	/centos/6/os/i386/Packages/
.					else
MASTER_SITES?=  http://vault.centos.org/%SUBDIR%/
MASTER_SITES_SUBDIR=	/${LINUX_DIST_VER}/os/Source/SPackages/
.					endif

.				else
MASTER_SITES=	http://vault.centos.org/${LINUX_DIST_VER}/os/i386/Packages/
.				endif
.			endif

.		endif
.	endif


#.if ${USE_LINUX:L} == "yes" #redundant with bsd.port.mk fu
#USE_LINUX=	c6
#.endif
PKGNAMEPREFIX?=			linux-${USE_LINUX}-

# DISTFILES and SRC_DISTFILES assume that there is only one bindist
# and one src file.
# Please, define them in the Makefile of the port in case this assumption
# is not true.

DISTVERSION=	${PORTVERSION}-${RPMVERSION}
DISTNAME?=		${PORTNAME}-${DISTVERSION}
DISTFILES?=		${DISTNAME}${EXTRACT_SUFX}
BIN_DISTFILES:=		${DISTFILES}
SRC_DISTFILES?=		${DISTNAME}${SRC_SUFX}
EXTRACT_ONLY?=		${BIN_DISTFILES:C/:[^:]+$//}

.	if defined(PACKAGE_BUILDING)
DISTFILES+=		${SRC_DISTFILES}
MASTER_SITE_SUBDIR+=	${MASTER_SITE_SRC_SUBDIR}
ALWAYS_KEEP_DISTFILES=	yes
.	endif

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

.		if !target(linux-rpm-clean-portdocs)
linux-rpm-clean-portdocs:
.			for x in ${PORTDOCS}
	@${RM} -f ${WRKDIR}/${DOCSDIR_REL}/${x}
.			endfor
	@${RMDIR} ${WRKDIR}/${DOCSDIR_REL}
.		endif
.  endif

.  if defined(AUTOMATIC_PLIST)

.	if ${USE_LINUX} == "f10" || ${USE_LINUX} == "yes"
_LINUX_BASE_SUFFIX=		f10
.	elif ${USE_LINUX} == "c6"
USE_LINUX=	c6
_LINUX_BASE_SUFFIX=		c6
.	else
# other linux_base ports do not provide a pkg-plist file
IGNORE=					uses AUTOMATIC_PLIST with an unsupported USE_LINUX, \"${USE_LINUX}\". Supported values are \"yes\", \"f10\" and \"c6\"
.  endif

PLIST?=					${WRKDIR}/.PLIST.linux-rpm

pre-package: linux-rpm-generate-plist

.  if !target(linux-rpm-generate-plist)
linux-rpm-generate-plist:
	cd ${WRKSRC} && \
	${FIND} * ! -path "fake/*" ! -type d | ${SORT} > ${PLIST}
.	endif
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
	cd ${WRKSRC} && ${FIND} * ! -path "fake*" -type d -exec ${MKDIR} "${PREFIX}/{}" \;
	cd ${WRKSRC} && ${FIND} * ! -path "fake/*" ! -type d | ${CPIO} -pm -R root:wheel ${PREFIX}
.  endif
.endif
