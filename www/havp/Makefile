PORTNAME=	havp
PORTVERSION=	0.93
CATEGORIES=	www

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	HTTP Antivirus Proxy
WWW=		https://www.havp.org/

LIB_DEPENDS=	libclamav.so:security/clamav

USE_GITHUB=	yes
GH_ACCOUNT=     HaveSec
GH_PROJECT=     HAVP
GH_TAGNAME=	2ef418a

USES=		gmake perl5
GNU_CONFIGURE=	yes
USE_PERL5=	build
USE_RC_SUBR=	havp
CONFIGURE_ARGS=	--disable-locking

LOG_DIR=	/var/log/havp
TMP_DIR=	/var/tmp/havp
RUN_DIR=	/var/run/havp
PLIST_SUB+=	LOG_DIR=${LOG_DIR} TMP_DIR=${TMP_DIR} RUN_DIR=${RUN_DIR}

SUB_FILES=	pkg-install pkg-deinstall
SUB_LIST=	LOG_DIR=${LOG_DIR} TMP_DIR=${TMP_DIR} RUN_DIR=${RUN_DIR}

OPTIONS_DEFINE=	SSL CLAMAV TROPHIE
OPTIONS_DEFAULT=	SSL CLAMAV
SSL_DESC=	SSL proxying (not scanned, only forwarded!)
CLAMAV_DESC=	libclamav support
TROPHIE_DESC=	Trend Micro (Trophie) support

.include <bsd.mport.options.mk>

.if ${PORT_OPTIONS:MSSL}
CONFIGURE_ARGS+=	--enable-ssl-tunnel
.else
CONFIGURE_ARGS+=	--disable-ssl-tunnel
.endif

.if ${PORT_OPTIONS:MCLAMAV}
CONFIGURE_ARGS+=	--enable-clamav
.else
CONFIGURE_ARGS+=	--disable-clamav
.endif

.if ${PORT_OPTIONS:MTROPHIE}
CONFIGURE_ARGS+=	--enable-trophie
.else
CONFIGURE_ARGS+=	--disable-trophie
.endif

post-extract:
	${CHMOD} 755 ${WRKSRC}/configure

post-install:
	@${MKDIR} ${EXAMPLESDIR}
	@${CP} ${WRKSRC}/etc/havp/blacklist ${EXAMPLESDIR}/blacklist.sample
	@${CP} -R ${WRKSRC}/etc/havp/templates ${EXAMPLESDIR}
	@${CP} ${WRKSRC}/etc/havp/whitelist ${EXAMPLESDIR}/whitelist.sample
	@${MKDIR} ${FAKE_DESTDIR}${LOG_DIR} ${FAKE_DESTDIR}${TMP_DIR} ${FAKE_DESTDIR}${RUN_DIR}

.include <bsd.port.mk>
