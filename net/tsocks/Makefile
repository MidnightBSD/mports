PORTNAME=	tsocks
DISTVERSION=	1.8.b5
PORTREVISION=	2
CATEGORIES=	net security
MASTER_SITES=	SF/${PORTNAME}/${PORTNAME}/1.8%20beta%205 \
		http://ftp1.sourceforge.net/tsocks/ \
		http://www.yazzy.org/ports/tsocks/
DISTNAME=	${PORTNAME}-${PORTVERSION:C/.b/beta/}

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Allow non SOCKS aware applications to use SOCKS without modification
WWW=		https://tsocks.sourceforge.net

LICENSE=	gpl2

GNU_CONFIGURE=	yes
USES=		gmake
USE_LDCONFIG=	yes

WRKSRC=		${WRKDIR}/${PORTNAME}-${PORTVERSION:C/.b.*//}

CONFIGURE_ARGS=	--with-conf=${PREFIX}/etc/tsocks.conf \
		--libdir=${PREFIX}/lib

OPTIONS_DEFINE=	DOCS EXAMPLES HOSTNAMES MUTE OLDMETHOD SOCKSDNS
OPTIONS_DEFAULT=HOSTNAMES

HOSTNAMES_DESC=	Enable DNS lookups
OLDMETHOD_DESC=	Do not use RTLD_NEXT parameter to dlsym
MUTE_DESC=	Disable all error messages
SOCKSDNS_DESC=	Intercept DNS requests and attempt to force them to use TCP

HOSTNAMES_CONFIGURE_OFF=	--disable-hostnames
MUTE_CONFIGURE_ON=	--disable-debug
OLDMETHOD_CONFIGURE_ON=	--enable-oldmethod
SOCKSDNS_CONFIGURE_ON=	--enable-socksdns

SUB_FILES=	pkg-message

post-patch:
	@${REINPLACE_CMD} -e 's|ufds|fds|g' ${WRKSRC}/tsocks.c
	@${REINPLACE_CMD} -e 's|/usr|${PREFIX}|' ${WRKSRC}/tsocks

post-install:
	${INSTALL_PROGRAM} ${WRKSRC}/inspectsocks ${PREFIX}/bin
	${INSTALL_PROGRAM} ${WRKSRC}/validateconf ${PREFIX}/bin
	${INSTALL_DATA} ${WRKSRC}/tsocks.conf.simple.example \
		${PREFIX}/etc/tsocks.conf.sample
	@${MKDIR} ${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/*.example ${EXAMPLESDIR}
	@${MKDIR} ${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/INSTALL ${DOCSDIR}/README
	${STRIP_CMD} ${PREFIX}/lib/lib${PORTNAME}.so

.include <bsd.port.mk>
