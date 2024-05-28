PORTNAME=	jq
DISTVERSION=	1.7.1
CATEGORIES=	textproc
MASTER_SITES=	https://github.com/jqlang/${PORTNAME}/releases/download/${PORTNAME}-${DISTVERSION}/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Lightweight and flexible command-line JSON processor
WWW=		https://jqlang.github.io/jq/

LICENSE=	mit
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		cpe gmake libtool
CPE_VENDOR=	${PORTNAME}_project
USE_CSTD=	gnu99
USE_LDCONFIG=	yes

GNU_CONFIGURE=	yes
GNU_CONFIGURE_MANPREFIX=${PREFIX}/share
CONFIGURE_ARGS=	--disable-maintainer-mode \
		--docdir="${DOCSDIR}"

INSTALL_TARGET=	install-strip

PORTDOCS=	*

OPTIONS_DEFINE=			DOCS ONIGURUMA
OPTIONS_DEFAULT=		ONIGURUMA

DOCS_CONFIGURE_ENABLE=		docs
DOCS_MAKE_ARGS_OFF=		docdir=

ONIGURUMA_DESC=			With oniguruma BSDL regular expression library
ONIGURUMA_LIB_DEPENDS=		libonig.so:devel/oniguruma
ONIGURUMA_CONFIGURE_WITH=	oniguruma=${LOCALBASE}

.include <bsd.port.mk>
