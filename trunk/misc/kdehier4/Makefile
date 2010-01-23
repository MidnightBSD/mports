#
# $FreeBSD: ports/misc/kdehier4/Makefile,v 1.27 2008/08/09 16:52:18 miwi Exp $
# $MidnightBSD: mports/misc/kdehier4/Makefile,v 1.2 2008/12/05 19:06:37 ctriv Exp $
#

PORTNAME=	kdehier4
PORTVERSION=	1.0.3
CATEGORIES=	misc kde
MASTER_SITES=	# none
DISTFILES=	# none

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Utility port that creates hierarchy of shared KDE4 directories
LICENSE=	unknown

NO_BUILD=	yes
NO_WRKSUBDIR=	yes
USE_KDE4=	kdeprefix

.include <bsd.port.pre.mk>

.if ${KDE4_PREFIX} != ${LOCALBASE}
PLIST_SUB+=	MTREE="" \
		LDCONFIG_DIR="${LDCONFIG_DIR}" \
		LDCONFIG32_DIR="${LDCONFIG32_DIR}" \
		KDE4_PREFIX="${KDE4_PREFIX}"
.else
PLIST_SUB+=	MTREE="@comment " \
		LDCONFIG_DIR="${LDCONFIG_DIR}" \
		LDCONFIG32_DIR="${LDCONFIG32_DIR}"
.endif

do-fetch:
	@${DO_NADA}

do-install:
	@for dir in `${GREP} -v "^@comment" ${FILESDIR}/dirlist`; \
	do \
		${MKDIR} ${PREFIX}/$${dir}; \
		${TOUCH} ${PREFIX}/$${dir}/.keep_me; \
	done
.if ${KDE4_PREFIX} != ${LOCALBASE}
	@for dir in `${GREP} -v "^@comment" ${FILESDIR}/mtree-dirlist`; \
	do \
		${MKDIR} ${PREFIX}/$${dir}; \
		${TOUCH} ${PREFIX}/$${dir}/.keep_me; \
	done
	${LN} -sf ${LOCALBASE}/${LDCONFIG_DIR} ${KDE4_PREFIX}/libdata/
	${LN} -sf ${LOCALBASE}/${LDCONFIG32_DIR} ${KDE4_PREFIX}/libdata/
	${LN} -sf ${LOCALBASE}/libdata/pkgconfig ${KDE4_PREFIX}/libdata/
.endif

.include <bsd.port.post.mk>
