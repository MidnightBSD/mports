PORTNAME=	autotrust
PORTVERSION=	0.3.1
PORTREVISION=	2
CATEGORIES=	dns
MASTER_SITES=	http://www.nlnetlabs.nl/downloads/autotrust/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tool to automatically update DNSSEC trust anchors

LICENSE=	bsd3

LIB_DEPENDS+=	libldns.so:dns/ldns \
		libunbound.so:dns/unbound

GNU_CONFIGURE=	yes
CFLAGS=		-I${LOCALBASE}/include
LDFLAGS+=	-L${LOCALBASE}/lib -pthread

PLIST_FILES=	sbin/autotrust \
		etc/autotrust/autotrust.conf.sample \
		man/man8/autotrust.8.gz
PLIST_DIRS=	etc/autotrust

do-patch:
	${REINPLACE_CMD} \
		'45s!=!\?=!; \
		46s!^\(CFLAGS \)\(= -I.\) @CFLAGS@!\1+\2!' \
		${WRKSRC}/Makefile.in

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/${PORTNAME} ${PREFIX}/sbin
	${MKDIR} ${ETCDIR}
	${INSTALL_DATA} ${WRKSRC}/${PORTNAME}.conf.sample ${ETCDIR}
	${INSTALL_MAN} ${WRKSRC}/${PORTNAME}.8 ${PREFIX}/man/man8

.include <bsd.port.mk>
