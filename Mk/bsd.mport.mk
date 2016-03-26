# $MidnightBSD$
#
#   bsd.mport.mk - 2007/04/01 Chris Reinhardt
#   Based on:
#		bsd.port.mk - 940820 Jordan K. Hubbard.
#	This file is in the public domain.
#
# Please view me with 4 column tabs!

# This is the master file for the most common elements to all port
# Makefile in the ports system.  For a more general overview of its
# use and importance, see the Porter's Handbook.

# There are two different types of "maintainers" in the ports framework.
# The maintainer alias of the bsd.port.mk file is listed below in the
# MidnightBSD_MAINTAINER entry.  You should consult them if you have any
# questions/suggestions regarding this file.
#
# DO NOT COMMIT CHANGES TO THIS FILE BY YOURSELF, EVEN IF YOU DID NOT GET
# A RESPONSE FROM THE MAINTAINER(S) WITHIN A REASONABLE TIMEFRAME! ALL
# UNAUTHORISED CHANGES WILL BE UNCONDITIONALLY REVERTED!

MidnightBSD_MAINTAINER=	ctriv@MidnightBSD.org

# These need to be absolute since we don't know how deep in the ports
# tree we are and thus can't go relative.  They can, of course, be overridden
# by individual Makefiles or local system make configuration.
PORTSDIR?=		/usr/mports
LOCALBASE?=		/usr/local
LINUXBASE?=		/compat/linux
LOCALBASE_REL:=		${LOCALBASE}
LINUXBASE_REL:=		${LINUXBASE}
LOCALBASE:=		${DESTDIR}${LOCALBASE_REL}
LINUXBASE:=		${DESTDIR}${LINUXBASE_REL}
DISTDIR?=		${PORTSDIR}/Distfiles
_DISTDIR?=		${DISTDIR}/${DIST_SUBDIR}
INDEXDIR?=		${PORTSDIR}
SRC_BASE?=		/usr/src
SCRIPTSDIR?=		${PORTSDIR}/Mk/scripts
LIB_DIRS?=		/lib /usr/lib ${LOCALBASE}/lib
NOTPHONY?=
CONFIGURE_ENV+=		XDG_DATA_HOME=${WRKDIR} \
				XDG_CONFIG_HOME=${WRKDIR} \
				HOME=${WRKDIR}
MAKE_ENV+=		XDG_DATA_HOME=${WRKDIR} \
				XDG_CONFIG_HOME=${WRKDIR} \
				HOME=${WRKDIR}

TARGETDIR:=		${DESTDIR}${PREFIX}

# make sure bmake treats -V as expected
.MAKE.EXPAND_VARIABLES= yes

MPORTCOMPONENTS?=	${PORTSDIR}/Mk/components
MPORTEXTENSIONS?=	${PORTSDIR}/Mk/extensions

.include "${MPORTCOMPONENTS}/commands.mk"

# sadly, we have to use a little hack here.  Once linux-rpm.mk is loaded, this 
# will already have been evaluated. XXX - Find a better fix in the future.
.if defined(USE_LINUX_PREFIX) || defined(USE_LINUX_RPM)
PREFIX:=	${LINUXBASE_REL}
NO_MTREE=	yes
.else
PREFIX?=	${LOCALBASE_REL}
.endif

# Fake targets override this when they submake.
TRUE_PREFIX?=		${PREFIX}

# Figure out where the local mtree file is
.if !defined(MTREE_FILE)  && !defined(NO_MTREE)
.if ${PREFIX} == /usr
MTREE_FILE=	/etc/mtree/BSD.usr.dist
.elif ${PREFIX} == ${LINUXBASE_REL}
MTREE_FILE=	${MTREE_LINUX_FILE}
.else
MTREE_FILE=	${PORTSDIR}/Templates/BSD.local.dist
.endif
MTREE_FILE_DEFAULT=yes
.endif
MTREE_CMD?=		/usr/sbin/mtree
MTREE_LINUX_FILE?=	${PORTSDIR}/Templates/BSD.compat.dist
MTREE_ARGS?=		-U ${MTREE_FOLLOWS_SYMLINKS} -f ${MTREE_FILE} -d -e -p
MTREE_LINUX_ARGS?=	-U ${MTREE_FOLLOWS_SYMLINKS} -f ${MTREE_LINUX_FILE} -d -e -p

.if defined(USE_DOS2UNIX)
.if ${USE_DOS2UNIX:tu}=="YES"
DOS2UNIX_REGEX?=        .*
.else
.if ${USE_DOS2UNIX:M*/*}
DOS2UNIX_FILES+=	${USE_DOS2UNIX}
.else
DOS2UNIX_GLOB+=		${USE_DOS2UNIX}
.endif
.endif
EXTENSIONS+=	dos2unix
.endif

.if !defined(UID)
UID!=	${ID} -u
.endif

# Determine whether or not we can use rootly owner/group functions.
.if ${UID} == 0
_BINOWNGRP=	-o ${BINOWN} -g ${BINGRP}
_SHROWNGRP=	-o ${SHAREOWN} -g ${SHAREGRP}
_MANOWNGRP=	-o ${MANOWN} -g ${MANGRP}
.else
_BINOWNGRP=
_SHROWNGRP=
_MANOWNGRP=
.endif

# Start of options section
.if defined(INOPTIONSMK) || ( !defined(USEOPTIONSMK) && !defined(AFTERPORTMK) )


# Get the default maintainer
MAINTAINER?=	ports@MidnightBSD.org

# Get the architecture
.if !defined(ARCH)
ARCH!=	${UNAME} -p
.endif

# Get the operating system type
.if !defined(OPSYS)
OPSYS!=	${UNAME} -s
.endif

UNAMER!=${UNAME} -r

# Get the operating system revision
OSREL?=	${UNAMER:C/-.*//}

# Get __MidnightBSD_version
.if !defined(OSVERSION)
.if exists(${DESTDIR}/usr/include/sys/param.h)
OSVERSION!=	${AWK} '/^\#define[[:blank:]]__MidnightBSD_version/ {print $$3}' < ${DESTDIR}/usr/include/sys/param.h
.elif exists(${SRC_BASE}/sys/sys/param.h)
OSVERSION!=	${AWK} '/^\#define[[:blank:]]__MidnightBSD_version/ {print $$3}' < ${SRC_BASE}/sys/sys/param.h
.else
OSVERSION!=	${SYSCTL} -n kern.osreldate
.endif
.endif

MASTERDIR?=	${.CURDIR}

