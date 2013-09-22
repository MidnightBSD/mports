# $MidnightBSD$

PORTNAME=	kdehier4
PORTVERSION=	1.1.1
PORTREVISION=	1
CATEGORIES=	misc kde
MASTER_SITES=	# none
DISTFILES=	# none

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Hierarchy of shared KDE4 directories

LICENSE=	unknown

NO_BUILD=	yes
USE_KDE4=	#

.include <bsd.port.pre.mk>

.if ${KDE4_PREFIX} != ${LOCALBASE}
PLIST_SUB+=	MTREE="" \
		LDCONFIG_DIR="${LDCONFIG_DIR}" \
		LDCONFIG32_DIR="${LDCONFIG32_DIR}"
SUB_FILES=	session-kde4.conf \
		system-kde4.conf
SUB_LIST=	KDE4_PREFIX="${KDE4_PREFIX}"
.else
PLIST_SUB+=	MTREE="@comment "
.endif

do-install:
.if ${KDE4_PREFIX} != ${LOCALBASE}
	${MKDIR} ${PREFIX}/etc/dbus-1
	${INSTALL_DATA} ${WRKDIR}/session-kde4.conf ${PREFIX}/etc/dbus-1
	${INSTALL_DATA} ${WRKDIR}/system-kde4.conf ${PREFIX}/etc/dbus-1
.endif

maintainer-generate-plist:
	cd ${FILESDIR} && ${SH} make-plist.sh

.include <bsd.port.post.mk>
