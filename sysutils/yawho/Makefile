# $MidnightBSD: mports/sysutils/yawho/Makefile,v 1.3 2010/01/10 00:54:58 laffer1 Exp $

PORTNAME=	yawho
PORTVERSION=	1.2
PORTREVISION= 	1
CATEGORIES=	sysutils
MASTER_SITES=	http://wizard.ae.krakow.pl/~mike/download/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simple 'w'-like program; displays connection type and login shell PID
LICENSE=	gpl2

GNU_CONFIGURE=	yes

PLIST_FILES=	bin/yawho

pre-patch:
	@${REINPLACE_CMD} -E -e 's/kp_.?proc\.._/ki_/' ${WRKSRC}/process.c

.include <bsd.port.pre.mk>

.if ${OSVERSION} > 4004
BROKEN=		fails to build with new utmpx
.endif

.include <bsd.port.post.mk>
