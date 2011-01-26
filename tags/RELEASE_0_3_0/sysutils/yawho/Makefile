# $MidnightBSD: mports/sysutils/yawho/Makefile,v 1.2 2007/10/25 02:54:14 laffer1 Exp $

PORTNAME=	yawho
PORTVERSION=	1.2
PORTREVISION= 	1
CATEGORIES=	sysutils
MASTER_SITES=	http://wizard.ae.krakow.pl/~mike/download/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Simple 'w'-like program; displays connection type and login shell PID
LICENSE=	gpl2

MAKE_JOBS_SAFE=	yes

PLIST_FILES=	bin/yawho

.include <bsd.port.pre.mk>

pre-patch:
	@${REINPLACE_CMD} -E -e 's/kp_.?proc\.._/ki_/' ${WRKSRC}/process.c

GNU_CONFIGURE=	yes

.include <bsd.port.post.mk>
