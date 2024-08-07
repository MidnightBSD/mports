PORTNAME=	monit
DISTVERSION=	5.33.0
CATEGORIES=	sysutils
MASTER_SITES=	https://mmonit.com/monit/dist/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Unix system management and proactive monitoring
WWW=		https://mmonit.com/monit/

LICENSE=	agpl
LICENSE_FILE=	${WRKSRC}/COPYING

GNU_CONFIGURE=	yes
CONFIGURE_ARGS+=	--build=${ARCH}-portbld-freebsd12.4
CFLAGS+=	-lkvm -ldevstat
USES=		bison cpe gmake
CPE_VENDOR=	m${PORTNAME}
USE_RC_SUBR=	${PORTNAME}

GNU_CONFIGURE=	yes

PLIST_FILES=	bin/monit \
		etc/monitrc.sample \
		share/man/man1/monit.1.gz

SUB_FILES=	pkg-message

PORTDOCS=	COPYING CHANGES

OPTIONS_DEFINE=	DOCS PAM SSL
OPTIONS_DEFAULT=PAM SSL

PAM_CONFIGURE_OFF=	--without-pam
SSL_CONFIGURE_OFF=	--without-ssl
SSL_USES=		ssl

post-install:
	${INSTALL} -m 600 ${WRKSRC}/monitrc ${PREFIX}/etc/monitrc.sample
	@${REINPLACE_CMD} -i '' -e \
		"s|include /etc/monit.d|include ${TRUE_PREFIX}/etc/monit.d|" \
		${PREFIX}/etc/monitrc.sample
	${INSTALL} -d ${DOCSDIR}
	cd ${WRKSRC} && ${INSTALL} -m 644 ${PORTDOCS} ${DOCSDIR}

.include <bsd.port.mk>
