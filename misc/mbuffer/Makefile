PORTNAME=	mbuffer
PORTVERSION=	20241007
CATEGORIES=	misc
MASTER_SITES=	http://www.maier-komor.de/software/mbuffer/

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Tool for buffering data streams
WWW=		https://www.maier-komor.de/mbuffer.html

LICENSE=	gpl3+
LICENSE_FILE=	${WRKSRC}/LICENSE

USES=		localbase ssl tar:tgz autoreconf gmake

GNU_CONFIGURE=	yes
GNU_CONFIGURE_MANPREFIX=	${PREFIX}/share

OPTIONS_DEFINE=		GCRYPT MHASH RHASH
OPTIONS_DEFAULT=	MHASH

GCRYPT_DESC=	Use gcrypt for hash generation
MHASH_DESC=	Use mhash for hash generation
RHASH_DESC=	Use rhash for hash generation

GCRYPT_RUN_DEPENDS=	libgcrypt>=1.8.4_1:security/libgcrypt
MHASH_RUN_DEPENDS=	mhash>=0.9.9.9_5:security/mhash
RHASH_RUN_DEPENDS=	rhash>=1.3.5:security/rhash

# hangs forever
NO_TEST=	yes

post-patch:
	${REINPLACE_CMD} \
		-e 's@bash@sh@' ${WRKSRC}/Makefile.in

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/bin/mbuffer
	${MV} ${STAGEDIR}${PREFIX}/etc/mbuffer.rc \
		${STAGEDIR}${PREFIX}/etc/mbuffer.rc.sample

.include <bsd.port.mk>
