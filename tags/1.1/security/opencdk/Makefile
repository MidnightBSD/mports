# $MidnightBSD$

PORTNAME=	opencdk
PORTVERSION=	0.6.6
PORTREVISION=	6
PORTEPOCH=	1
CATEGORIES=	security
MASTER_SITES=	http://josefsson.org/gnutls/releases/opencdk/
MASTER_SITE_SUBDIR=	alpha/gnutls/opencdk

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Open Crypto Development Kit
LICENSE=	gpl2

OPTIONS_DEFINE=	DOCS

LIB_DEPENDS=	libgcrypt.so:${PORTSDIR}/security/libgcrypt

GNU_CONFIGURE=	yes
USES=		libtool pathfix pkgconfig tar:bzip2
USE_LDCONFIG=	yes
CONFIGURE_ARGS=	--with-libgcrypt-prefix=${LOCALBASE}

DOCS=		AUTHORS NEWS README THANKS doc/opencdk-api.html

post-patch:
	@${REINPLACE_CMD} -e '/^LDADD/ s/$$/ $$(LIBGCRYPT_LIBS)/' ${WRKSRC}/tests/Makefile.in

post-install:
	@${MKDIR} ${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/tests/*.c ${EXAMPLESDIR}
	${INSTALL_DATA} ${WRKSRC}/tests/*.gpg ${EXAMPLESDIR}
	@${MKDIR} ${DOCSDIR}
	cd ${WRKSRC} && ${INSTALL_DATA} ${DOCS} ${DOCSDIR}

.include <bsd.port.mk>
