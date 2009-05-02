#-*- mode: Makefile; tab-width: 4; -*-
# ex:ts=4
#
# $MidnightBSD: mports/Mk/extensions/kde.mk,v 1.2 2009/03/14 19:04:13 laffer1 Exp $
# $FreeBSD: ports/Mk/bsd.kde.mk,v 1.63 2006/09/12 23:26:10 lofi Exp $
#
# Please view me with 4 column tabs!

# Please make sure all changes to this file are past through the maintainer.
# Do not commit them yourself (unless of course you're the Port's Wraith ;).

.if !defined(_POSTMKINCLUDED) && !defined(Kde_Pre_Include)

Kde_Pre_Include=			kde.mk
Kde_Include_Maintainer= 	ports@MidnightBSD.org

# This section contains the USE_ definitions.
# XXX: Write HAVE_ definitions sometime.

# USE_QT_VER		- Says that the port uses the Qt toolkit.  Possible values:
#					  3; each specify the major version of Qt to use.
# USE_KDELIBS_VER	- Says that the port uses KDE libraries.  Possible values:
#					  3 specifies the major version of KDE to use.
#					  This implies USE_QT of the appropriate version.
# USE_KDEBASE_VER	- Says that the port uses the KDE base.  Possible values:
#					  3 specifies the major version of KDE to use.
#					  This implies USE_KDELIBS of the appropriate version.

# tagged MASTER_SITE_KDE_kde
kmaster=				${MASTER_SITE_KDE:S@%/@%/:kde@g}
.if !defined(MASTER_SITE_SUBDIR)
MASTER_SITE_KDE_kde=	${kmaster:S@%SUBDIR%/@@g}
.else
ksub=${MASTER_SITE_SUBDIR}
MASTER_SITE_KDE_kde=	${kmaster:S@%SUBDIR%/@${ksub}/@g}
.endif # !defined(MASTER_SITE_SUBDIR)

# USE_KDEBASE_VER section
.if defined(USE_KDEBASE_VER)
.if ${USE_KDEBASE_VER} == CVS
LIB_DEPENDS+=	kfontinst:${PORTSDIR}/x11/kdebase
USE_KDELIBS_VER=CVS
.elif ${USE_KDEBASE_VER} == 3
# kdebase 3.x common stuff
LIB_DEPENDS+=	kfontinst:${PORTSDIR}/x11/kdebase3
USE_KDELIBS_VER=3
.endif # ${USE_KDEBASE_VER} == 3
.endif # defined(USE_KDEBASE_VER)

# USE_KDELIBS_VER section
.if defined(USE_KDELIBS_VER)

## This is needed for configure scripts to figure out
## which threads lib to use

CONFIGURE_ENV+= PTHREAD_LIBS="${PTHREAD_LIBS}"

## Every KDE application is inherently IPv6-capable

CATEGORIES+=ipv6

##  XXX - This really belongs into bsd.port.mk
.if !defined(_NO_KDE_CONFTARGET_HACK)
CONFIGURE_TARGET=
CONFIGURE_ARGS+=--build=${MACHINE_ARCH}-portbld-freebsd6.1 \
		--x-libraries=${LOCALBASE}/lib --x-includes=${LOCALBASE}/include \
		--disable-as-needed
.endif

.if ${USE_KDELIBS_VER} == CVS
LIB_DEPENDS+=	kimproxy:${PORTSDIR}/x11/kdelibs
USE_QT_VER=		CVS
PREFIX=			${KDE_CVS_PREFIX}
.elif ${USE_KDELIBS_VER} == 3
# kdelibs 3.x common stuff
LIB_DEPENDS+=	kimproxy:${PORTSDIR}/x11/kdelibs3
USE_QT_VER=		3
PREFIX=			${KDE_PREFIX}
.else
IGNORE=			cannot install: unsupported value in USE_KDELIBS_VER
.endif # ${USE_KDELIBS_VER} == 3
.endif # defined(USE_KDELIBS_VER)

# End of USE_KDELIBS_VER section

# USE_QT_VER section
.if ${USE_QT_VER} == CVS

KDE_CVS_PREFIX?=	${LOCALBASE}/kde-cvs
QT_CVS_PREFIX?=		${LOCALBASE}/qt-cvs
QTCPPFLAGS?=
QTCFGLIBS?=

