PORTNAME=	libiconv
PORTVERSION=	1.16
CATEGORIES=	converters devel
MASTER_SITES=	GNU

MAINTAINER=	ports@MidnightBSD.org
COMMENT=	Character set conversion library

LICENSE=	gpl3
LICENSE_FILE=	${WRKSRC}/COPYING

USES=		libtool
USE_CSTD=	gnu89
USE_LDCONFIG=	yes

GNU_CONFIGURE=	yes
CONFIGURE_ARGS=	--enable-static \
		--enable-shared \
		--disable-nls \
		--docdir=${DOCSDIR} \
		--host=${ARCH}-portbld-midnightbsd${OSREL} \
		--target=${ARCH}-portbld-midnightbsd${OSREL} \
		am_cv_func_iconv=no
INSTALL_TARGET=	install-strip
MAKE_JOBS_UNSAFE=	yes

OPTIONS_DEFINE=	DOCS ENCODINGS
OPTIONS_DEFAULT=ENCODINGS
ENCODINGS_DESC=	Include extra character sets

ENCODINGS_CONFIGURE_ENABLE=	extra-encodings

post-patch:
	@${REINPLACE_CMD} -e 's:ei_ksc5601:ei_euc_kr:g' ${WRKSRC}/lib/aliases.h
	@${REINPLACE_CMD} -e 's:gawk:awk:g' ${WRKSRC}/configure \
		${WRKSRC}/libcharset/configure

.include <bsd.port.mk>
