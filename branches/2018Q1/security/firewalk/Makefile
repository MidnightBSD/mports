# $MidnightBSD$
# $FreeBSD: ports/security/firewalk/Makefile,v 1.22 2007/01/31 14:09:53 pav Exp $

PORTNAME=	firewalk
PORTVERSION=	5.0
PORTREVISION=	5
CATEGORIES=	security
MASTER_SITES=	http://www.packetfactory.net/firewalk/dist/
EXTRACT_SUFX=	.tgz

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Remote firewall auditing tool

LICENSE=        bsd2

BUILD_DEPENDS=	${LOCALBASE}/lib/libdnet.a:${PORTSDIR}/net/libdnet	\
		${LIBNET_CONFIG}:${PORTSDIR}/net/libnet
RUN_DEPENDS=	${BUILD_DEPENDS}

WRKSRC=		${WRKDIR}/Firewalk

GNU_CONFIGURE=	yes
CONFIGURE_ENV=	CPPFLAGS="-I${LOCALBASE}/include `${LIBNET_CONFIG} --cflags`" \
		LDFLAGS="-L${LOCALBASE}/lib"

LIBNET_CONFIG?=	${LOCALBASE}/bin/libnet11-config

post-patch:
	@${REINPLACE_CMD} -e 's|-lnet|`${LIBNET_CONFIG} --libs`|' \
		${CONFIGURE_WRKSRC}/${CONFIGURE_SCRIPT}

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/src/firewalk ${PREFIX}/bin/
	${INSTALL_MAN} ${WRKSRC}/man/firewalk.8 ${MANPREFIX}/man/man8/
	${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/BUGS ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/TODO ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/README ${DOCSDIR}

.include <bsd.port.mk>