.if ${MASTERDIR} != ${.CURDIR}
SLAVE_PORT?=	yes
MASTER_PORT?=${MASTERDIR:C/[^\/]+\/\.\.\///:C/[^\/]+\/\.\.\///:C/^.*\/([^\/]+\/[^\/]+)$/\\1/}
.else
SLAVE_PORT?=	no
MASTER_PORT?=
.endif

# Check the compatibility layer for amd64

.if ${ARCH} == "amd64"
.if exists(/usr/lib32)
HAVE_COMPAT_IA32_LIBS?=  YES
.endif
.if !defined(HAVE_COMPAT_IA32_KERN)
HAVE_COMPAT_IA32_KERN!= if ${SYSCTL} -a compat.ia32.maxvmem >/dev/null 2>&1; then echo YES; fi
.endif
.endif

.if defined(IA32_BINARY_PORT) && ${ARCH} != "i386"
.if ${ARCH} == "amd64"
.if !defined(HAVE_COMPAT_IA32_KERN)
IGNORE= you need a kernel with compiled-in IA32 compatibility to use this port.
.elif !defined(HAVE_COMPAT_IA32_LIBS)
IGNORE= you need the 32-bit libraries installed under /usr/lib32 to use this port.
.endif
_LDCONFIG_FLAGS=-32
LIB32DIR=	lib32
.else
IGNORE= you have to use i386 (or compatible) platform to use this port.
.endif
.endif
PLIST_SUB+=     LIB32DIR=${LIB32DIR}

# If they exist, include Makefile.inc, then architecture/operating
# system specific Makefiles, then local Makefile.local.

.if ${MASTERDIR} != ${.CURDIR} && exists(${.CURDIR}/../Makefile.inc)
.include "${.CURDIR}/../Makefile.inc"
USE_SUBMAKE=	yes
.endif

.if exists(${MASTERDIR}/../Makefile.inc)
.include "${MASTERDIR}/../Makefile.inc"
USE_SUBMAKE=	yes
.endif

.if exists(${MASTERDIR}/Makefile.${ARCH}-${OPSYS})
.include "${MASTERDIR}/Makefile.${ARCH}-${OPSYS}"
USE_SUBMAKE=	yes
.elif exists(${MASTERDIR}/Makefile.${OPSYS})
.include "${MASTERDIR}/Makefile.${OPSYS}"
USE_SUBMAKE=	yes
.elif exists(${MASTERDIR}/Makefile.${ARCH})
.include "${MASTERDIR}/Makefile.${ARCH}"
USE_SUBMAKE=	yes
.endif

.if exists(${MASTERDIR}/Makefile.local)
.include "${MASTERDIR}/Makefile.local"
USE_SUBMAKE=	yes
.endif

# where 'make config' records user configuration options
PORT_DBDIR?=	${DESTDIR}/var/db/ports

UID_FILES?=	${PORTSDIR}/UIDs
GID_FILES?=	${PORTSDIR}/GIDs
UID_OFFSET?=	0
GID_OFFSET?=	0

# predefined accounts from src/etc/master.passwd
# alpha numeric sort order
USERS_BLACKLIST=	_dhcp _pflogd auditdistd bin bind daemon games hast kmem mailnull man news nobody operator pop proxy root smmsp sshd toor tty uucp www

LDCONFIG_DIR=	libdata/ldconfig
LDCONFIG32_DIR=	libdata/ldconfig32

.if defined(LATEST_LINK)
UNIQUENAME?=	${LATEST_LINK}
.else
UNIQUENAME?=	${PKGNAMEPREFIX}${PORTNAME}${PKGNAMESUFFIX}
.endif

.endif  # end of options before pre-makefile starts

# At least KDE needs TMPDIR for the package building,
# so we're setting it to the known default value.
.if defined(PACKAGE_BUILDING)
TMPDIR?=	/tmp
.endif # defined(PACKAGE_BUILDING)

# Respect TMPDIR passed via make.conf or similar and pass it down
# to configure and make.
.if defined(TMPDIR)
MAKE_ENV+=	TMPDIR="${TMPDIR}"
CONFIGURE_ENV+=	TMPDIR="${TMPDIR}"
.endif # defined(TMPDIR)

# Reset value from bsd.own.mk.
.if defined(WITH_DEBUG) && !defined(WITHOUT_DEBUG)
STRIP=	#none
.endif

.include "${MPORTCOMPONENTS}/options.mk"

# Start of pre-makefile section.
.if !defined(AFTERPORTMK) && !defined(INOPTIONSMK)

.include "${MPORTCOMPONENTS}/sanity.mk"

_PREMKINCLUDED=		yes

.if defined(PORTVERSION)
.if ${PORTVERSION:M*[-_,]*}x != x
IGNORE=			PORTVERSION ${PORTVERSION} may not contain '-' '_' or ','
.endif
DISTVERSION?=	${PORTVERSION:S/:/::/g}
.elif defined(DISTVERSION)
PORTVERSION=	${DISTVERSION:tl:C/([a-z])[a-z]+/\1/g:C/([0-9])([a-z])/\1.\2/g:C/:(.)/\1/g:C/[^a-z0-9+]+/./g}
.endif

PORTREVISION?=	0
.if ${PORTREVISION} != 0
_SUF1=	_${PORTREVISION}
.endif

PORTEPOCH?=		0
.if ${PORTEPOCH} != 0
_SUF2=	,${PORTEPOCH}
.endif

PKGVERSION=	${PORTVERSION:C/[-_,]/./g}${_SUF1}${_SUF2}
PKGBASE=	${PKGNAMEPREFIX}${PORTNAME}${PKGNAMESUFFIX}
PKGSUBNAME=	${PKGBASE}
PKGNAME=	${PKGBASE}-${PKGVERSION}
DISTNAME?=	${PORTNAME}-${DISTVERSIONPREFIX}${DISTVERSION:C/:(.)/\1/g}${DISTVERSIONSUFFIX}
DISTVERSIONFULL=	${DISTVERSIONPREFIX}${DISTVERSION:C/:(.)/\1/g}${DISTVERSIONSUFFIX}

.if defined(USE_GITHUB) && empty(MASTER_SITES:MGHC)
# Only add in DISTVERSIONFULL if GH_TAGNAME if set by port. Otherwise
# GH_TAGNAME defaults to DISTVERSIONFULL; Avoid adding DISTVERSIONFULL in twice.
.  if defined(GH_TAGNAME)
DISTNAME?=	${GH_ACCOUNT}-${GH_PROJECT}-${DISTVERSIONFULL}-${GH_TAGNAME_SANITIZED}
.  else
DISTNAME?=	${GH_ACCOUNT}-${GH_PROJECT}-${GH_TAGNAME_SANITIZED}
.  endif
.else
DISTNAME?=	${PORTNAME}-${DISTVERSIONFULL}
.endif

INDEXFILE?=		INDEX-${OSVERSION:C/([0-9]).*/\1/}

PKGCOMPATDIR?=	${LOCALBASE}/lib/compat/pkg

#
# Handle the backwards compatibility stuff for extension loading
#
.if defined(XORG_CAT)
_LOAD_XORG_EXT=		yes
.endif

.if defined(PERL_CONFIGURE) || defined(PERL_MODBUILD) 
_LOAD_PERL5_EXT=	yes
.endif

.if defined(USE_LIBRUBY)
_LOAD_RUBY_EXT=		yes
.endif

.if defined(USE_TK)
_LOAD_TCL_EXT=		yes
.endif

.if defined(APACHE_COMPAT)
_LOAD_APACHE_EXT=	yes
.endif

.if (defined (USE_QT_VER) && ${USE_QT_VER:tl} == 4) || defined(USE_QT4)
_LOAD_QT_EXT=		yes
.endif

.if defined(USE_GTK)
_LOAD_GNOME_EXT=	yes
.endif

.if defined(USE_GSTREAMER1)
_LOAD_GSTREAMER_EXT=	yes
.endif

.if defined(USE_LDAP)
_LOAD_LDAP_EXT=	yes
.endif

.for EXT in ${EXTENSIONS}
_LOAD_${EXT:tu}_EXT=	yes
.endfor

# This is the order that we used before the extensions were refactored. 
# in the future if things could be fixed to work when loaded alphabetacally, then
# we could go back to the above approach.
_ALL_EXT=	charsetfix desthack pathfix pkgconfig compiler kmod uidfix \
		linux_rpm linux_apps xorg fortran \
		gcc fmake gmake bison local perl5 openssl \
		apache autotools bdb cmake cpe display dos2unix \
		efl emacs execinfo fam fonts fuse \
		gecko gettext gettext-tools gettext-runtime \
		gnome gnustep gssapi gstreamer iconv imake jpeg \
		ldap libarchive libedit libtool localbase lua \
		metaport makeself motif mysql ncurses objc ocaml openal \
		pgsql php python java qt ruby scons sdl sqlite \
		tar tcl tk tex wx xfce zip

.for EXT in ${_ALL_EXT:tu} 
.	if defined(USE_${EXT}) || defined(USE_${EXT}_RUN) || defined(USE_${EXT}_BUILD) || defined(WANT_${EXT}) || defined(_LOAD_${EXT}_EXT)
.		include "${MPORTEXTENSIONS}/${EXT:tl}.mk"
.	endif
.endfor


# Loading features - USES directive
.for f in ${USES}
_f:=	${f:C/\:.*//}
.if !defined(${_f}_ARGS)
${_f}_ARGS:=	${f:C/^[^\:]*(\:|\$)//:S/,/ /g}
.endif
.endfor
.for f in ${USES}
.include "${MPORTEXTENSIONS}/${f:C/\:.*//}.mk"
.endfor


.if defined(USE_GCPIO)
EXTRACT_DEPENDS+=       gcpio:${PORTSDIR}/archivers/gcpio
.endif

.if defined(USE_BZIP2)
USES+=tar:bzip2
.elif defined(USE_ZIP)
USES+=zip
.elif defined(USE_XZ)
USES+=tar:xz
.elif defined(USE_MAKESELF)
EXTRACT_SUFX?=			.run
.else
EXTRACT_SUFX?=			.tar.gz
.endif

PACKAGES?=		${PORTSDIR}/Packages/${ARCH}
TEMPLATES?=		${PORTSDIR}/Templates
KEYWORDS?=		${PORTSDIR}/Keywords

PATCHDIR?=		${MASTERDIR}/files
FILESDIR?=		${MASTERDIR}/files
SCRIPTDIR?=		${MASTERDIR}/scripts
PKGDIR?=		${MASTERDIR}

.if defined(USE_LINUX_PREFIX)
_LINUX_LDCONFIG=			${LINUXBASE_REL}/sbin/ldconfig -r ${LINUXBASE_REL}
LDCONFIG_PLIST_EXEC_CMD?=	${_LINUX_LDCONFIG}
LDCONFIG_PLIST_UNEXEC_CMD?=	${_LINUX_LDCONFIG}
.else
LDCONFIG_PLIST_EXEC_CMD?=	${LDCONFIG} -m ${USE_LDCONFIG:S|${PREFIX}|%D|g}
LDCONFIG_PLIST_UNEXEC_CMD?=	${LDCONFIG} -R
.endif


# These do some path checks if DESTDIR is set correctly.
# You can force skipping these test by defining IGNORE_PATH_CHECKS
.if !defined(IGNORE_PATH_CHECKS)
.if (${PREFIX:C,(^.).*,\1,} != "/")
.BEGIN:
	@${ECHO_MSG} "PREFIX must be defined as an absolute path so that when 'make'"
	@${ECHO_MSG} "is invoked in the work area PREFIX points to the right place."
	@${FALSE}
.endif
.if defined(DESTDIR)
.if (${DESTDIR:C,(^.).*,\1,} != "/")
.if ${DESTDIR} == "/"
.BEGIN:
	@${ECHO_MSG} "You can't set DESTDIR to /. Please re-run make with"
	@${ECHO_MSG} "DESTDIR unset."
	@${FALSE}
.else
.BEGIN:
	@${ECHO_MSG} "DESTDIR must be defined as an absolute path so that when 'make'"
	@${ECHO_MSG} "is invoked in the work area DESTDIR points to the right place."
	@${FALSE}
.endif
.endif
.if (${DESTDIR:C,^.*(/)$$,\1,} == "/")
.BEGIN:
	@${ECHO_MSG} "DESTDIR can't have a trailing slash. Please remove the trailing"
	@${ECHO_MSG} "slash and re-run 'make'"
	@${FALSE}
.endif
.endif
.endif

#
# One of the includes may have changed CPIO
#
.if defined(USE_GCPIO)
CPIO=	${GCPIO}
.endif

# Location of mounted CDROM(s) to search for files
CD_MOUNTPTS?=	/cdrom ${CD_MOUNTPT}

# Owner and group of the WWW user
WWWOWN?=	www
WWWGRP?=	www


.include "${MPORTCOMPONENTS}/fake/vars.mk"

.endif
# End of pre-makefile section.

# Start of post-makefile section.
.if !defined(BEFOREPORTMK) && !defined(INOPTIONSMK)

.if defined(_POSTMKINCLUDED)
check-makefile::
	@${ECHO_MSG} "${PKGNAME}: Makefile error: you cannot include bsd.port[.post].mk twice"
	@${FALSE}
.endif


_POSTMKINCLUDED=	yes

# Integrate with the license auditing framework
.if !defined (DISABLE_LICENSES)
.include "${MPORTCOMPONENTS}/licenses.mk"
.endif

# Make sure we have some stuff defined before we pull in the mixins.
#
# The user can override the NO_PACKAGE by specifying this from
# the make command line
.if defined(FORCE_PACKAGE)
.undef NO_PACKAGE
.endif

WRKDIR?=		${WRKDIRPREFIX}${.CURDIR}/work
.if !defined(IGNORE_MASTER_SITE_GITHUB) && defined(USE_GITHUB)
WRKSRC?=		${WRKDIR}/${GH_PROJECT}-${DISTVERSION}
.endif
.if defined(NO_WRKSUBDIR)
WRKSRC?=		${WRKDIR}
.else
WRKSRC?=		${WRKDIR}/${DISTNAME}
.endif

PATCH_WRKSRC?=	${WRKSRC}
CONFIGURE_WRKSRC?=	${WRKSRC}
BUILD_WRKSRC?=	${WRKSRC}
INSTALL_WRKSRC?=${WRKSRC}

DESCR?=			${PKGDIR}/pkg-descr
PLIST?=			${PKGDIR}/pkg-plist
PKGINSTALL?=	${PKGDIR}/pkg-install
PKGDEINSTALL?=	${PKGDIR}/pkg-deinstall
PKGREQ?=		${PKGDIR}/pkg-req
PKGMESSAGE?=	${PKGDIR}/pkg-message

TMPPLIST?=	${WRKDIR}/.PLIST.mktmp
TMPGUCMD?=	${WRKDIR}/.PLIST.gucmd

.for _CATEGORY in ${CATEGORIES}
PKGCATEGORY?=	${_CATEGORY}
.endfor
_PORTDIRNAME=	${.CURDIR:T}
PORTDIRNAME?=	${_PORTDIRNAME}
PKGORIGIN?=		${PKGCATEGORY}/${PORTDIRNAME}



#
# Pull in our mixins.
#


.include "${MPORTCOMPONENTS}/options.mk"
.include "${MPORTCOMPONENTS}/metadata.mk"
.include "${MPORTCOMPONENTS}/maintainer.mk"


PLIST_SUB+=	OSREL=${OSREL} PREFIX=%D LOCALBASE=${LOCALBASE_REL} \
		DESTDIR=${DESTDIR} TARGETDIR=${TARGETDIR} \
		RESETPREFIX=${TRUE_PREFIX}
SUB_LIST+=	PREFIX=${PREFIX} LOCALBASE=${LOCALBASE_REL} \
		DATADIR=${DATADIR} DOCSDIR=${DOCSDIR} EXAMPLESDIR=${EXAMPLESDIR} \
		WWWDIR=${WWWDIR} ETCDIR=${ETCDIR} \
		DESTDIR=${DESTDIR} TARGETDIR=${TARGETDIR}

PLIST_REINPLACE+=	group mode owner stopdaemon rmtry
PLIST_REINPLACE_RMTRY=s!^@rmtry \(.*\)!@unexec rm -f %D/\1 2>/dev/null || true!
PLIST_REINPLACE_STOPDAEMON=s!^@stopdaemon \(.*\)!@unexec %D/etc/rc.d/\1 forcestop 2>/dev/null || true!
PLIST_REINPLACE_owner=s!^@owner \(.*\)!@exec chown \1 %D
PLIST_REINPLACE_group=s!^@group \(.*\)!@exec chgroup \1 %D
PLIST_REINPLACE_mode=s!^@mode \(.*\)!@exec chmod \1 %D

# kludge to strip trailing whitespace from CFLAGS;
# sub-configure will not # survive double space
CFLAGS:=	${CFLAGS:C/ $//}

.if defined(WITHOUT_CPU_CFLAGS)
.if defined(_CPUCFLAGS)
.if !empty(_CPUCFLAGS)
CFLAGS:=	${CFLAGS:C/${_CPUCFLAGS}//}
.endif
.endif
.endif

.if defined(WITH_DEBUG) && ${WITH_DEBUG} != "no"
.if !defined(INSTALL_STRIPPED)
STRIP=  #none
MAKE_ENV+=      DONTSTRIP=yes
STRIP_CMD=      ${TRUE}
.endif
DEBUG_FLAGS?=	-g
CFLAGS:=	${CFLAGS:N-O*:N-fno-strict*} ${DEBUG_FLAGS}
.if defined(INSTALL_TARGET)
INSTALL_TARGET:=	${INSTALL_TARGET:S/^install-strip$/install/g}
.endif
.endif

.if defined(WITH_SSP) || defined(WITH_SSP_PORTS)
.include "${PORTSDIR}/Mk/components/ssp.mk"
.endif

# XXX PIE support to be added here
MAKE_ENV+=	NO_PIE=yes

.if defined(NOPORTDOCS)
PLIST_SUB+=	PORTDOCS="@comment "
.else
PLIST_SUB+=	PORTDOCS=""
.endif

.if defined(NOPORTEXAMPLES)
PLIST_SUB+=	PORTEXAMPLES="@comment "
.else
PLIST_SUB+=	PORTEXAMPLES=""
.endif

# XXX deprecated
.if defined(NOPORTDATA)
PLIST_SUB+=	PORTDATA="@comment "
.else
PLIST_SUB+=	PORTDATA=""
.endif

CONFIGURE_SHELL?=	${SH}
MAKE_SHELL?=	${SH}

CONFIGURE_ENV+=	SHELL=${CONFIGURE_SHELL} CONFIG_SHELL=${CONFIGURE_SHELL}
MAKE_ENV+=		SHELL=${MAKE_SHELL} NO_LINT=YES

.if defined(MANCOMPRESSED)
.if ${MANCOMPRESSED} != yes && ${MANCOMPRESSED} != no && \
	${MANCOMPRESSED} != maybe
check-makevars::
	@${ECHO_MSG} "${PKGNAME}: Makefile error: value of MANCOMPRESSED (is \"${MANCOMPRESSED}\") can only be \"yes\", \"no\" or \"maybe\"".
	@${FALSE}
.endif
.endif

MANCOMPRESSED?=	no

.if defined(PATCHFILES)
.if ${PATCHFILES:M*.zip}x != x
PATCH_DEPENDS+=		${LOCALBASE}/bin/unzip:${PORTSDIR}/archivers/unzip
.endif
.endif

.if defined(USE_LHA)
EXTRACT_DEPENDS+=	lha:${PORTSDIR}/archivers/lha
.endif
.if defined(USE_MAKESELF)
EXTRACT_DEPENDS+=	unmakeself:${PORTSDIR}/archivers/unmakeself
.endif

.if defined(USE_BINUTILS) && !defined(DISABLE_BINUTILS)
BUILD_DEPENDS+=	${LOCALBASE}/bin/as:${PORTSDIR}/devel/binutils
BINUTILS?=	ADDR2LINE AR AS CPPFILT GPROF LD NM OBJCOPY OBJDUMP RANLIB \
	READELF SIZE STRINGS
BINUTILS_NO_MAKE_ENV?=
. for b in ${BINUTILS}
${b}=	${LOCALBASE}/bin/${b:C/PP/++/:tl}
.  if defined(GNU_CONFIGURE) || defined(BINUTILS_CONFIGURE)
CONFIGURE_ENV+=	${b}="${${b}}"
.  endif
.  if ${BINUTILS_NO_MAKE_ENV:M${b}} == ""
MAKE_ENV+=	${b}="${${b}}"
.  endif
. endfor
.endif

.if defined(USE_OPENLDAP_VER)
USE_OPENLDAP?=		yes
WANT_OPENLDAP_VER=	${USE_OPENLDAP_VER}
.endif

.if defined(USE_RC_SUBR) || defined(USE_RCORDER)
RC_SUBR=	/etc/rc.subr
SUB_LIST+=	RC_SUBR=${RC_SUBR}
.if defined(USE_RC_SUBR) && ${USE_RC_SUBR:tu} != "YES"
SUB_FILES+=	${USE_RC_SUBR}
.endif
.if defined(USE_RCORDER)
SUB_FILES+=	${USE_RCORDER}
.endif
.endif

.if defined(USE_LDCONFIG) && ${USE_LDCONFIG:tl} == "yes"
USE_LDCONFIG=	${PREFIX}/lib
.endif

.if defined(USE_LDCONFIG32) && ${USE_LDCONFIG32:tl} == "yes"
IGNORE=			has USE_LDCONFIG32 set to yes, which is not correct
.endif

.if defined(USE_LINUX_PREFIX) && defined(USE_LDCONFIG)
# we need ${LINUXBASE}/sbin/ldconfig
USE_LINUX?=	yes
.endif

.if defined(USE_LINUX)

.  if !defined(LINUX_OSRELEASE)
LINUX_OSRELEASE!=	${ECHO_CMD} `${SYSCTL} -n compat.linux.osrelease 2>/dev/null`
.  endif

# install(1) also does a brandelf on strip, so don't strip with FreeBSD tools.
STRIP=
.	if exists(${LINUXBASE}/usr/bin/strip)
STRIP_CMD=	${LINUXBASE}/usr/bin/strip
.	else
STRIP_CMD=	${TRUE}
.	endif

# Allow the user to specify another linux_base version.
.	if defined(OVERRIDE_LINUX_BASE_PORT)
.		if ${USE_LINUX:tl} == yes
USE_LINUX=	${OVERRIDE_LINUX_BASE_PORT}
.		endif
.	endif

# NOTE: when you update the default linux_base version (case "yes"),
# don't forget to update the Handbook!

.	if exists(${PORTSDIR}/emulators/linux_base-${USE_LINUX})
LINUX_BASE_PORT=	${LINUXBASE}/bin/sh:${PORTSDIR}/emulators/linux_base-${USE_LINUX}
.	else
.		if ${USE_LINUX:tl} == "yes"
.				if (${OSVERSION} > 4003)
LINUX_BASE_PORT=	${LINUXBASE}/etc/fedora-release:${PORTSDIR}/emulators/linux_base-f10
.				else
LINUX_BASE_PORT=	${LINUXBASE}/etc/fedora-release:${PORTSDIR}/emulators/linux_base-fc4
.				endif
.		else
IGNORE=		cannot be built: there is no emulators/linux_base-${USE_LINUX}, perhaps wrong use of USE_LINUX or OVERRIDE_LINUX_BASE_PORT.
.		endif
.	endif

BUILD_DEPENDS+=	${LINUX_BASE_PORT}
RUN_DEPENDS+=	${LINUX_BASE_PORT}
.endif

# required by mport.create MPORT_CREATE_ARGS
PKG_IGNORE_DEPENDS?=		'this_port_does_not_exist'

_GL_gbm_LIB_DEPENDS=		libgbm.so:${PORTSDIR}/graphics/gbm
_GL_glesv2_LIB_DEPENDS=		libGLESv2.so:${PORTSDIR}/graphics/libglesv2
_GL_egl_LIB_DEPENDS=		libEGL.so:${PORTSDIR}/graphics/libEGL
_GL_gl_LIB_DEPENDS=		libGL.so:${PORTSDIR}/graphics/libGL
_GL_gl_USE_XORG=		glproto dri2proto
_GL_glew_LIB_DEPENDS=		libGLEW.so:${PORTSDIR}/graphics/glew
_GL_glu_LIB_DEPENDS=		libGLU.so:${PORTSDIR}/graphics/libGLU
_GL_glu_USE_XORG=		glproto dri2proto
_GL_glw_LIB_DEPENDS=		libGLw.so:${PORTSDIR}/graphics/libGLw
_GL_glut_LIB_DEPENDS=		libglut.so:${PORTSDIR}/graphics/freeglut

.if defined(USE_GL)
. if ${USE_GL:tl} == "yes"
USE_GL=		glu
. endif
. for _component in ${USE_GL}
.  if !defined(_GL_${_component}_LIB_DEPENDS) && \
		!defined(_GL_${_component}_RUN_DEPENDS)
IGNORE=		uses unknown GL component
.   else
USE_XORG+=	${_GL_${_component}_USE_XORG}
BUILD_DEPENDS+=	${_GL_${_component}_BUILD_DEPENDS}
LIB_DEPENDS+=	${_GL_${_component}_LIB_DEPENDS}
RUN_DEPENDS+=	${_GL_${_component}_RUN_DEPENDS}
.  endif
. endfor
.endif

.if defined(USE_LOCAL_MK)
EXTENSIONS+=	local
.endif

.if defined(XORG_CAT)
EXTENSIONS+=xorg
.endif

#
# Here we include again XXX
#
.for EXT in ${_ALL_EXT:tu} 
.	if defined(USE_${EXT}) || defined(USE_${EXT}_RUN) || defined(USE_${EXT}_BUILD) || defined(WANT_${EXT}) || defined(_LOAD_${EXT}_EXT)
.		include "${MPORTEXTENSIONS}/${EXT:tl}.mk"
.	endif
.endfor

# FreeBSD compatibility: Loading features
.for f in ${_USES_POST}
_f:=	${f:C/\:.*//}
.if !defined(${_f}_ARGS)
${_f}_ARGS:=	${f:C/^[^\:]*(\:|\$)//:S/,/ /g}
.endif
.endfor
.for f in ${_USES_POST}
.include "${MPORTEXTENSIONS}/${f:C/\:.*//}.mk"
.endfor

.if defined(USE_XORG)
# Add explicit X options to avoid problems with false positives in configure
.if defined(GNU_CONFIGURE)
CONFIGURE_ARGS+=--x-libraries=${LOCALBASE}/lib --x-includes=${LOCALBASE}/include
.endif
.endif

.if exists(${PORTSDIR}/../Makefile.inc)
.include "${PORTSDIR}/../Makefile.inc"
USE_SUBMAKE=	yes
.endif

#
# These componenets include targets that may have been overwritten by the 
# above extentions, so they are loaded here.
#
USE_MPORT_TOOLS=	yes
.include "${MPORTCOMPONENTS}/fake/targets.mk"
.include "${MPORTCOMPONENTS}/update.mk"


# Set the default for the installation of Postscript(TM)-
# compatible functionality.
.if !defined(WITHOUT_X11)
GHOSTSCRIPT_PORT?=	print/ghostscript8
.else
GHOSTSCRIPT_PORT?=	print/ghostscript8-nox11
.endif

# Set up the ghostscript dependencies.
.if defined(USE_GHOSTSCRIPT) || defined(USE_GHOSTSCRIPT_BUILD)
BUILD_DEPENDS+=	gs:${PORTSDIR}/${GHOSTSCRIPT_PORT}
.endif
.if defined(USE_GHOSTSCRIPT) || defined(USE_GHOSTSCRIPT_RUN)
RUN_DEPENDS+=	gs:${PORTSDIR}/${GHOSTSCRIPT_PORT}
.endif

# Set up the cdrtools.
.if defined(USE_CDRTOOLS)
BUILD_DEPENDS+=	cdrecord:${PORTSDIR}/sysutils/cdrtools
RUN_DEPENDS+=	cdrecord:${PORTSDIR}/sysutils/cdrtools
.endif

# Macro for doing in-place file editing using regexps
REINPLACE_ARGS?=	-i.bak
REINPLACE_CMD?=	${SED} ${REINPLACE_ARGS}

# Names of cookies used to skip already completed stages
EXTRACT_COOKIE?=	${WRKDIR}/.extract_done.${PORTNAME}.${PREFIX:S/\//_/g}
CONFIGURE_COOKIE?=	${WRKDIR}/.configure_done.${PORTNAME}.${PREFIX:S/\//_/g}
UPDATE_COOKIE?=		${WRKDIR}/.update_done.${PORTNAME}.${PREFIX:S/\//_/g}
INSTALL_COOKIE?=	${WRKDIR}/.install_done.${PORTNAME}.${PREFIX:S/\//_/g}
BUILD_COOKIE?=		${WRKDIR}/.build_done.${PORTNAME}.${PREFIX:S/\//_/g}
PATCH_COOKIE?=		${WRKDIR}/.patch_done.${PORTNAME}.${PREFIX:S/\//_/g}
PACKAGE_COOKIE?=	${WRKDIR}/.package_done.${PORTNAME}.${PREFIX:S/\//_/g}
FAKE_COOKIE?=		${WRKDIR}/.fake_done.${PORTNAME}.${PREFIX:S/\//_/g}

# How to do nothing.  Override if you, for some strange reason, would rather
# do something.
DO_NADA?=		${TRUE}

# Use this as the first operand to always build dependency.
NONEXISTENT?=	/nonexistent

# Miscellaneous overridable commands:
XMKMF?=			xmkmf -a

CHECKSUM_ALGORITHMS?= sha256

DISTINFO_FILE?=		${MASTERDIR}/distinfo

MAKE_FLAGS?=	-f
MAKEFILE?=		Makefile
MAKE_CMD?=		${BSDMAKE}
MAKE_ENV+=		TARGETDIR=${TARGETDIR} \
			DESTDIR=${DESTDIR} \
			PREFIX=${PREFIX} \
			LOCALBASE=${LOCALBASE_REL} \
			LIBDIR="${LIBDIR}" \
			CC="${CC}" CFLAGS="${CFLAGS}" \
			CPP="${CPP}" CPPFLAGS="${CPPFLAGS}" \
			LDFLAGS="${LDFLAGS}" LIBS="${LIBS}" \
			CXX="${CXX}" CXXFLAGS="${CXXFLAGS}" \
			MANPREFIX="${MANPREFIX}"

# Add -fno-strict-aliasing to CFLAGS with optimization level -O2 or higher.
# gcc 4.x enable strict aliasing optimization with -O2 which is known to break
# a lot of ports.
.if !defined(WITHOUT_NO_STRICT_ALIASING)
.if !empty(CFLAGS:M-O[23s]) && empty(CFLAGS:M-fno-strict-aliasing)
CFLAGS+=       -fno-strict-aliasing
.endif
.endif

.for lang in C CXX
.if defined(USE_${lang}STD)
${lang}FLAGS:=	${${lang}FLAGS:N-std=*} -std=${USE_${lang}STD}
.endif

.if defined(${lang}FLAGS_${ARCH})
${lang}FLAGS+=	${${lang}FLAGS_${ARCH}}
.endif
.endfor

# Multiple make jobs support
.if defined(DISABLE_MAKE_JOBS) || defined(MAKE_JOBS_UNSAFE)
_MAKE_JOBS=		#
MAKE_JOBS_NUMBER=	1
.else
.if defined(MAKE_JOBS_NUMBER)
_MAKE_JOBS_NUMBER:=	${MAKE_JOBS_NUMBER}
.else
_MAKE_JOBS_NUMBER!=	${SYSCTL} -n kern.smp.cpus
.endif
.if defined(MAKE_JOBS_NUMBER_LIMIT) && ( ${MAKE_JOBS_NUMBER_LIMIT} < ${_MAKE_JOBS_NUMBER} )
MAKE_JOBS_NUMBER=	${MAKE_JOBS_NUMBER_LIMIT}
.else
MAKE_JOBS_NUMBER=	${_MAKE_JOBS_NUMBER}
.endif
_MAKE_JOBS?=		-j${MAKE_JOBS_NUMBER}
BUILD_FAIL_MESSAGE+=	Try to set MAKE_JOBS_UNSAFE=yes and rebuild before reporting the failure to the maintainer.
.endif

PTHREAD_CFLAGS?=
PTHREAD_LIBS?=		-pthread

FETCH_ENV?=		SSL_NO_VERIFY_PEER=1 SSL_NO_VERIFY_HOSTNAME=1
FETCH_BINARY?=	/usr/bin/fetch
FETCH_ARGS?=	-Fpr
FETCH_REGET?=	1
.if !defined(DISABLE_SIZE)
FETCH_BEFORE_ARGS+=	$${CKSIZE:+-S $$CKSIZE}
.endif
FETCH_CMD?=		${FETCH_BINARY} ${FETCH_ARGS}

.if defined(RANDOMIZE_MASTER_SITES) && exists(/usr/games/random)
RANDOM_CMD?=	/usr/games/random
RANDOM_ARGS?=	"-w -f -"
_RANDOMIZE_SITES=	" |${RANDOM_CMD} ${RANDOM_ARGS}"
.endif

TOUCH?=			/usr/bin/touch
TOUCH_FLAGS?=	-f

DISTORIG?=	.bak.orig
PATCH?=			/usr/bin/patch
PATCH_STRIP?=	-p0
PATCH_DIST_STRIP?=	-p0
.if defined(PATCH_DEBUG)
PATCH_DEBUG_TMP=	yes
PATCH_ARGS?=	-d ${PATCH_WRKSRC} -E ${PATCH_STRIP}
PATCH_DIST_ARGS?=	--suffix ${DISTORIG} -d ${PATCH_WRKSRC} -E ${PATCH_DIST_STRIP}
.else
PATCH_DEBUG_TMP=	no
PATCH_ARGS?=	-d ${PATCH_WRKSRC} --forward --quiet -E ${PATCH_STRIP}
PATCH_DIST_ARGS?=	--suffix ${DISTORIG} -d ${PATCH_WRKSRC} --forward --quiet -E ${PATCH_DIST_STRIP}
.endif
.if !defined(QUIET)
PATCH_SILENT=		PATCH_SILENT=yes
.endif
.if defined(BATCH)
PATCH_ARGS+=		--batch
PATCH_DIST_ARGS+=	--batch
.endif

# Prevent breakage with VERSION_CONTROL=numbered
PATCH_ARGS+=	-V simple

.if defined(PATCH_CHECK_ONLY)
PATCH_ARGS+=	-C
PATCH_DIST_ARGS+=	-C
.endif

.if ${PATCH} == "/usr/bin/patch"
PATCH_ARGS+=	--suffix .orig
PATCH_DIST_ARGS+=	--suffix .orig
.endif

TAR?=	/usr/bin/tar

# EXTRACT_SUFX is defined in .pre.mk section
.if defined(USE_LHA)
EXTRACT_CMD?=		${LHA_CMD}
EXTRACT_BEFORE_ARGS?=	xfqw=${WRKDIR}
EXTRACT_AFTER_ARGS?=
.elif defined(USE_MAKESELF)
EXTRACT_CMD?=		${UNMAKESELF_CMD}
EXTRACT_BEFORE_ARGS?=
EXTRACT_AFTER_ARGS?=
.else
EXTRACT_CMD?=		${TAR}
EXTRACT_BEFORE_ARGS?=	-xf
.if defined(EXTRACT_PRESERVE_OWNERSHIP)
EXTRACT_AFTER_ARGS?=
.else
EXTRACT_AFTER_ARGS?=	--no-same-owner --no-same-permissions
.endif
.endif


# Determine whether or not we can use rootly owner/group functions.
.if !defined(UID)
UID!=	${ID} -u
.endif
.if ${UID} == 0
_BINOWNGRP=	-o ${BINOWN} -g ${BINGRP}
_SHROWNGRP=	-o ${SHAREOWN} -g ${SHAREGRP}
_MANOWNGRP=	-o ${MANOWN} -g ${MANGRP}
.else
_BINOWNGRP=
_SHROWNGRP=
_MANOWNGRP=
.endif

# A few aliases for *-install targets
INSTALL_PROGRAM= \
	${INSTALL} ${COPY} ${STRIP} ${_BINOWNGRP} -m ${BINMODE}
INSTALL_KLD= \
	${INSTALL} ${COPY} ${_BINOWNGRP} -m ${BINMODE}
INSTALL_LIB= \
	${INSTALL} ${COPY} ${STRIP} ${_SHROWNGRP} -m ${SHAREMODE}
INSTALL_SCRIPT= \
	${INSTALL} ${COPY} ${_BINOWNGRP} -m ${BINMODE}
INSTALL_DATA= \
	${INSTALL} ${COPY} ${_SHROWNGRP} -m ${SHAREMODE}
INSTALL_MAN= \
	${INSTALL} ${COPY} ${_MANOWNGRP} -m ${MANMODE}

INSTALL_MACROS=	BSD_INSTALL_PROGRAM="${INSTALL_PROGRAM}" \
			BSD_INSTALL_LIB="${INSTALL_LIB}" \
			BSD_INSTALL_SCRIPT="${INSTALL_SCRIPT}" \
			BSD_INSTALL_DATA="${INSTALL_DATA}" \
			BSD_INSTALL_MAN="${INSTALL_MAN}"
MAKE_ENV+=	${INSTALL_MACROS}
SCRIPTS_ENV+=	${INSTALL_MACROS}

# Macro for copying entire directory tree with correct permissions
.if ${UID} == 0
COPYTREE_BIN=	${SH} -c '(${FIND} -d $$0 $$2 | ${CPIO} -dumpl $$1 >/dev/null \
					2>&1) && \
					${CHOWN} -Rh ${BINOWN}:${BINGRP} $$1 && \
					${FIND} -d $$0 $$2 -type d -exec chmod 755 $$1/{} \; && \
					${FIND} -d $$0 $$2 -type f -exec chmod ${BINMODE} $$1/{} \;' --
COPYTREE_SHARE=	${SH} -c '(${FIND} -d $$0 $$2 | ${CPIO} -dumpl $$1 >/dev/null \
					2>&1) && \
					${CHOWN} -Rh ${SHAREOWN}:${SHAREGRP} $$1 && \
					${FIND} -d $$0 $$2 -type d -exec chmod 755 $$1/{} \; && \
					${FIND} -d $$0 $$2 -type f -exec chmod ${SHAREMODE} $$1/{} \;' --
.else
COPYTREE_BIN=	${SH} -c '(${FIND} -d $$0 $$2 | ${CPIO} -dumpl $$1 >/dev/null \
					2>&1) && \
					${FIND} -d $$0 $$2 -type d -exec chmod 755 $$1/{} \; && \
					${FIND} -d $$0 $$2 -type f -exec chmod ${BINMODE} $$1/{} \;' --
COPYTREE_SHARE=	${SH} -c '(${FIND} -d $$0 $$2 | ${CPIO} -dumpl $$1 >/dev/null \
					2>&1) && \
					${FIND} -d $$0 $$2 -type d -exec chmod 755 $$1/{} \; && \
					${FIND} -d $$0 $$2 -type f -exec chmod ${SHAREMODE} $$1/{} \;' --
.endif



MPORT_CREATE?=		/usr/libexec/mport.create
MPORT_DELETE?=		/usr/libexec/mport.delete
MPORT_INSTALL?= 	/usr/libexec/mport.install
MPORT_QUERY?=		/usr/libexec/mport.query
MPORT_CHECK_FAKE?=	/usr/libexec/mport.check-fake
MPORT_UPDEPENDS?=	/usr/libexec/mport.updepends
MPORT_UPDATE?=		/usr/libexec/mport.update
MPORT_CHECK_OLDER?=	/usr/libexec/mport.check-for-older
MPORT_INFO?=		/usr/libexec/mport.info
MPORT_LIST?=		/usr/libexec/mport.list

.if defined(DESTDIR)
MPORT_INSTALL:=		${CHROOT} ${DESTDIR} ${MPORT_INSTALL}
MPORT_DELETE:=		${CHROOT} ${DESTDIR} ${MPORT_DELETE}
MPORT_QUERY:=   	${CHROOT} ${DESTDIR} ${MPORT_QUERY}
MPORT_UPDEPENDS:=	${CHROOT} ${DESTDIR} ${MPORT_UPDEPENDS}
MPORT_UPDATE:=		${CHROOT} ${DESTDIR} ${MPORT_UPDATE}
MPORT_CHECK_OLDER:=	${CHROOT} ${DESTDIR} ${MPORT_CHECK_OLDER}
MPORT_INFO:=		${CHROOT} ${DESTDIR} ${MPORT_INFO}
MPORT_LIST:=		${CHROOT} ${DESTDIR} ${MPORT_LIST}
.endif

.if !defined(MPORT_CREATE_ARGS)
MPORT_CREATE_ARGS=	-n ${PKGBASE} -v ${PKGVERSION} -o ${PKGFILE} \
					-s ${FAKE_DESTDIR} -p ${TMPPLIST} -P ${PREFIX} \
					-O ${PKGORIGIN} -c "${COMMENT:Q}" -l en \
					-D "`cd ${.CURDIR} && ${MAKE} package-depends | ${GREP} -v -E ${PKG_IGNORE_DEPENDS} | ${SORT} -u`" \
					-t "${CATEGORIES}"

.if ${OSVERSION} > 6000 && defined(PKG_NOTE_CPE)
MPORT_CREATE_ARGS+=			-e ${PKG_NOTE_CPE}
.endif
MPORT_CREATE_ARGS+=			$$_LATE_MPORT_CREATE_ARGS
					
.if !defined(NO_MTREE)
MPORT_CREATE_ARGS+=	-M ${MTREE_FILE}
.endif
.if defined(CONFLICTS) && !defined(DISABLE_CONFLICTS)
MPORT_CREATE_ARGS+=	-C "${CONFLICTS}"
.endif
.endif

PKG_SUFX?=	.mport

ALL_TARGET?=		all
INSTALL_TARGET?=	install
INSTALL_TARGET+=	${LATE_INSTALL_ARGS}

# Popular master sites
.include "${PORTSDIR}/Mk/components/sites.mk"

# Empty declaration to avoid "variable MASTER_SITES recursive" error
MASTER_SITES?=
PATCH_SITES?=
_MASTER_SITES_DEFAULT?=
_PATCH_SITES_DEFAULT?=

# Feed internal _{MASTER,PATCH}_SITES_n where n is a group designation
# as per grouping rules (:something)
# Organize _{MASTER,PATCH}_SITES_{DEFAULT,[^/:]+} according to grouping
# rules (:something)
.for _S in ${MASTER_SITES}
_S_TEMP=	${_S:S/^${_S:C@/?:[^/:]+$@/@}//:S/^://}
.	if !empty(_S_TEMP)
.		for _group in ${_S_TEMP:S/,/ /g}
_G_TEMP=	${_group}
.			if ${_G_TEMP} == all || ${_G_TEMP} == ALL || ${_G_TEMP} == default
check-makevars::
				@${ECHO_MSG} "Makefile error: the words all, ALL and default are reserved and cannot be"
				@${ECHO_MSG} "used in group definitions. Please fix your MASTER_SITES"
				@${FALSE}
.			endif
_MASTER_SITES_${_group}+=	${_S:C@^(.*/):[^/:]+$@\1@}
.		endfor
.	else
_MASTER_SITES_DEFAULT+=	${_S:C@^(.*/):[^/:]+$@\1@}
.	endif
.endfor
.for _S in ${PATCH_SITES}
_S_TEMP=	${_S:S/^${_S:C@/:[^/:]+$@/@}//:S/^://}
.	if !empty(_S_TEMP)
.		for _group in ${_S_TEMP:S/,/ /g}
_G_TEMP=	${_group}
.			if ${_G_TEMP} == all || ${_G_TEMP} == ALL || ${_G_TEMP} == default
check-makevars::
				@${ECHO_MSG} "The words all, ALL and default are reserved and cannot be"
				@${ECHO_MSG} "used in group definitions. Please fix your PATCH_SITES"
				@${FALSE}
.			endif
_PATCH_SITES_${_group}+=	${_S:C@^(.*/):[^/:]+$@\1@}
.		endfor
.	else
_PATCH_SITES_DEFAULT+=	${_S:C@^(.*/):[^/:]+$@\1@}
.	endif
.endfor

# Feed internal _{MASTER,PATCH}_SITE_SUBDIR_n where n is a group designation
# as per grouping rules (:something)
# Organize _{MASTER,PATCH}_SITE_SUBDIR_{DEFAULT,[^/:]+} according to grouping
# rules (:something)
.for _S in ${MASTER_SITE_SUBDIR}
_S_TEMP=	${_S:S/^${_S:C@/:[^/:]+$@/@}//:S/^://}
.	if !empty(_S_TEMP)
.		for _group in ${_S_TEMP:S/,/ /g}
_G_TEMP=	${_group}
.			if ${_G_TEMP} == all || ${_G_TEMP} == ALL || ${_G_TEMP} == default
check-makevars::
				@${ECHO_MSG} "Makefile error: the words all, ALL and default are reserved and cannot be"
				@${ECHO_MSG} "used in group definitions. Please fix your MASTER_SITE_SUBDIR"
				@${FALSE}
.			endif
.			if defined(_MASTER_SITES_${_group})
_MASTER_SITE_SUBDIR_${_group}+= ${_S:C@^(.*)/:[^/:]+$@\1@}
.			endif
.		endfor
.	else
.		if defined(_MASTER_SITES_DEFAULT)
_MASTER_SITE_SUBDIR_DEFAULT+=	${_S:C@^(.*)/:[^/:]+$@\1@}
.		endif
.	endif
.endfor
.for _S in ${PATCH_SITE_SUBDIR}
_S_TEMP=	${_S:S/^${_S:C@/:[^/:]+$@/@}//:S/^://}
.	if !empty(_S_TEMP)
.		for _group in ${_S_TEMP:S/,/ /g}
_G_TEMP=	${_group}
.			if ${_G_TEMP} == all || ${_G_TEMP} == ALL || ${_G_TEMP} == default
check-makevars::
				@${ECHO_MSG} "Makefile error: the words all, ALL and default are reserved and cannot be"
				@${ECHO_MSG} "used in group definitions. Please fix your PATCH_SITE_SUBDIR"
				@${FALSE}
.			endif
.			if defined(_PATCH_SITES_${_group})
_PATCH_SITE_SUBDIR_${_group}+= ${_S:C@^(.*)/:[^/:]+$@\1@}
.			endif
.		endfor
.	else
.		if defined(_PATCH_SITES_DEFAULT)
_PATCH_SITE_SUBDIR_DEFAULT+=	${_S:C@^(.*)/:[^/:]+$@\1@}
.		endif
.	endif
.endfor

# Substitute subdirectory names
# XXX simpler/faster solution but not the best space wise, suggestions please
.for _S in ${MASTER_SITES}
_S_TEMP=	${_S:S/^${_S:C@/:[^/:]+$@/@}//:S/^://}
.	if !empty(_S_TEMP)
.		for _group in ${_S_TEMP:S/,/ /g}
.			if !defined(_MASTER_SITE_SUBDIR_${_group})
MASTER_SITES_TMP=	${_MASTER_SITES_${_group}:S^%SUBDIR%/^^}
.			else
_S_TEMP_TEMP=		${_MASTER_SITES_${_group}:M*%SUBDIR%/*}
.				if empty(_S_TEMP_TEMP)
MASTER_SITES_TMP=	${_MASTER_SITES_${_group}}
.				else
MASTER_SITES_TMP=
.					for site in ${_MASTER_SITES_${_group}}
_S_TEMP_TEMP=	${site:M*%SUBDIR%/*}
.						if empty(_S_TEMP_TEMP)
MASTER_SITES_TMP+=	${site}
.						else
.							for dir in ${_MASTER_SITE_SUBDIR_${_group}}
MASTER_SITES_TMP+=	${site:S^%SUBDIR%^\${dir}^}
.							endfor
.						endif
.					endfor
.				endif
.			endif
_MASTER_SITES_${_group}:=	${MASTER_SITES_TMP}
.		endfor
.	endif
.endfor
.if defined(_MASTER_SITE_SUBDIR_DEFAULT)
_S_TEMP=	${_MASTER_SITES_DEFAULT:M*%SUBDIR%/*}
.	if empty(_S_TEMP)
MASTER_SITES_TMP=	${_MASTER_SITES_DEFAULT}
.	else
MASTER_SITES_TMP=
.		for site in ${_MASTER_SITES_DEFAULT}
_S_TEMP_TEMP=		${site:M*%SUBDIR%/*}
.			if empty(_S_TEMP_TEMP)
MASTER_SITES_TMP+=	${site}
.			else
.				for dir in ${_MASTER_SITE_SUBDIR_DEFAULT}
MASTER_SITES_TMP+=	${site:S^%SUBDIR%^\${dir}^}
.				endfor
.			endif
.		endfor
.	endif
.else
MASTER_SITES_TMP=	${_MASTER_SITES_DEFAULT:S^%SUBDIR%/^^}
.endif
_MASTER_SITES_DEFAULT:=	${MASTER_SITES_TMP}
MASTER_SITES_TMP=
.for _S in ${PATCH_SITES}
_S_TEMP=	${_S:S/^${_S:C@/:[^/:]+$@/@}//:S/^://}
.	if !empty(_S_TEMP)
.		for _group in ${_S_TEMP:S/,/ /g}
.			if !defined(_PATCH_SITE_SUBDIR_${_group})
PATCH_SITES_TMP=	${_PATCH_SITES_${_group}:S^%SUBDIR%/^^}
.			else
_S_TEMP_TEMP=		${_PATCH_SITES_${_group}:M*%SUBDIR%/*}
.				if empty(_S_TEMP_TEMP)
PATCH_SITES_TMP=	${_PATCH_SITES_${_group}}
.				else
PATCH_SITES_TMP=
.					for site in ${_PATCH_SITES_${_group}}
_S_TEMP_TEMP=	${site:M*%SUBDIR%/*}
.						if empty(_S_TEMP_TEMP)
PATCH_SITES_TMP+=	${site}
.						else
.							for dir in ${_PATCH_SITE_SUBDIR_${_group}}
PATCH_SITES_TMP+=	${site:S^%SUBDIR%^\${dir}^}
.							endfor
.						endif
.					endfor
.				endif
.			endif
_PATCH_SITES_${_group}:=	${PATCH_SITES_TMP}
.		endfor
.	endif
.endfor
.if defined(_PATCH_SITE_SUBDIR_DEFAULT)
_S_TEMP=	${_PATCH_SITES_DEFAULT:M*%SUBDIR%/*}
.	if empty(_S_TEMP)
PATCH_SITES_TMP=	${_PATCH_SITES_DEFAULT}
.	else
PATCH_SITES_TMP=
.		for site in ${_PATCH_SITES_DEFAULT}
_S_TEMP_TEMP=		${site:M*%SUBDIR%/*}
.			if empty(_S_TEMP_TEMP)
PATCH_SITES_TMP+=	${site}
.			else
.				for dir in ${_PATCH_SITE_SUBDIR_DEFAULT}
PATCH_SITES_TMP+=	${site:S^%SUBDIR%^\${dir}^}
.				endfor
.			endif
.		endfor
.	endif
.else
PATCH_SITES_TMP=	${_PATCH_SITES_DEFAULT:S^%SUBDIR%/^^}
.endif
_PATCH_SITES_DEFAULT:=	${PATCH_SITES_TMP}
PATCH_SITES_TMP=

# The primary backup site.
MASTER_SITE_BACKUP?=	\
	ftp://ftp.midnightbsd.org/pub/MidnightBSD/mports/distfiles/${DIST_SUBDIR}/ \
	http://distcache.freebsd.org/ports-distfiles/${DIST_SUBDIR}/
MASTER_SITE_BACKUP:=	${MASTER_SITE_BACKUP:S^\${DIST_SUBDIR}/^^}
# Include private dist files that we can't redistribute for Magus.
.if defined(MAGUS)
RANDOMIZE_MASTER_SITES=	"yes"
MASTER_SITE_BACKUP:=	${MASTER_SITE_BACKUP} \
			ftp://extradistfiles.midnightbsd.org/pub/
.endif

# If the user has MASTER_SITE_FREEBSD set, go to the FreeBSD repository
# for everything, but don't search it twice by appending it to the end.
.if defined(MASTER_SITE_FREEBSD)
_MASTER_SITE_OVERRIDE:=	${MASTER_SITE_BACKUP}
_MASTER_SITE_BACKUP:=	# empty
.else
_MASTER_SITE_OVERRIDE=	${MASTER_SITE_OVERRIDE}
_MASTER_SITE_BACKUP=	${MASTER_SITE_BACKUP}
.endif

# Search CDROM first if mounted, symlink instead of copy if
# FETCH_SYMLINK_DISTFILES is set
.for MOUNTPT in ${CD_MOUNTPTS}
.if exists(${MOUNTPT}/mports/Distfiles)
_MASTER_SITE_OVERRIDE:=	file:${MOUNTPT}/mports/Distfiles/${DIST_SUBDIR}/ ${_MASTER_SITE_OVERRIDE}
.if defined(FETCH_SYMLINK_DISTFILES)
FETCH_BEFORE_ARGS+=	-l
.endif
.endif
.endfor

NOFETCHFILES?=

# Organize DISTFILES, PATCHFILES, _MASTER_SITES_ALL, _PATCH_SITES_ALL
# according to grouping rules (:something)
DISTFILES?=		${DISTNAME}${EXTRACT_SUFX}
_MASTER_SITES_ALL=	${_MASTER_SITES_DEFAULT}
_PATCH_SITES_ALL=	${_PATCH_SITES_DEFAULT}
_G_TEMP=	DEFAULT
.for _D in ${DISTFILES}
_D_TEMP=	${_D:S/^${_D:C/:[^:]+$//}//}
.	if !empty(_D_TEMP)
.		for _group in ${_D_TEMP:S/^://:S/,/ /g}
.			if !defined(_MASTER_SITES_${_group})
_G_TEMP_TEMP=	${_G_TEMP:M/${_group}/}
.				if empty(_G_TEMP_TEMP)
_G_TEMP+=	${_group}
_MASTER_SITES_ALL+=	${_MASTER_SITES_${_group}}
.				endif
.			endif
.		endfor
_DISTFILES+=	${_D:C/:[^:]+$//}
.	else
_DISTFILES+=	${_D}
.	endif
.endfor
_G_TEMP=	DEFAULT
.for _P in ${PATCHFILES}
_P_TEMP=	${_P:C/:[^-:][^:]*$//}
_P_groups=	${_P:S/^${_P:C/:[^:]+$//}//:S/^://}
_P_file=	${_P_TEMP:C/:-[^:]+$//}
_P_strip=	${_P_TEMP:S/^${_P_TEMP:C/:-[^:]*$//}//:S/^://}
.	if !empty(_P_groups)
.		for _group in ${_P_groups:S/,/ /g}
.			if !defined(_PATCH_SITES_${_group})
_G_TEMP_TEMP=	${_G_TEMP:M/${_group}/}
.				if empty(_G_TEMP_TEMP)
_G_TEMP+=	${_group}
_PATCH_SITES_ALL+=	${_PATCH_SITES_${_group}}
.				endif
.			endif
.		endfor
.	endif
_PATCHFILES:=	${_PATCHFILES} ${_P_file}
.	if !empty(_P_strip)
_PATCH_DIST_STRIP_CASES:=	${_PATCH_DIST_STRIP_CASES} ("${_P_file}") printf %s "${_P_strip}" ;;
.	endif
.endfor
_P_groups=
_P_file=
_P_strip=
_G_TEMP=
_G_TEMP_TEMP=
ALLFILES?=	${_DISTFILES} ${_PATCHFILES}

#
# Sort the master site list according to the patterns in MASTER_SORT
#
MASTER_SORT?=
MASTER_SORT_REGEX?=
MASTER_SORT_REGEX+=	${MASTER_SORT:S|.|\\.|g:S|^|://[^/]*|:S|$|/|}

MASTER_SORT_AWK=	BEGIN { RS = " "; ORS = " "; IGNORECASE = 1 ; gl = "${MASTER_SORT_REGEX:S|\\|\\\\|g}"; }
.for srt in ${MASTER_SORT_REGEX}
MASTER_SORT_AWK+=	/${srt:S|/|\\/|g}/ { good["${srt:S|\\|\\\\|g}"] = good["${srt:S|\\|\\\\|g}"] " " $$0 ; next; }
.endfor
MASTER_SORT_AWK+=	{ rest = rest " " $$0; } END { n=split(gl, gla); for(i=1;i<=n;i++) { print good[gla[i]]; } print rest; }

SORTED_MASTER_SITES_DEFAULT_CMD=	cd ${.CURDIR} && ${MAKE} master-sites-DEFAULT
SORTED_PATCH_SITES_DEFAULT_CMD=		cd ${.CURDIR} && ${MAKE} patch-sites-DEFAULT
SORTED_MASTER_SITES_ALL_CMD=	cd ${.CURDIR} && ${MAKE} master-sites-ALL
SORTED_PATCH_SITES_ALL_CMD=	cd ${.CURDIR} && ${MAKE} patch-sites-ALL

# has similar effect to old targets, i.e., access only {MASTER,PATCH}_SITES, not working with the new _n variables
master-sites-DEFAULT:
	@${ECHO_CMD} ${_MASTER_SITE_OVERRIDE} `${ECHO_CMD} '${_MASTER_SITES_DEFAULT}' | ${AWK} '${MASTER_SORT_AWK:S|\\|\\\\|g}'` ${_MASTER_SITE_BACKUP}
patch-sites-DEFAULT:
	@${ECHO_CMD} ${_MASTER_SITE_OVERRIDE} `${ECHO_CMD} '${_PATCH_SITES_DEFAULT}' | ${AWK} '${MASTER_SORT_AWK:S|\\|\\\\|g}'` ${_MASTER_SITE_BACKUP}

#
# Sort the master site list according to the patterns in MASTER_SORT
# according to grouping rules (:something)
#
# for use in the fetch targets
.for _S in ${MASTER_SITES}
_S_TEMP=	${_S:S/^${_S:C@/:[^/:]+$@/@}//}
.	if !empty(_S_TEMP)
.		for _group in ${_S_TEMP:S/^://:S/,/ /g}
.			if !target(master-sites-${_group})
SORTED_MASTER_SITES_${_group}_CMD=	cd ${.CURDIR} && ${MAKE} master-sites-${_group}
master-sites-${_group}:
	@${ECHO_CMD} ${_MASTER_SITE_OVERRIDE} `${ECHO_CMD} '${_MASTER_SITES_${_group}}' | ${AWK} '${MASTER_SORT_AWK:S|\\|\\\\|g}'` ${_MASTER_SITE_BACKUP}
.			endif
.		endfor
.	endif
.endfor
.for _S in ${PATCH_SITES}
_S_TEMP=	${_S:S/^${_S:C@/:[^/:]+$@/@}//}
.	if !empty(_S_TEMP)
.		for _group in ${_S_TEMP:S/^://:S/,/ /g}
.			if !target(patch-sites-${_group})
SORTED_PATCH_SITES_${_group}_CMD=	cd ${.CURDIR} && ${MAKE} patch-sites-${_group}
patch-sites-${_group}:
	@${ECHO_CMD} ${_MASTER_SITE_OVERRIDE} `${ECHO_CMD} '${_PATCH_SITES_${_group}}' | ${AWK} '${MASTER_SORT_AWK:S|\\|\\\\|g}'` ${_MASTER_SITE_BACKUP}
.			endif
.		endfor
.	endif
.endfor

#
# Hackery to enable simple fetch targets with several dynamic MASTER_SITES
#
_MASTER_SITES_ENV=	_MASTER_SITES_DEFAULT="${_MASTER_SITES_DEFAULT}"
.for _F in ${DISTFILES}
_F_TEMP=	${_F:S/^${_F:C/:[^:]+$//}//:S/^://}
.	if !empty(_F_TEMP)
.		for _group in ${_F_TEMP:S/,/ /g}
.			if defined(_MASTER_SITES_${_group})
_MASTER_SITES_ENV+=	_MASTER_SITES_${_group}="${_MASTER_SITES_${_group}}"
.			endif
.		endfor
.	endif
.endfor
_PATCH_SITES_ENV=	_PATCH_SITES_DEFAULT="${_PATCH_SITES_DEFAULT}"
.for _F in ${PATCHFILES}
_F_TEMP=	${_F:S/^${_F:C/:[^-:][^:]*$//}//:S/^://}
.	if !empty(_F_TEMP)
.		for _group in ${_F_TEMP:S/,/ /g}
.			if defined(_PATCH_SITES_${_group})
_PATCH_SITES_ENV+=	_PATCH_SITES_${_group}="${_PATCH_SITES_${_group}}"
.			endif
.		endfor
.	endif
.endfor

master-sites-ALL:
	@${ECHO_CMD} ${_MASTER_SITE_OVERRIDE} `${ECHO_CMD} '${_MASTER_SITES_ALL}' | ${AWK} '${MASTER_SORT_AWK:S|\\|\\\\|g}'` ${_MASTER_SITE_BACKUP}
patch-sites-ALL:
	@${ECHO_CMD} ${_MASTER_SITE_OVERRIDE} `${ECHO_CMD} '${_PATCH_SITES_ALL}' | ${AWK} '${MASTER_SORT_AWK:S|\\|\\\\|g}'` ${_MASTER_SITE_BACKUP}

# synonyms, mnemonics
master-sites-all: master-sites-ALL
patch-sites-all: patch-sites-ALL
master-sites-default: master-sites-DEFAULT
patch-sites-default: patch-sites-DEFAULT

# compatibility with old behavior
master-sites: master-sites-DEFAULT
patch-sites: patch-sites-DEFAULT

CKSUMFILES=		${ALLFILES}

# List of all files, with ${DIST_SUBDIR} in front.  Used for checksum.
.if defined(DIST_SUBDIR)
.if defined(CKSUMFILES) && ${CKSUMFILES}!=""
_CKSUMFILES?=	${CKSUMFILES:S/^/${DIST_SUBDIR}\//}
.endif
.else
_CKSUMFILES?=	${CKSUMFILES}
.endif

# This is what is actually going to be extracted, and is overridable
#  by user.
EXTRACT_ONLY?=	${_DISTFILES}

.if !target(maintainer)
maintainer:
	@${ECHO_CMD} "${MAINTAINER}"
.endif

.if !target(check-makefile)
check-makefile::
	@${DO_NADA}
.endif

.if !defined(CATEGORIES)
check-categories:
	@${ECHO_MSG} "${PKGNAME}: Makefile error: CATEGORIES is mandatory."
	@${FALSE}
.else

VALID_CATEGORIES+= accessibility afterstep arabic archivers astro audio \
	benchmarks biology cad comms converters core databases \
	deskutils devel dns editors elisp emulators finance french ftp \
	games geography german gnome gnustep graphics hamradio haskell hebrew hungarian \
	ipv6 irc japanese java kld korean lang linux lisp lua \
	mail mate math misc multimedia net net-im net-mgmt net-p2p news \
	palm parallel perl5 plan9 polish portuguese ports-mgmt \
	print python ruby rubygems russian \
	scheme science security shells spanish sysutils \
	tcl textproc tk \
	ukrainian vietnamese windowmaker www \
	x11 x11-clocks x11-drivers x11-fm x11-fonts x11-servers x11-themes \
	x11-toolkits x11-wm xfce

check-categories:
.for cat in ${CATEGORIES}
.	if empty(VALID_CATEGORIES:M${cat})
		@${ECHO_MSG} "${PKGNAME}: Makefile error: category ${cat} not in list of valid categories."; \
		${FALSE};
.	endif
.endfor
.endif

.if !target(check-makevars)
check-makevars::
	@${DO_NADA}
.endif

.if !target(check-depends)
check-depends:
	@${DO_NADA}
.endif

PKGREPOSITORYSUBDIR?=	All
PKGREPOSITORY?=		${PACKAGES}/${PKGREPOSITORYSUBDIR}

PKGFILE?=		${PKGREPOSITORY}/${PKGNAME}${PKG_SUFX}


# The "latest version" link -- ${PKGNAME} minus everthing after the last '-'
PKGLATESTREPOSITORY?=	${PACKAGES}/Latest
LATEST_LINK?=		${PKGBASE}
PKGLATESTFILE=		${PKGLATESTREPOSITORY}/${LATEST_LINK}${PKG_SUFX}


CONFIGURE_SCRIPT?=	configure
CONFIGURE_CMD?=		./${CONFIGURE_SCRIPT}
.if (${OSVERSION} < 4016)
CONFIGURE_TARGET?=	${ARCH}-portbld-freebsd7.0
.else
CONFIGURE_TARGET?=	${ARCH}-portbld-freebsd9.1
.endif
CONFIGURE_TARGET:=      ${CONFIGURE_TARGET:S/--build=//}
CONFIGURE_LOG?=		config.log

# A default message to print if do-configure fails.
CONFIGURE_FAIL_MESSAGE?=	"Please report the problem to ${MAINTAINER} [maintainer] and attach the \"${CONFIGURE_WRKSRC}/${CONFIGURE_LOG}\" including the output of the failure of your make command. Also, it might be a good idea to provide an overview of all packages installed on your system (e.g. an \`ls ${PKG_DBDIR}\`)."

.if defined(GNU_CONFIGURE)
# Maximum command line length
.if !defined(CONFIGURE_MAX_CMD_LEN)
CONFIGURE_MAX_CMD_LEN!=	${SYSCTL} -n kern.argmax
.endif
GNU_CONFIGURE_PREFIX?=	${PREFIX}
GNU_CONFIGURE_MANPREFIX?=	${MANPREFIX}
CONFIG_SITE?=		${PORTSDIR}/Templates/config.site
CONFIGURE_ARGS+=	--prefix=${GNU_CONFIGURE_PREFIX} $${_LATE_CONFIGURE_ARGS}
CONFIGURE_ENV+=		CONFIG_SITE=${CONFIG_SITE} lt_cv_sys_max_cmd_len=${CONFIGURE_MAX_CMD_LEN}
HAS_CONFIGURE=		yes

SET_LATE_CONFIGURE_ARGS= \
     _LATE_CONFIGURE_ARGS="" ; \
	_configure_help="`./${CONFIGURE_SCRIPT} --help 2>&1`"; \
	if ${ECHO_CMD} $$_configure_help | ${GREP} -- '--mandir' >/dev/null  && !(${ECHO_CMD} ${CONFIGURE_ARGS} | ${GREP} -- '--mandir' >/dev/null); then \
		_LATE_CONFIGURE_ARGS="$${_LATE_CONFIGURE_ARGS} --mandir=${MANPREFIX}/man"; \
	fi ;\
	if ${ECHO_CMD} $$_configure_help | ${GREP} -- '--infodir' >/dev/null && !(${ECHO_CMD} ${CONFIGURE_ARGS} | ${GREP} -- '--infodir' >/dev/null); then \
		_LATE_CONFIGURE_ARGS="$${_LATE_CONFIGURE_ARGS} --infodir=${PREFIX}/${INFO_PATH}/${INFO_SUBDIR}"; \
	fi ;\
	if [ -z "`./${CONFIGURE_SCRIPT} --version 2>&1 | ${EGREP} -i '(autoconf.*2\.13|Unrecognized option)'`" ]; then \
		_LATE_CONFIGURE_ARGS="$${_LATE_CONFIGURE_ARGS} --build=${CONFIGURE_TARGET}" ; \
	else \
		_LATE_CONFIGURE_ARGS="$${_LATE_CONFIGURE_ARGS} ${CONFIGURE_TARGET}" ; \
	fi ;
.endif

# Passed to most of script invocations
SCRIPTS_ENV+=	CURDIR=${MASTERDIR} DISTDIR=${DISTDIR} \
		  WRKDIR=${WRKDIR} WRKSRC=${WRKSRC} PATCHDIR=${PATCHDIR} \
		  SCRIPTDIR=${SCRIPTDIR} FILESDIR=${FILESDIR} \
		  PORTSDIR=${PORTSDIR} DEPENDS="${DEPENDS}" \
		  PREFIX=${PREFIX} LOCALBASE=${LOCALBASE} \
		  DESTDIR=${DESTDIR} TARGETDIR=${DESTDIR}

.if defined(BATCH)
SCRIPTS_ENV+=	BATCH=yes
.endif

# Manual Pages
.include "${PORTSDIR}/Mk/components/man.mk"

.if ${PREFIX} == /usr
INFO_PATH?=	share/info
.else
INFO_PATH?=	info
.endif

.if defined(INFO)
RUN_DEPENDS+=	indexinfo:${PORTSDIR}/print/indexinfo

. for D in ${INFO:H}
RD:=	${D}
.  if ${RD} != "."
.   if !defined(INFO_SUBDIR)
INFO_SUBDIR:=	${RD}
.   elif ${INFO_SUBDIR} != ${RD}
BROKEN=		only one subdirectory in INFO is allowed
.   endif
.  endif
.undef RD
. endfor
.endif

DOCSDIR?=	${PREFIX}/share/doc/${PORTNAME}
EXAMPLESDIR?=	${PREFIX}/share/examples/${PORTNAME}
DATADIR?=	${PREFIX}/share/${PORTNAME}
WWWDIR?=	${PREFIX}/www/${PORTNAME}
ETCDIR?=	${PREFIX}/etc/${PORTNAME}

DOCSDIR_REL?=	${DOCSDIR:S,^${PREFIX}/,,}
EXAMPLESDIR_REL?=	${EXAMPLESDIR:S,^${PREFIX}/,,}
DATADIR_REL?=	${DATADIR:S,^${PREFIX}/,,}
WWWDIR_REL?=	${WWWDIR:S,^${PREFIX}/,,}
ETCDIR_REL?=	${ETCDIR:S,^${PREFIX}/,,}

PLIST_SUB+=	DOCSDIR="${DOCSDIR_REL}" \
		EXAMPLESDIR="${EXAMPLESDIR_REL}" \
		DATADIR="${DATADIR_REL}" \
		WWWDIR="${WWWDIR_REL}" \
		ETCDIR="${ETCDIR_REL}"

DESKTOPDIR?=		${PREFIX}/share/applications
_DESKTOPDIR_REL=	${DESKTOPDIR:S,^${PREFIX}/,,}/

.if ${_DESKTOPDIR_REL} == ${DESKTOPDIR}/
# DESKTOPDIR is not beneath PREFIX
_DESKTOPDIR_REL=
.endif

.MAIN: all

################################################################
# Many ways to disable a port.
#
# If we're in BATCH mode and the port is interactive, or we're
# in interactive mode and the port is non-interactive, skip all
# the important targets.  The reason we have two modes is that
# one might want to leave a build in BATCH mode running
# overnight, then come back in the morning and do _only_ the
# interactive ones that required your intervention.
#
# Ignore ports that can't be resold if building for a CDROM.
#
# Don't build a port if it's restricted and we don't want to get
# into that.
#
# Don't build a port if it's broken, unless we're running a parallel
# build (in case it's fixed).
#
# Don't build a port if it's forbidden for whatever reason.
#
# Don't build a port if the system is too old.
################################################################

# Check the machine architectures
.if defined(ONLY_FOR_ARCHS)
.for __ARCH in ${ONLY_FOR_ARCHS}
.if ${ARCH:M${__ARCH}} != ""
__ARCH_OK?=		1
.endif
.endfor
.else
__ARCH_OK?=		1
.endif

.if defined(NOT_FOR_ARCHS)
.for __NARCH in ${NOT_FOR_ARCHS}
.if ${ARCH:M${__NARCH}} != ""
.undef __ARCH_OK
.endif
.endfor
.endif

.if !defined(__ARCH_OK)
.if defined(ONLY_FOR_ARCHS)
IGNORE=		is only for ${ONLY_FOR_ARCHS},
.else # defined(NOT_FOR_ARCHS)
IGNORE=		does not run on ${NOT_FOR_ARCHS},
.endif
IGNORE+=	while you are running ${ARCH}

.if defined(ONLY_FOR_ARCHS_REASON_${ARCH})
IGNORE+=	(reason: ${ONLY_FOR_ARCHS_REASON_${ARCH}})
.elif defined(ONLY_FOR_ARCHS_REASON)
IGNORE+=	(reason: ${ONLY_FOR_ARCHS_REASON})
.endif

.if defined(NOT_FOR_ARCHS_REASON_${ARCH})
IGNORE+=	(reason: ${NOT_FOR_ARCHS_REASON_${ARCH}})
.elif defined(NOT_FOR_ARCHS_REASON)
IGNORE+=	(reason: ${NOT_FOR_ARCHS_REASON})
.endif

.endif

# Check the user interaction and legal issues
.if !defined(NO_IGNORE)
.if (defined(IS_INTERACTIVE) && defined(BATCH))
IGNORE=		is an interactive port
.elif (!defined(IS_INTERACTIVE) && defined(INTERACTIVE))
IGNORE=		is not an interactive port
.elif (defined(NO_CDROM) && defined(FOR_CDROM))
IGNORE=		may not be placed on a CDROM: ${NO_CDROM}
.elif (defined(RESTRICTED) && defined(NO_RESTRICTED))
IGNORE=		is restricted: ${RESTRICTED}
.elif defined(BROKEN)
.if !defined(TRYBROKEN)
IGNORE=		is marked as broken: ${BROKEN}
.endif
.elif defined(BROKEN_${ARCH})
.if !defined(TRYBROKEN)
IGNORE=		is marked as broken on ${ARCH}: ${BROKEN_${ARCH}}
.endif
.elif defined(FORBIDDEN)
IGNORE=		is forbidden: ${FORBIDDEN}
.endif

# Define the text to be output to LEGAL
.if defined(LEGAL_TEXT)
LEGAL= ${LEGAL_TEXT}
.elif defined(RESTRICTED)
LEGAL= ${RESTRICTED}
.elif defined(NO_CDROM)
LEGAL= ${NO_CDROM}
.elif defined(NO_PACKAGE) && ! defined(LEGAL_PACKAGE)
LEGAL= ${NO_PACKAGE}
.endif

.if (defined(MANUAL_PACKAGE_BUILD) && defined(PACKAGE_BUILDING))
IGNORE=		has to be built manually: ${MANUAL_PACKAGE_BUILD}
clean:
	@${IGNORECMD}
.endif

.if defined(IGNORE)
.if defined(IGNORE_SILENT)
IGNORECMD=	${DO_NADA}
.else
IGNORECMD=	${ECHO_MSG} "===>  ${PKGNAME} "${IGNORE:Q}.;exit 1
.endif

_TARGETS=	check-sanity fetch checksum extract patch configure all build \
		fake install reinstall package 

# LAH
.for target in ${_TARGETS}
.if !target(${target}) #&& defined(_OPTIONS_OK)
_PHONY_TARGETS+= ${target}
${target}: ${${target:tu}_COOKIE}
	@${IGNORECMD}
.endif
.endfor # foreach(targets)

.endif

.endif

.if defined(IGNORE) || defined(NO_PACKAGE)
ignorelist: package-name
.else
ignorelist:
	@${DO_NADA}
.endif

################################################################
# Clean directories for ftp or CDROM.
################################################################

.if defined(RESTRICTED)
clean-restricted:	delete-distfiles delete-package
clean-restricted-list: delete-distfiles-list delete-package-list
RESTRICTED_FILES?=	${_DISTFILES} ${_PATCHFILES}
.else
clean-restricted:
clean-restricted-list:
.endif

.if defined(NO_CDROM)
clean-for-cdrom:	delete-distfiles delete-package
clean-for-cdrom-list:	delete-distfiles-list delete-package-list
RESTRICTED_FILES?=	${_DISTFILES} ${_PATCHFILES}
.else
clean-for-cdrom:
clean-for-cdrom-list:
.endif

.if defined(ALL_HOOK)
all:
	@cd ${.CURDIR} && ${SETENV} CURDIR=${.CURDIR} DISTNAME=${DISTNAME} \
	  DISTDIR=${DISTDIR} WRKDIR=${WRKDIR} WRKSRC=${WRKSRC} \
	  PATCHDIR=${PATCHDIR} SCRIPTDIR=${SCRIPTDIR} \
	  FILESDIR=${FILESDIR} PORTSDIR=${PORTSDIR} DESTDIR=${DESTDIR} PREFIX=${PREFIX} \
	  DEPENDS="${DEPENDS}" BUILD_DEPENDS="${BUILD_DEPENDS}" \
	  RUN_DEPENDS="${RUN_DEPENDS}" CONFLICTS="${CONFLICTS}" \
	${ALL_HOOK}
.endif

.if !target(all)
all: build
.endif

.if !defined(DEPENDS_TARGET)
.if defined(DEPENDS_PRECLEAN)
DEPENDS_TARGET=	clean
DEPENDS_ARGS=	NOCLEANDEPENDS=yes
.endif
.if make(reinstall)
DEPENDS_TARGET+=	reinstall
.else
DEPENDS_TARGET+=	cached-install
.endif
.if defined(DEPENDS_CLEAN)
DEPENDS_TARGET+=	clean
DEPENDS_ARGS+=	NOCLEANDEPENDS=yes
.endif
.endif

################################################################
#
# Do preliminary work to detect if we need to run the config
# target or not.
#
################################################################
.if ((!defined(OPTIONS) && !defined(OPTIONS_DEFINE) && \
	!defined(OPTIONS_SINGLE) && !defined(OPTIONS_MULTI)) \
	&& !defined(OPTIONS_GROUP) && !defined(OPTIONS_RADIO) \
	|| defined(CONFIG_DONE) || \
	defined(PACKAGE_BUILDING) || defined(BATCH) || \
	exists(${_OPTIONSFILE}) || exists(${_OPTIONSFILE}.local))
_OPTIONS_OK=yes
.endif

################################################################
# The following are used to create easy dummy targets for
# disabling some bit of default target behavior you don't want.
# They still check to see if the target exists, and if so don't
# do anything, since you might want to set this globally for a
# group of ports in a Makefile.inc, but still be able to
# override from an individual Makefile.
################################################################

# Disable checksum
.if defined(NO_CHECKSUM) && !target(checksum)
checksum: fetch
	@${DO_NADA}
.endif

# Disable build
.if defined(NO_BUILD) && !target(build)
build: configure
	@${TOUCH} ${TOUCH_FLAGS} ${BUILD_COOKIE}
.endif

# Disable install
.if defined(NO_INSTALL) && !target(install)
fake: build
	@${TOUCH} ${TOUCH_FLAGS} ${INSTALL_COOKIE}
.endif

# Disable package
.if defined(NO_PACKAGE) && !target(package)
package:
.if defined(IGNORE_SILENT)
	@${DO_NADA}
.else
	@${ECHO_MSG} "===>  ${PKGNAME} may not be packaged: "${NO_PACKAGE:Q}.
.endif
.endif

# Disable describe
.if defined(NO_DESCRIBE) && !target(describe)
describe:
	@${DO_NADA}
.endif

################################################################
# More standard targets start here.
#
# These are the body of the build/install framework.  If you are
# not happy with the default actions, and you can't solve it by
# adding pre-* or post-* targets/scripts, override these.
################################################################

# Pre-everything

pre-everything::
	@${DO_NADA}

.if !target(do-autoreconf)
do-autoreconf::
	@${DO_NADA}
.endif

.if !target(patch-libtool)
patch-libtool::
	@${DO_NADA}
.endif

buildanyway-message:
.if defined(TRYBROKEN) && defined(BROKEN)
	@${ECHO_MSG} "Trying build of ${PKGNAME} even though it is marked BROKEN."
.else
	@${DO_NADA}
.endif


# Warn user about deprecated packages.  Advisory only.

.if !target(check-deprecated)
check-deprecated:
.if defined(DEPRECATED)
	@${ECHO_MSG} "===>   NOTICE:"
	@${ECHO_MSG}
	@${ECHO_MSG} "This port is deprecated; you may wish to reconsider installing it:"
	@${ECHO_MSG}
	@${ECHO_MSG} ${DEPRECATED:Q}.
	@${ECHO_MSG}
.if defined(EXPIRATION_DATE)
	@${ECHO_MSG} "It is scheduled to be removed on or after ${EXPIRATION_DATE}."
	@${ECHO_MSG}
.endif
.endif
.endif

# Check if the port is listed in the vulnerability database

AUDITFILE?=		/var/db/portaudit/auditfile.tbz
_EXTRACT_AUDITFILE=	${TAR} -jxOf "${AUDITFILE}" auditfile

check-vulnerable:
.if !defined(DISABLE_VULNERABILITIES) && !defined(PACKAGE_BUILDING)
	@if [ -f "${AUDITFILE}" ]; then \
		audit_created=`${_EXTRACT_AUDITFILE} | \
			${SED} -nEe "1s/^#CREATED: *([0-9]{4})-?([0-9]{2})-?([0-9]{2}).*$$/\1\2\3/p"`; \
		audit_expiry=`/bin/date -u -v-14d "+%Y%m%d"`; \
		if [ "$$audit_created" -lt "$$audit_expiry" ]; then \
			${ECHO_MSG} "===>  WARNING: Vulnerability database out of date, checking anyway"; \
		fi; \
		vlist=`${_EXTRACT_AUDITFILE} | ${GREP} "${PORTNAME}" | \
			${AWK} -F\| ' /^[^#]/ { \
				if (!system("${PKG_VERSION} -T \"${PKGNAME}\" \"" $$1 "\"")) \
					print "=> " $$3 ".\n   Reference: <" $$2 ">" \
			} \
		'`; \
		if [ -n "$$vlist" ]; then \
			${ECHO_MSG} "===>  ${PKGNAME} has known vulnerabilities:"; \
			${ECHO_MSG} "$$vlist"; \
			${ECHO_MSG} "=> Please update your ports tree and try again."; \
			exit 1; \
		fi; \
	else \
		${ECHO_MSG} "===>  Vulnerability check disabled, database not found"; \
	fi
.endif

# set alg to any of SIZE, SHA256 (or any other checksum algorithm):
DISTINFO_DATA?= if [ \( -n "${DISABLE_SIZE}" -a -n "${NO_CHECKSUM}" \) -o ! -f "${DISTINFO_FILE}" ]; then exit; fi; \
	DIR=${DIST_SUBDIR}; ${AWK} -v alg=$$alg -v file=$${DIR:+$$DIR/}$${file} \
		'$$1 == alg && $$2 == "(" file ")" {print $$4}' ${DISTINFO_FILE}

# Fetch

.if !target(do-fetch)
do-fetch:
	@${MKDIR} ${_DISTDIR}
	@cd ${_DISTDIR}; \
	${_MASTER_SITES_ENV} ; \
	for _file in ${DISTFILES}; do \
		file=$${_file%%:*}; \
		if [ $$_file = $$file ]; then	\
			select='';	\
		else    \
			select=`${ECHO_CMD} $${_file##*:} | ${SED} -e 's/,/ /g'` ;	\
		fi;     \
		force_fetch=false; \
		filebasename=$${file##*/}; \
		for afile in ${FORCE_FETCH}; do \
			afile=$${afile##*/}; \
			if [ "x$$afile" = "x$$filebasename" ]; then \
				force_fetch=true; \
			fi; \
		done; \
		if [ ! -f $$file -a ! -f $$filebasename -o "$$force_fetch" = "true" ]; then \
			if [ -L $$file -o -L $$filebasename ]; then \
				${ECHO_MSG} "=> ${_DISTDIR}/$$file is a broken symlink."; \
				${ECHO_MSG} "=> Perhaps a filesystem (most likely a CD) isn't mounted?"; \
				${ECHO_MSG} "=> Please correct this problem and try again."; \
				exit 1; \
			fi ; \
			if [ -f ${DISTINFO_FILE} -a "x${NO_CHECKSUM}" = "x" ]; then \
				_sha256sum=`alg=SHA256; ${DISTINFO_DATA}`; \
				if [ -z "$$_sha256sum" ]; then \
					${ECHO_MSG} "=> $${DIR:+$$DIR/}$$file is not in ${DISTINFO_FILE}."; \
					${ECHO_MSG} "=> Either ${DISTINFO_FILE} is out of date, or"; \
					${ECHO_MSG} "=> $${DIR:+$$DIR/}$$file is spelled incorrectly."; \
					exit 1; \
				fi; \
			fi; \
			${ECHO_MSG} "=> $$file doesn't seem to exist in ${_DISTDIR}."; \
			if [ ! -w ${_DISTDIR} ]; then \
			   ${ECHO_MSG} "=> ${_DISTDIR} is not writable by you; cannot fetch."; \
			   exit 1; \
			fi; \
			if [ ! -z "$$select" ] ; then \
				__MASTER_SITES_TMP= ; \
				for group in $$select; do \
					if [ ! -z \$${_MASTER_SITES_$${group}} ] ; then \
						eval ___MASTER_SITES_TMP="\$${_MASTER_SITES_$${group}}" ; \
						__MASTER_SITES_TMP="$${__MASTER_SITES_TMP} $${___MASTER_SITES_TMP}" ; \
					fi \
				done; \
				___MASTER_SITES_TMP= ; \
				SORTED_MASTER_SITES_CMD_TMP="${ECHO_CMD} ${_MASTER_SITE_OVERRIDE} `${ECHO_CMD} $${__MASTER_SITES_TMP} | ${AWK} '${MASTER_SORT_AWK:S|\\|\\\\|g}'` ${_MASTER_SITE_BACKUP}" ; \
			else \
				SORTED_MASTER_SITES_CMD_TMP="${SORTED_MASTER_SITES_DEFAULT_CMD}" ; \
			fi ; \
			sites_remaining=0; \
			sites="`eval $$SORTED_MASTER_SITES_CMD_TMP ${_RANDOMIZE_SITES}`"; \
			for site in $${sites}; do \
				sites_remaining=$$(($${sites_remaining} + 1)); \
                        done; \
			for site in $${sites}; do \
				sites_remaining=$$(($${sites_remaining} - 1)); \
			    ${ECHO_MSG} "=> Attempting to fetch $${site}$${file}"; \
				CKSIZE=`alg=SIZE; ${DISTINFO_DATA}`; \
				case $${file} in \
				*/*)	${MKDIR} $${file%/*}; \
						args="-o $${file} $${site}$${file}";; \
				*)		args=$${site}$${file};; \
				esac; \
				if ${SETENV} ${FETCH_ENV} ${FETCH_CMD} ${FETCH_BEFORE_ARGS} $${args} ${FETCH_AFTER_ARGS}; then \
					actual_size=`stat -f %z "$${file}"`; \
					if [ -n "${DISABLE_SIZE}" ] || [ -z "$${CKSIZE}" ] || [ $${actual_size} -eq $${CKSIZE} ]; then \
						continue 2; \
					else \
						${ECHO_MSG} "=> Fetched file size mismatch (expected $${CKSIZE}, actual $${actual_size})"; \
						if [ $${sites_remaining} -gt 0 ]; then \
							${ECHO_MSG} "=> Trying next site"; \
							${RM} -f $${file}; \
						fi; \
					fi; \
				fi; \
			done; \
			${ECHO_MSG} "=> Couldn't fetch it - please try to retrieve this";\
			${ECHO_MSG} "=> port manually into ${_DISTDIR} and try again."; \
			exit 1; \
	    fi; \
	 done
.if defined(PATCHFILES)
	@cd ${_DISTDIR};\
	${_PATCH_SITES_ENV} ; \
	for _file in ${PATCHFILES}; do \
		file=`${ECHO_CMD} $$_file | ${SED} -E -e 's/:[^:]+$$//'` ; \
		if [ $$_file = $$file ]; then	\
			select='';	\
		else	\
			select=`${ECHO_CMD} $${_file##*:} | ${SED} -e 's/,/ /g'` ;	\
		fi;	\
		file=`${ECHO_CMD} $$file | ${SED} -E -e 's/:-[^:]+$$//'` ; \
		force_fetch=false; \
		filebasename=$${file##*/}; \
		for afile in ${FORCE_FETCH}; do \
			afile=$${afile##*/}; \
			if [ "x$$afile" = "x$$filebasename" ]; then \
				force_fetch=true; \
			fi; \
		done; \
		if [ ! -f $$file -a ! -f $$filebasename -o "$$force_fetch" = "true" ]; then \
			if [ -L $$file -o -L $${file##*/} ]; then \
				${ECHO_MSG} "=> ${_DISTDIR}/$$file is a broken symlink."; \
				${ECHO_MSG} "=> Perhaps a filesystem (most likely a CD) isn't mounted?"; \
				${ECHO_MSG} "=> Please correct this problem and try again."; \
				exit 1; \
			fi ; \
			${ECHO_MSG} "=> $$file doesn't seem to exist in ${_DISTDIR}."; \
			if [ ! -z "$$select" ] ; then \
				__PATCH_SITES_TMP= ; \
				for group in $$select; do \
					if [ ! -z \$${_PATCH_SITES_$${group}} ] ; then \
						eval ___PATCH_SITES_TMP="\$${_PATCH_SITES_$${group}}" ; \
						__PATCH_SITES_TMP="$${__PATCH_SITES_TMP} $${___PATCH_SITES_TMP}" ; \
					fi \
				done; \
				___PATCH_SITES_TMP= ; \
				SORTED_PATCH_SITES_CMD_TMP="${ECHO_CMD} ${_MASTER_SITE_OVERRIDE} `${ECHO_CMD} $${__PATCH_SITES_TMP} | ${AWK} '${MASTER_SORT_AWK:S|\\|\\\\|g}'` ${_MASTER_SITE_BACKUP}" ; \
			else \
				SORTED_PATCH_SITES_CMD_TMP="${SORTED_PATCH_SITES_DEFAULT_CMD}" ; \
			fi; \
			sites_remaining=0; \
			sites="`eval $$SORTED_PATCH_SITES_CMD_TMP`"; \
			for site in $${sites}; do \
				sites_remaining=$$(($${sites_remaining} + 1)); \
			done; \
			for site in $${sites}; do \
				sites_remaining=$$(($${sites_remaining} - 1)); \
			    ${ECHO_MSG} "=> Attempting to fetch $${site}$${file}"; \
				CKSIZE=`alg=SIZE; ${DISTINFO_DATA}`; \
				case $${file} in \
				*/*)	${MKDIR} $${file%/*}; \
						args="-o $${file} $${site}$${file}";; \
				*)		args=$${site}$${file};; \
				esac; \
				if ${SETENV} ${FETCH_ENV} ${FETCH_CMD} ${FETCH_BEFORE_ARGS} $${args} ${FETCH_AFTER_ARGS}; then \
					actual_size=`stat -f %z "$${file}"`; \
					if [ -n "${DISABLE_SIZE}" ] || [ -z "$${CKSIZE}" ] || [ $${actual_size} -eq $${CKSIZE} ]; then \
						continue 2; \
					else \
						${ECHO_MSG} "=> Fetched file size mismatch (expected $${CKSIZE}, actual $${actual_size})"; \
						if [ $${sites_remaining} -gt 1 ]; then \
							${ECHO_MSG} "=> Trying next site"; \
							${RM} -f $${file}; \
						fi; \
					fi; \
				fi; \
			done; \
			${ECHO_MSG} "=> Couldn't fetch it - please try to retrieve this";\
			${ECHO_MSG} "=> port manually into ${_DISTDIR} and try again."; \
			exit 1; \
	    fi; \
	 done
.endif
.endif

# Extract

clean-wrkdir:
	@${RM} -rf ${WRKDIR}

.if !target(do-extract)
do-extract:
	@${MKDIR} ${WRKDIR}
	@for file in ${EXTRACT_ONLY}; do \
		if ! (cd ${WRKDIR} && ${EXTRACT_CMD} ${EXTRACT_BEFORE_ARGS} ${_DISTDIR}/$$file ${EXTRACT_AFTER_ARGS});\
		then \
			exit 1; \
		fi; \
	done
	@if [ ${UID} = 0 ]; then \
		${CHMOD} -R ug-s ${WRKDIR}; \
		${CHOWN} -R 0:0 ${WRKDIR}; \
	fi
.endif


.if defined(MAGUS)
_SLEEP=${TRUE}
.elif defined(FATAL_LICENSE_CHECK)
_SLEEP=${FALSE}
.else
_SLEEP=sleep
.endif

# Patch

.if !target(do-patch)
do-patch:
.if defined(PATCHFILES)
	@${ECHO_MSG} "===>  Applying distribution patches for ${PKGNAME}"
	@(set -e; \
	cd ${_DISTDIR}; \
	patch_dist_strip () { \
		case "$$1" in \
		${_PATCH_DIST_STRIP_CASES} \
		esac; \
	}; \
	for i in ${_PATCHFILES}; do \
		if [ ${PATCH_DEBUG_TMP} = yes ]; then \
			${ECHO_MSG} "===>   Applying distribution patch $$i" ; \
		fi; \
		case $$i in \
		*.Z|*.gz) ${GZCAT} $$i ;; \
		*.bz2) ${BZCAT} $$i ;; \
		*.xz) ${XZCAT} $$i ;; \
		*) ${CAT} $$i ;; \
		esac | ${PATCH} ${PATCH_DIST_ARGS} `patch_dist_strip $$i` ; \
	done)
.endif
.if defined(EXTRA_PATCHES)
	@set -e; \
	for i in ${EXTRA_PATCHES}; do \
		case $$i in \
		*:-p[0-9]) patch_file=$${i%:*} ; patch_strip=$${i##*:} ;; \
		*) patch_file=$$i ;; \
		esac ; \
		${ECHO_MSG} "===>  Applying extra patch $$patch_file" ; \
		case $$patch_file in \
		*.Z|*.gz) ${GZCAT} $$patch_file ;; \
		*.bz2) ${BZCAT} $$patch_file ;; \
		*.xz) ${XZCAT} $$patch_file ;; \
		*) ${CAT} $$patch_file ;; \
		esac | ${PATCH} ${PATCH_ARGS} $$patch_strip ; \
	done
.endif
	@set -e ;\
	if [ -d ${PATCHDIR} ]; then \
		if [ "`${ECHO_CMD} ${PATCHDIR}/patch-*`" != "${PATCHDIR}/patch-*" ]; then \
			${ECHO_MSG} "===>  Applying ${OPSYS} patches for ${PKGNAME}" ; \
			PATCHES_APPLIED="" ; \
			for i in ${PATCHDIR}/patch-*; do \
				case $$i in \
					*.orig|*.rej|*~|*,v) \
						${ECHO_MSG} "===>   Ignoring patchfile $$i" ; \
						;; \
					*) \
						if [ ${PATCH_DEBUG_TMP} = yes ]; then \
							${ECHO_MSG} "===>   Applying ${OPSYS} patch $$i" ; \
						fi; \
						if ${PATCH} ${PATCH_ARGS} < $$i ; then \
							PATCHES_APPLIED="$$PATCHES_APPLIED $$i" ; \
						else \
							${ECHO_MSG} `${ECHO_CMD} "=> Patch $$i failed to apply cleanly." | ${SED} "s|${PATCHDIR}/||"` ; \
							if [ x"$$PATCHES_APPLIED" != x"" ]; then \
								${ECHO_MSG} `${ECHO_CMD} "=> Patch(es) $$PATCHES_APPLIED applied cleanly." | ${SED} "s|${PATCHDIR}/||g"` ; \
							fi; \
							${FALSE} ; \
						fi; \
						;; \
				esac; \
			done; \
		fi; \
	fi
.endif

.if !target(run-autotools)
run-autotools:
	@${DO_NADA}
.endif

# Configure

.if !target(do-configure)
do-configure:
	@if [ -f ${SCRIPTDIR}/configure ]; then \
		cd ${.CURDIR} && ${SETENV} ${SCRIPTS_ENV} ${SH} \
		  ${SCRIPTDIR}/configure; \
	fi
.if defined(GNU_CONFIGURE)
	@CONFIG_GUESS_DIRS=$$(${FIND} ${WRKDIR} -name config.guess -o -name config.sub \
		| ${XARGS} -n 1 ${DIRNAME}); \
	for _D in $${CONFIG_GUESS_DIRS}; do \
		${RM} $${_D}/config.guess; \
		${CP} -f ${TEMPLATES}/config.guess $${_D}/config.guess; \
		${CHMOD} a+rx $${_D}/config.guess; \
		${RM} $${_D}/config.sub; \
		${CP} -f ${TEMPLATES}/config.sub $${_D}/config.sub; \
		${CHMOD} a+rx $${_D}/config.sub; \
	done
.endif
.if defined(HAS_CONFIGURE)
	@(cd ${CONFIGURE_WRKSRC} && \
	    ${SET_LATE_CONFIGURE_ARGS} \
		if ! ${SETENV} CC="${CC}" CPP="${CPP}" CXX="${CXX}" \
	    CFLAGS="${CFLAGS}" CPPFLAGS="${CPPFLAGS}" CXXFLAGS="${CXXFLAGS}" \
	    LDFLAGS="${LDFLAGS}" LIBS="${LIBS}"\
	    INSTALL="/usr/bin/install -c ${_BINOWNGRP}" \
	    INSTALL_DATA="${INSTALL_DATA}" \
	    INSTALL_LIB="${INSTALL_LIB}" \
	    INSTALL_PROGRAM="${INSTALL_PROGRAM}" \
	    INSTALL_SCRIPT="${INSTALL_SCRIPT}" \
	    ${CONFIGURE_ENV} ${CONFIGURE_CMD} ${CONFIGURE_ARGS}; then \
			 ${ECHO_MSG} "===>  Script \"${CONFIGURE_SCRIPT}\" failed unexpectedly."; \
			 (${ECHO_MSG} ${CONFIGURE_FAIL_MESSAGE}) | ${FMT} 75 79 ; \
			 ${FALSE}; \
		fi)
.endif
# XXX is this needed?
.if defined(USE_IMAKE)
	@(cd ${CONFIGURE_WRKSRC}; ${SETENV} ${MAKE_ENV} ${XMKMF})
.endif
.endif

# Build
# XXX: ${MAKE_ARGS:N${DESTDIRNAME}=*} would be easier but it is not valid with the old fmake
DO_MAKE_BUILD?= ${SETENV} ${MAKE_ENV} ${MAKE_CMD} ${MAKE_FLAGS} ${MAKEFILE} ${_MAKE_JOBS} ${MAKE_ARGS:C,^${DESTDIRNAME}=.*,,g}
.if !target(do-build)
do-build:
	@(cd ${BUILD_WRKSRC}; if ! ${DO_MAKE_BUILD} ${ALL_TARGET}; then \
		if [ -n "${BUILD_FAIL_MESSAGE}" ] ; then \
			${ECHO_MSG} "===> Compilation failed unexpectedly."; \
			(${ECHO_CMD} "${BUILD_FAIL_MESSAGE}") | ${FMT} 75 79 ; \
			fi; \
		${FALSE}; \
		fi)
.endif

# Check conflicts

.if !target(check-conflicts)
check-conflicts: check-build-conflicts check-install-conflicts
.endif

.if !target(check-build-conflicts)
check-build-conflicts:
.if ( defined(CONFLICTS) || defined(CONFLICTS_BUILD) ) && !defined(DISABLE_CONFLICTS) && !defined(DEFER_CONFLICTS_CHECK)
	@for _name in ${CONFLICTS:C/.+/'&'/}; do \
		if ${MPORT_QUERY} -q name=$${_name} ; then \
			${ECHO_CMD} -n "===> $${_name} conflicts with installed packages. You need to remove it with mport delete $${_name}"; \
			exit 1;	 \
		fi; \
	done;
	@for _name in ${CONFLICTS_BUILD:C/.+/'&'/}; do \
		if ${MPORT_QUERY} -q name=$$_name ; then \
			${ECHO_CMD} -n "===> $${_name} conflicts with installed packages. You need to remove it with mport delete $${_name}"; \
			exit 1;  \
		fi; \
	done;
.endif
.endif

.if !target(identify-install-conflicts)
identify-install-conflicts:
.if ( defined(CONFLICTS) || defined(CONFLICTS_INSTALL) ) && !defined(DISABLE_CONFLICTS)
	@for _name in ${CONFLICTS_INSTALL:C/.+/'&'/}; do \
                if ${MPORT_QUERY} -q name=$$_name ; then \
                        ${ECHO_MSG} "===> $${_name} conflicts with installed packages."; \
			${ECHO_MSG} "      They install files into the same place."; \
			${ECHO_MSG} "      You may want to stop build with Ctrl + C."; \
                        sleep 10;  \
                fi; \
        done;
.endif
.endif

.if !target(check-install-conflicts)
check-install-conflicts:
.if ( defined(CONFLICTS) || defined(CONFLICTS_INSTALL) || ( defined(CONFLICTS_BUILD) && defined(DEFER_CONFLICTS_CHECK) ) ) && !defined(DISABLE_CONFLICTS)
.if defined(DEFER_CONFLICTS_CHECK)
	@for _name in ${CONFLICTS:C/.+/'&'/} ${CONFLICTS_BUILD:C/.+/'&'/} ${CONFLICTS_INSTALL:C/.+/'&'/}; do \
		if ${MPORT_QUERY} -q name=$${_name} ; then \
			${ECHO_CMD} -n "===> $${_name} conflicts with installed packages. You need to remove it with mport delete $${_name}"; \
			exit 1;  \
		fi; \
	done;
.else
	@for _name in ${CONFLICTS_INSTALL:C/.+/'&'/}; do \
		if ${MPORT_QUERY} -q name=$$_name ; then \
			${ECHO_MSG} "===> $${_name} conflicts with installed packages."; \
			${ECHO_MSG} "      They install files into the same place."; \
			${ECHO_MSG} "      You may want to stop build with Ctrl + C."; \
			exit 1;  \
		fi; \
	done;
.endif # defined(DEFER_CONFLICTS_CHECK)
.endif
.endif


#
# Package
#
.if !target(do-package)
do-package: ${TMPPLIST}
	@if ! ${MKDIR} -p ${PKGREPOSITORY}; then \
		${ECHO_MSG} "=> Can't create directory ${PKGREPOSITORY}."; \
		exit 1; \
	fi; 
	@__softMAKEFLAGS='${__softMAKEFLAGS:S/'/'\''/g}'; \
	_LATE_MPORT_CREATE_ARGS=""; \
	if [ -f ${PKGINSTALL} ]; then \
		_LATE_MPORT_CREATE_ARGS="$${_LATE_MPORT_CREATE_ARGS} -i ${PKGINSTALL}"; \
	fi; \
	if [ -f ${PKGDEINSTALL} ]; then \
		_LATE_MPORT_CREATE_ARGS="$${_LATE_MPORT_CREATE_ARGS} -j ${PKGDEINSTALL}"; \
	fi; \
	if [ -f ${PKGMESSAGE} ]; then \
		_LATE_MPORT_CREATE_ARGS="$${_LATE_MPORT_CREATE_ARGS} -m ${PKGMESSAGE}"; \
	fi; \
	if ${MPORT_CREATE} ${MPORT_CREATE_ARGS} ; then \
		${ECHO_MSG} "Created ${PKGFILE}"; \
		cd ${.CURDIR} && eval ${MAKE} $${__softMAKEFLAGS} package-links; \
	else \
		${ECHO_MSG} "Unable to create package ${PKGFILE}"; \
		cd ${.CURDIR} && rm -f ${PACKAGE_COOKIE} ${INSTALL_COOKIE}; \
		cd ${.CURDIR} && eval ${MAKE} $${__softMAKEFLAGS} delete-package; \
		exit 1; \
	fi
.endif

# Some support rules for do-package

.if !target(package-links)
package-links: delete-package-links
	@for cat in ${CATEGORIES}; do \
		if [ ! -d ${PACKAGES}/$$cat ]; then \
			if ! ${MKDIR} ${PACKAGES}/$$cat; then \
				${ECHO_MSG} "=> Can't create directory ${PACKAGES}/$$cat."; \
				exit 1; \
			fi; \
		fi; \
		${ECHO_MSG} "Link to ${PACKAGES}/$$cat/${PKGNAME}${PKG_SUFX}"; \
		${LN} -sf ${PKGFILE} ${PACKAGES}/$$cat; \
	done
.if !defined(NO_LATEST_LINK)
	@if [ ! -d ${PKGLATESTREPOSITORY} ]; then \
		if ! ${MKDIR} ${PKGLATESTREPOSITORY}; then \
			${ECHO_MSG} "=> Can't create directory ${PKGLATESTREPOSITORY}."; \
			exit 1; \
		fi; \
	fi
	@${ECHO_MSG} "Link to ${PKGLATESTREPOSITORY}/${PKGNAME}${PKG_SUFX}"
	@${LN} -s ${PKGFILE} ${PKGLATESTFILE}
.endif
.endif

.if !target(delete-package-links)
delete-package-links:
	@for cat in ${CATEGORIES}; do \
		${RM} -f ${PACKAGES}/$$cat/${PKGNAME}${PKG_SUFX}; \
	done
.if !defined(NO_LATEST_LINK)
	@${RM} -f ${PKGLATESTFILE}
.endif
.endif

.if !target(delete-package)
delete-package: delete-package-links
	@${RM} -f ${PKGFILE}
.endif

.if !target(delete-package-links-list)
delete-package-links-list:
	@for cat in ${CATEGORIES}; do \
		${ECHO_CMD} ${RM} -f ${PACKAGES}/$$cat/${PKGNAME}${PKG_SUFX}; \
	done
.if !defined(NO_LATEST_LINK)
	@${ECHO_CMD} ${RM} -f ${PKGLATESTFILE}
.endif
.endif

.if !target(delete-package-list)
delete-package-list: delete-package-links-list
	@${ECHO_CMD} "[ -f ${PKGFILE} ] && (${ECHO_CMD} deleting ${PKGFILE}; ${RM} -f ${PKGFILE})"
.endif


#
# This is the "real" install.  Really.  Not kidding.
#
.if !target(install-package)
install-package:
.	if defined(DESTDIR) 
		@${CP} ${PKGFILE} ${DISTDIR}${PKGFILE}
.	endif
# $MPORT_INSTALL calls chroot if DESTDIR is set
	@${MPORT_INSTALL} ${PKGFILE}	
.endif


#
# This is used by dependcies to install.  If ${PKGFILE} exists, we can just 
# install that.  Otherwise, we need to build and install like normal.
#
.if !target(cached-install)
cached-install:
.	if exists(${PKGFILE})
		@cd ${.CURDIR} && ${MAKE} ${_INSTALL_SEQ}
.	else
#		If the package was deleted, and clean wasn't run, we need to make sure
#		that the port doesn't think the package is there.
		@cd ${.CURDIR} && rm -f ${PACKAGE_COOKIE} ${INSTALL_COOKIE}
		@cd ${.CURDIR} && ${MAKE} install
.	endif		
.endif


#
# This is the depends target used by our build cluster, magus. It is 
# much like cached-install, but a missing depends file in this case is 
# a fatal error.
#
.if !target(magus-install-depend)
magus-install-depend:
.   if exists(${PKGFILE})
		@cd ${.CURDIR} && ${MAKE} ${_INSTALL_SEQ}
.   else
		@echo "Missing dependency package file: ${PKGFILE}"
		@exit 1
.   endif
.endif


#
# Utility targets follow
#
.if !target(check-umask)
check-umask:
	@if [ `${SH} -c umask` != 0022 ]; then \
		${ECHO_MSG} "===>  Warning: your umask is \"`${SH} -c umask`"\".; \
		${ECHO_MSG} "      If this is not desired, set it to an appropriate value"; \
		${ECHO_MSG} "      and install this port again by \`\`make reinstall''."; \
	fi
.endif


.if !defined(DISABLE_SECURITY_CHECK)
.if !target(security-check)
.if !defined(OLD_SECURITY_CHECK)

security-check:
# Scan PLIST for:
#   1.  setugid files
#   2.  accept()/recvfrom() which indicates network listening capability
#   3.  insecure functions (gets/mktemp/tempnam/[XXX])
#   4.  startup scripts, in conjunction with 2.
#   5.  world-writable files/dirs
#
	-@${RM} -f ${WRKDIR}/.PLIST.setuid ${WRKDIR}/.PLIST.writable ${WRKDIR}/.PLIST.objdump; \
	${AWK} -v prefix='${PREFIX}' ' \
		match($$0, /^@cwd /) { prefix = substr($$0, RSTART + RLENGTH); if (prefix == "/") prefix=""; next; } \
		/^@/ { next; } \
		/^\// { print; next; } \
		{ print prefix "/" $$0; } \
	' ${TMPPLIST} > ${WRKDIR}/.PLIST.flattened; \
	${TR} '\n' '\0' < ${WRKDIR}/.PLIST.flattened \
	| ${XARGS} -0 -J % ${FIND} % -prune ! -type l -type f \( -perm -4000 -o -perm -2000 \) \( -perm -0010 -o -perm -0001 \) 2> /dev/null > ${WRKDIR}/.PLIST.setuid; \
	${TR} '\n' '\0' < ${WRKDIR}/.PLIST.flattened \
	| ${XARGS} -0 -J % ${FIND} % -prune -perm -0002 \! -type l 2> /dev/null > ${WRKDIR}/.PLIST.writable; \
	${TR} '\n' '\0' < ${WRKDIR}/.PLIST.flattened \
	| ${XARGS} -0 -J % ${FIND} % -prune ! -type l -type f -print0 2> /dev/null \
	| ${XARGS} -0 -n 1 ${OBJDUMP} -R 2> /dev/null > ${WRKDIR}/.PLIST.objdump; \
	if \
		! ${AWK} -v audit="$${PORTS_AUDIT}" -v destdir="${DESTDIR}" -f ${PORTSDIR}/Tools/scripts/security-check.awk \
		  ${WRKDIR}/.PLIST.flattened ${WRKDIR}/.PLIST.objdump ${WRKDIR}/.PLIST.setuid ${WRKDIR}/.PLIST.writable; \
	then \
		www_site=$$(cd ${.CURDIR} && ${MAKE} www-site); \
	    if [ ! -z "$${www_site}" ]; then \
			${ECHO_MSG}; \
			${ECHO_MSG} "      For more information, and contact details about the security"; \
			${ECHO_MSG} "      status of this software, see the following webpage: "; \
			${ECHO_MSG} "$${www_site}"; \
		fi; \
	fi


.else # i.e. defined(OLD_SECURITY_CHECK)

security-check:
# Scan PLIST for:
#   1.  setugid files
#   2.  accept()/recvfrom() which indicates network listening capability
#   3.  insecure functions (gets/mktemp/tempnam/[XXX])
#   4.  startup scripts, in conjunction with 2.
#   5.  world-writable files/dirs
#
	-@${RM} -f ${WRKDIR}/.PLIST.setuid ${WRKDIR}/.PLIST.stupid \
		${WRKDIR}/.PLIST.network ${WRKDIR}/.PLIST.writable; \
	if [ -n "$$PORTS_AUDIT" ]; then \
		stupid_functions_regexp=' (gets|mktemp|tempnam|tmpnam|strcpy|strcat|sprintf)$$'; \
	else \
		stupid_functions_regexp=' (gets|mktemp|tempnam|tmpnam)$$'; \
	fi; \
	for i in `${GREP} -v '^@' ${TMPPLIST}`; do \
		if [ ! -L "${PREFIX}/$$i" -a -f "${PREFIX}/$$i" ]; then \
			${OBJDUMP} -R ${PREFIX}/$$i > \
				${WRKDIR}/.PLIST.objdump 2> /dev/null; \
			if [ -s ${WRKDIR}/.PLIST.objdump ] ; then \
				${EGREP} " $$stupid_functions_regexp" \
					${WRKDIR}/.PLIST.objdump | ${AWK} '{print " " $$3}' | ${TR} -d '\n' \
					> ${WRKDIR}/.PLIST.stupid; \
				if [ -n "`${EGREP} ' (accept|recvfrom)$$' ${WRKDIR}/.PLIST.objdump`" ] ; then \
					if [ -s ${WRKDIR}/.PLIST.stupid ]; then \
						${ECHO_MSG} -n "${PREFIX}/$$i (USES POSSIBLY INSECURE FUNCTIONS:" >> ${WRKDIR}/.PLIST.network; \
						${CAT} ${WRKDIR}/.PLIST.stupid >> ${WRKDIR}/.PLIST.network; \
						${ECHO_CMD} ")" >> ${WRKDIR}/.PLIST.network; \
					else \
						${ECHO_CMD} ${PREFIX}/$$i >> ${WRKDIR}/.PLIST.network; \
					fi; \
				fi; \
			fi; \
			if [ -n "`${FIND} ${PREFIX}/$$i -prune \( -perm -4000 -o -perm -2000 \) \( -perm -0010 -o -perm -0001 \) 2>/dev/null`" ]; then \
				if [ -s ${WRKDIR}/.PLIST.stupid ]; then \
					${ECHO_MSG} -n "${PREFIX}/$$i (USES POSSIBLY INSECURE FUNCTIONS:" >> ${WRKDIR}/.PLIST.setuid; \
					${CAT} ${WRKDIR}/.PLIST.stupid >> ${WRKDIR}/.PLIST.setuid; \
					${ECHO_CMD} ")" >> ${WRKDIR}/.PLIST.setuid; \
				else \
					${ECHO_CMD} ${PREFIX}/$$i >> ${WRKDIR}/.PLIST.setuid; \
				fi; \
			fi; \
		fi; \
		if [ ! -L "${PREFIX}/$$i" ]; then \
			if [ -n "`${FIND} ${PREFIX}/$$i -prune -perm -0002 \! -type l 2>/dev/null`" ]; then \
				 ${ECHO_CMD} ${PREFIX}/$$i >> ${WRKDIR}/.PLIST.writable; \
			fi; \
		fi; \
	done; \
	${GREP} '^etc/rc.d/' ${TMPPLIST} > ${WRKDIR}/.PLIST.startup; \
	if [ -s ${WRKDIR}/.PLIST.setuid -o -s ${WRKDIR}/.PLIST.network -o -s ${WRKDIR}/.PLIST.writable ]; then \
		if [ -n "$$PORTS_AUDIT" ]; then \
			if [ -z "${DESTDIR}" ] ; then \
				${ECHO_MSG} "===>  SECURITY REPORT (PARANOID MODE): "; \
			else \
				${ECHO_MSG} "===>  SECURITY REPORT FOR ${DESTDIR} (PARANOID MODE): "; \
			fi; \
		else \
			if [ -z "${DESTDIR}" ] ; then \
				${ECHO_MSG} "===>  SECURITY REPORT: "; \
			else \
				${ECHO_MSG} "===>  SECURITY REPORT FOR ${DESTDIR}: "; \
			fi; \
		fi; \
		if [ -s ${WRKDIR}/.PLIST.setuid ] ; then \
			if [ -z "${DESTDIR}" ] ; then \
				${ECHO_MSG} "      This port has installed the following binaries,"; \
			else \
				${ECHO_MSG} "      This port has installed the following binaries into ${DESTDIR},"; \
			fi; \
			${ECHO_MSG} "      which execute with increased privileges."; \
			${CAT} ${WRKDIR}/.PLIST.setuid; \
			${ECHO_MSG}; \
		fi; \
		if [ -s ${WRKDIR}/.PLIST.network ] ; then \
			if [ -z "${DESTDIR}" ] ; then \
				${ECHO_MSG} "      This port has installed the following files, which may act as network"; \
				${ECHO_MSG} "      servers and may therefore pose a remote security risk to the system."; \
			else \
				${ECHO_MSG} "      This port has installed the following files into ${DESTDIR}, which may"; \
				${ECHO_MSG} "      act as network servers and may therefore pose a remote security risk to"; \
				${ECHO_MSG} "      the system."; \
			fi; \
			${CAT} ${WRKDIR}/.PLIST.network; \
			${ECHO_MSG}; \
			if [ -s ${WRKDIR}/.PLIST.startup ] ; then \
				if [ -z "${DESTDIR}" ] ; then \
					${ECHO_MSG} "      This port has installed the following startup scripts,"; \
				else \
					${ECHO_MSG} "      This port has installed the following startup scripts into ${DESTDIR},"; \
				fi; \
				${ECHO_MSG} "      which may cause these network services to be started at boot time."; \
				${SED} s,^,${PREFIX}/, < ${WRKDIR}/.PLIST.startup; \
				${ECHO_MSG}; \
			fi; \
		fi; \
		if [ -s ${WRKDIR}/.PLIST.writable ] ; then \
			if [ -z "${DESTDIR}" ] ; then \
				${ECHO_MSG} "      This port has installed the following world-writable files/directories."; \
			else \
				${ECHO_MSG} "      This port has installed the following world-writable files/directories"; \
				${ECHO_MSG} "      into ${DESTDIR}."; \
			fi; \
			${CAT} ${WRKDIR}/.PLIST.writable; \
			${ECHO_MSG}; \
		fi; \
		${ECHO_MSG} "      If there are vulnerabilities in these programs there may be a security"; \
		${ECHO_MSG} "      risk to the system. The FreeBSD Project makes no guarantee about the"; \
		${ECHO_MSG} "      security of ports included in the Ports Collection."; \
		${ECHO_MSG} "      Please type 'make deinstall' to deinstall the port if this is a concern."; \
		www_site=$$(cd ${.CURDIR} && ${MAKE} ${__softMAKEFLAGS} www-site); \
	    if [ ! -z "$${www_site}" ]; then \
			${ECHO_MSG}; \
			${ECHO_MSG} "      For more information, and contact details about the security"; \
			${ECHO_MSG} "      status of this software, see the following webpage: "; \
			${ECHO_MSG} "$${www_site}"; \
		fi; \
	fi
.endif # !defined(OLD_SECURITY_CHECK)
.endif
.else # i.e. defined(DISABLE_SECURITY_CHECK)
security-check:
	@${ECHO_MSG} "      WARNING: Security check has been disabled."
.endif # !defined(DISABLE_SECURITY_CHECK)


################################################################
# Skeleton targets start here
#
# You shouldn't have to change these.  Either add the pre-* or
# post-* targets/scripts or redefine the do-* targets.  These
# targets don't do anything other than checking for cookies and
# call the necessary targets/scripts.
################################################################

# Please note that the order of the following targets is important, and
# should not be modified.

_TARGETS_STAGES=SANITY FETCH EXTRACT PATCH CONFIGURE BUILD FAKE PACKAGE INSTALL UPDATE

_SANITY_SEQ=	pre-everything check-makefile check-categories \
				check-makevars check-desktop-entries \
				check-depends identify-install-conflicts check-deprecated \
				check-vulnerable check-license buildanyway-message \
				options-message

_FETCH_DEP=		check-sanity
_FETCH_SEQ=		fetch-depends pre-fetch pre-fetch-script \
				do-fetch post-fetch post-fetch-script

_EXTRACT_DEP=	fetch
_EXTRACT_SEQ=	check-build-conflicts extract-message checksum extract-depends \
				clean-wrkdir pre-extract pre-extract-script do-extract \
				post-extract post-extract-script 

_PATCH_DEP=		extract
_PATCH_SEQ=		ask-license patch-message check-license \
				patch-depends \
				pre-patch pre-patch-script \
				do-patch \
				post-patch post-patch-script

_CONFIGURE_DEP=	patch
_CONFIGURE_SEQ=	build-depends lib-depends misc-depends configure-message \
				pre-configure pre-configure-script \
				run-autotools do-autoreconf patch-libtool \
				do-configure post-configure post-configure-script

_BUILD_DEP=		configure
_BUILD_SEQ=		build-message pre-build pre-build-script do-build \
				post-build post-build-script

_FAKE_DEP=		build
_FAKE_SEQ=		fake-message fake-dir apply-slist pre-fake fake-pre-install \
				generate-plist fake-pre-su-install create-users-groups do-fake fake-post-install \
				post-fake fake-compress-man compress-man install-rc-script install-ldconfig-file install-license install-desktop-entries \
				fix-fake-symlinks finish-tmpplist fix-plist-sequence

.if defined(MPORT_MAINTAINER_MODE) && !defined(_MAKEPLIST)
_FAKE_SEQ+=		check-fake
.endif

_PACKAGE_DEP=	fake
_PACKAGE_SEQ=	package-message pre-package pre-package-script \
				do-package post-package post-package-script 

_INSTALL_DEP=	package
# Not sure how we want to handle sudo/su.  Will figure out later - triv.
_INSTALL_SEQ=	install-message run-depends lib-depends install-package done-message


_UPDATE_DEP=	package
_UPDATE_SEQ=	update-message check-for-older-installed do-update update-upwards-depends done-message

.if !target(check-sanity)
check-sanity: ${_SANITY_SEQ}
.endif

# XXX MCL might need to move in loop below?
.if !target(fetch)
fetch: ${_FETCH_DEP} ${_FETCH_SEQ}
.endif

# Main logic. The loop generates 8 main targets and using cookies
# ensures that those already completed are skipped.

.for target in extract patch configure build fake package install update

.if !target(${target}) && defined(_OPTIONS_OK)
${target}: ${${target:tu}_COOKIE}
.elif !target(${target})
${target}: config 
	@cd ${.CURDIR} && ${MAKE} CONFIG_DONE=1 ${__softMAKEFLAGS} ${${target:tu}_COOKIE}
.elif target(${target}) && defined(IGNORE)
.endif

.if !exists(${${target:tu}_COOKIE})

.if ${UID} != 0 && defined(_${target:tu}_SUSEQ) && !defined(INSTALL_AS_USER)
.if defined(USE_SUBMAKE)
${${target:tu}_COOKIE}: ${_${target:tu}_DEP}
	@cd ${.CURDIR} && ${MAKE} ${_${target:tu}_SEQ}
.else
${${target:tu}_COOKIE}: ${_${target:tu}_DEP} ${_${target:tu}_SEQ}
.endif 
	@${ECHO_MSG} "===>  Switching to root credentials for '${target}' target"
	@cd ${.CURDIR} && \
		${SU_CMD} "${MAKE} ${_${target:tu}_SUSEQ}"
	@${ECHO_MSG} "===>  Returning to user credentials"
	@${TOUCH} ${TOUCH_FLAGS} ${.TARGET}
.elif defined(USE_SUBMAKE)
${${target:tu}_COOKIE}: ${_${target:tu}_DEP}
	@cd ${.CURDIR} && \
		${MAKE} ${_${target:tu}_SEQ} ${_${target:tu}_SUSEQ}
	@${TOUCH} ${TOUCH_FLAGS} ${.TARGET}
.else
${${target:tu}_COOKIE}: ${_${target:tu}_DEP} ${_${target:tu}_SEQ} ${_${target:tu}_SUSEQ}
	@${TOUCH} ${TOUCH_FLAGS} ${.TARGET}
.endif

.else
${${target:tu}_COOKIE}::
	@if [ -e ${.TARGET} ]; then \
		${DO_NADA}; \
	else \
		cd ${.CURDIR} && ${MAKE} ${.TARGET}; \
	fi
.endif

.endfor

# Enforce order for -jN builds

.for _t in ${_TARGETS_STAGES}
.  for s in ${_${_t}_SEQ}
.    if target(${s})
.      if ! ${NOTPHONY:M${s}}
_PHONY_TARGETS+= ${s}
.      endif
_${_t}_REAL_SEQ+=       ${s}
.    endif
.  endfor
.  for s in ${_${_t}_SUSEQ}
.    if target(${s})
.      if ! ${NOTPHONY:M${s}}
_PHONY_TARGETS+= ${s}
.       endif
_${_t}_REAL_SUSEQ+=     ${s}
.    endif
.  endfor
.ORDER: ${_${_t}_DEP} ${_${_t}_REAL_SEQ}
.endfor

extract-message:
	@${ECHO_MSG} -e "\033[1m===>  Extracting for ${PKGNAME}\033[0m"
patch-message:
	@${ECHO_MSG} -e "\033[1m===>  Patching for ${PKGNAME}\033[0m"
configure-message:
	@${ECHO_MSG} -e "\033[1m===>  Configuring for ${PKGNAME}\033[0m"
build-message:
	@${ECHO_MSG} -e "\033[1m===>  Building for ${PKGNAME}\033[0m"
fake-message:
	@${ECHO_MSG} -e "\033[1m===>  Faking install for ${PKGNAME}\033[0m"
install-message:
.if !defined(DESTDIR)
	@${ECHO_MSG} -e "\033[1m===>  Installing ${PKGFILE}\033[0m"
.else
	@${ECHO_MSG} -e "\033[1m===>  Installing ${PKGFILE} into ${DESTDIR}\033[0m"
.endif
package-message:
	@${ECHO_MSG} -e "\033[1m===>  Building package for ${PKGNAME}\033[0m"
update-message:
	@${ECHO_MSG} -e "\033[1m===>  Updating ${PKGBASE} to ${PKGVERSION}\033[0m"
done-message:
	@${ECHO_MSG} -e "\033[1m===>  Done.\033[0m"


# Empty pre-* and post-* targets

.for stage in pre post
.for name in check-sanity fetch extract patch configure build fake package 

.if !target(${stage}-${name})
${stage}-${name}:
	@${DO_NADA}
.endif

.if !target(${stage}-${name}-script)
${stage}-${name}-script:
	@if [ -f ${SCRIPTDIR}/${.TARGET:S/-script$//} ]; then \
		cd ${.CURDIR} && ${SETENV} ${SCRIPTS_ENV} ${SH} \
			${SCRIPTDIR}/${.TARGET:S/-script$//}; \
	fi
.endif

.endfor
.endfor


.if !target(pretty-print-www-site)
pretty-print-www-site:
	@www_site=$$(cd ${.CURDIR} && ${MAKE} www-site); \
	if [ -n "$${www_site}" ]; then \
		${ECHO_MSG} -n " and/or visit the "; \
		${ECHO_MSG} -n "<a href=\"$${www_site}\">web site</a>"; \
		${ECHO_MSG} " for futher informations"; \
	fi
.endif

################################################################
# Some more targets supplied for users' convenience
################################################################

# Checkpatch
#
# Special target to verify patches

.if !target(checkpatch)
checkpatch:
	@cd ${.CURDIR} && ${MAKE} PATCH_CHECK_ONLY=yes ${_PATCH_DEP} ${_PATCH_SEQ}
.endif

# Reinstall
#
# Special target to re-run install

.if !target(reinstall)
reinstall:
	@${RM} -f ${INSTALL_COOKIE} 
	@cd ${.CURDIR} && DEPENDS_TARGET="${DEPENDS_TARGET}" ${MAKE} -DFORCE_PKG_REGISTER install
.endif

# refake
#
# Clear the fake dir and cookie, and do it again.
.if !target(refake)
refake:
	@${RM} -rf ${FAKE_DESTDIR} ${FAKE_COOKIE} ${PACKAGE_COOKIE}
	@cd ${.CURDIR} && ${MAKE} fake	
.endif


# Deinstall
#
# Special target to remove installation

.if !target(deinstall)
deinstall:
.if !defined(DESTDIR)
	@${ECHO_MSG} "===>  Deinstalling for ${PKGORIGIN}"
.else
	@${ECHO_MSG} "===>  Deinstalling for ${PKGORIGIN} from ${DESTDIR}"
.endif
.if ${UID} != 0 && !defined(INSTALL_AS_USER)
	@${ECHO_MSG} "===>   Running ${SUDO} ${MPORT_DELETE} -o ${PKGORIGIN}
	@${SUDO} ${MPORT_DELETE} -f -o ${PKGORIGIN}
.else
	@${MPORT_DELETE} -f -o ${PKGORIGIN}
.endif
	@${RM} -f ${INSTALL_COOKIE}
.endif # !target(deinstall)


#
# Cleaning up
#
.if !target(do-clean)
do-clean:
	@if [ -d ${WRKDIR} ]; then \
		if [ -w ${WRKDIR} ]; then \
			${RM} -rf ${WRKDIR}; \
		else \
			${ECHO_MSG} "===>   ${WRKDIR} not writable, skipping"; \
		fi; \
	fi
.endif

.if !target(clean)
clean:
.if !defined(NOCLEANDEPENDS)
	@cd ${.CURDIR} && ${MAKE} limited-clean-depends
.endif
	@${ECHO_MSG} "===>  Cleaning for ${PKGNAME}"
.if target(pre-clean)
	@cd ${.CURDIR} && ${MAKE} pre-clean
.endif
	@cd ${.CURDIR} && ${MAKE} do-clean
.if target(post-clean)
	@cd ${.CURDIR} && ${MAKE} post-clean
.endif
.endif

.if !target(pre-distclean)
pre-distclean:
	@${DO_NADA}
.endif

.if !target(distclean)
distclean: pre-distclean clean
	@cd ${.CURDIR} && ${MAKE} delete-distfiles RESTRICTED_FILES="${_DISTFILES} ${_PATCHFILES}"
.endif

.if !target(delete-distfiles)
delete-distfiles:
	@${ECHO_MSG} "===>  Deleting distfiles for ${PKGNAME}"
	@(if [ "X${RESTRICTED_FILES}" != "X" -a -d ${_DISTDIR} ]; then \
		cd ${_DISTDIR}; \
		for file in ${RESTRICTED_FILES}; do \
			${RM} -f $${file}; \
			dir=$${file%/*}; \
			if [ "$${dir}" != "$${file}" ]; then \
				${RMDIR} -p $${dir} >/dev/null 2>&1 || :; \
			fi; \
		done; \
	fi)
.if defined(DIST_SUBDIR)
	-@${RMDIR} ${_DISTDIR} >/dev/null 2>&1 || ${TRUE}
.endif
.endif

.if !target(delete-distfiles-list)
delete-distfiles-list:
	@${ECHO_CMD} "# ${PKGNAME}"
	@if [ "X${RESTRICTED_FILES}" != "X" ]; then \
		for file in ${RESTRICTED_FILES}; do \
			${ECHO_CMD} "[ -f ${_DISTDIR}/$$file ] && (${ECHO_CMD} deleting ${_DISTDIR}/$$file; ${RM} -f ${_DISTDIR}/$$file)"; \
			dir=$${file%/*}; \
			if [ "$${dir}" != "$${file}" ]; then \
				${ECHO_CMD} "(cd ${_DISTDIR} && ${RMDIR} -p $${dir} 2>/dev/null)"; \
			fi; \
		done; \
	fi
.if defined(DIST_SUBDIR)
	@${ECHO_CMD} "${RMDIR} ${_DISTDIR} 2>/dev/null || ${TRUE}"
.endif
.endif

# Prints out a list of files to fetch (useful to do a batch fetch)

.if !target(fetch-list)
fetch-list:
	@${MKDIR} ${_DISTDIR}
	@(cd ${_DISTDIR}; \
	 ${_MASTER_SITES_ENV} ; \
	 for _file in ${DISTFILES}; do \
		file=`${ECHO_CMD} $$_file | ${SED} -E -e 's/:[^:]+$$//'` ; \
		select=`${ECHO_CMD} $${_file#$${file}} | ${SED} -e 's/^://' -e 's/,/ /g'` ; \
		if [ ! -f $$file -a ! -f `${BASENAME} $$file` ]; then \
			if [ ! -z "$$select" ] ; then \
				__MASTER_SITES_TMP= ; \
				for group in $$select; do \
					if [ ! -z \$${_MASTER_SITES_$${group}} ] ; then \
						eval ___MASTER_SITES_TMP=\$${_MASTER_SITES_$${group}} ; \
						__MASTER_SITES_TMP="$${__MASTER_SITES_TMP} $${___MASTER_SITES_TMP}" ; \
					fi \
				done; \
				___MASTER_SITES_TMP= ; \
				SORTED_MASTER_SITES_CMD_TMP="${ECHO_CMD} ${_MASTER_SITE_OVERRIDE} `${ECHO_CMD} $${__MASTER_SITES_TMP} | ${AWK} '${MASTER_SORT_AWK:S|\\|\\\\|g}'` ${_MASTER_SITE_BACKUP}" ; \
			else \
				SORTED_MASTER_SITES_CMD_TMP="${SORTED_MASTER_SITES_DEFAULT_CMD}" ; \
			fi ; \
			for site in `eval $$SORTED_MASTER_SITES_CMD_TMP ${_RANDOMIZE_SITES}`; do \
				if [ ! -z "`${ECHO_CMD} ${NOFETCHFILES} | ${GREP} -w $${file}`" ]; then \
					if [ -z "`${ECHO_CMD} ${MASTER_SITE_OVERRIDE} | ${GREP} -w $${site}`" ]; then \
						continue; \
					fi; \
				fi; \
				DIR=${DIST_SUBDIR}; \
				CKSIZE=`${GREP} "^SIZE ($${DIR:+$$DIR/}$$file)" ${DISTINFO_FILE} | ${AWK} '{print $$4}'`; \
				case $${file} in \
				*/*)	args="-o $${file} $${site}$${file}";; \
				*)		args=$${site}$${file};; \
				esac; \
				${ECHO_CMD} -n ${SETENV} ${FETCH_ENV} ${FETCH_CMD} ${FETCH_BEFORE_ARGS} $${args} "${FETCH_AFTER_ARGS}" '|| ' ; \
			done; \
			${ECHO_CMD} "${ECHO_CMD} $${file} not fetched" ; \
		fi \
	done)
.if defined(PATCHFILES)
	@(cd ${_DISTDIR}; \
	 ${_PATCH_SITES_ENV} ; \
	 for _file in ${PATCHFILES}; do \
		file=`${ECHO_CMD} $$_file | ${SED} -E -e 's/:[^:]+$$//'` ; \
		select=`${ECHO_CMD} $${_file#$${file}} | ${SED} -e 's/^://' -e 's/,/ /g'` ; \
		if [ ! -f $$file -a ! -f `${BASENAME} $$file` ]; then \
			if [ ! -z "$$select" ] ; then \
				__PATCH_SITES_TMP= ; \
				for group in $$select; do \
					if [ ! -z \$${_PATCH_SITES_$${group}} ] ; then \
						eval ___PATCH_SITES_TMP=\$${_PATCH_SITES_$${group}} ; \
						__PATCH_SITES_TMP="$${__PATCH_SITES_TMP} $${___PATCH_SITES_TMP}" ; \
					fi \
				done; \
				___PATCH_SITES_TMP= ; \
				SORTED_PATCH_SITES_CMD_TMP="${ECHO_CMD} ${_MASTER_SITE_OVERRIDE} `${ECHO_CMD} $${__PATCH_SITES_TMP} | ${AWK} '${MASTER_SORT_AWK:S|\\|\\\\|g}'` ${_MASTER_SITE_BACKUP}" ; \
			else \
				SORTED_PATCH_SITES_CMD_TMP="${SORTED_PATCH_SITES_DEFAULT_CMD}" ; \
			fi ; \
			for site in `eval $$SORTED_PATCH_SITES_CMD_TMP ${_RANDOMIZE_SITES}`; do \
				DIR=${DIST_SUBDIR}; \
				CKSIZE=`${GREP} "^SIZE ($${DIR:+$$DIR/}$$file)" ${DISTINFO_FILE} | ${AWK} '{print $$4}'`; \
				case $${file} in \
				*/*)	args="-o $${file} $${site}$${file}";; \
				*)		args=$${site}$${file};; \
				esac; \
				${ECHO_CMD} -n ${SETENV} ${FETCH_ENV} ${FETCH_CMD} ${FETCH_BEFORE_ARGS} $${args} "${FETCH_AFTER_ARGS}" '|| ' ; \
			done; \
			${ECHO_CMD} "${ECHO_CMD} $${file} not fetched" ; \
		fi \
	 done)
.endif
.endif

# Generates patches.


# Checksumming utilities

check-checksum-algorithms:
	@ \
	${checksum_init} \
	\
	for alg in ${CHECKSUM_ALGORITHMS:tu}; do \
		eval alg_executable=\$$$$alg; \
		if [ -z "$$alg_executable" ]; then \
			${ECHO_MSG} "Checksum algorithm $$alg: Couldn't find the executable."; \
			${ECHO_MSG} "Set $$alg=/path/to/$$alg in /etc/make.conf and try again."; \
			exit 1; \
		fi; \
	done; \

checksum_init=\
	SHA256=${SHA256};

.if !target(makesum)
makesum: check-checksum-algorithms
	@cd ${.CURDIR} && ${MAKE} fetch NO_CHECKSUM=yes \
		DISABLE_SIZE=yes
	@if [ -f ${DISTINFO_FILE} ]; then ${CAT} /dev/null > ${DISTINFO_FILE}; fi
	@( \
		cd ${DISTDIR}; \
		\
		${checksum_init} \
		\
		for file in ${_CKSUMFILES}; do \
			for alg in ${CHECKSUM_ALGORITHMS:tu}; do \
				eval alg_executable=\$$$$alg; \
				\
				if [ $$alg_executable != "NO" ]; then \
					$$alg_executable $$file >> ${DISTINFO_FILE}; \
				fi; \
			done; \
			${ECHO_CMD} "SIZE ($$file) = `${STAT} -f \"%z\" $$file`" >> ${DISTINFO_FILE}; \
		done \
	)
.endif

.if !target(checksum)
checksum: fetch check-checksum-algorithms
	@set -e ; \
	${checksum_init} \
	\
	if [ -f ${DISTINFO_FILE} ]; then \
		cd ${DISTDIR}; OK=""; \
		for file in ${_CKSUMFILES}; do \
			ignored="true"; \
			_file=$${file#${DIST_SUBDIR}/*};	\
			for alg in ${CHECKSUM_ALGORITHMS:tu}; do \
				ignore="false"; \
				eval alg_executable=\$$$$alg; \
				\
				if [ $$alg_executable != "NO" ]; then \
					MKSUM=`$$alg_executable < $$file`; \
					CKSUM=`file=$$_file; ${DISTINFO_DATA}`; \
				else \
					ignore="true"; \
				fi; \
				\
				if [ $$ignore = "false" -a -z "$$CKSUM" ]; then \
					${ECHO_MSG} "=> No $$alg checksum recorded for $$file."; \
					ignore="true"; \
				fi; \
				\
				if [ $$ignore = "false" ]; then \
					match="false"; \
					for chksum in $$CKSUM; do \
						if [ "$$chksum" = "$$MKSUM" ]; then \
							match="true"; \
							break; \
						fi; \
					done; \
					if [ $$match = "true" ]; then \
						${ECHO_MSG} "=> $$alg Checksum OK for $$file."; \
						ignored="false"; \
					else \
						${ECHO_MSG} "=> $$alg Checksum mismatch for $$file."; \
						refetchlist="$$refetchlist$$file "; \
						OK="$${OK:-retry}"; \
						[ "$${OK}" = "retry" -a ${FETCH_REGET} -gt 0 ] && ${RM} -f $${file}; \
						ignored="false"; \
					fi; \
				fi; \
			done; \
			\
			if [ $$ignored = "true" ]; then \
				${ECHO_MSG} "=> No suitable checksum found for $$file."; \
				OK="${FALSE}"; \
			fi; \
			\
		done; \
		\
		if [ "$${OK:=true}" = "retry" ] && [ ${FETCH_REGET} -gt 0 ]; then \
			${ECHO_MSG} "===>  Refetch for ${FETCH_REGET} more times files: $$refetchlist"; \
			if ( cd ${.CURDIR} && \
				${MAKE} ${.MAKEFLAGS} FORCE_FETCH="$$refetchlist" FETCH_REGET="`${EXPR} ${FETCH_REGET} - 1`" fetch); then \
				if ( cd ${.CURDIR} && \
					${MAKE} ${.MAKEFLAGS} FETCH_REGET="`${EXPR} ${FETCH_REGET} - 1`" checksum ); then \
					OK="true"; \
				fi; \
			fi; \
		fi; \
		\
		if [ "$$OK" != "true" -a ${FETCH_REGET} -eq 0 ]; then \
			${ECHO_MSG} "===>  Giving up on fetching files: $$refetchlist"; \
			${ECHO_MSG} "Make sure the Makefile and distinfo file (${DISTINFO_FILE})"; \
			${ECHO_MSG} "are up to date.  If you are absolutely sure you want to override this"; \
			${ECHO_MSG} "check, type \"make NO_CHECKSUM=yes [other args]\"."; \
			exit 1; \
		fi; \
		if [ "$$OK" != "true" ]; then \
			exit 1; \
		fi; \
	elif [ -n "${_CKSUMFILES:M*}" ]; then \
		${ECHO_MSG} "=> No checksum file (${DISTINFO_FILE})."; \
		exit 1; \
	fi
.endif

################################################################
# The special package-building targets
# You probably won't need to touch these
################################################################

# Nobody should want to override this unless PKGNAME is simply bogus.

.if !target(package-name)
package-name:
	@${ECHO_CMD} ${PKGNAME}
.endif

# Build a package but don't check the package cookie

.if !target(repackage)
repackage: pre-repackage package

pre-repackage:
	@${RM} -f ${PACKAGE_COOKIE}
.endif

# Build a package but don't check the cookie for installation, also don't
# install package cookie

.if !target(package-noinstall)
package-noinstall: 
	@cd ${.CURDIR} && ${MAKE} package
.endif

################################################################
# Dependency checking
################################################################

.if !target(depends)
depends: extract-depends patch-depends lib-depends misc-depends fetch-depends build-depends run-depends

.if defined(ALWAYS_BUILD_DEPENDS)
_DEPEND_ALWAYS=	1
.else
_DEPEND_ALWAYS=	0
.endif

_INSTALL_DEPENDS=	\
		if [ X${USE_PACKAGE_DEPENDS} != "X" ]; then \
			subpkgfile=`(cd $$dir; ${MAKE} $$depends_args -V PKGFILE)`; \
			if [ -r "$${subpkgfile}" -a "$$target" = "${DEPENDS_TARGET}" ]; then \
				if [ -z "${DESTDIR}" ] ; then \
					${ECHO_MSG} "===>   Installing existing package $${subpkgfile}"; \
					${MPORT_INSTALL} $${subpkgfile}; \
				else \
					${ECHO_MSG} "===>   Installing existing package $${subpkgfile} into ${DESTDIR}"; \
					${MPORT_INSTALL} $${subpkgfile}; \
				fi; \
			else \
				(cd $$dir; ${MAKE} -DINSTALLS_DEPENDS $$target $$depends_args) ; \
				(cd $$dir; ${MAKE} -DINSTALLS_DEPENDS clean) ; \
			fi; \
		else \
			(cd $$dir; ${MAKE} -DINSTALLS_DEPENDS $$target $$depends_args) ; \
			(cd $$dir; ${MAKE} -DINSTALLS_DEPENDS clean) ; \
		fi; \
		if [ -z "${DESTDIR}" ] ; then \
			${ECHO_MSG} "===>   Returning to build of ${PKGNAME}"; \
		else \
			${ECHO_MSG} "===>   Returning to build of ${PKGNAME} for ${DESTDIR}"; \
		fi;

.for deptype in EXTRACT PATCH FETCH BUILD RUN
.if !target(${deptype:tl}-depends)
${deptype:tl}-depends:
.if defined(${deptype}_DEPENDS)
.if !defined(NO_DEPENDS)
	@for i in `${ECHO_CMD} "${${deptype}_DEPENDS}"`; do \
		prog=`${ECHO_CMD} $$i | ${SED} -e 's/:.*//'`; \
		if [ -z "$$prog" ]; then \
			${ECHO_MSG} "Error: there is an empty port dependency in ${deptype}_DEPENDS."; \
			break; \
		fi; \
		dir=`${ECHO_CMD} $$i | ${SED} -e 's/[^:]*://'`; \
		if ${EXPR} "$$dir" : '.*:' > /dev/null; then \
			target=`${ECHO_CMD} $$dir | ${SED} -e 's/.*://'`; \
			dir=`${ECHO_CMD} $$dir | ${SED} -e 's/:.*//'`; \
		else \
			target="${DEPENDS_TARGET}"; \
			depends_args="${DEPENDS_ARGS}"; \
		fi; \
		if ${EXPR} "$$prog" : \\/ >/dev/null; then \
			if [ -e "$$prog" ]; then \
				if [ "$$prog" = "${NONEXISTENT}" ]; then \
					${ECHO_MSG} "Error: ${NONEXISTENT} exists.  Please remove it, and restart the build."; \
					${FALSE}; \
				else \
					if [ -z "${DESTDIR}" ] ; then \
						${ECHO_MSG} "===>   ${PKGNAME} depends on file: $$prog - found"; \
					else \
						${ECHO_MSG} "===>   ${PKGNAME} depends on file in ${DESTDIR}: $$prog - found"; \
					fi; \
					if [ ${_DEPEND_ALWAYS} = 1 ]; then \
						${ECHO_MSG} "       (but building it anyway)"; \
						notfound=1; \
					else \
						notfound=0; \
					fi; \
				fi; \
			else \
				if [ -z "${DESTDIR}" ] ; then \
					${ECHO_MSG} "===>   ${PKGNAME} depends on file: $$prog - not found"; \
				else \
					${ECHO_MSG} "===>   ${PKGNAME} depends on file in ${DESTDIR}: $$prog - not found"; \
				fi; \
				notfound=1; \
			fi; \
		else \
			case $${prog} in \
				*\>*|*\<*|*=*)	pkg=yes;; \
				*)		pkg="";; \
			esac; \
			if [ "$$pkg" != "" ]; then \
				_version=`${ECHO_CMD} "$$prog" | ${SED} -E 's/^[^><=]*//'`; \
				_name=`${ECHO_CMD} "$$prog" | ${SED} -E 's/[><=]+.*//'`; \
				if ${MPORT_QUERY} -q name=$$_name version$$_version; then \
					if [ -z "${DESTDIR}" ] ; then \
						${ECHO_MSG} "===>   ${PKGNAME} depends on package: $$prog - found"; \
					else \
						${ECHO_MSG} "===>   ${PKGNAME} depends on package in ${DESTDIR}: $$prog - found"; \
					fi; \
					if [ ${_DEPEND_ALWAYS} = 1 ]; then \
						${ECHO_MSG} "       (but building it anyway)"; \
						notfound=1; \
					else \
						notfound=0; \
					fi; \
				else \
					if [ -z "${DESTDIR}" ] ; then \
						${ECHO_MSG} "===>   ${PKGNAME} depends on package: $$prog - not found"; \
					else \
						${ECHO_MSG} "===>   ${PKGNAME} depends on package in ${DESTDIR}: $$prog - not found"; \
					fi; \
					notfound=1; \
				fi; \
				if [ $$notfound != 0 ]; then \
					inverse_dep=`${ECHO_CMD} $$_version | ${SED} \
						-e 's/<=/=gt=/; s/</=ge=/; s/>=/=lt=/; s/>/=le=/' \
						-e 's/=gt=/>/; s/=ge=/>=/; s/=lt=/</; s/=le=/<=/'`; \
					bad_version=`${MPORT_QUERY} -q name=$$_name version$$_version || ${TRUE}`; \
					if [ "$$pkg_info" != "" ]; then \
						${ECHO_MSG} "===>   Found $$pkg_info, but you need to upgrade to $$prog."; \
						exit 1; \
					fi; \
				fi; \
			elif ${WHICH} "$$prog" > /dev/null 2>&1 ; then \
				if [ -z "${PREFIX}" ] ; then \
					${ECHO_MSG} "===>   ${PKGNAME} depends on executable: $$prog - found"; \
				else \
					${ECHO_MSG} "===>   ${PKGNAME} depends on executable in ${DESTDIR}: $$prog - found"; \
				fi; \
				if [ ${_DEPEND_ALWAYS} = 1 ]; then \
					${ECHO_MSG} "       (but building it anyway)"; \
					notfound=1; \
				else \
					notfound=0; \
				fi; \
			else \
				if [ -z "${DESTDIR}" ] ; then \
					${ECHO_MSG} "===>   ${PKGNAME} depends on executable: $$prog - not found"; \
				else \
					${ECHO_MSG} "===>   ${PKGNAME} depends on executable in ${DESTDIR}: $$prog - not found"; \
				fi; \
				notfound=1; \
			fi; \
		fi; \
		if [ $$notfound != 0 ]; then \
			${ECHO_MSG} "===>    Verifying $$target for $$prog in $$dir"; \
			if [ ! -d "$$dir" ]; then \
				${ECHO_MSG} "     => No directory for $$prog.  Skipping.."; \
			else \
				${_INSTALL_DEPENDS} \
			fi; \
		fi; \
	done
.endif
.else
	@${DO_NADA}
.endif
.endif
.endfor

lib-depends:
.if defined(LIB_DEPENDS) && !defined(NO_DEPENDS)
	@set -e ; \
	for i in ${LIB_DEPENDS:M*.so*\:*}; do \
		lib=$${i%%:*} ; \
		dir=$${i#*:}  ; \
		target="${DEPENDS_TARGET}"; \
		depends_args="${DEPENDS_ARGS}"; \
		${ECHO_MSG}  -n "===>   ${PKGNAME} depends on shared library: $${lib}" ; \
		found=0 ; \
		dirs="${LIB_DIRS} `${CAT} ${LOCALBASE}/libdata/ldconfig/* 2>/dev/null || : `" ; \
		for libdir in $$dirs; do \
			test -f $${libdir}/$${lib} || continue; \
			if [ -x /usr/bin/file ]; then \
				_LIB_FILE=`realpath $${libdir}/$${lib}`; \
				[ `file -b -L --mime-type $${_LIB_FILE}` = "application/x-sharedlib" ] || continue ; \
			fi ; \
			found=1 ; \
			${ECHO_MSG} " - found"; \
		done ; \
		if [ $${found} -eq 0 ]; then \
			${ECHO_MSG} " - not found"; \
			${ECHO_MSG} "===>    Verifying for $$lib in $$dir"; \
			if [ ! -d "$$dir" ] ; then \
				${ECHO_MSG} "    => No directory for $$lib.  Skipping.."; \
			else \
				${_INSTALL_DEPENDS} \
			fi ; \
		fi ; \
	done
	@set -e ; for i in ${LIB_DEPENDS:N*.so*\:*}; do \
		lib=$${i%%:*}; \
		pattern="`${ECHO_CMD} $$lib | ${SED} -E -e 's/\./\\\\./g' -e 's/(\\\\)?\+/\\\\+/g'`"\
		dir=$${i#*:}; \
		target=$${i##*:}; \
		if ${TEST} $$dir = $$target; then \
			target="${DEPENDS_TARGET}"; \
			depends_args="${DEPENDS_ARGS}"; \
		else \
			dir=$${dir%%:*}; \
		fi; \
		if [ -z "${DESTDIR}" ] ; then \
			${ECHO_MSG} -n "===>   ${PKGNAME} depends on shared library: $$lib"; \
			if ${LDCONFIG} ${_LDCONFIG_FLAGS} -r | ${GREP} -vwF -e "${PKGCOMPATDIR}" | ${GREP} -qwE -e "-l$$pattern"; then \
				${ECHO_MSG} " - found"; \
				if [ ${_DEPEND_ALWAYS} = 1 ]; then \
					${ECHO_MSG} "       (but building it anyway)"; \
					notfound=1; \
				else \
					notfound=0; \
				fi; \
			else \
				${ECHO_MSG} " - not found"; \
				notfound=1; \
			fi; \
		else \
			${ECHO_MSG} -n "===>   ${PKGNAME} depends on shared library in ${DESTDIR}: $$lib"; \
			if ${CHROOT} ${DESTDIR} ${LDCONFIG} ${_LDCONFIG_FLAGS} -r | ${GREP} -vwF -e "${PKGCOMPATDIR}" | ${GREP} -qwE -e "-l$$pattern"; then \
				${ECHO_MSG} " - found"; \
				if [ ${_DEPEND_ALWAYS} = 1 ]; then \
					${ECHO_MSG} "       (but building it anyway)"; \
					notfound=1; \
				else \
					notfound=0; \
				fi; \
			else \
				${ECHO_MSG} " - not found"; \
				notfound=1; \
			fi; \
		fi; \
		if [ $$notfound != 0 ]; then \
			${ECHO_MSG} "===>    Verifying $$target for $$lib in $$dir"; \
			if [ ! -d "$$dir" ]; then \
				${ECHO_MSG} "     => No directory for $$lib.  Skipping.."; \
			else \
				${_INSTALL_DEPENDS} \
				if ! ${LDCONFIG} ${_LDCONFIG_FLAGS} -r | ${GREP} -vwF -e "${PKGCOMPATDIR}" | ${GREP} -qwE -e "-l$$pattern"; then \
					${ECHO_MSG} "Error: shared library \"$$lib\" does not exist"; \
					${FALSE}; \
				fi; \
			fi; \
		fi; \
	done
.endif

misc-depends:
.if defined(DEPENDS)
.if !defined(NO_DEPENDS)
	@for dir in ${DEPENDS}; do \
		if ${EXPR} "$$dir" : '.*:' > /dev/null; then \
			target=`${ECHO_CMD} $$dir | ${SED} -e 's/.*://'`; \
			dir=`${ECHO_CMD} $$dir | ${SED} -e 's/:.*//'`; \
		else \
			target="${DEPENDS_TARGET}"; \
			depends_args="${DEPENDS_ARGS}"; \
		fi; \
		${ECHO_MSG} "===>   ${PKGNAME} depends on: $$dir"; \
		${ECHO_MSG} "===>    Verifying $$target for $$dir"; \
		if [ ! -d $$dir ]; then \
			${ECHO_MSG} "     => No directory for $$dir.  Skipping.."; \
		else \
			(cd $$dir; ${MAKE} $$target $$depends_args) ; \
		fi \
	done
	@if [ -z "${DESTDIR}" ] ; then \
		${ECHO_MSG} "===>   Returning to build of ${PKGNAME}"; \
	else \
		${ECHO_MSG} "===>   Returning to build of ${PKGNAME} for ${DESTDIR}"; \
	fi
.endif
.else
	@${DO_NADA}
.endif

.endif

# Dependency lists: both build and runtime, recursive.  Print out directory names.

_UNIFIED_DEPENDS=${EXTRACT_DEPENDS} ${PATCH_DEPENDS} ${FETCH_DEPENDS} ${BUILD_DEPENDS} ${LIB_DEPENDS} ${RUN_DEPENDS}
_DEPEND_DIRS=	${_UNIFIED_DEPENDS:C,^[^:]*:([^:]*).*$,\1,} ${DEPENDS:C,:.*,,}

all-depends-list:
	@${ALL-DEPENDS-LIST}

ALL-DEPENDS-LIST= \
	L="${_DEPEND_DIRS}";						\
	checked="";							\
	while [ -n "$$L" ]; do						\
		l="";							\
		for d in $$L; do					\
			case $$checked in				\
			$$d\ *|*\ $$d\ *|*\ $$d)			\
				continue;;				\
			esac;						\
			checked="$$checked $$d";			\
			if [ ! -d $$d ]; then				\
				${ECHO_MSG} "${PKGNAME}: \"$$d\" non-existent -- dependency list incomplete" >&2; \
				continue;				\
			fi;						\
			${ECHO_CMD} $$d;				\
			if ! children=$$(cd $$d && ${MAKE} -V _DEPEND_DIRS); then\
				${ECHO_MSG} "${PKGNAME}: \"$$d\" erroneous -- dependency list incomplete" >&2; \
				continue;				\
			fi;						\
			for child in $$children; do			\
				case "$$checked $$l" in			\
				$$child\ *|*\ $$child\ *|*\ $$child)	\
					continue;;			\
				esac;					\
				l="$$l $$child";			\
			done;						\
		done;							\
		L=$$l;							\
	done

.if !target(clean-depends)
clean-depends:
	@for dir in $$(${CLEAN-DEPENDS-FULL}); do \
		(cd $$dir; ${MAKE} NOCLEANDEPENDS=yes clean); \
	done
.endif

.if !target(limited-clean-depends)
limited-clean-depends:
	@for dir in $$(${CLEAN-DEPENDS-LIMITED}); do \
		(cd $$dir; ${MAKE} NOCLEANDEPENDS=yes clean); \
	done
.endif

.if !target(deinstall-depends)
deinstall-depends:
	@for dir in $$(${ALL-DEPENDS-LIST}); do \
		(cd $$dir; ${MAKE} deinstall); \
	done
.endif

.if !target(fetch-recursive)
fetch-recursive:
	@${ECHO_MSG} "===> Fetching all distfiles for ${PKGNAME} and dependencies"
	@for dir in ${.CURDIR} $$(${ALL-DEPENDS-LIST}); do \
		(cd $$dir; ${MAKE} fetch); \
	done
.endif

.if !target(fetch-recursive-list)
fetch-recursive-list:
	@for dir in ${.CURDIR} $$(${ALL-DEPENDS-LIST}); do \
		(cd $$dir; ${MAKE} fetch-list); \
	done
.endif

.if !target(fetch-required)
fetch-required: fetch
	@${ECHO_MSG} "===> Fetching all required distfiles for ${PKGNAME} and dependencies"
.for deptype in EXTRACT PATCH FETCH BUILD RUN
.if defined(${deptype}_DEPENDS)
.if !defined(NO_DEPENDS)
	@for i in ${${deptype}_DEPENDS}; do \
		prog=`${ECHO_CMD} $$i | ${CUT} -f 1 -d ':'`; \
		dir=`${ECHO_CMD} $$i | ${CUT} -f 2-999 -d ':'`; \
		if ${EXPR} "$$dir" : '.*:' > /dev/null; then \
			dir=`${ECHO_CMD} $$dir | ${CUT} -f 1 -d ':'`; \
			if ${EXPR} "$$prog" : \\/ >/dev/null; then \
				if [ ! -e "$$prog" ]; then \
					(cd $$dir; ${MAKE} fetch); \
				fi; \
			fi; \
		else \
			(cd $$dir; \
			tmp=`${MAKE} -V PKGNAME`; \
			if [ ! -d ${PKG_DBDIR}/$${tmp} ]; then \
				${MAKE} fetch; \
			fi );  \
		fi; \
	done
.endif
.endif
.endfor
.endif

.if !target(fetch-required-list)
fetch-required-list: fetch-list
.for deptype in EXTRACT PATCH FETCH BUILD RUN
.if defined(${deptype}_DEPENDS)
.if !defined(NO_DEPENDS)
	@for i in ${${deptype}_DEPENDS}; do \
		prog=`${ECHO_CMD} $$i | ${CUT} -f 1 -d ':'`; \
		dir=`${ECHO_CMD} $$i | ${CUT} -f 2-999 -d ':'`; \
		if ${EXPR} "$$dir" : '.*:' > /dev/null; then \
			dir=`${ECHO_CMD} $$dir | ${CUT} -f 1 -d ':'`; \
			if ${EXPR} "$$prog" : \\/ >/dev/null; then \
				if [ ! -e "$$prog" ]; then \
					(cd $$dir; ${MAKE} fetch-list); \
				fi; \
			fi; \
		else \
			(cd $$dir; \
			tmp=`${MAKE} -V PKGNAME`; \
			if [ ! -d ${PKG_DBDIR}/$${tmp} ]; then \
				${MAKE} fetch-list; \
			fi );  \
		fi; \
	done
.endif
.endif
.endfor
.endif

.if !target(checksum-recursive)
checksum-recursive:
	@${ECHO_MSG} "===> Fetching and checking checksums for ${PKGNAME} and dependencies"
	@for dir in ${.CURDIR} $$(${ALL-DEPENDS-LIST}); do \
		(cd $$dir; ${MAKE} checksum); \
	done
.endif

# Dependency lists: build and runtime.  Print out directory names.

build-depends-list:
.if defined(EXTRACT_DEPENDS) || defined(PATCH_DEPENDS) || defined(FETCH_DEPENDS) || defined(BUILD_DEPENDS) || defined(LIB_DEPENDS) || defined(DEPENDS)
	@${BUILD-DEPENDS-LIST}
.endif

BUILD-DEPENDS-LIST= \
	for dir in $$(${ECHO_CMD} "${EXTRACT_DEPENDS} ${PATCH_DEPENDS} ${FETCH_DEPENDS} ${BUILD_DEPENDS} ${LIB_DEPENDS}" | ${TR} '\040' '\012' | ${SED} -e 's/^[^:]*://' -e 's/:.*//' | ${SORT} -u) $$(${ECHO_CMD} ${DEPENDS} | ${TR} '\040' '\012' | ${SED} -e 's/:.*//' | ${SORT} -u); do \
		if [ -d $$dir ]; then \
			${ECHO_CMD} $$dir; \
		else \
			${ECHO_MSG} "${PKGNAME}: \"$$dir\" non-existent -- dependency list incomplete" >&2; \
		fi; \
	done | ${SORT} -u

run-depends-list:
.if defined(LIB_DEPENDS) || defined(RUN_DEPENDS) || defined(DEPENDS)
	@${RUN-DEPENDS-LIST}
.endif

RUN-DEPENDS-LIST= \
	for dir in $$(${ECHO_CMD} "${LIB_DEPENDS} ${RUN_DEPENDS}" | ${SED} -e 'y/ /\n/' | ${CUT} -f 2 -d ':' | ${SORT} -u) $$(${ECHO_CMD} ${DEPENDS} | ${SED} -e 'y/ /\n/' | ${CUT} -f 1 -d ':' | ${SORT} -u); do \
		if [ -d $$dir ]; then \
			${ECHO_CMD} $$dir; \
		else \
			${ECHO_MSG} "${PKGNAME}: \"$$dir\" non-existent -- dependency list incomplete" >&2; \
		fi; \
	done | ${SORT} -u

# Package (recursive runtime) dependency list.  Print out both directory names
# and package names.

package-depends-list:
.if defined(CHILD_DEPENDS) || defined(LIB_DEPENDS) || defined(RUN_DEPENDS) || defined(DEPENDS)
	@${PACKAGE-DEPENDS-LIST}
.endif

# the mport binary tools only store the the first tier of the depenancy
# tree in a mports archive.
PACKAGE-DEPENDS-LIST?= \
	for depend in `${ECHO_CMD} "${LIB_DEPENDS} ${RUN_DEPENDS}" | ${SED} -e 'y/ /\n/' | ${SORT} -u`; do \
		version=`(${ECHO_CMD} $$depend | ${CUT} -f 1 -d ':' | ${GREP} -se '[<>]') || ${TRUE}`; \
		dir=`${ECHO_CMD} $$depend | ${CUT} -f 2 -d ':' | ${XARGS} ${REALPATH}`; \
		if [ -d $$dir ]; then \
			meta=`cd $$dir && ${MAKE} -V PKGBASE -V PKGORIGIN | ${PASTE} - -`; \
			if [ -z "$$version" ]; then \
				${ECHO_CMD} "$$dir $$meta" | ${AWK} '{print $$2 " " $$1 " " $$3}'; \
			else \
				version=`${ECHO_CMD} $$version | ${SED} -E 's/^.*([<>])/\1/'`; \
				${ECHO_CMD} "$$dir $$meta $$version" | ${AWK} '{print $$2 " " $$1 " " $$3 " " $$4}'; \
			fi; \
		else \
			${ECHO_MSG} "\"$$dir\" non-existent -- dependency list incomplete" >&2; \
		fi; \
	done

.if !target(package-depends)
package-depends:
	@${PACKAGE-DEPENDS-LIST} | ${AWK} '{ if ($$4) print $$1":"$$3":"$$4; else print $$1":"$$3 }'
.endif


# Build packages for port and dependencies
package-recursive: package
	@for dir in $$(${ALL-DEPENDS-LIST}); do \
		(cd $$dir; ${MAKE} package); \
	done

# Show missing dependiencies
.if !target(missing)
missing:
	@for dir in $$(${ALL-DEPENDS-LIST}); do \
		THISORIGIN=$$(${ECHO_CMD} $$dir | ${SED} 's,${PORTSDIR}/,,'); \
		if ${MPORT_QUERY} -q origin=$${THISORIGIN}; then \
			${ECHO_CMD} $$THISORIGIN; \
		fi \
	done
.endif
################################################################
# Everything after here are internal targets and really
# shouldn't be touched by anybody but the release engineers.
################################################################


_SUB_LIST_TEMP=	${SUB_LIST:S/$/!g/:S/^/ -e s!%%/:S/=/%%!/}
.if !target(apply-slist)
apply-slist:
.if defined(SUB_FILES)
.for file in ${SUB_FILES}
.if !exists(${FILESDIR}/${file}.in)
	@${ECHO_MSG} "** Missing ${FILESDIR}/${file}.in for ${PKGNAME}."; exit 1
.else
	@${SED} ${_SUB_LIST_TEMP} -e '/^@comment /d' ${FILESDIR}/${file}.in > ${WRKDIR}/${file}
.endif
.endfor
.for i in pkg-message pkg-install pkg-deinstall pkg-req
.if ${SUB_FILES:M${i}*}!=""
${i:S/-//:tu}=	${WRKDIR}/${SUB_FILES:M${i}*}
.endif
.endfor
.endif
.endif

# Make tmp packaing list.  This is the top level target for the entire file.
make-tmpplist:  generate-plist finish-tmpplist
finish-tmpplist: add-plist-info add-plist-docs add-plist-post

# Generate packing list.  Also tests to make sure all required package
# files exist.
#
.if !target(generate-plist)
generate-plist:
	@${ECHO_MSG} "===>   Generating temporary packing list"
	@${MKDIR} `${DIRNAME} ${TMPPLIST}`
	@if [ ! -f ${DESCR} ]; then ${ECHO_MSG} "** Missing pkg-descr for ${PKGNAME}."; exit 1; fi
	@>${TMPPLIST}
	@for file in ${PLIST_FILES}; do \
		${ECHO_CMD} $${file} | ${SED} ${PLIST_SUB:S/$/!g/:S/^/ -e s!%%/:S/=/%%!/} >> ${TMPPLIST}; \
	done
	@for man in ${__MANPAGES}; do \
		${ECHO_CMD} $${man} >> ${TMPPLIST}; \
	done
.	for _PREFIX in ${PREFIX}
.		if ${_TMLINKS:M${_PREFIX}*}x != x
			@for i in ${_TMLINKS:M${_PREFIX}*:S|^${_PREFIX}/||}; do \
				${ECHO_CMD} "$$i" >> ${TMPPLIST}; \
			done
.		endif
.		if ${_TMLINKS:N${_PREFIX}*}x != x
			@${ECHO_CMD} @cwd / >> ${TMPPLIST}
			@for i in ${_TMLINKS:N${_PREFIX}*:S|^/||}; do \
				${ECHO_CMD} "$$i" >> ${TMPPLIST}; \
			done
			@${ECHO_CMD} '@cwd ${PREFIX}' >> ${TMPPLIST}
.		endif
.	endfor
	@if [ -f ${PLIST} ]; then \
		${SED} ${PLIST_SUB:S/$/!g/:S/^/ -e s!%%/:S/=/%%!/} ${PLIST} >> ${TMPPLIST}; \
	fi
.	for reinplace in ${PLIST_REINPLACE}
.		if defined(PLIST_REINPLACE_${reinplace:tu})
			@${SED} -i "" -e '${PLIST_REINPLACE_${reinplace:tu}}' ${TMPPLIST}
.		endif
.	endfor
 
.	for dir in ${PLIST_DIRS}
		@${ECHO_CMD} ${dir} | ${SED} ${PLIST_SUB:S/$/!g/:S/^/ -e s!%%/:S/=/%%!/} | ${SED} -e 's,^,@dir ,' >> ${TMPPLIST}
.	endfor

.	if defined(USE_LDCONFIG)
.		if !defined(INSTALL_AS_USER)
			@${ECHO_CMD} "@exec ${LDCONFIG_PLIST_EXEC_CMD}"     >> ${TMPPLIST}
			@${ECHO_CMD} "@unexec ${LDCONFIG_PLIST_UNEXEC_CMD}" >> ${TMPPLIST}
.		else
			@${ECHO_CMD} "@exec ${LDCONFIG_PLIST_EXEC_CMD}" || ${TRUE}     >> ${TMPPLIST}
			@${ECHO_CMD} "@unexec ${LDCONFIG_PLIST_UNEXEC_CMD}" || ${TRUE} >> ${TMPPLIST}
.		endif
.	endif
.	if defined(USE_LDCONFIG32)
.		if !defined(INSTALL_AS_USER)
			@${ECHO_CMD} "@exec ${LDCONFIG} -32 -m ${USE_LDCONFIG32}" >> ${TMPPLIST}
			@${ECHO_CMD} "@unexec ${LDCONFIG} -32 -R" >> ${TMPPLIST}
.		else
			@${ECHO_CMD} "@exec ${LDCONFIG} -32 -m ${USE_LDCONFIG32} || ${TRUE}" >> ${TMPPLIST}
			@${ECHO_CMD} "@unexec ${LDCONFIG} -32 -R || ${TRUE}" >> ${TMPPLIST}
.		endif
.	endif
# End of generate-plist
.endif 

${TMPPLIST}:
	@cd ${.CURDIR} && ${MAKE} generate-plist

.if !target(add-plist-docs)
add-plist-docs:
.	if defined(PORTDOCS) && !defined(NOPORTDOCS)
		@if ${EGREP} -qe '^@cw?d' ${TMPPLIST} && \
			[ "`${SED} -En -e '/^@cw?d[ 	]*/s,,,p' ${TMPPLIST} | ${TAIL} -n 1`" != "${PREFIX}" ]; then \
			${ECHO_CMD} "@cwd ${PREFIX}" >> ${TMPPLIST}; \
		fi
.		for x in ${PORTDOCS}
			@if ${ECHO_CMD} "${x}"| ${AWK} '$$1 ~ /(\*|\||\[|\]|\?|\{|\}|\$$)/ { exit 1};'; then \
				if [ ! -e ${FAKE_DESTDIR}${DOCSDIR}/${x} ]; then \
					${ECHO_CMD} ${DOCSDIR}/${x} | \
					${SED} -e 's,^${PREFIX}/,,' >> ${TMPPLIST}; \
				fi; \
			fi
.		endfor
		@${FIND} -P ${FAKE_DESTDIR}${PORTDOCS:S/^/${DOCSDIR}\//} ! -type d 2>/dev/null | \
			${SED} -ne 's,^${FAKE_DESTDIR}${PREFIX}/,,p' >> ${TMPPLIST}
		@${FIND} -P -d ${FAKE_DESTDIR}${PORTDOCS:S/^/${DOCSDIR}\//} -type d 2>/dev/null | \
			${SED} -ne 's,^${FAKE_DESTDIR}${PREFIX}/,@dir ,p' >> ${TMPPLIST}
		@${ECHO_CMD} "@dir ${DOCSDIR:S,^${PREFIX}/,,}" >> ${TMPPLIST}
.	else
		@${DO_NADA}
.	endif
.endif

.if !target(add-plist-info)
add-plist-info:
# Process GNU INFO files at package install/deinstall time
.if defined(INFO)
.for i in ${INFO}
	@${ECHO_CMD} "@unexec install-info --quiet --delete %D/${INFO_PATH}/$i.info %D/${INFO_PATH}/dir" \
		>> ${TMPPLIST}
	@${ECHO_CMD} ${INFO_PATH}/$i.info >> ${TMPPLIST}
	@${ECHO_CMD} "@exec install-info --quiet %D/${INFO_PATH}/$i.info %D/${INFO_PATH}/dir" \
		>> ${TMPPLIST}
	@if [ "`${DIRNAME} $i`" != "." ]; then \
		${ECHO_CMD} "@dir info/`${DIRNAME} $i`" >> ${TMPPLIST}; \
	fi
.endfor
.if defined(INFO_SUBDIR)
	@${ECHO_CMD} "@unexec ${RMDIR} %D/${INFO_PATH}/${INFO_SUBDIR} 2> /dev/null || true" >> ${TMPPLIST}
.endif
.if (${PREFIX} != "/usr")
	@${ECHO_CMD} "@unexec if [ -f %D/${INFO_PATH}/dir ]; then if sed -e '1,/Menu:/d' %D/${INFO_PATH}/dir \
		 | grep -q '^[*] '; then true; else rm %D/${INFO_PATH}/dir; fi; fi" >> ${TMPPLIST}

.if (${PREFIX} != ${LOCALBASE_REL} && ${PREFIX} != ${LINUXBASE_REL})
	@${ECHO_CMD} "@dir rmdir info/" >> ${TMPPLIST}
.endif

.endif
.endif
.endif

# If we're installing into a non-standard PREFIX, we need to remove that directory at
# deinstall-time
.if !target(add-plist-post)
add-plist-post:
.	if (${PREFIX} != ${LOCALBASE_REL} && ${PREFIX} != ${LINUXBASE_REL} && ${PREFIX} != "/usr")
		@${ECHO_CMD} "@unexec rmdir %D 2> /dev/null || true" >> ${TMPPLIST}
.	else
		@${DO_NADA}
.	endif
.endif


.if !target(install-rc-script)
install-rc-script:
.	if defined(USE_RCORDER) || defined(USE_RC_SUBR) && ${USE_RC_SUBR:tu} != "YES"
.		if defined(USE_RCORDER)
			@${ECHO_MSG} "===> Installing early rc.d startup script(s)"
			@${ECHO_CMD} "@cwd /" >> ${TMPPLIST}
			@${INSTALL} -d ${FAKE_DESTDIR}/etc/rc.d
			@for i in ${USE_RCORDER}; do \
				${INSTALL_SCRIPT} ${WRKDIR}/$${i} ${FAKE_DESTDIR}/etc/rc.d/$${i%.sh}; \
				${ECHO_CMD} "etc/rc.d/$${i%.sh}" >> ${TMPPLIST}; \
			done
			@${ECHO_CMD} "@cwd ${PREFIX}" >> ${TMPPLIST}
.		endif
.		if defined(USE_RC_SUBR) && ${USE_RC_SUBR:tu} != "YES"
			@${ECHO_MSG} "===> Installing rc.d startup script(s)"
			@${ECHO_CMD} "@cwd ${PREFIX}" >> ${TMPPLIST}
			@for i in ${USE_RC_SUBR}; do \
				${INSTALL_SCRIPT} ${WRKDIR}/$${i} ${FAKE_DESTDIR}${PREFIX}/etc/rc.d/$${i%.sh}; \
				${ECHO_CMD} "etc/rc.d/$${i%.sh}" >> ${TMPPLIST}; \
			done
.		endif
.	else
		@${DO_NADA}
.	endif
.endif

#
# Install the ldconfig file if needed. 
#
.if !target(install-ldconfig-file)
install-ldconfig-file:
.	if defined(USE_LDCONFIG) 
.		if (${USE_LDCONFIG} != ${PREFIX}/lib && ${USE_LDCONFIG} != %D/lib)
			@${ECHO_MSG} "===>   Installing ldconfig configuration file."
			@${ECHO_CMD} ${USE_LDCONFIG:S/%D/${PREFIX}/g} | ${TR} ' ' '\n' \
				> ${FAKE_DESTDIR}${PREFIX}/${LDCONFIG_DIR}/${UNIQUENAME}
			@${ECHO_CMD} ${LDCONFIG_DIR}/${UNIQUENAME} >> ${TMPPLIST}
.		endif
.	elif defined(USE_LDCONFIG32)
		@${ECHO_CMD} ${USE_LDCONFIG32} | ${TR} ' ' '\n' \
			> ${FAKE_DESTDIR}${PREFIX}/${LDCONFIG32_DIR}/${UNIQUENAME}
		@${ECHO_CMD} ${LDCONFIG32_DIR}/${UNIQUENAME} >> ${TMPPLIST}
.	else
		@${DO_NADA}
.	endif
.endif

.if !target(create-users-groups)
create-users-groups:
.if defined(GROUPS) || defined(USERS)
.if defined(GROUPS)
.for _file in ${GID_FILES}
.if !exists(${_file})
	@${ECHO_CMD} "** ${_file} doesn't exist. Exiting."; exit 1
.endif
.endfor
	@${ECHO_MSG} "===> Creating users and/or groups."
	@${ECHO_CMD} "@exec echo \"===> Creating users and/or groups.\"" >> ${TMPPLIST}
.for _group in ${GROUPS}
# _bgpd:*:130:
	@if ! ${GREP} -h ^${_group}: ${GID_FILES} >/dev/null 2>&1; then \
		${ECHO_CMD} "** Cannot find any information about group \`${_group}' in ${GID_FILES}."; \
		exit 1; \
	fi
	@IFS=":"; ${GREP} -h ^${_group}: ${GID_FILES} | head -n 1 | while read group foo gid members; do \
		gid=$$(($$gid+${GID_OFFSET})); \
		if ! ${PW} groupshow $$group >/dev/null 2>&1; then \
			${ECHO_MSG} "Creating group \`$$group' with gid \`$$gid'."; \
			${PW} groupadd $$group -g $$gid; \
		else \
			${ECHO_MSG} "Using existing group \`$$group'."; \
		fi; \
		${ECHO_CMD} "@exec if ! ${PW} groupshow $$group >/dev/null 2>&1; then \
			echo \"Creating group '$$group' with gid '$$gid'.\"; \
			${PW} groupadd $$group -g $$gid; else echo \"Using existng group '$$group'.\"; fi" >> ${TMPPLIST}; \
	done
.endfor
.endif
.if defined(USERS)
.for _file in ${UID_FILES}
.if !exists(${_file})
	@${ECHO_CMD} "** ${_file} doesn't exist. Exiting."; exit 1
.endif
.endfor
.for _user in ${USERS}
# _bgpd:*:130:130:BGP Daemon:/var/empty:/sbin/nologin
	@if ! ${GREP} -h ^${_user}: ${UID_FILES} >/dev/null 2>&1; then \
		${ECHO_CMD} "** Cannot find any information about user \`${_user}' in ${UID_FILES}."; \
		exit 1; \
	fi
	@IFS=":"; ${GREP} -h ^${_user}: ${UID_FILES} | head -n 1 | while read login passwd uid gid class change expire gecos homedir shell; do \
		uid=$$(($$uid+${UID_OFFSET})); \
		gid=$$(($$gid+${GID_OFFSET})); \
		class="$${class:+-L }$$class"; \
		homedir=$$(echo $$homedir | sed "s|^/usr/local|${PREFIX}|"); \
		if ! ${PW} usershow $$login >/dev/null 2>&1; then \
			${ECHO_MSG}  "Creating user \`$$login' with uid \`$$uid'."; \
			eval ${PW} useradd $$login -u $$uid -g $$gid $$class -c \"$$gecos\" -d $$homedir -s $$shell; \
			case $$homedir in /nonexistent|/var/empty) ;; *) ${INSTALL} -d -g $$gid -o $$uid $$homedir;; esac; \
		else \
			${ECHO_MSG} "Using existing user \`$$login'."; \
		fi; \
		${ECHO_CMD} "@exec if ! ${PW} usershow $$login >/dev/null 2>&1; then \
			echo \"Creating user '$$login' with uid '$$uid'.\"; \
			${PW} useradd $$login -u $$uid -g $$gid $$class -c \"$$gecos\" -d $$homedir -s $$shell; \
			else echo \"Using existing user '$$login'.\"; fi" >> ${TMPPLIST}; \
		case $$homedir in /nonexistent|/var/empty) ;; *) ${ECHO_CMD} "@exec ${INSTALL} -d -g $$gid -o $$uid $$homedir" >> ${TMPPLIST};; esac; \
	done
.endfor
.if defined(GROUPS)
.for _group in ${GROUPS}
# mail:*:6:postfix,clamav
	@IFS=":"; ${GREP} -h ^${_group}: ${GID_FILES} | head -n 1 | while read group foo gid members; do \
		gid=$$(($$gid+${GID_OFFSET})); \
		IFS=","; for _login in $$members; do \
			for _user in ${USERS}; do \
				if [ "x$${_user}" = "x$${_login}" ]; then \
					if ! ${PW} groupshow ${_group} | ${GREP} -qw $${_login}; then \
						${ECHO_MSG} "Adding user \`$${_login}' to group \`${_group}'."; \
						${PW} groupmod ${_group} -m $${_login}; \
					fi; \
					${ECHO_CMD} "@exec if ! ${PW} groupshow ${_group} | ${GREP} -qw $${_login}; then \
						echo \"Adding user '$${_login}' to group '${_group}'.\"; \
						${PW} groupmod ${_group} -m $${_login}; fi" >> ${TMPPLIST}; \
				fi; \
			done; \
		done; \
	done
.endfor
.endif
.if defined(USERS)
.for _user in ${USERS}
	@if [ ! ${USERS_BLACKLIST:M${_user}} ]; then \
		${ECHO_CMD} "@unexec if ${PW} usershow ${_user} >/dev/null 2>&1; then \
		echo \"==> You should manually remove the \\\"${_user}\\\" user. \"; fi" >> ${TMPPLIST}; \
	fi
.endfor
.endif
.endif
.else
	@${DO_NADA}
.endif
.endif

# XXX Make sure the commands to create group(s)
# and user(s) are the first in pkg-plist
.if !target(fix-plist-sequence)
fix-plist-sequence: ${TMPPLIST}
.if defined(GROUPS) || defined(USERS)
	@${ECHO_CMD} "===> Correct pkg-plist sequence to create group(s) and user(s)"
	@${EGREP} -e '^@exec echo.*Creating users and' -e '^@exec.*${PW}' -e '^@exec ${INSTALL} -d -g' ${TMPPLIST} > ${TMPGUCMD}
	@${EGREP} -v -e '^@exec echo.*Creating users and' -e '^@exec.*${PW}' -e '^@exec ${INSTALL} -d -g' ${TMPPLIST} >> ${TMPGUCMD}
	@${MV} -f ${TMPGUCMD} ${TMPPLIST}
.endif
.endif

# Compress (or uncompress) and symlink manpages.
.if !target(compress-man)
compress-man:
.  if defined(_FAKEMAN) || defined(_MLINKS)
.    if ${MANCOMPRESSED:tl} == yes && defined(NOMANCOMPRESS)
	@${ECHO_MSG} "===>   Uncompressing manual pages for ${PKGNAME}"
	@_manpages='${_FAKEMAN:S/'/'\''/g}' && [ "$${_manpages}" != "" ] && ( eval ${GUNZIP_CMD} $${_manpages} ) || ${TRUE}
.    elif ${MANCOMPRESSED:tl} == no && !defined(NOMANCOMPRESS)
	@${ECHO_MSG} "===>   Compressing manual pages for ${PKGNAME}"
	@_manpages='${_FAKEMAN:S/'/'\''/g}' && [ "$${_manpages}" != "" ] && ( eval ${GZIP_CMD} $${_manpages} ) || ${TRUE}
.    endif
.    if defined(_MLINKS)
	@set -- ${_FAKE_MLINKS}; \
	while :; do \
		[ $$# -eq 0 ] && break || ${TRUE}; \
		${RM} -f $${2%.gz}; ${RM} -f $$2.gz; \
		${LN} -fs `${ECHO_CMD} $$1 $$2 | ${AWK} '{ \
					z=split($$1, a, /\//); x=split($$2, b, /\//); \
					while (a[i] == b[i]) i++; \
					for (q=i; q<x; q++) printf "../"; \
					for (; i<z; i++) printf a[i] "/"; printf a[z]; }'` $$2; \
		shift; shift; \
	done
.    endif
# FreeBSD Stage Compatibility - FAKE_DESTDIR = STAGEDIR in their world ~
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
# End FreeBSD Stage Compatibility
.  else
	@${DO_NADA}
.endif
.endif


# Depend is generally meaningless for arbitrary ports, but if someone wants
# one they can override this.  This is just to catch people who've gotten into
# the habit of typing `make depend all install' as a matter of course.
#
.if !target(depend)
depend:
.endif

# Same goes for tags
.if !target(tags)
tags:
.endif

.if !defined(NOPRECIOUSMAKEVARS)
# These won't change, so we can pass them through the environment
.MAKEFLAGS: \
	ARCH="${ARCH:S/"/"'"'"/g:S/\$/\$\$/g:S/\\/\\\\/g}" \
	OPSYS="${OPSYS:S/"/"'"'"/g:S/\$/\$\$/g:S/\\/\\\\/g}" \
	OSREL="${OSREL:S/"/"'"'"/g:S/\$/\$\$/g:S/\\/\\\\/g}" \
	OSVERSION="${OSVERSION:S/"/"'"'"/g:S/\$/\$\$/g:S/\\/\\\\/g}" \
	SYSTEMVERSION="${SYSTEMVERSION:S/"/"'"'"/g:S/\$/\$\$/g:S/\\/\\\\/g}"
.endif

desktop-categories:
	@categories=""; \
	for native_category in ${CATEGORIES}; do \
		c=""; \
		case $$native_category in \
			accessibility)	c="Utility Accessibility"		;; \
			archivers)		c="Utility Archiving"					;; \
			astro)			c="Education Science Astronomy"	;; \
			audio)			c="AudioVideo Audio"			;; \
			benchmarks)		c="System"						;; \
			biology)		c="Education Science Biology"	;; \
			cad)			c="Graphics Engineering"					;; \
			core)			c="System"				;; \
			comms)			c="Utility"				;; \
			converters)		c="Utility"				;; \
			databases)		c="Office Database"					;; \
			deskutils)		c="Utility"						;; \
			devel)			c="Development"					;; \
			dns)			c="Network"						;; \
			elisp)			c="Development"					;; \
			editors)		c="Utility"						;; \
			emulators)		c="System Emulator"					;; \
			finance)		c="Office Finance"				;; \
			ftp)			c="Network FileTransfer"		;; \
			games)			c="Game"						;; \
			geography)		c="Education Science Geography"	;; \
			gnome)			c="GNOME GTK"					;; \
			graphics)		c="Graphics"					;; \
			hamradio)		c="HamRadio"					;; \
			haskell)		c="Development"					;; \
			ipv6)			c="Network"						;; \
			irc)			c="Network IRCClient"			;; \
			java)			c="Development Java"			;; \
			kde)			c="KDE Qt"						;; \
			lang)			c="Development"					;; \
			lisp)			c="Development"					;; \
			lua)			c="Development"				;; \
			mail)			c="Office Email"		;; \
			math)			c="Education Science Math"		;; \
			multimedia)		c="AudioVideo"					;; \
			net)			c="Network"						;; \
			net-im)			c="Network InstantMessaging"	;; \
			net-mgmt)		c="Network"						;; \
			net-p2p)		c="Network P2P"					;; \
			news)			c="News"						;; \
			pear)			c="Development WebDevelopment"	;; \
			perl5)			c="Development"					;; \
			python)			c="Development"					;; \
			ruby)			c="Development"					;; \
			rubygems)		c="Development"					;; \
			scheme)			c="Development"					;; \
			science)		c="Science Education"			;; \
			security)		c="System Security"				;; \
			shells)			c="Shell"						;; \
			sysutils)		c="System Utility"				;; \
			tcl*|tk*)		c="Development"					;; \
			www)			c="Network"						;; \
			x11-clocks)		c="Utility Clock"				;; \
			x11-fm)			c="FileManager"					;; \
			xfce)			c="GTK XFCE"							;; \
			zope)			c="Development WebDevelopment"	;; \
		esac; \
		if [ -n "$$c" ]; then \
			categories="$$categories $$c"; \
		fi; \
	done; \
	if [ -n "$$categories" ]; then \
		for c in Application $$categories; do ${ECHO_MSG} "$$c"; done \
			| ${SORT} -u | ${TR} '\n' ';'; \
		${ECHO_MSG}; \
	fi

