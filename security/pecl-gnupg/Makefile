PORTNAME=	gnupg
PORTVERSION=	1.4.0
PORTREVISION=	1
CATEGORIES=	security

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	PECL wrapper around the gpgme library

LICENSE=	bsd2
LICENSE_FILE=	${WRKSRC}/LICENSE

LIB_DEPENDS=	libgpgme.so:security/gpgme

USES=		localbase php:pecl

CONFIGURE_ARGS=	--with-gnupg=${LOCALBASE}/include

post-patch:
	@${REINPLACE_CMD} -e '/GNUPG_DL/ s|-ldl||; s|$$GNUPG_DIR/lib|${LOCALBASE}/lib|' ${WRKSRC}/config.m4

.include <bsd.port.mk>
