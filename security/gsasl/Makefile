# Created by: ijliao

PORTNAME=	gsasl
PORTVERSION=	1.8.1
CATEGORIES=	security
MASTER_SITES=	GNU

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	GNU SASL command-line utility

LICENSE=	lgpl2.1

LIB_DEPENDS=	libgsasl.so:security/libgsasl

USES=		charsetfix libtool localbase pathfix pkgconfig readline

CONFIGURE_ARGS=	--disable-rpath \
		--without-gssapi-impl
GNU_CONFIGURE=	yes

INFO=		gsasl

OPTIONS_DEFINE=	DOCS NLS
OPTIONS_SUB=	yes

NLS_CONFIGURE_ENABLE=	nls
NLS_USES=		gettext

post-patch:
	@${REINPLACE_CMD} -e '/^en@/d' ${WRKSRC}/po/LINGUAS

post-install-DOCS-on:
	@${MKDIR} ${FAKE_DESTDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/doc/*.html ${FAKE_DESTDIR}${DOCSDIR}

.include <bsd.port.mk>