# http://standards.freedesktop.org/menu-spec/menu-spec-latest.html
DESKTOP_CATEGORIES_MAIN=	AudioVideo Audio Video Development Education \
	Game Graphics Network Office Science Settings System Utility
DESKTOP_CATEGORIES_ADDITIONAL=	Building Debugger IDE GUIDesigner Profiling \
	RevisionControl Translation Calendar ContactManagement Database \
	Dictionary Chart Email Finance FlowChart PDA ProjectManagement \
	Presentation Spreadsheet WordProcessor 2DGraphics VectorGraphics \
	RasterGraphics 3DGraphics Scanning OCR Photography Publishing Viewer \
	TextTools DesktopSettings HardwareSettings Printing PackageManager \
	Dialup InstantMessaging Chat IRCClient Feed FileTransfer HamRadio News \
	P2P RemoteAccess Telephony TelephonyTools VideoConference WebBrowser \
	WebDevelopment Midi Mixer Sequencer Tuner TV AudioVideoEditing Player \
	Recorder DiscBurning ActionGame AdventureGame ArcadeGame BoardGame \
	BlocksGame CardGame KidsGame LogicGame RolePlaying Shooter Simulation \
	SportsGame StrategyGame Art Construction Music Languages \
	ArtificialIntelligence Astronomy Biology Chemistry ComputerScience \
	DataVisualization Economy Electricity Geography Geology Geoscience \
	History Humanities ImageProcessing Literature Maps Math \
	NumericalAnalysis MedicalSoftware Physics Robotics Spirituality Sports \
	ParallelComputing Amusement Archiving Compression Electronics Emulator \
	Engineering FileTools FileManager TerminalEmulator Filesystem Monitor \
	Security Accessibility Calculator Clock TextEditor Documentation Adult \
	Core KDE GNOME MATE XFCE GTK Qt Motif Java ConsoleOnly
