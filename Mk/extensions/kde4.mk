# $MidnightBSD: mports/Mk/extensions/kde4.mk,v 1.7 2011/07/16 17:26:18 laffer1 Exp $

.if !defined(_POSTMKINCLUDED) && !defined(Kde_Pre_Include)

Kde_Pre_Include=	kde4.mk
Kde_Include_MAINTAINER=	ports@MidnightBSD.org

#
# This file contains some variable definitions that are supposed to
# make your life easier when dealing with ports related to the KDE4
# desktop environment. It's automatically included when USE_KDE4
# is defined in the ports' makefile.
#
# KDE4 related ports can use this as follows:
#
# USE_KDE4=	kdehier kdeprefix kdelibs
# USE_QT_VER=	4
# QT_COMPONENTS=corelib #set additional qt4 components here
#
# .include <bsd.port.mk>
#
# Available KDE4 components are:
#
# akonadi	- Akonadi PIM storage service
# automoc4	- automoc4 tool
# baseapps	- Basic KDE applications (Konqueror, Dolphin)
# kdeexp	- experimental libraries (with non-stable ABI/API)
# kdehier	- Provides common KDE directories
# kdelibs	- The base set of KDE libraries
# kdeprefix	- If set, port will be installed into ${KDE4_PREFIX} instead of ${LOCALBASE}
# oxygen	- icon themes
# pimlibs	- KDE PIM libraries
# pimruntime	- KDE PIM runtime services
# pykde4	- Python bindings for KDE
# pykdeuic4	- User Interface Compiler for PyKDE
# runtime	- More KDE applications
# sharedmime	- share-mime-info wrapper for KDE ports
# workspace	- More KDE applications (Plasma, kwin, etc.)
#
# These read-only variables can be used in port Makefile:
#
# MASTER_SITE_KDE_kde
#		- MASTER_SITE_KDE_kde is equivalent to MASTER_SITE_KDE
#		with :kde tag. It could be used when port needs multiple
#		distfiles from different sites.
# KDE4_PREFIX	- The place where KDE4 ports live.

KDE4_VERSION=		4.7.4
KDE4_BRANCH?=		stable
KDEPIM4_VERSION=	4.4.11.1
KDEPIM4_BRANCH?=	stable
KOFFICE2_VERSION=	2.3.2
KOFFICE2_BRANCH?=	stable
KDEVELOP_VERSION=	4.2.3
KDEVELOP_BRANCH?=	stable

#
# KDE4 is not installed into its own prefix and conflicts with KDE3
#
KDE4_PREFIX?=		${LOCALBASE}

#
# Tagged MASTER_SITE_KDE
#
kmaster=		${MASTER_SITE_KDE:S@%/@%/:kde@g}
.if !defined(MASTER_SITE_SUBDIR)
MASTER_SITE_KDE_kde=	${kmaster:S@%SUBDIR%/@@g}
.else
ksub=${MASTER_SITE_SUBDIR}
MASTER_SITE_KDE_kde=	${kmaster:S@%SUBDIR%/@${ksub}/@g}
.endif # !defined(MASTER_SITE_SUBDIR)

#
# KDE4 modules
#
_USE_KDE4_ALL=	akonadi automoc4 baseapps kdebase kdehier kdelibs kdeprefix \
		oxygen pimlibs pimruntime pykde4 pykdeuic4 runtime \
		sharedmime workspace

akonadi_LIB_DEPENDS=		akonadiprotocolinternals.1:${PORTSDIR}/databases/akonadi

automoc4_BUILD_DEPENDS=		${LOCALBASE}/bin/automoc4:${PORTSDIR}/devel/automoc4

baseapps_LIB_DEPENDS=		konq.7:${PORTSDIR}/x11/kde4-baseapps
kdebase_LIB_DEPENDS=		${baseapps_LIB_DEPENDS}

kdehier_RUN_DEPENDS=		kdehier4>=1:${PORTSDIR}/misc/kdehier4

kdelibs_LIB_DEPENDS=		kimproxy.5:${PORTSDIR}/x11/kdelibs4