MOC?=				${QT_CVS_PREFIX}/bin/moc
BUILD_DEPENDS+=		${MOC}:${PORTSDIR}/x11-toolkits/qt-copy
RUN_DEPENDS+=		${MOC}:${PORTSDIR}/x11-toolkits/qt-copy
QTCPPFLAGS+=		-D_GETOPT_H		# added to work around broken getopt.h #inc
.if !defined (QT_NONSTANDARD)
CONFIGURE_ARGS+=--with-extra-libs="${LOCALBASE}/lib" \
				--with-extra-includes="${LOCALBASE}/include"
CONFIGURE_ENV+=	MOC="${MOC}" CPPFLAGS="${CPPFLAGS} ${QTCPPFLAGS}" LIBS="${QTCFGLIBS}" \
				QTDIR="${QT_CVS_PREFIX}" KDEDIR="${KDE_CVS_PREFIX}"
.endif

.elif ${USE_QT_VER} == 3

# Yeah, it's namespace pollution, but this is really the best place for this
# stuff. Arts does NOT use it anymore.
KDE_VERSION=		3.5.10
KDE_ORIGVER=	${KDE_VERSION}
KDE_PREFIX?=	${LOCALBASE}

QTCPPFLAGS?=
QTCGFLIBS?=

# Qt 3.x common stuff
QT_PREFIX?=		${LOCALBASE}
MOC?=			${QT_PREFIX}/bin/moc
#LIB_DEPENDS+=	qt-mt.3:${PORTSDIR}/x11-toolkits/qt33
BUILD_DEPENDS+=	${QT_PREFIX}/bin/moc:${PORTSDIR}/x11-toolkits/qt33
RUN_DEPENDS+=	${QT_PREFIX}/bin/moc:${PORTSDIR}/x11-toolkits/qt33
QTCPPFLAGS+=	-I${LOCALBASE}/include -I${PREFIX}/include \
				-I${QT_PREFIX}/include -D_GETOPT_H
QTCFGLIBS+=		-Wl,-export-dynamic -L${LOCALBASE}/lib -ljpeg \
				-L${QT_PREFIX}/lib
.if defined(PACKAGE_BUILDING)
TMPDIR?=	/tmp
MAKE_ENV+=	TMPDIR="${TMPDIR}"
CONFIGURE_ENV+=	TMPDIR="${TMPDIR}"
.endif

.if !defined(QT_NONSTANDARD)
CONFIGURE_ARGS+=--with-qt-includes=${QT_PREFIX}/include \
				--with-qt-libraries=${QT_PREFIX}/lib \
				--with-extra-libs=${LOCALBASE}/lib \
				--with-extra-includes=${LOCALBASE}/include
CONFIGURE_ENV+=	MOC="${MOC}" CPPFLAGS="${CPPFLAGS} ${QTCPPFLAGS}" LIBS="${QTCFGLIBS}" \
		QTDIR="${QT_PREFIX}" KDEDIR="${KDE_PREFIX}"
.endif # !defined(QT_NONSTANDARD)
.else
IGNORE=			cannot install: unsupported value of USE_QT_VER
.endif # defined(USE_QT_VER)

# End of USE_QT_VER section

# Assemble plist from parts
# <alane@freebsd.org> 2002-12-06
.if defined(KDE_BUILD_PLIST)
PLIST?=			${WRKDIR}/plist
PLIST_BASE?=	plist.base
PLIST_APPEND?=
plist_base=${FILESDIR}/${PLIST_BASE}
plist_base_rm=${FILESDIR}/${PLIST_BASE}.rm
plist_append=${PLIST_APPEND:C:([A-Za-z0-9._]+):${FILESDIR}/\1:}
plist_append_rm=${PLIST_APPEND:C:([A-Za-z0-9._]+):${FILESDIR}/\1.rm:}
kde-plist:
	${CAT} ${plist_base} ${plist_append} 2>/dev/null >${PLIST}
	-${CAT} ${plist_append_rm} ${plist_base_rm} 2>/dev/null >>${PLIST};true
.PHONY: kde-plist
pre-build: kde-plist
.endif # defined(KDE_BUILD_PLIST)


.endif      # !defined(_POSTMKINCLUDED) && !defined(Kde_Pre_Include)
