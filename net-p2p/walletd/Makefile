PORTNAME=	walletd
DISTVERSIONPREFIX=	v
DISTVERSION=	2.15.2
CATEGORIES=	net-p2p

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Official Sia Wallet
WWW=		https://sia.tech/software/walletd

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/LICENSE

NOT_FOR_ARCHS=	armv6 armv7 i386
NOT_FOR_ARCHS_REASON=	requires 64-bit architecture

USES=		go:1.26+,modules
USE_RC_SUBR=	walletd

USE_GITHUB=	yes
GH_ACCOUNT=	SiaFoundation
GO_MOD_DIST=	github
GO_MODULE=	go.sia.tech/walletd/v2
GO_TARGET=	./cmd/walletd
GO_BUILDFLAGS+= -tags='netgo timetzdata'

PLIST_FILES=	"@dir(${USERS},${GROUPS},750) /var/db/${PORTNAME}" \
		"@sample(${USERS},${GROUPS},600) etc/walletd.yml.sample" \
		"@sample etc/newsyslog.conf.d/walletd.conf.sample" \
		bin/walletd

SUB_FILES=	${PORTNAME}-syslog.conf ${PORTNAME}.conf ${PORTNAME}.yml pkg-message

SUB_LIST=	GROUPS=${GROUPS} \
		PREFIX=${PREFIX} \
		USERS=${USERS}

USERS=		${PORTNAME}
GROUPS=		${PORTNAME}

NO_TEST=	yes

post-install:
	${INSTALL_DATA} ${WRKDIR}/${PORTNAME}-syslog.conf ${PREFIX}/etc/newsyslog.conf.d/${PORTNAME}.conf.sample
	${INSTALL_DATA} ${WRKDIR}/${PORTNAME}.yml ${PREFIX}/etc/${PORTNAME}.yml.sample
	${INSTALL} -d ${FAKE_DESTDIR}/var/db/${PORTNAME}

pre-configure:
	${REINPLACE_CMD} -e "s|%%BUILDTIME%%|$$(date +%s)|g" ${WRKSRC}/build/meta.go

.include <bsd.port.mk>
