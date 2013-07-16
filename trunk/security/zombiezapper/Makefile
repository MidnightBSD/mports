# $FreeBSD: ports/security/zombiezapper/Makefile,v 1.8 2005/11/14 17:07:05 sem Exp $
# $MidnightBSD: mports/security/zombiezapper/Makefile,v 1.4 2010/01/02 22:43:42 laffer1 Exp $

PORTNAME=	zombiezapper
PORTVERSION=	1.2
PORTREVISION=	2
CATEGORIES=	security
MASTER_SITES=	PACKETSTORM/distributed/zombie
DISTNAME=	zombie-${PORTVERSION}
EXTRACT_SUFX=	.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Send a terminate command to Trinoo/TFN/Stacheldracht DDoS agents
LICENSE=	other

BUILD_DEPENDS=	${LIBNET_CONFIG}:${PORTSDIR}/net/libnet10

LIBNET_CONFIG?=	${LOCALBASE}/bin/libnet10-config

CPPFLAGS+=	$$(${LIBNET_CONFIG} --cflags --defines)
LDFLAGS+=	$$(${LIBNET_CONFIG} --libs)

PORTDOCS=	USAGE tekpaper.txt
PLIST_FILES=	bin/zz

.include <bsd.mport.options.mk>

do-build:
	cd ${WRKSRC} && \
		${CC} ${CFLAGS} ${CPPFLAGS} -o zz zz.c ${LDFLAGS}

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/zz ${PREFIX}/bin
.if ${PORT_OPTIONS:MDOCS}
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${PORTDOCS:S|^|${WRKSRC}/|} ${DOCSDIR}
.endif

.include <bsd.port.mk>
