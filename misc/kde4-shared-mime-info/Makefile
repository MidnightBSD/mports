#
# $MidnightBSD: mports/misc/kde4-shared-mime-info/Makefile,v 1.2 2009/04/11 20:20:01 laffer1 Exp $
#

PORTNAME=	shared-mime-info
PORTVERSION=	1.1
PORTREVISION=	0
CATEGORIES=	misc kde
MASTER_SITES=	# none
PKGNAMEPREFIX=	kde4-
DISTNAME=	# none
EXTRACT_SUFX=	# none

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Handles shared MIME database under $${KDE_PREFIX}
LICENSE=	unknown

RUN_DEPENDS=	update-mime-database:${PORTSDIR}/misc/shared-mime-info

USE_KDE4=	kdeprefix kdehier

NO_BUILD=	yes
NO_WRKSUBDIR=	yes

MIMESUBDIRS=	application audio image inode message model multipart \
		packages text video x-epoc x-content

.include <bsd.port.pre.mk>

.if ${KDE4_PREFIX} != ${LOCALBASE}
PLIST_SUB+=	HACK=""
.else
PLIST_SUB+=	HACK="@comment "
.endif

do-install:
.if ${KDE4_PREFIX} != ${LOCALBASE}
.for dir in ${MIMESUBDIRS}
	${MKDIR} ${KDE4_PREFIX}/share/mime/${dir}
	${TOUCH} ${KDE4_PREFIX}/share/mime/${dir}/.keep_me
.endfor
.else
	@${DO_NADA}
.endif

.include <bsd.port.post.mk>
