# Ports collection Makefile for:	linux-shoutcast
# Date created:				08 Apr 2006
# Whom:					Gabor Kovesdan
#
# $MidnightBSD: mports/audio/linux-shoutcast/Makefile,v 1.2 2008/09/12 18:15:56 laffer1 Exp $
# $FreeBSD: ports/audio/linux-shoutcast/Makefile,v 1.6 2007/06/05 16:41:03 gabor Exp $

PORTNAME=	shoutcast
PORTVERSION=	2.0
CATEGORIES=	audio net
MASTER_SITES=	http://download.nullsoft.com/shoutcast/tools/
PKGNAMEPREFIX=	linux-
DISTNAME=	sc_serv2_linux_07_31_2011

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Nullsoft's streaming audio server (Linux binary port)
LICENSE=	restricted

CONFLICTS=	shoutcast-[0-9]*

USE_LINUX=	YES
ONLY_FOR_ARCHS=	i386 amd64
NO_BUILD=	YES
RESTRICTED=	Redistribution of the software is not allowed

USE_RC_SUBR=	shoutcast.sh
PORTDOCS=	readme.txt changes.txt
WRKSRC=		${WRKDIR}

SFILES=	${WRKSRC}/sc_serv_basic.conf  ${WRKSRC}/sc_serv_debug.conf \
	${WRKSRC}/sc_serv_public.conf ${WRKSRC}/sc_serv_relay.conf ${WRKSRC}/sc_serv_simple.conf

post-patch:
	@${REINPLACE_CMD} -e 's/[[:cntrl:]]*$$//' \
		-e 's|=sc_serv.log|=/var/log/sc_serv.log|' \
		-e 's|=sc_w3c.log|=/var/log/sc_w3c.log|' \
		-e 's|ScreenLog=1|ScreenLog=0|' \
		-e 's|RealTime=1|RealTime=0|' \
		-e 's|=sc_serv.ban|=${PREFIX}/etc/shoutcast/sc_serv.ban|' \
		-e 's|=sc_serv.rip|=${PREFIX}/etc/shoutcast/sc_serv.rip|' \
		${SFILES}

do-install:
	@${INSTALL_PROGRAM} ${WRKSRC}/sc_serv ${PREFIX}/sbin
	@${MKDIR} ${PREFIX}/etc/shoutcast
	${CP} ${SFILES} ${PREFIX}/etc/shoutcast/

.if !defined(NOPORTDOCS)
	@${MKDIR} ${DOCSDIR}
	@${INSTALL_DATA} ${WRKSRC}/readme.txt ${DOCSDIR}
	@${INSTALL_DATA} ${WRKSRC}/changes.txt ${DOCSDIR}
.endif

post-install:
	@${SH} ${PKGINSTALL} ${PKGNAME} POST-INSTALL
	@${BRANDELF} -t Linux ${PREFIX}/sbin/sc_serv

.include <bsd.port.mk>
