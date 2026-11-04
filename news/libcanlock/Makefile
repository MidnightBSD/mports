PORTNAME=	libcanlock
DISTVERSION=	3.3.3
CATEGORIES=	news
MASTER_SITES=	https://micha.freeshell.org/libcanlock/src/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Standalone RFC 8315 Netnews Cancel-Lock implementation
WWW=		https://micha.freeshell.org/libcanlock/

LICENSE=	bsd3 ICU
LICENSE_COMB=	multi
LICENSE_NAME_ICU=	ICU license
LICENSE_FILE_bsd3=	${WRKSRC}/LICENSE
LICENSE_FILE_ICU=	${WRKSRC}/LICENSE
LICENSE_PERMS_ICU=	dist-mirror dist-sell pkg-mirror pkg-sell auto-accept

USES=		libtool tar:bzip2
USE_LDCONFIG=	yes

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-pc-files \
			--with-pkgconfigdir=${PREFIX}/libdata/pkgconfig

INSTALL_TARGET=	install-strip

OPTIONS_DEFINE=		HP
OPTIONS_DEFAULT=	HP
OPTIONS_SUB=		yes

HP_DESC=		Build article header parsers (canlock-hp)
HP_CONFIGURE_OFF=	--disable-hp

.include <bsd.port.mk>
