PORTNAME=	monit
PORTVERSION=	5.26.0
PORTREVISION=	0
CATEGORIES=	sysutils
MASTER_SITES=	https://mmonit.com/monit/dist/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Unix system management and proactive monitoring

LICENSE=	agpl

GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=	--build=${ARCH}-portbld-freebsd10.4
CFLAGS+=	-lkvm -ldevstat
USES=		bison gmake
USE_RC_SUBR=	${PORTNAME}

PLIST_FILES=	bin/monit \
		etc/monitrc.sample \
		man/man1/monit.1.gz

SUB_FILES=	pkg-message

PORTDOCS=	COPYING README CHANGES

OPTIONS_DEFINE=	DOCS SSL
OPTIONS_DEFAULT=SSL

SSL_CONFIGURE_OFF=	--without-ssl
SSL_USES=		ssl

post-install:
	${INSTALL} -m 600 ${WRKSRC}/monitrc ${STAGEDIR}${PREFIX}/etc/monitrc.sample
	${INSTALL} -d ${STAGEDIR}${DOCSDIR}
	cd ${WRKSRC} && ${INSTALL} -m 644 ${PORTDOCS} ${STAGEDIR}${DOCSDIR}

.include <bsd.port.mk>
