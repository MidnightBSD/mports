PORTNAME=	hostapd
PORTVERSION=	2.9
CATEGORIES=	net
MASTER_SITES=	https://w1.fi/releases/

PATCH_SITES=	https://w1.fi/security/2020-1/
PATCHFILES=	0001-WPS-UPnP-Do-not-allow-event-subscriptions-with-URLs-.patch:-p1 \
		0002-WPS-UPnP-Fix-event-message-generation-using-a-long-U.patch:-p1 \
		0003-WPS-UPnP-Handle-HTTP-initiation-failures-for-events-.patch:-p1

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	IEEE 802.11 AP, IEEE 802.1X/WPA/WPA2/EAP/RADIUS Authenticator

LICENSE=	bsd3

USES=		cpe gmake ssl
CPE_VENDOR=	w1.f1
BUILD_WRKSRC=	${WRKSRC}/hostapd
CFLAGS+=	-I${OPENSSLINC}
LDFLAGS+=	-L${OPENSSLLIB}

PLIST_FILES=	sbin/hostapd sbin/hostapd_cli share/man/man1/hostapd_cli.1.gz \
		share/man/man8/hostapd.8.gz
.if !exists(/etc/rc.d/hostapd)
USE_RC_SUBR=	hostapd
.endif

post-patch:
	@${REINPLACE_CMD} -e 's|@$$(E) "  CC " $$<|@$$(E) "  $$(CC) " $$<|' \
		${BUILD_WRKSRC}/Makefile
	@${SED} -e 's|@PREFIX@|${PREFIX}|g' ${FILESDIR}/config \
		>> ${WRKSRC}/hostapd/.config

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/hostapd/hostapd ${STAGEDIR}${PREFIX}/sbin
	${INSTALL_PROGRAM} ${WRKSRC}/hostapd/hostapd_cli \
		${STAGEDIR}${PREFIX}/sbin
	${INSTALL_MAN} ${WRKSRC}/hostapd/hostapd_cli.1 \
		${STAGEDIR}${PREFIX}/share/man/man1
	${INSTALL_MAN} ${WRKSRC}/hostapd/hostapd.8 \
		${STAGEDIR}${PREFIX}/share/man/man8

.include <bsd.port.mk>