kdeprefix_PREFIX=		${KDE4_PREFIX}

oxygen_RUN_DEPENDS=		${KDE4_PREFIX}/share/icons/oxygen/index.theme:${PORTSDIR}/x11-themes/kde4-icons-oxygen

pimlibs_LIB_DEPENDS=		kpimutils.5:${PORTSDIR}/deskutils/kdepimlibs4

pimruntime_LIB_DEPENDS=		kdepim-copy.5:${PORTSDIR}/deskutils/kdepim4-runtime

pykde4_RUN_DEPENDS=		${KDE4_PYTHON_SITELIBDIR}/PyKDE4/kdeui.so:${PORTSDIR}/devel/kdebindings4-python-pykde4

pykdeuic4_RUN_DEPENDS=		${LOCALBASE}/bin/pykdeuic4:${PORTSDIR}/devel/kdebindings4-python-pykdeuic4

runtime_BUILD_DEPENDS=		${KDE4_PREFIX}/bin/kdebugdialog:${PORTSDIR}/x11/kde4-runtime
runtime_RUN_DEPENDS=		${KDE4_PREFIX}/bin/kdebugdialog:${PORTSDIR}/x11/kde4-runtime

sharedmime_BUILD_DEPENDS=	kde4-shared-mime-info>=1:${PORTSDIR}/misc/kde4-shared-mime-info
sharedmime_RUN_DEPENDS=		kde4-shared-mime-info>=1:${PORTSDIR}/misc/kde4-shared-mime-info

workspace_LIB_DEPENDS=		kscreensaver.5:${PORTSDIR}/x11/kde4-workspace


PLIST_SUB+=	KDE4_PREFIX="${KDE4_PREFIX}"

KDE4_PYTHON_SITELIBDIR=	${PYTHON_SITELIBDIR:S;${PYTHONBASE};${KDE4_PREFIX};}

#
# Common build related stuff for kde4 ports. It's not intended for usage
# in KDE4-dependent ports
#
.if defined(KDE4_BUILDENV)

.if ${OSVERSION} < 3000
BROKEN=		does not build on 0.2
.endif

.if ${KDE4_BRANCH} == "unstable"
WITH_DEBUG=yes
.endif

.if defined(WITH_DEBUG)
CMAKE_BUILD_TYPE=	DebugFull
.endif

PLIST_SUB+=	KDE4_VERSION="${KDE4_VERSION}"

USE_LDCONFIG=	yes

USE_CMAKE=	yes
CMAKE_SOURCE_PATH=	${WRKSRC}
CONFIGURE_WRKSRC=	${CMAKE_SOURCE_PATH}/build
BUILD_WRKSRC=		${CONFIGURE_WRKSRC}
INSTALL_WRKSRC?=	${BUILD_WRKSRC}

post-extract:	kde-create-builddir

kde-create-builddir:
	${MKDIR} ${BUILD_WRKSRC}

.endif # KDE4_BUILDENV

.endif #!defined(_POSTMKINCLUDED) && !defined(Kde_Pre_Include)

CONFLICTS+= kdelibs-3* kdeutils-3* kdebase-3*

.if defined(_POSTMKINCLUDED) && !defined(Kde_Post_Include)

Kde_Post_Include=	kde4.mk

.for component in ${USE_KDE4}
. if ${_USE_KDE4_ALL:M${component}}!=""
BUILD_DEPENDS+=	${${component}_BUILD_DEPENDS}
LIB_DEPENDS+=	${${component}_LIB_DEPENDS}
RUN_DEPENDS+=	${${component}_RUN_DEPENDS}
.  if defined(${component}_PREFIX)
.   if ${.MAKEFLAGS:MPREFIX=*}==""
PREFIX=	${${component}_PREFIX}
.    if ${KDE4_PREFIX} != ${LOCALBASE}
NO_MTREE=	yes
.    endif
.   endif
.  endif
. else
IGNORE=	cannot install: Unknown component ${component}
. endif
.endfor

.endif #defined(_POSTMKINCLUDED) && !defined(Kde_Post_Include)
