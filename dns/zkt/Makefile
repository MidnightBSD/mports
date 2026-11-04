PORTNAME=		zkt
DISTVERSION=		1.1.6
CATEGORIES=		dns
MASTER_SITES=		http://www.hznet.de/dns/zkt/

MAINTAINER=		ports@MidnightBSD.org
COMMENT=		Tool to manage keys and signatures for DNSSEC-zones
WWW=		https://www.hznet.de/dns/zkt/

LICENSE=		bsd3
LICENSE_FILE=		${WRKSRC}/LICENSE

BUILD_DEPENDS=		dnssec-signzone:dns/bind-tools
RUN_DEPENDS:=		${BUILD_DEPENDS}

DIR_NAMED_CONF?=	/etc/namedb
GNU_CONFIGURE=		yes
CONFIGURE_ARGS+=	--enable-configpath=${DIR_NAMED_CONF}

post-patch:
	@${REINPLACE_CMD} -e 's|/var/named/|${DIR_NAMED_CONF}/|g' ${WRKSRC}/man/*.8

do-install:
	${INSTALL_PROGRAM} ${WRKSRC}/zkt-conf ${PREFIX}/sbin/
	${INSTALL_PROGRAM} ${WRKSRC}/zkt-keyman ${PREFIX}/sbin/
	${INSTALL_PROGRAM} ${WRKSRC}/zkt-ls ${PREFIX}/sbin/
	${INSTALL_PROGRAM} ${WRKSRC}/zkt-signer ${PREFIX}/sbin/
	${INSTALL_PROGRAM} ${WRKSRC}/zkt-soaserial ${PREFIX}/sbin/
	${INSTALL_MAN} ${WRKSRC}/man/dnssec-zkt.8 ${PREFIX}/share/man/man8/
	${INSTALL_MAN} ${WRKSRC}/man/zkt-conf.8 ${PREFIX}/share/man/man8/
	${INSTALL_MAN} ${WRKSRC}/man/zkt-keyman.8 ${PREFIX}/share/man/man8/
	${INSTALL_MAN} ${WRKSRC}/man/zkt-ls.8 ${PREFIX}/share/man/man8/
	${INSTALL_MAN} ${WRKSRC}/man/zkt-signer.8 ${PREFIX}/share/man/man8/

.include <bsd.port.mk>
