# Ports collection makefile for:   nologinmsg
# Whom:                            Richard Rose <freebsd-security@rikrose.net>
# Date created:                    20020710
#
# $MidnightBSD: mports/shells/nologinmsg/Makefile,v 1.1 2006/09/18 13:37:37 laffer1 Exp $
# $FreeBSD: ports/shells/nologinmsg/Makefile,v 1.4 2006/05/13 04:15:22 edwin Exp $
#
# The port is self contained in the src directory

PORTNAME=	nologinmsg
PORTVERSION=	1.0
CATEGORIES=	shells sysutils
MASTER_SITES=	# none
DISTFILES=	# none

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	More functional native binary replacement for /sbin/nologin
LICENSE=	bsd2

FAKE_OPTS=	trueprefix

MAN8=		nologinmsg.8
MANCOMPRESSED=	yes

do-extract:
	@${MKDIR} ${WRKSRC}
.for i in Makefile nologinmsg.c nologinmsg.8 pathnames.h
	@${CP} ${FILESDIR}/${i} ${WRKSRC}
.endfor

post-patch:
	@${REINPLACE_CMD} -e 's|/usr/local|${PREFIX}|g' ${WRKSRC}/nologinmsg.8 \
		${WRKSRC}/pathnames.h

pre-install:
	${MKDIR} ${PREFIX}/etc/nologinmsgs

post-install:
	${STRIP_CMD} ${PREFIX}/bin/nologinmsg

.include <bsd.port.mk>