DESKTOP_CATEGORIES_RESERVED=	Screensaver TrayIcon Applet Shell

VALID_DESKTOP_CATEGORIES+=	${DESKTOP_CATEGORIES_MAIN} \
	${DESKTOP_CATEGORIES_ADDITIONAL} \
	${DESKTOP_CATEGORIES_RESERVED}

check-desktop-entries:
.if defined(DESKTOP_ENTRIES)
	@set -- ${DESKTOP_ENTRIES} XXX; \
	if [ `${EXPR} \( $$# - 1 \) % 6` -ne 0 ]; then \
		${ECHO_MSG} "${PKGNAME}: Makefile error: the DESKTOP_ENTRIES list must contain one or more groups of 6 elements"; \
		exit 1; \
	fi; \
	num=1; \
	while [ $$# -gt 6 ]; do \
		entry="#$$num"; \
		if [ -n "$$4" ]; then \
			entry="$$entry ($$4)"; \
		elif [ -n "$$1" ]; then \
			entry="$$entry ($$1)"; \
		fi; \
		if [ -z "$$1" ]; then \
			${ECHO_MSG} "${PKGNAME}: Makefile error: in desktop entry $$entry: field 1 (Name) is empty"; \
			exit 1; \
		fi; \
		if ${ECHO_CMD} "$$3" | ${GREP} -iq '.\(png\|svg\|xpm\)$$'; then \
			if ! ${ECHO_CMD} "$$3" | ${GREP} -iq '^/'; then \
				${ECHO_MSG} "${PKGNAME}: Makefile warning: in desktop entry $$entry: field 3 (Icon) should be either absolute path or icon name without extension if installed icons follow Icon Theme Specification"; \
			fi; \
                fi; \
		if [ -z "$$4" ]; then \
			${ECHO_MSG} "${PKGNAME}: Makefile error: in desktop entry $$entry: field 4 (Exec) is empty"; \
			exit 1; \
		fi; \
		if [ -n "$$5" ]; then \
			for c in `${ECHO_CMD} "$$5" | ${TR} ';' ' '`; do \
				if ! ${ECHO_CMD} ${VALID_DESKTOP_CATEGORIES} | ${GREP} -wq $$c; then \
					${ECHO_CMD} "${PKGNAME}: Makefile warning: in desktop entry $$entry: category $$c is not a valid desktop category"; \
				fi; \
			done; \
			if ! ${ECHO_CMD} "$$5" | ${GREP} -q "`${ECHO_CMD} ${DESKTOP_CATEGORIES_MAIN} | ${SED} -E 's,[[:blank:]]+,\\\|,g'`"; then \
				${ECHO_CMD} "${PKGNAME}: Makefile warning: in desktop entry $$entry: field 5 (Categories) must contain at least one main desktop category (make -VDESKTOP_CATEGORIES_MAIN)"; \
			fi; \
			if ! ${ECHO_CMD} "$$5" | ${GREP} -q ';$$'; then \
				${ECHO_MSG} "${PKGNAME}: Makefile error: in desktop entry $$entry: field 5 (Categories) does not end with a semicolon"; \
				exit 1; \
			fi; \
		else \
			if [ -z "`cd ${.CURDIR} && ${MAKE} ${__softMAKEFLAGS} desktop-categories`" ]; then \
				${ECHO_MSG} "${PKGNAME}: Makefile error: in desktop entry $$entry: field 5 (Categories) is empty and could not be deduced from the CATEGORIES variable"; \
				exit 1; \
			fi; \
		fi; \
		if [ -z "$$6" ]; then \
			${ECHO_MSG} "${PKGNAME}: Makefile error: in desktop entry $$entry: field 6 (StartupNotify) is empty"; \
			exit 1; \
		fi; \
		if [ "x$$6" != "xtrue" ] && [ "x$$6" != "xfalse" ]; then \
			${ECHO_MSG} "${PKGNAME}: Makefile error: in desktop entry $$entry: field 6 (StartupNotify) is not \"true\" or \"false\""; \
			exit 1; \
		fi; \
		shift 6; \
		num=`${EXPR} $$num + 1`; \
	done
.else
	@${DO_NADA}
.endif

.if !target(install-desktop-entries)
install-desktop-entries:
.if defined(DESKTOP_ENTRIES)
	@(${MKDIR} "${FAKE_DESTDIR}${DESKTOPDIR}" 2> /dev/null) || \
		(${ECHO_MSG} "===> Cannot create ${FAKE_DESTDIR}${DESKTOPDIR}, check permissions"; exit 1)
	@set -- ${DESKTOP_ENTRIES} XXX; \
	if [ -z "${_DESKTOPDIR_REL}" ]; then \
		${ECHO_CMD} "@cwd ${DESKTOPDIR}" >> ${TMPPLIST}; \
	fi; \
	while [ $$# -gt 6 ]; do \
		filename="`${ECHO_CMD} "$$4" | ${SED} -e 's,^/,,g;s,[/ ],_,g;s,[^_[:alnum:]],,g'`.desktop"; \
		pathname="${FAKE_DESTDIR}${DESKTOPDIR}/$$filename"; \
		categories="$$5"; \
		if [ -z "$$categories" ]; then \
			categories="`cd ${.CURDIR} && ${MAKE} ${__softMAKEFLAGS} desktop-categories`"; \
		fi; \
		${ECHO_CMD} "${_DESKTOPDIR_REL}$$filename" >> ${TMPPLIST}; \
		${ECHO_CMD} "[Desktop Entry]" > $$pathname; \
		${ECHO_CMD} "Type=Application" >> $$pathname; \
		${ECHO_CMD} "Version=1.0" >> $$pathname; \
		${ECHO_CMD} "Name=$$1" >> $$pathname; \
		comment="$$2"; \
		if [ -z "$$2" ]; then \
			comment="`cd ${.CURDIR} && ${MAKE} -VCOMMENT`"; \
		fi; \
		${ECHO_CMD} "GenericName=$$comment" >> $$pathname; \
		${ECHO_CMD} "Comment=$$comment" >> $$pathname; \
		if [ -n "$$3" ]; then \
			${ECHO_CMD} "Icon=$$3" >> $$pathname; \
		fi; \
		${ECHO_CMD} "Exec=$$4" >> $$pathname; \
		${ECHO_CMD} "Categories=$$categories" >> $$pathname; \
		if [ -n "$$6" ]; then \
			${ECHO_CMD} "StartupNotify=$$6" >> $$pathname; \
		fi; \
		shift 6; \
	done; \
	${ECHO_CMD} "@unexec rmdir ${DESKTOPDIR} 2>/dev/null || true" >> ${TMPPLIST}; \
	if [ -z "${_DESKTOPDIR_REL}" ]; then \
		${ECHO_CMD} "@cwd" >> ${TMPPLIST}; \
	fi
.else
	@${DO_NADA}
.endif
.endif

.PHONY: ${_PHONY_TARGETS}

.endif


# End of post-makefile section.
